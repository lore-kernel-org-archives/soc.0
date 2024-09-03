Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96934CD13CF
	for <soc@archiver.kernel.org>; Tue,  3 Sep 2024 10:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D482C4AF0C; Tue,  3 Sep 2024 10:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF797C4CEC4;
	Tue,  3 Sep 2024 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725358798;
	bh=zw+NjY7f5U5FN4S+UaaHtIcRl2Fxl9cmlDbpfPFHgM4=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=N4KyDdVwx+x7SivDaULrm/6i6NrwEryRueXcuxpChXLc0mbP3AkzCh0Y8s/W1Gjog
	 lW55d/xJo+lvdPQjHi8TRZuFNuyuD2h/MyA98+aNZVDTkU2x2+4Wba8967xpzl6v7W
	 9bBQ/yBA5mmJmCyT45hxjStvouspqWPAsxZIKqT6RkKiKQ7eHQvcE2FRRDsUEvdHSD
	 rzxennZ93zUDT3DYzMMYJOARwe9k2e1y5U0jl68bAmR6ih5sR1iQMt2tba43U8GkR0
	 MUv5ByIbJElHZbG5NRzoANOCGf80D+En1UDLSf4NK28M3zX/MNeAm76qCyu2rn+S4A
	 L2U+gX+o6Pz8g==
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
Subject: [PATCH leds v2 07/11] leds: turris-omnia: Inform about missing LED gamma correction feature in the MCU driver
Date: Tue,  3 Sep 2024 12:19:26 +0200
Message-ID: <20240903101930.16251-8-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240903101930.16251-1-kabel@kernel.org>
References: <20240903101930.16251-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If the LED gamma correction feature is missing in the MCU firmware,
inform about this in the MCU firmware probe function instead of LED
driver probe function, so that all the feature checks are in one place.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c               | 6 ------
 drivers/platform/cznic/turris-omnia-mcu-base.c | 1 +
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 51b13d3d7476..8d3bddc90fe0 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -429,12 +429,6 @@ static int omnia_leds_probe(struct i2c_client *client)
 	}
 
 	leds->has_gamma_correction = ret & OMNIA_FEAT_LED_GAMMA_CORRECTION;
-	if (!leds->has_gamma_correction) {
-		dev_info(dev,
-			 "Your board's MCU firmware does not support the LED gamma correction feature.\n");
-		dev_info(dev,
-			 "Consider upgrading MCU firmware with the omnia-mcutool utility.\n");
-	}
 
 	if (ret & OMNIA_FEAT_BRIGHTNESS_INT) {
 		ret = devm_request_any_context_irq(dev, client->irq,
diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index 3bb4a3cfdb29..770e680b96f9 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -259,6 +259,7 @@ static int omnia_mcu_read_features(struct omnia_mcu *mcu)
 		_DEF_FEAT(POWEROFF_WAKEUP,	"poweroff and wakeup"),
 		_DEF_FEAT(TRNG,			"true random number generator"),
 		_DEF_FEAT(BRIGHTNESS_INT,	"LED panel brightness change interrupt"),
+		_DEF_FEAT(LED_GAMMA_CORRECTION,	"LED gamma correction"),
 #undef _DEF_FEAT
 	};
 	struct i2c_client *client = mcu->client;
-- 
2.44.2

