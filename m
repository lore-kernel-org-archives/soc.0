Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2B3CD13CF
	for <soc@archiver.kernel.org>; Mon,  2 Sep 2024 12:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B216BC4AF09; Mon,  2 Sep 2024 12:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4820C4CEC7;
	Mon,  2 Sep 2024 12:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725280886;
	bh=KxLoPvRTqutF1mR3o8geQ+QlfWUbc6g26YQYee6tbfw=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=f58GFhGP0J4vb0P5ZGq4rEaZLiPdhLCE95g9qjRUCWNf07PvPrc2jNhyxK8B5ZdOE
	 w7kXOOM58GukcAx3vJ5VvzrY3ko28rvJzSwiG63QzhGXLh51mujRLQyPVuSGrNbUzz
	 Vr2i0jsVyQF/TVTpQsT4YUGFiLN1eQ2RmFlK17ImXaCVOIm+60rrM/0Uo7qCwgrH0U
	 tw+iCDwIxqZgfpKER2QA8hjtnNlxQ/ODSLfsLuFjUMmCprRb/3aL9hqTju0D4ZUspQ
	 Ob6R/jXVrOYChu0gNQMtMdFGZXhALchbFsklobARRcvrO4m8nRtIhP0AWtY34cmqPC
	 1YY73H93h/19g==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds 5/8] leds: turris-omnia: Notify sysfs on MCU global LEDs brightness change
Date: Mon,  2 Sep 2024 14:41:01 +0200
Message-ID: <20240902124104.14297-6-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902124104.14297-1-kabel@kernel.org>
References: <20240902124104.14297-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recall that on Turris Omnia, the LED controller has a global brightness
property, which allows the user to make the front LED panel dimmer.

There is also a button on the front panel, which by default is
configured so that pressing it changes the global brightness to a lower
value (unless it is at 0%, in which case pressing the button changes the
global brightness to 100%).

Newer versions of the MCU firmware support informing the SOC that the
brightness was changed by button press event via an interrupt.

Now that we have the turris-omnia-mcu driver, which adds support for MCU
interrupts, add the ability to inform the userspace (via a sysfs
notification) that the global brightness was changed.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 67 ++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 14e8fbb5bb69..bf8635cec72e 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -357,7 +357,57 @@ static struct attribute *omnia_led_controller_attrs[] = {
 	&dev_attr_gamma_correction.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(omnia_led_controller);
+
+static const struct attribute_group omnia_led_controller_group = {
+	.attrs = omnia_led_controller_attrs,
+};
+
+static irqreturn_t omnia_brightness_changed_handler(int irq, void *dev_id)
+{
+	struct kernfs_node *brightness_kn = dev_id;
+
+	sysfs_notify_dirent(brightness_kn);
+
+	return IRQ_HANDLED;
+}
+
+static void brightness_kn_release(struct device *dev, void *res)
+{
+	struct kernfs_node **brightness_kn = res;
+
+	sysfs_put(*brightness_kn);
+}
+
+static int omnia_probe_brightness_interrupt(struct i2c_client *client)
+{
+	struct kernfs_node **brightness_kn;
+	struct device *dev = &client->dev;
+	int ret;
+
+	brightness_kn = devres_alloc(brightness_kn_release,
+				     sizeof(*brightness_kn), GFP_KERNEL);
+	if (!brightness_kn)
+		return -ENOMEM;
+
+	*brightness_kn = sysfs_get_dirent(dev->kobj.sd, "brightness");
+	if (!*brightness_kn) {
+		devres_free(brightness_kn);
+		return -EIO;
+	}
+
+	devres_add(dev, brightness_kn);
+
+	ret = devm_request_any_context_irq(dev, client->irq,
+					   omnia_brightness_changed_handler,
+					   IRQF_ONESHOT, "leds-turris-omnia",
+					   *brightness_kn);
+	if (ret < 0) {
+		dev_err(dev, "Cannot request IRQ: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
 
 static int omnia_mcu_get_features(const struct i2c_client *client)
 {
@@ -387,6 +437,7 @@ static int omnia_leds_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
 	struct device_node *np = dev_of_node(dev);
+	bool has_brightness_interrupt;
 	struct omnia_leds *leds;
 	struct omnia_led *led;
 	int ret, count;
@@ -414,6 +465,8 @@ static int omnia_leds_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	has_brightness_interrupt = ret & OMNIA_FEAT_BRIGHTNESS_INT;
+
 	leds->has_gamma_correction = ret & OMNIA_FEAT_LED_GAMMA_CORRECTION;
 	if (!leds->has_gamma_correction) {
 		dev_info(dev,
@@ -439,7 +492,16 @@ static int omnia_leds_probe(struct i2c_client *client)
 		led += ret;
 	}
 
-	return 0;
+	ret = devm_device_add_group(dev, &omnia_led_controller_group);
+	if (ret < 0) {
+		dev_err(dev, "Cannot add sysfs attribute group: %d\n", ret);
+		return ret;
+	}
+
+	if (has_brightness_interrupt)
+		ret = omnia_probe_brightness_interrupt(client);
+
+	return ret;
 }
 
 static void omnia_leds_remove(struct i2c_client *client)
@@ -479,7 +541,6 @@ static struct i2c_driver omnia_leds_driver = {
 	.driver		= {
 		.name	= "leds-turris-omnia",
 		.of_match_table = of_omnia_leds_match,
-		.dev_groups = omnia_led_controller_groups,
 	},
 };
 
-- 
2.44.2

