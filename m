Return-Path: <SRS0=rNyZ=FO=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3896C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 20:04:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F92222D5A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Dec 2020 20:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F92222D5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=urwXFKTiv13U2TYkkpBXyLS3JTwP5GnNoVe6eTcMw/g=; b=Nflqm319mvjXsXnY6nXvvvKAG
	Yc9mUhx8vrZOpIcvRrCNpJ22lAZVBAQ9JIuI6c35HCUuFVHS4hXzWLZbQEgIN6my1ABm+lHS13m71
	tLTp1w+ojAoqCYrCvetmrjakCg0h3mbAMB3vxz2Gursp7CqnBwd99tZkMEdEdWCbbedqunLn7MO7v
	kKP+iTGCeF2200uWG+x9hGrwdXhqgHhrKtUzaK2xhCkk1qOw51BdM702GL3HSqnFzVgLCA27mmEP7
	1jVd66GmlObvJl1Df1atwPMT75g+u9ZTZ576vH1QylZl05UWMjOFzunIzo1A8JVVjtNl24tVkkBgX
	ZiymXR9zQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knS9x-0001f9-1E; Thu, 10 Dec 2020 20:03:29 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knS9q-0001dT-Ig
 for linux-arm-kernel@lists.infradead.org; Thu, 10 Dec 2020 20:03:23 +0000
Received: by mail-ot1-f68.google.com with SMTP id 11so6089713oty.9
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 10 Dec 2020 12:03:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yMZLlSq3lxvwuPHVX5TX4Re3z8tBFVB0mWh2Fx0zmtc=;
 b=rLhYHIHP1lFP2pCnFGeDbU85S/jAAXOslFVaD/KwWvNdM/6Zm/9ZNnnpk1cXiV14aE
 MgkYCe4eNW5rF11P6nsNxmSXFRLrwN7n8OjyHds8z2dohylLircsA8VT9SPAIIxeQvDZ
 kQr2cxkxmubEWcNaHR8gE0OmlIpyxdYKzWpDwWf79RjlEcIE++B8BiDASporFdhkSv8a
 O+LY+ApTEL1p1I2YtTp46sktpWryAEM75tutozLhxHsWfpe5Bqp+d27cOhsnt8X6DQxy
 iC1x47FN/dTtP/4RBHYofoWaJvuvdiWGDZMYjdPbpySMrfW7PdCT7bl6QproC9+AL42b
 zOvw==
X-Gm-Message-State: AOAM530ioBMXhoXOkuOQJLPUh4Ws9xNK8PIRCnoPz0JdrZLbQ/GBvELP
 QD4lDpSk3JEMcyZI4Sbfww==
X-Google-Smtp-Source: ABdhPJzlqBNeD22WHSE6CjWpP84aHB+xxtAgCBG7Ge75WUiIM6OmvPlMnMo3GFn3sC+vLh2YTJRsMQ==
X-Received: by 2002:a9d:2de9:: with SMTP id g96mr7098507otb.209.1607630601240; 
 Thu, 10 Dec 2020 12:03:21 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id o82sm1220636oih.5.2020.12.10.12.03.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 12:03:20 -0800 (PST)
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Jamie Iles <jamie@jamieiles.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, soc@kernel.org
Subject: [PATCH 2/4] ARM: Remove PicoXcell platform support
Date: Thu, 10 Dec 2020 14:03:13 -0600
Message-ID: <20201210200315.2965567-3-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210200315.2965567-1-robh@kernel.org>
References: <20201210200315.2965567-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_150322_680726_0C9DCF1F 
X-CRM114-Status: GOOD (  21.88  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201210200313.6OrELO4vjmx0CzEMulsf67gLNqHnNzabwRNf0aTTXv0@z>

PicoXcell has had nothing but treewide cleanups for at least the last 8
years and no signs of activity. The most recent activity is a yocto vendor
kernel based on v3.0 in 2015.

Cc: Jamie Iles <jamie@jamieiles.com>
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 MAINTAINERS                      |  9 ----
 arch/arm/Kconfig                 |  2 -
 arch/arm/Kconfig.debug           | 13 +----
 arch/arm/Makefile                |  1 -
 arch/arm/mach-picoxcell/Kconfig  |  9 ----
 arch/arm/mach-picoxcell/Makefile |  2 -
 arch/arm/mach-picoxcell/common.c | 81 --------------------------------
 7 files changed, 1 insertion(+), 116 deletions(-)
 delete mode 100644 arch/arm/mach-picoxcell/Kconfig
 delete mode 100644 arch/arm/mach-picoxcell/Makefile
 delete mode 100644 arch/arm/mach-picoxcell/common.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b516bb34a8d5..48a971f61d77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13760,15 +13760,6 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-picolcd*
 
-PICOXCELL SUPPORT
-M:	Jamie Iles <jamie@jamieiles.com>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Supported
-T:	git git://github.com/jamieiles/linux-2.6-ji.git
-F:	arch/arm/boot/dts/picoxcell*
-F:	arch/arm/mach-picoxcell/
-F:	drivers/crypto/picoxcell*
-
 PIDFD API
 M:	Christian Brauner <christian@brauner.io>
 L:	linux-kernel@vger.kernel.org
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index fe2f17eb2b50..e59d9bee6cd4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -693,8 +693,6 @@ source "arch/arm/mach-orion5x/Kconfig"
 
 source "arch/arm/mach-oxnas/Kconfig"
 
-source "arch/arm/mach-picoxcell/Kconfig"
-
 source "arch/arm/mach-prima2/Kconfig"
 
 source "arch/arm/mach-pxa/Kconfig"
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index 8986a91a6f31..10a6b5d1f380 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -770,14 +770,6 @@ choice
 		depends on ARCH_OMAP2PLUS
 		select DEBUG_OMAP2PLUS_UART
 
-	config DEBUG_PICOXCELL_UART
-		depends on ARCH_PICOXCELL
-		bool "Use PicoXcell UART for low-level debug"
-		select DEBUG_UART_8250
-		help
-		  Say Y here if you want kernel low-level debugging support
-		  on PicoXcell based platforms.
-
 	config DEBUG_PXA_UART1
 		depends on ARCH_PXA
 		bool "Use PXA UART1 for low-level debug"
@@ -1717,7 +1709,6 @@ config DEBUG_UART_PHYS
 	default 0x80010000 if DEBUG_ASM9260_UART
 	default 0x80070000 if DEBUG_IMX23_UART
 	default 0x80074000 if DEBUG_IMX28_UART
-	default 0x80230000 if DEBUG_PICOXCELL_UART
 	default 0x808c0000 if DEBUG_EP93XX || ARCH_EP93XX
 	default 0x90020000 if DEBUG_NSPIRE_CLASSIC_UART || DEBUG_NSPIRE_CX_UART
 	default 0xb0060000 if DEBUG_SIRFPRIMA2_UART1
@@ -1852,7 +1843,6 @@ config DEBUG_UART_VIRT
 	default 0xfe017000 if DEBUG_MMP_UART2
 	default 0xfe018000 if DEBUG_MMP_UART3
 	default 0xfe100000 if DEBUG_IMX23_UART || DEBUG_IMX28_UART
-	default 0xfe230000 if DEBUG_PICOXCELL_UART
 	default 0xfe300000 if DEBUG_BCM_KONA_UART
 	default 0xfe800000 if ARCH_IOP32X
 	default 0xfeb00000 if DEBUG_HI3620_UART || DEBUG_HIX5HD2_UART
@@ -1907,8 +1897,7 @@ config DEBUG_UART_8250_WORD
 	bool "Use 32-bit accesses for 8250 UART"
 	depends on DEBUG_LL_UART_8250 || DEBUG_UART_8250
 	depends on DEBUG_UART_8250_SHIFT >= 2
-	default y if DEBUG_PICOXCELL_UART || \
-		DEBUG_SOCFPGA_UART0 || DEBUG_SOCFPGA_ARRIA10_UART1 || \
+	default y if DEBUG_SOCFPGA_UART0 || DEBUG_SOCFPGA_ARRIA10_UART1 || \
 		DEBUG_SOCFPGA_CYCLONE5_UART1 || DEBUG_KEYSTONE_UART0 || \
 		DEBUG_KEYSTONE_UART1 || DEBUG_ALPINE_UART0 || \
 		DEBUG_DAVINCI_DMx_UART0 || DEBUG_DAVINCI_DA8XX_UART1 || \
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 4d76eab2b22d..81142fb677cd 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -204,7 +204,6 @@ machine-$(CONFIG_ARCH_OXNAS)		+= oxnas
 machine-$(CONFIG_ARCH_OMAP1)		+= omap1
 machine-$(CONFIG_ARCH_OMAP2PLUS)	+= omap2
 machine-$(CONFIG_ARCH_ORION5X)		+= orion5x
-machine-$(CONFIG_ARCH_PICOXCELL)	+= picoxcell
 machine-$(CONFIG_ARCH_PXA)		+= pxa
 machine-$(CONFIG_ARCH_QCOM)		+= qcom
 machine-$(CONFIG_ARCH_RDA)		+= rda
diff --git a/arch/arm/mach-picoxcell/Kconfig b/arch/arm/mach-picoxcell/Kconfig
deleted file mode 100644
index b8eba18c0265..000000000000
--- a/arch/arm/mach-picoxcell/Kconfig
+++ /dev/null
@@ -1,9 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-config ARCH_PICOXCELL
-	bool "Picochip PicoXcell"
-	depends on ARCH_MULTI_V6
-	select ARM_VIC
-	select DW_APB_TIMER_OF
-	select GPIOLIB
-	select HAVE_TCM
-	select NO_IOPORT_MAP
diff --git a/arch/arm/mach-picoxcell/Makefile b/arch/arm/mach-picoxcell/Makefile
deleted file mode 100644
index aef03938005c..000000000000
--- a/arch/arm/mach-picoxcell/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-y	:= common.o
diff --git a/arch/arm/mach-picoxcell/common.c b/arch/arm/mach-picoxcell/common.c
deleted file mode 100644
index 8e738266a66a..000000000000
--- a/arch/arm/mach-picoxcell/common.c
+++ /dev/null
@@ -1,81 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2011 Picochip Ltd., Jamie Iles
- *
- * All enquiries to support@picochip.com
- */
-#include <linux/delay.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/reboot.h>
-
-#include <asm/mach/arch.h>
-#include <asm/mach/map.h>
-
-#define PHYS_TO_IO(x)			(((x) & 0x00ffffff) | 0xfe000000)
-#define PICOXCELL_PERIPH_BASE		0x80000000
-#define PICOXCELL_PERIPH_LENGTH		SZ_4M
-
-#define WDT_CTRL_REG_EN_MASK		(1 << 0)
-#define WDT_CTRL_REG_OFFS		(0x00)
-#define WDT_TIMEOUT_REG_OFFS		(0x04)
-static void __iomem *wdt_regs;
-
-/*
- * The machine restart method can be called from an atomic context so we won't
- * be able to ioremap the regs then.
- */
-static void picoxcell_setup_restart(void)
-{
-	struct device_node *np = of_find_compatible_node(NULL, NULL,
-							 "snps,dw-apb-wdg");
-	if (WARN(!np, "unable to setup watchdog restart"))
-		return;
-
-	wdt_regs = of_iomap(np, 0);
-	WARN(!wdt_regs, "failed to remap watchdog regs");
-}
-
-static struct map_desc io_map __initdata = {
-	.virtual	= PHYS_TO_IO(PICOXCELL_PERIPH_BASE),
-	.pfn		= __phys_to_pfn(PICOXCELL_PERIPH_BASE),
-	.length		= PICOXCELL_PERIPH_LENGTH,
-	.type		= MT_DEVICE,
-};
-
-static void __init picoxcell_map_io(void)
-{
-	iotable_init(&io_map, 1);
-}
-
-static void __init picoxcell_init_machine(void)
-{
-	picoxcell_setup_restart();
-}
-
-static const char *picoxcell_dt_match[] = {
-	"picochip,pc3x2",
-	"picochip,pc3x3",
-	NULL
-};
-
-static void picoxcell_wdt_restart(enum reboot_mode mode, const char *cmd)
-{
-	/*
-	 * Configure the watchdog to reset with the shortest possible timeout
-	 * and give it chance to do the reset.
-	 */
-	if (wdt_regs) {
-		writel_relaxed(WDT_CTRL_REG_EN_MASK, wdt_regs + WDT_CTRL_REG_OFFS);
-		writel_relaxed(0, wdt_regs + WDT_TIMEOUT_REG_OFFS);
-		/* No sleeping, possibly atomic. */
-		mdelay(500);
-	}
-}
-
-DT_MACHINE_START(PICOXCELL, "Picochip picoXcell")
-	.map_io		= picoxcell_map_io,
-	.init_machine	= picoxcell_init_machine,
-	.dt_compat	= picoxcell_dt_match,
-	.restart	= picoxcell_wdt_restart,
-MACHINE_END
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
