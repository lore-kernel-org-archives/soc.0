Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9D3C7EE25
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 15:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0318DC433D2; Tue, 16 May 2023 15:32:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC04C433A7;
	Tue, 16 May 2023 15:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684251162;
	bh=poBedNYca11WcbITBXBuz+ooZ6HYTQ+UBh0gmv7VB8A=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RaMLjoUme5tPm65FUZABY/287OPkHR/67/TSDDl0Gx1GddULP1jQohF/9X62GeEAi
	 qVtirzrbkFsnn8ckUoTSX9H91191iRF1CeRVmQXvb8wv2dpn2Sow0ngktUGH8FmhHR
	 xwlcNGtJUqHm2iclK1qhONDrE3qjvyM1g7X13LxuJUaun+LaH04V0JkY4l3OmZDrlw
	 X4JovRCBOqM263l8R3YYDg8sAdQUeSjyOyC6oAcu2VKedtyc1TO+TLa61WZCqlMW3v
	 OzMrPPcrvgkYafXz7UiCqPeBj6uRW9u5WsdFSNEibj/AoYXLP8EmvosOP7gxaqpVcO
	 9lFz+qhMYn9CA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 10/13] ARM: pxa: fix missing-prototypes warnings
Date: Tue, 16 May 2023 17:31:06 +0200
Message-Id: <20230516153109.514251-11-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516153109.514251-1-arnd@kernel.org>
References: <20230516153109.514251-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The PXA platform has a number of configurations that end up with
a warning like these when building with W=1:

drivers/hwmon/max1111.c:83:5: error: no previous prototype for 'max1111_read_channel' [-Werror=missing-prototypes]
arch/arm/mach-pxa/reset.c:86:6: error: no previous prototype for 'pxa_restart' [-Werror=missing-prototypes]
arch/arm/mach-pxa/mfp-pxa2xx.c:254:5: error: no previous prototype for 'keypad_set_wake' [-Werror=missing-prototypes]
drivers/clk/pxa/clk-pxa25x.c:70:14: error: no previous prototype for 'pxa25x_get_clk_frequency_khz' [-Werror=missing-prototypes]
drivers/clk/pxa/clk-pxa25x.c:325:12: error: no previous prototype for 'pxa25x_clocks_init' [-Werror=missing-prototypes]
drivers/clk/pxa/clk-pxa27x.c:74:14: error: no previous prototype for 'pxa27x_get_clk_frequency_khz' [-Werror=missing-prototypes]
drivers/clk/pxa/clk-pxa27x.c:102:6: error: no previous prototype for 'pxa27x_is_ppll_disabled' [-Werror=missing-prototypes]
drivers/clk/pxa/clk-pxa27x.c:470:12: error: no previous prototype for 'pxa27x_clocks_init' [-Werror=missing-prototypes]
arch/arm/mach-pxa/pxa27x.c:44:6: error: no previous prototype for 'pxa27x_clear_otgph' [-Werror=missing-prototypes]
arch/arm/mach-pxa/pxa27x.c:58:6: error: no previous prototype for 'pxa27x_configure_ac97reset' [-Werror=missing-prototypes]
arch/arm/mach-pxa/spitz_pm.c:170:15: error: no previous prototype for 'spitzpm_read_devdata' [-Werror=missing-prototypes]

The problem is that there is a declaration for each of these, but
it's only seen by the caller and not the callee. Moving these
into appropriate header files ensures that both use the same
calling conventions and it avoids the warnings.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/generic.h              | 15 ---------------
 arch/arm/mach-pxa/mfp-pxa2xx.c           |  1 +
 arch/arm/mach-pxa/pxa25x.c               |  1 +
 arch/arm/mach-pxa/pxa27x.c               |  3 +++
 arch/arm/mach-pxa/reset.c                |  1 +
 arch/arm/mach-pxa/spitz_pm.c             |  2 +-
 drivers/clk/pxa/clk-pxa25x.c             |  2 ++
 drivers/clk/pxa/clk-pxa27x.c             |  3 ++-
 drivers/hwmon/max1111.c                  |  1 +
 drivers/usb/gadget/udc/pxa27x_udc.c      |  6 ------
 drivers/usb/host/ohci-pxa27x.c           |  7 +------
 include/linux/platform_data/asoc-pxa.h   |  1 +
 include/linux/platform_data/pxa2xx_udc.h |  6 ++++++
 include/linux/soc/pxa/smemc.h            | 16 ++++++++++++++++
 sound/arm/pxa2xx-ac97-lib.c              |  2 --
 15 files changed, 36 insertions(+), 31 deletions(-)

diff --git a/arch/arm/mach-pxa/generic.h b/arch/arm/mach-pxa/generic.h
index 7bb1499de4c5..c9c2c46ecead 100644
--- a/arch/arm/mach-pxa/generic.h
+++ b/arch/arm/mach-pxa/generic.h
@@ -27,7 +27,6 @@ extern void __init pxa25x_map_io(void);
 extern void __init pxa26x_init_irq(void);
 
 #define pxa27x_handle_irq ichp_handle_irq
-extern unsigned	pxa27x_get_clk_frequency_khz(int);
 extern void __init pxa27x_init_irq(void);
 extern void __init pxa27x_map_io(void);
 
@@ -52,18 +51,4 @@ extern void pxa2xx_clear_reset_status(unsigned int);
 static inline void pxa2xx_clear_reset_status(unsigned int mask) {}
 #endif
 
-/*
- * Once fully converted to the clock framework, all these functions should be
- * removed, and replaced with a clk_get(NULL, "core").
- */
-#ifdef CONFIG_PXA25x
-extern unsigned pxa25x_get_clk_frequency_khz(int);
-#else
-#define pxa25x_get_clk_frequency_khz(x)		(0)
-#endif
-
-#ifdef CONFIG_PXA27x
-#else
-#define pxa27x_get_clk_frequency_khz(x)		(0)
-#endif
 
diff --git a/arch/arm/mach-pxa/mfp-pxa2xx.c b/arch/arm/mach-pxa/mfp-pxa2xx.c
index b556452dfcf9..f5a3d890f682 100644
--- a/arch/arm/mach-pxa/mfp-pxa2xx.c
+++ b/arch/arm/mach-pxa/mfp-pxa2xx.c
@@ -20,6 +20,7 @@
 
 #include "pxa2xx-regs.h"
 #include "mfp-pxa2xx.h"
+#include "mfp-pxa27x.h"
 
 #include "generic.h"
 
diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index 802babff6c91..d6c6aaeb02ad 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -27,6 +27,7 @@
 #include <linux/irqchip.h>
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/soc/pxa/cpu.h>
+#include <linux/soc/pxa/smemc.h>
 
 #include <asm/mach/map.h>
 #include <asm/suspend.h>
diff --git a/arch/arm/mach-pxa/pxa27x.c b/arch/arm/mach-pxa/pxa27x.c
index bc47552b763c..7e7aaeff95b2 100644
--- a/arch/arm/mach-pxa/pxa27x.c
+++ b/arch/arm/mach-pxa/pxa27x.c
@@ -24,6 +24,7 @@
 #include <linux/platform_data/i2c-pxa.h>
 #include <linux/platform_data/mmp_dma.h>
 #include <linux/soc/pxa/cpu.h>
+#include <linux/soc/pxa/smemc.h>
 
 #include <asm/mach/map.h>
 #include <asm/irq.h>
@@ -31,7 +32,9 @@
 #include "irqs.h"
 #include "pxa27x.h"
 #include "reset.h"
+#include <linux/platform_data/pxa2xx_udc.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
+#include <linux/platform_data/asoc-pxa.h>
 #include "pm.h"
 #include "addr-map.h"
 #include "smemc.h"
diff --git a/arch/arm/mach-pxa/reset.c b/arch/arm/mach-pxa/reset.c
index f0be90573ad3..27293549f8ad 100644
--- a/arch/arm/mach-pxa/reset.c
+++ b/arch/arm/mach-pxa/reset.c
@@ -10,6 +10,7 @@
 #include "regs-ost.h"
 #include "reset.h"
 #include "smemc.h"
+#include "generic.h"
 
 static void do_hw_reset(void);
 
diff --git a/arch/arm/mach-pxa/spitz_pm.c b/arch/arm/mach-pxa/spitz_pm.c
index 4001fa589a2b..9571f2b5b118 100644
--- a/arch/arm/mach-pxa/spitz_pm.c
+++ b/arch/arm/mach-pxa/spitz_pm.c
@@ -167,7 +167,7 @@ static bool spitz_charger_wakeup(void)
 		gpio_get_value(SPITZ_GPIO_SYNC);
 }
 
-unsigned long spitzpm_read_devdata(int type)
+static unsigned long spitzpm_read_devdata(int type)
 {
 	switch (type) {
 	case SHARPSL_STATUS_ACIN:
diff --git a/drivers/clk/pxa/clk-pxa25x.c b/drivers/clk/pxa/clk-pxa25x.c
index 93d5907b8530..0a4da519d704 100644
--- a/drivers/clk/pxa/clk-pxa25x.c
+++ b/drivers/clk/pxa/clk-pxa25x.c
@@ -11,10 +11,12 @@
  */
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
+#include <linux/clk/pxa.h>
 #include <linux/clkdev.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/soc/pxa/smemc.h>
+#include <linux/soc/pxa/cpu.h>
 
 #include <dt-bindings/clock/pxa-clock.h>
 #include "clk-pxa.h"
diff --git a/drivers/clk/pxa/clk-pxa27x.c b/drivers/clk/pxa/clk-pxa27x.c
index 116c6ac666e3..2bea89874ec1 100644
--- a/drivers/clk/pxa/clk-pxa27x.c
+++ b/drivers/clk/pxa/clk-pxa27x.c
@@ -12,6 +12,7 @@
 #include <linux/clkdev.h>
 #include <linux/of.h>
 #include <linux/soc/pxa/smemc.h>
+#include <linux/clk/pxa.h>
 
 #include <dt-bindings/clock/pxa-clock.h>
 #include "clk-pxa.h"
@@ -99,7 +100,7 @@ unsigned int pxa27x_get_clk_frequency_khz(int info)
 	return (unsigned int)clks[0] / KHz;
 }
 
-bool pxa27x_is_ppll_disabled(void)
+static bool pxa27x_is_ppll_disabled(void)
 {
 	unsigned long ccsr = readl(clk_regs + CCSR);
 
diff --git a/drivers/hwmon/max1111.c b/drivers/hwmon/max1111.c
index 4c5487aeb3cf..5cc08c720b52 100644
--- a/drivers/hwmon/max1111.c
+++ b/drivers/hwmon/max1111.c
@@ -80,6 +80,7 @@ static int max1111_read(struct device *dev, int channel)
 #ifdef CONFIG_SHARPSL_PM
 static struct max1111_data *the_max1111;
 
+int max1111_read_channel(int channel);
 int max1111_read_channel(int channel)
 {
 	if (!the_max1111 || !the_max1111->spi)
diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
index 160c7bd1024e..af1707a8829b 100644
--- a/drivers/usb/gadget/udc/pxa27x_udc.c
+++ b/drivers/usb/gadget/udc/pxa27x_udc.c
@@ -2472,12 +2472,6 @@ static void pxa_udc_shutdown(struct platform_device *_dev)
 		udc_disable(udc);
 }
 
-#ifdef CONFIG_PXA27x
-extern void pxa27x_clear_otgph(void);
-#else
-#define pxa27x_clear_otgph()   do {} while (0)
-#endif
-
 #ifdef CONFIG_PM
 /**
  * pxa_udc_suspend - Suspend udc device
diff --git a/drivers/usb/host/ohci-pxa27x.c b/drivers/usb/host/ohci-pxa27x.c
index 0bc7e96bcc93..dcac2938789a 100644
--- a/drivers/usb/host/ohci-pxa27x.c
+++ b/drivers/usb/host/ohci-pxa27x.c
@@ -29,6 +29,7 @@
 #include <linux/of_platform.h>
 #include <linux/of_gpio.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
+#include <linux/platform_data/pxa2xx_udc.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/signal.h>
@@ -263,12 +264,6 @@ static inline void pxa27x_reset_hc(struct pxa27x_ohci *pxa_ohci)
 	__raw_writel(uhchr & ~UHCHR_FHR, pxa_ohci->mmio_base + UHCHR);
 }
 
-#ifdef CONFIG_PXA27x
-extern void pxa27x_clear_otgph(void);
-#else
-#define pxa27x_clear_otgph()	do {} while (0)
-#endif
-
 static int pxa27x_start_hc(struct pxa27x_ohci *pxa_ohci, struct device *dev)
 {
 	int retval;
diff --git a/include/linux/platform_data/asoc-pxa.h b/include/linux/platform_data/asoc-pxa.h
index 327454cd8246..7b5b9e20fbf5 100644
--- a/include/linux/platform_data/asoc-pxa.h
+++ b/include/linux/platform_data/asoc-pxa.h
@@ -27,5 +27,6 @@ typedef struct {
 } pxa2xx_audio_ops_t;
 
 extern void pxa_set_ac97_info(pxa2xx_audio_ops_t *ops);
+extern void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio);
 
 #endif
diff --git a/include/linux/platform_data/pxa2xx_udc.h b/include/linux/platform_data/pxa2xx_udc.h
index 102d47c53d6d..996a73e8fb80 100644
--- a/include/linux/platform_data/pxa2xx_udc.h
+++ b/include/linux/platform_data/pxa2xx_udc.h
@@ -25,4 +25,10 @@ struct pxa2xx_udc_platform_data {
 	int	gpio_pullup;			/* high == pullup activated */
 };
 
+#ifdef CONFIG_PXA27x
+extern void pxa27x_clear_otgph(void);
+#else
+#define pxa27x_clear_otgph()	do {} while (0)
+#endif
+
 #endif
diff --git a/include/linux/soc/pxa/smemc.h b/include/linux/soc/pxa/smemc.h
index f1ffea236c15..4feb1dded3ec 100644
--- a/include/linux/soc/pxa/smemc.h
+++ b/include/linux/soc/pxa/smemc.h
@@ -10,4 +10,20 @@ int pxa2xx_smemc_get_sdram_rows(void);
 unsigned int pxa3xx_smemc_get_memclkdiv(void);
 void __iomem *pxa_smemc_get_mdrefr(void);
 
+/*
+ * Once fully converted to the clock framework, all these functions should be
+ * removed, and replaced with a clk_get(NULL, "core").
+ */
+#ifdef CONFIG_PXA25x
+extern unsigned pxa25x_get_clk_frequency_khz(int);
+#else
+#define pxa25x_get_clk_frequency_khz(x)		(0)
+#endif
+
+#ifdef CONFIG_PXA27x
+extern unsigned pxa27x_get_clk_frequency_khz(int);
+#else
+#define pxa27x_get_clk_frequency_khz(x)		(0)
+#endif
+
 #endif
diff --git a/sound/arm/pxa2xx-ac97-lib.c b/sound/arm/pxa2xx-ac97-lib.c
index 2ca33fd5a575..a03a3291de84 100644
--- a/sound/arm/pxa2xx-ac97-lib.c
+++ b/sound/arm/pxa2xx-ac97-lib.c
@@ -33,8 +33,6 @@ static struct clk *ac97conf_clk;
 static int reset_gpio;
 static void __iomem *ac97_reg_base;
 
-extern void pxa27x_configure_ac97reset(int reset_gpio, bool to_gpio);
-
 /*
  * Beware PXA27x bugs:
  *
-- 
2.39.2

