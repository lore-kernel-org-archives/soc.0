Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11DCEC761A6
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 08:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ECDE9C433EF; Tue,  4 Apr 2023 08:24:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73FCC4339B;
	Tue,  4 Apr 2023 08:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680596668;
	bh=DzupnWeoOGy+Q0S7UaV26wirxq+rNaq4TIQ6ayzWeSU=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=q1DOI4MOxSTdRpKNPiEQEY+GekqHAOqM6PRZNB9jvo27I8+Nef7zkloNTAQgR2tk/
	 hZolTQBu/q/CSnPJMYwrgURmVPg/3YhLqlO9Cod44xtN637b1VgMJ5FNkw0VmQ4kKE
	 gmUNZwOQJR/PpEOl8nY4VT3FaDYpxJ6cCfv2QpD1tsOutzkJBOZmhOOUVbmpXJDzKJ
	 29OYUnU8uo+gjfEzFENoc8DDd77k8oNbJ0Ew+DAp2y8R8vMEJZYAN9rY30R4AqhgX9
	 h2QgWreeJ5rdEraJbl/kthdn8cqtWRi3INiyux3NkcXiSJ/d82BE9BX0WfsiFXBPmK
	 4qvPphjRmFXsA==
From: Arnd Bergmann <arnd@kernel.org>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	"Aaro Koskinen" <aaro.koskinen@iki.fi>,
	"Bartosz Golaszewski" <brgl@bgdev.pl>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Christian Lamparter <chunkeey@googlemail.com>,
	"David S. Miller" <davem@davemloft.net>,
	"Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
	"Eric Dumazet" <edumazet@google.com>,
	"Felipe Balbi" <balbi@kernel.org>,
	"Jakub Kicinski" <kuba@kernel.org>,
	"Johannes Berg" <johannes@sipsolutions.net>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
	"Linus Walleij" <linus.walleij@linaro.org>,
	"Paolo Abeni" <pabeni@redhat.com>,
	"Rob Herring" <robh+dt@kernel.org>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Christian Lamparter <chunkeey@gmail.com>
Subject: [PATCH v2 3/3] p54spi: convert to devicetree
Date: Tue,  4 Apr 2023 10:24:01 +0200
Message-Id: <20230404082401.1087835-4-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404082401.1087835-1-arnd@kernel.org>
References: <20230404082401.1087835-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The Prism54 SPI driver hardcodes GPIO numbers and expects users to
pass them as module parameters, apparently a relic from its life as a
staging driver. This works because there is only one user, the Nokia
N8x0 tablet.

Convert this to the gpio descriptor interface and DT based probing
to improve this and simplify the code at the same time.

Acked-by: Christian Lamparter <chunkeey@gmail.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 MAINTAINERS                                |  1 +
 arch/arm/mach-omap2/board-n8x0.c           | 18 ------
 drivers/net/wireless/intersil/p54/p54spi.c | 71 ++++++++--------------
 drivers/net/wireless/intersil/p54/p54spi.h |  3 +
 4 files changed, 30 insertions(+), 63 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4f57deee1a08..9b08dcea913a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15793,6 +15793,7 @@ M:	Christian Lamparter <chunkeey@googlemail.com>
 L:	linux-wireless@vger.kernel.org
 S:	Maintained
 W:	https://wireless.wiki.kernel.org/en/users/Drivers/p54
+F:	Documentation/devicetree/bindings/net/wireless/st,stlc45xx.yaml
 F:	drivers/net/wireless/intersil/p54/
 
 PACKET SOCKETS
diff --git a/arch/arm/mach-omap2/board-n8x0.c b/arch/arm/mach-omap2/board-n8x0.c
index 3353b0a923d9..6a2949f50653 100644
--- a/arch/arm/mach-omap2/board-n8x0.c
+++ b/arch/arm/mach-omap2/board-n8x0.c
@@ -19,7 +19,6 @@
 #include <linux/spi/spi.h>
 #include <linux/usb/musb.h>
 #include <linux/mmc/host.h>
-#include <linux/platform_data/spi-omap2-mcspi.h>
 #include <linux/platform_data/mmc-omap.h>
 #include <linux/mfd/menelaus.h>
 
@@ -142,21 +141,6 @@ static void __init n8x0_usb_init(void) {}
 
 #endif /*CONFIG_USB_MUSB_TUSB6010 */
 
-
-static struct omap2_mcspi_device_config p54spi_mcspi_config = {
-	.turbo_mode	= 0,
-};
-
-static struct spi_board_info n800_spi_board_info[] __initdata = {
-	{
-		.modalias	= "p54spi",
-		.bus_num	= 2,
-		.chip_select	= 0,
-		.max_speed_hz   = 48000000,
-		.controller_data = &p54spi_mcspi_config,
-	},
-};
-
 #if defined(CONFIG_MENELAUS) && IS_ENABLED(CONFIG_MMC_OMAP)
 
 /*
@@ -585,7 +569,5 @@ omap_late_initcall(n8x0_late_initcall);
 void * __init n8x0_legacy_init(void)
 {
 	board_check_revision();
-	spi_register_board_info(n800_spi_board_info,
-				ARRAY_SIZE(n800_spi_board_info));
 	return &mmc1_data;
 }
diff --git a/drivers/net/wireless/intersil/p54/p54spi.c b/drivers/net/wireless/intersil/p54/p54spi.c
index 19152fd449ba..130b36f9eec0 100644
--- a/drivers/net/wireless/intersil/p54/p54spi.c
+++ b/drivers/net/wireless/intersil/p54/p54spi.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
 #include <linux/firmware.h>
@@ -15,7 +16,7 @@
 #include <linux/irq.h>
 #include <linux/spi/spi.h>
 #include <linux/etherdevice.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 
 #include "p54spi.h"
@@ -29,19 +30,6 @@
 
 MODULE_FIRMWARE("3826.arm");
 
-/* gpios should be handled in board files and provided via platform data,
- * but because it's currently impossible for p54spi to have a header file
- * in include/linux, let's use module paramaters for now
- */
-
-static int p54spi_gpio_power = 97;
-module_param(p54spi_gpio_power, int, 0444);
-MODULE_PARM_DESC(p54spi_gpio_power, "gpio number for power line");
-
-static int p54spi_gpio_irq = 87;
-module_param(p54spi_gpio_irq, int, 0444);
-MODULE_PARM_DESC(p54spi_gpio_irq, "gpio number for irq line");
-
 static void p54spi_spi_read(struct p54s_priv *priv, u8 address,
 			      void *buf, size_t len)
 {
@@ -261,14 +249,14 @@ static int p54spi_upload_firmware(struct ieee80211_hw *dev)
 
 static void p54spi_power_off(struct p54s_priv *priv)
 {
-	disable_irq(gpio_to_irq(p54spi_gpio_irq));
-	gpio_set_value(p54spi_gpio_power, 0);
+	disable_irq(priv->irq);
+	gpiod_set_value(priv->gpiodown_power, 1);
 }
 
 static void p54spi_power_on(struct p54s_priv *priv)
 {
-	gpio_set_value(p54spi_gpio_power, 1);
-	enable_irq(gpio_to_irq(p54spi_gpio_irq));
+	gpiod_set_value(priv->gpio_powerdown, 0);
+	enable_irq(priv->irq);
 
 	/* need to wait a while before device can be accessed, the length
 	 * is just a guess
@@ -607,32 +595,20 @@ static int p54spi_probe(struct spi_device *spi)
 		goto err_free;
 	}
 
-	ret = gpio_request(p54spi_gpio_power, "p54spi power");
-	if (ret < 0) {
-		dev_err(&priv->spi->dev, "power GPIO request failed: %d", ret);
+	priv->gpio_powerdown = gpiod_get(&spi->dev, "powerdown", GPIOD_OUT_HIGH);
+	if (IS_ERR(priv->gpio_powerdown)) {
+		ret = PTR_ERR(priv->gpio_powerdown);
+		dev_err(&priv->spi->dev, "powerdown GPIO request failed: %d", ret);
 		goto err_free;
 	}
 
-	ret = gpio_request(p54spi_gpio_irq, "p54spi irq");
-	if (ret < 0) {
-		dev_err(&priv->spi->dev, "irq GPIO request failed: %d", ret);
-		goto err_free_gpio_power;
-	}
-
-	gpio_direction_output(p54spi_gpio_power, 0);
-	gpio_direction_input(p54spi_gpio_irq);
-
-	ret = request_irq(gpio_to_irq(p54spi_gpio_irq),
-			  p54spi_interrupt, 0, "p54spi",
-			  priv->spi);
+	ret = request_irq(spi->irq, p54spi_interrupt, 0, "p54spi", priv->spi);
 	if (ret < 0) {
 		dev_err(&priv->spi->dev, "request_irq() failed");
-		goto err_free_gpio_irq;
+		goto err_free_gpio_power;
 	}
 
-	irq_set_irq_type(gpio_to_irq(p54spi_gpio_irq), IRQ_TYPE_EDGE_RISING);
-
-	disable_irq(gpio_to_irq(p54spi_gpio_irq));
+	disable_irq(priv->irq);
 
 	INIT_WORK(&priv->work, p54spi_work);
 	init_completion(&priv->fw_comp);
@@ -660,11 +636,9 @@ static int p54spi_probe(struct spi_device *spi)
 
 err_free_common:
 	release_firmware(priv->firmware);
-	free_irq(gpio_to_irq(p54spi_gpio_irq), spi);
-err_free_gpio_irq:
-	gpio_free(p54spi_gpio_irq);
+	free_irq(priv->irq, spi);
 err_free_gpio_power:
-	gpio_free(p54spi_gpio_power);
+	gpiod_put(priv->gpio_powerdown);
 err_free:
 	p54_free_common(priv->hw);
 	return ret;
@@ -676,10 +650,8 @@ static void p54spi_remove(struct spi_device *spi)
 
 	p54_unregister_common(priv->hw);
 
-	free_irq(gpio_to_irq(p54spi_gpio_irq), spi);
-
-	gpio_free(p54spi_gpio_power);
-	gpio_free(p54spi_gpio_irq);
+	free_irq(priv->irq, spi);
+	gpiod_put(priv->gpio_powerdown);
 	release_firmware(priv->firmware);
 
 	mutex_destroy(&priv->mutex);
@@ -687,10 +659,19 @@ static void p54spi_remove(struct spi_device *spi)
 	p54_free_common(priv->hw);
 }
 
+struct of_device_id p54spi_of_ids[] = {
+	{ .compatible = "cnxt,3110x", },
+	{ .compatible = "isil,p54spi", },
+	{ .compatible = "st,stlc4550", },
+	{ .compatible = "st,stlc4560", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, p54spi_of_ids);
 
 static struct spi_driver p54spi_driver = {
 	.driver = {
 		.name		= "p54spi",
+		.of_match_table = p54spi_of_ids,
 	},
 
 	.probe		= p54spi_probe,
diff --git a/drivers/net/wireless/intersil/p54/p54spi.h b/drivers/net/wireless/intersil/p54/p54spi.h
index e5619a13fd61..118785cc635a 100644
--- a/drivers/net/wireless/intersil/p54/p54spi.h
+++ b/drivers/net/wireless/intersil/p54/p54spi.h
@@ -107,6 +107,9 @@ struct p54s_priv {
 
 	enum fw_state fw_state;
 	const struct firmware *firmware;
+
+	struct gpio_desc *gpio_powerdown;
+	int irq;
 };
 
 #endif /* P54SPI_H */
-- 
2.39.2

