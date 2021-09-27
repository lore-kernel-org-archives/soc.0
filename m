Return-Path: <SRS0=MvIc=OR=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D0DC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 14:43:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14A8660FC2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Sep 2021 14:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 14A8660FC2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hC9auWpOPjbYGmRz7Ig7IowQbMm2z2xketgYtsOFEuI=; b=eWYlHwVy2QFrRB
	SHnNvBPQsi5illz1AwF0o7e3NnhV2Km9y5cgwplGt4UjFWALRILYGH4xD7DF9+94wQovCL0Z5UdZb
	tofaroLuARhnb6hsypYEof71jg3jIG1hjsIPlnzuutM1uxzKIfi7eoqA6FvMZf1FHpM+iPT79SQxj
	Q8lNzjb30nbIjp6mSETrQIbbKG2yIvCY/T9v+AIKL5ivQ1sftJfpJ2VICM8RT0NhixgyMUfbrS3j5
	XL4hdc033MBiqduRlhlnrL3yZFBj6C7mHc43HoLzCZH35j0L62eKHA1/9in5a0tgA25dY1nHqmoCq
	YVgv6ZM3EylzzfIlVkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUrot-002wJe-HE; Mon, 27 Sep 2021 14:41:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUrop-002wJ8-8l
 for linux-arm-kernel@lists.infradead.org; Mon, 27 Sep 2021 14:41:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D57B060FC0;
 Mon, 27 Sep 2021 14:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632753682;
 bh=0PWiE7aBehQZctgpSRfrxYiWBiaogEbKlW2Cy/ew6P8=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=b6NHKIP3HqzsMEojCHdLzj/TojlhAgwhcuA04VzndKKmm7GtRO38qccDjY5Gi3ceZ
 b/fdfURYBK2iD5Cvi6n4d36lJhdNsvcBCzSZhn4jA1Saborc1wVJACj8CuEv3eiWPV
 3BYIS2MGSWpSs0DDIENBcXdEf569K/P6b5BJYiPUixMeWqw7U5jXlgKVLBIFaZNxqG
 1mEruPW1Q69Ij+8k8jytPzgPPpPEjBef1ft6XsHzfFE2dt4r3jCk8iu/Xqwwiwar/k
 7AXJicaKdYxQK0+okdaD1opeP+jZXzmnfmRLyX3Z85ItUWp6Fzu8I90h8U5fYNFS19
 CB6TemyX88m8w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Felipe Balbi <felipe.balbi@linux.intel.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH] ARM: omap1: move omap15xx local bus handling to usb.c
Date: Mon, 27 Sep 2021 16:40:50 +0200
Message-ID: <20210927144118.2464881-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_074123_375088_83470586 
X-CRM114-Status: GOOD (  30.10  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210927144050.v5rfCdoATd3uZe7kebEAIMEbNu8AZ2B52YKlfzGkLtM@z>

From: Arnd Bergmann <arnd@arndb.de>

Commit 38225f2ef2f4 ("ARM/omap1: switch to use dma_direct_set_offset for
lbus DMA offsets") removed a lot of mach/memory.h, but left the USB
offset handling split into arch/arm/mach-omap1/usb.c and
drivers/usb/host/ohci-omap.c.

This can cause a randconfig build warning that now fails the build
with -Werror:

arch/arm/mach-omap1/usb.c:561:30: error: 'omap_1510_usb_ohci_nb' defined but not used [-Werror=unused-variable]
  561 | static struct notifier_block omap_1510_usb_ohci_nb = {
      |                              ^~~~~~~~~~~~~~~~~~~~~

Move it all into the platform file to get rid of the final
location that relies on mach/memory.h.

Acked-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
If there are no objections, I'd apply this to the soc tree for
5.16, or let Tony pick it up into his tree. This was originally
part of a longer series to bring omap1 closer to an allmodconfig
build. If I manage to find some time, I'll also try to resurrect
the rest of that series.
---
 arch/arm/mach-omap1/include/mach/memory.h |  12 ---
 arch/arm/mach-omap1/usb.c                 | 116 +++++++++++++++-------
 drivers/usb/host/ohci-omap.c              |  72 +-------------
 include/linux/platform_data/usb-omap1.h   |   2 +
 4 files changed, 86 insertions(+), 116 deletions(-)

diff --git a/arch/arm/mach-omap1/include/mach/memory.h b/arch/arm/mach-omap1/include/mach/memory.h
index 36bc0000cb6a..ba3a350479c8 100644
--- a/arch/arm/mach-omap1/include/mach/memory.h
+++ b/arch/arm/mach-omap1/include/mach/memory.h
@@ -9,16 +9,4 @@
 /* REVISIT: omap1 legacy drivers still rely on this */
 #include <mach/soc.h>
 
-/*
- * Bus address is physical address, except for OMAP-1510 Local Bus.
- * OMAP-1510 bus address is translated into a Local Bus address if the
- * OMAP bus type is lbus. We do the address translation based on the
- * device overriding the defaults used in the dma-mapping API.
- */
-
-/*
- * OMAP-1510 Local Bus address offset
- */
-#define OMAP1510_LB_OFFSET	UL(0x30000000)
-
 #endif
diff --git a/arch/arm/mach-omap1/usb.c b/arch/arm/mach-omap1/usb.c
index 86d3b3c157af..e60831c82b78 100644
--- a/arch/arm/mach-omap1/usb.c
+++ b/arch/arm/mach-omap1/usb.c
@@ -11,6 +11,7 @@
 #include <linux/platform_device.h>
 #include <linux/dma-map-ops.h>
 #include <linux/io.h>
+#include <linux/delay.h>
 
 #include <asm/irq.h>
 
@@ -206,8 +207,6 @@ static inline void udc_device_init(struct omap_usb_config *pdata)
 
 #endif
 
-#if	IS_ENABLED(CONFIG_USB_OHCI_HCD)
-
 /* The dmamask must be set for OHCI to work */
 static u64 ohci_dmamask = ~(u32)0;
 
@@ -236,20 +235,15 @@ static struct platform_device ohci_device = {
 
 static inline void ohci_device_init(struct omap_usb_config *pdata)
 {
+	if (!IS_ENABLED(CONFIG_USB_OHCI_HCD))
+		return;
+
 	if (cpu_is_omap7xx())
 		ohci_resources[1].start = INT_7XX_USB_HHC_1;
 	pdata->ohci_device = &ohci_device;
 	pdata->ocpi_enable = &ocpi_enable;
 }
 
-#else
-
-static inline void ohci_device_init(struct omap_usb_config *pdata)
-{
-}
-
-#endif
-
 #if	defined(CONFIG_USB_OTG) && defined(CONFIG_ARCH_OMAP_OTG)
 
 static struct resource otg_resources[] = {
@@ -534,33 +528,87 @@ static u32 __init omap1_usb2_init(unsigned nwires, unsigned alt_pingroup)
 }
 
 #ifdef	CONFIG_ARCH_OMAP15XX
+/* OMAP-1510 OHCI has its own MMU for DMA */
+#define OMAP1510_LB_MEMSIZE	32	/* Should be same as SDRAM size */
+#define OMAP1510_LB_CLOCK_DIV	0xfffec10c
+#define OMAP1510_LB_MMU_CTL	0xfffec208
+#define OMAP1510_LB_MMU_LCK	0xfffec224
+#define OMAP1510_LB_MMU_LD_TLB	0xfffec228
+#define OMAP1510_LB_MMU_CAM_H	0xfffec22c
+#define OMAP1510_LB_MMU_CAM_L	0xfffec230
+#define OMAP1510_LB_MMU_RAM_H	0xfffec234
+#define OMAP1510_LB_MMU_RAM_L	0xfffec238
 
-/* ULPD_DPLL_CTRL */
-#define DPLL_IOB		(1 << 13)
-#define DPLL_PLL_ENABLE		(1 << 4)
-#define DPLL_LOCK		(1 << 0)
+/*
+ * Bus address is physical address, except for OMAP-1510 Local Bus.
+ * OMAP-1510 bus address is translated into a Local Bus address if the
+ * OMAP bus type is lbus.
+ */
+#define OMAP1510_LB_OFFSET	   UL(0x30000000)
 
-/* ULPD_APLL_CTRL */
-#define APLL_NDPLL_SWITCH	(1 << 0)
+/*
+ * OMAP-1510 specific Local Bus clock on/off
+ */
+static int omap_1510_local_bus_power(int on)
+{
+	if (on) {
+		omap_writel((1 << 1) | (1 << 0), OMAP1510_LB_MMU_CTL);
+		udelay(200);
+	} else {
+		omap_writel(0, OMAP1510_LB_MMU_CTL);
+	}
 
-static int omap_1510_usb_ohci_notifier(struct notifier_block *nb,
-		unsigned long event, void *data)
+	return 0;
+}
+
+/*
+ * OMAP-1510 specific Local Bus initialization
+ * NOTE: This assumes 32MB memory size in OMAP1510LB_MEMSIZE.
+ *       See also arch/mach-omap/memory.h for __virt_to_dma() and
+ *       __dma_to_virt() which need to match with the physical
+ *       Local Bus address below.
+ */
+static int omap_1510_local_bus_init(void)
 {
-	struct device *dev = data;
+	unsigned int tlb;
+	unsigned long lbaddr, physaddr;
+
+	omap_writel((omap_readl(OMAP1510_LB_CLOCK_DIV) & 0xfffffff8) | 0x4,
+	       OMAP1510_LB_CLOCK_DIV);
+
+	/* Configure the Local Bus MMU table */
+	for (tlb = 0; tlb < OMAP1510_LB_MEMSIZE; tlb++) {
+		lbaddr = tlb * 0x00100000 + OMAP1510_LB_OFFSET;
+		physaddr = tlb * 0x00100000 + PHYS_OFFSET;
+		omap_writel((lbaddr & 0x0fffffff) >> 22, OMAP1510_LB_MMU_CAM_H);
+		omap_writel(((lbaddr & 0x003ffc00) >> 6) | 0xc,
+		       OMAP1510_LB_MMU_CAM_L);
+		omap_writel(physaddr >> 16, OMAP1510_LB_MMU_RAM_H);
+		omap_writel((physaddr & 0x0000fc00) | 0x300, OMAP1510_LB_MMU_RAM_L);
+		omap_writel(tlb << 4, OMAP1510_LB_MMU_LCK);
+		omap_writel(0x1, OMAP1510_LB_MMU_LD_TLB);
+	}
 
-	if (event != BUS_NOTIFY_ADD_DEVICE)
-		return NOTIFY_DONE;
+	/* Enable the walking table */
+	omap_writel(omap_readl(OMAP1510_LB_MMU_CTL) | (1 << 3), OMAP1510_LB_MMU_CTL);
+	udelay(200);
 
-	if (strncmp(dev_name(dev), "ohci", 4) == 0 &&
-	    dma_direct_set_offset(dev, PHYS_OFFSET, OMAP1510_LB_OFFSET,
-			(u64)-1))
-		WARN_ONCE(1, "failed to set DMA offset\n");
-	return NOTIFY_OK;
+	return 0;
 }
 
-static struct notifier_block omap_1510_usb_ohci_nb = {
-	.notifier_call		= omap_1510_usb_ohci_notifier,
-};
+static void omap_1510_local_bus_reset(void)
+{
+	omap_1510_local_bus_power(1);
+	omap_1510_local_bus_init();
+}
+
+/* ULPD_DPLL_CTRL */
+#define DPLL_IOB		(1 << 13)
+#define DPLL_PLL_ENABLE		(1 << 4)
+#define DPLL_LOCK		(1 << 0)
+
+/* ULPD_APLL_CTRL */
+#define APLL_NDPLL_SWITCH	(1 << 0)
 
 static void __init omap_1510_usb_init(struct omap_usb_config *config)
 {
@@ -616,19 +664,19 @@ static void __init omap_1510_usb_init(struct omap_usb_config *config)
 	}
 #endif
 
-#if	IS_ENABLED(CONFIG_USB_OHCI_HCD)
-	if (config->register_host) {
+	if (IS_ENABLED(CONFIG_USB_OHCI_HCD) && config->register_host) {
 		int status;
 
-		bus_register_notifier(&platform_bus_type,
-				      &omap_1510_usb_ohci_nb);
 		ohci_device.dev.platform_data = config;
+		dma_direct_set_offset(&ohci_device.dev, PHYS_OFFSET,
+				      OMAP1510_LB_OFFSET, (u64)-1);
 		status = platform_device_register(&ohci_device);
 		if (status)
 			pr_debug("can't register OHCI device, %d\n", status);
 		/* hcd explicitly gates 48MHz */
+
+		config->lb_reset = omap_1510_local_bus_reset;
 	}
-#endif
 }
 
 #else
diff --git a/drivers/usb/host/ohci-omap.c b/drivers/usb/host/ohci-omap.c
index 0b3722770760..ded9738392e4 100644
--- a/drivers/usb/host/ohci-omap.c
+++ b/drivers/usb/host/ohci-omap.c
@@ -40,17 +40,6 @@
 #include <mach/usb.h>
 
 
-/* OMAP-1510 OHCI has its own MMU for DMA */
-#define OMAP1510_LB_MEMSIZE	32	/* Should be same as SDRAM size */
-#define OMAP1510_LB_CLOCK_DIV	0xfffec10c
-#define OMAP1510_LB_MMU_CTL	0xfffec208
-#define OMAP1510_LB_MMU_LCK	0xfffec224
-#define OMAP1510_LB_MMU_LD_TLB	0xfffec228
-#define OMAP1510_LB_MMU_CAM_H	0xfffec22c
-#define OMAP1510_LB_MMU_CAM_L	0xfffec230
-#define OMAP1510_LB_MMU_RAM_H	0xfffec234
-#define OMAP1510_LB_MMU_RAM_L	0xfffec238
-
 #define DRIVER_DESC "OHCI OMAP driver"
 
 struct ohci_omap_priv {
@@ -104,61 +93,6 @@ static int omap_ohci_transceiver_power(struct ohci_omap_priv *priv, int on)
 	return 0;
 }
 
-#ifdef CONFIG_ARCH_OMAP15XX
-/*
- * OMAP-1510 specific Local Bus clock on/off
- */
-static int omap_1510_local_bus_power(int on)
-{
-	if (on) {
-		omap_writel((1 << 1) | (1 << 0), OMAP1510_LB_MMU_CTL);
-		udelay(200);
-	} else {
-		omap_writel(0, OMAP1510_LB_MMU_CTL);
-	}
-
-	return 0;
-}
-
-/*
- * OMAP-1510 specific Local Bus initialization
- * NOTE: This assumes 32MB memory size in OMAP1510LB_MEMSIZE.
- *       See also arch/mach-omap/memory.h for __virt_to_dma() and
- *       __dma_to_virt() which need to match with the physical
- *       Local Bus address below.
- */
-static int omap_1510_local_bus_init(void)
-{
-	unsigned int tlb;
-	unsigned long lbaddr, physaddr;
-
-	omap_writel((omap_readl(OMAP1510_LB_CLOCK_DIV) & 0xfffffff8) | 0x4,
-	       OMAP1510_LB_CLOCK_DIV);
-
-	/* Configure the Local Bus MMU table */
-	for (tlb = 0; tlb < OMAP1510_LB_MEMSIZE; tlb++) {
-		lbaddr = tlb * 0x00100000 + OMAP1510_LB_OFFSET;
-		physaddr = tlb * 0x00100000 + PHYS_OFFSET;
-		omap_writel((lbaddr & 0x0fffffff) >> 22, OMAP1510_LB_MMU_CAM_H);
-		omap_writel(((lbaddr & 0x003ffc00) >> 6) | 0xc,
-		       OMAP1510_LB_MMU_CAM_L);
-		omap_writel(physaddr >> 16, OMAP1510_LB_MMU_RAM_H);
-		omap_writel((physaddr & 0x0000fc00) | 0x300, OMAP1510_LB_MMU_RAM_L);
-		omap_writel(tlb << 4, OMAP1510_LB_MMU_LCK);
-		omap_writel(0x1, OMAP1510_LB_MMU_LD_TLB);
-	}
-
-	/* Enable the walking table */
-	omap_writel(omap_readl(OMAP1510_LB_MMU_CTL) | (1 << 3), OMAP1510_LB_MMU_CTL);
-	udelay(200);
-
-	return 0;
-}
-#else
-#define omap_1510_local_bus_power(x)	{}
-#define omap_1510_local_bus_init()	{}
-#endif
-
 #ifdef	CONFIG_USB_OTG
 
 static void start_hnp(struct ohci_hcd *ohci)
@@ -229,10 +163,8 @@ static int ohci_omap_reset(struct usb_hcd *hcd)
 
 	omap_ohci_clock_power(priv, 1);
 
-	if (cpu_is_omap15xx()) {
-		omap_1510_local_bus_power(1);
-		omap_1510_local_bus_init();
-	}
+	if (config->lb_reset)
+		config->lb_reset();
 
 	ret = ohci_setup(hcd);
 	if (ret < 0)
diff --git a/include/linux/platform_data/usb-omap1.h b/include/linux/platform_data/usb-omap1.h
index 43b5ce139c37..878e572a78bf 100644
--- a/include/linux/platform_data/usb-omap1.h
+++ b/include/linux/platform_data/usb-omap1.h
@@ -48,6 +48,8 @@ struct omap_usb_config {
 	u32 (*usb2_init)(unsigned nwires, unsigned alt_pingroup);
 
 	int (*ocpi_enable)(void);
+
+	void (*lb_reset)(void);
 };
 
 #endif /* __LINUX_USB_OMAP1_H */
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
