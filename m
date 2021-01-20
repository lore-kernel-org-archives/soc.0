Return-Path: <SRS0=0ZpT=GX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC61C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 12:50:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6E9723340
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Jan 2021 12:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6E9723340
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=azbKHdrJKqJ+CPynA9+XKyxwfTsVF77bF5/SzskTa4I=; b=rnXjLCkkr60XRiiLL9N8EFyRW
	Z1i387Y9fk/NNjdmAayo/RvM6fpJd08NN7AE7UbSuJTOduTjssSMJxk8jfGs9T/I0j6o098zSLNG8
	idLsuEngb7zIhoKIVfV8SGMjU9m0Svc0TGP/iEzhqLkkmAxoGWFzHlyzALVf/9JfBMEhPiQkPe87u
	eNXRK7lg48QO/QKyXZTQr1Wajq8EC3RLT0Ay4TAHt+lY0akEULTzz8HqCUoHUVoYj/lDbK8E9MK0a
	d6ghRFrfk/aeQC8OhbBth116Sa52kY5igHWEcp7ZCNHTVyUJj0EfwTllMCzO9GjjGQidEAoxJW8p5
	tlLhGlr3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Cus-0002Fj-Cr; Wed, 20 Jan 2021 12:48:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Cui-0002CG-8q
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Jan 2021 12:48:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAFD423371;
 Wed, 20 Jan 2021 12:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611146923;
 bh=/Wl34/jHn9mrIFox4YO2TVo/JCUUjHA0k/OxWK3F5AE=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FCoxzWvexWDhnhbLRvae28eh7x/aERpfpG1hbpXUjhVX1NmW1xS4JYs3a5D1LBpaW
 JX1BZGHvlV/ANbxJMhieW2PcVAvFYgS6a1DofNMZfeSqkJ2JwN2wFB4bfOvuhKCPbc
 c2iVcdRPRfAf7V88FUimKANN2qm5gaRaGAZsm9XRrHTsaRrXsMAbFr+vwIEa+u2dVu
 QDILCkA2YV84/pX+m44gVWALQNxfHwhysq4LAeJTABJAEBXirm4S9EHnF1Gf6VBi53
 8kFq2l8d7nPknMeVFRzKmpB4NfOKBj5m5eO8lfRLbLmSMzLc6knIwevsTbOIJYbpwd
 IWQLHoMSjWFBw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 soc@kernel.org
Subject: [PATCH 3/5] ARM: remove zte zx platform
Date: Wed, 20 Jan 2021 13:48:10 +0100
Message-ID: <20210120124812.2800027-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120124812.2800027-1-arnd@kernel.org>
References: <20210120124812.2800027-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_074844_617397_1894963E 
X-CRM114-Status: GOOD (  19.91  )
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
Cc: Jun Nie <jun.nie@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210120124810.ramxkLGAIHcy1z8clF3JyGd8-9uD4QOkVaAgmGJlUmw@z>

From: Arnd Bergmann <arnd@arndb.de>

The ZTE ZX set-top-box SoC platform was added in 2015 by Jun Nie, with
Baoyou Xie and Shawn Guo subsequently becoming maintainers after the
addition of the 64-bit variant.

However, the only machines that were ever supported upstream are the
reference designs, not actual set-top-box devices that would benefit
from this support. All ZTE set-top-boxes from the past few years seem
to be based on third-party SoCs. While there is very little information
about zx296702 and zx296718 on the web, I found some references to other
chips from the same family, such as zx296716 and zx296719, which were
never submitted for upstream support. Finally, there is no support for
the GPU on either of them, with the lima and panfrost device drivers
having been added after work on the zx platform had stopped.

Shawn confirmed that he has not seen any interest in this platform for
the past four years, and that it can be removed.

Thanks to Jun and Shawn for maintaining this platform over the past
five years.

Cc: Jun Nie <jun.nie@linaro.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 .../devicetree/bindings/arm/zte,sysctrl.txt   |  30 -
 .../devicetree/bindings/arm/zte.yaml          |  28 -
 .../bindings/reset/zte,zx2967-reset.txt       |  20 -
 .../devicetree/bindings/serial/pl011.yaml     |   2 -
 .../devicetree/bindings/soc/zte/pd-2967xx.txt |  19 -
 MAINTAINERS                                   |  42 --
 arch/arm/Kconfig                              |   2 -
 arch/arm/Kconfig.debug                        |  14 -
 arch/arm/Makefile                             |   1 -
 arch/arm/boot/dts/Makefile                    |   1 -
 arch/arm/boot/dts/zx296702-ad1.dts            |  48 --
 arch/arm/boot/dts/zx296702.dtsi               | 142 ----
 arch/arm/configs/zx_defconfig                 | 122 ----
 arch/arm/mach-zx/Kconfig                      |  21 -
 arch/arm/mach-zx/Makefile                     |   3 -
 arch/arm/mach-zx/core.h                       |  16 -
 arch/arm/mach-zx/headsmp.S                    |  30 -
 arch/arm/mach-zx/platsmp.c                    | 186 ------
 arch/arm/mach-zx/zx296702-pm-domain.c         | 202 ------
 arch/arm/mach-zx/zx296702.c                   |  22 -
 arch/arm64/Kconfig.platforms                  |   6 -
 arch/arm64/boot/dts/Makefile                  |   1 -
 arch/arm64/boot/dts/zte/Makefile              |   3 -
 arch/arm64/boot/dts/zte/zx296718-evb.dts      | 144 ----
 arch/arm64/boot/dts/zte/zx296718-pcbox.dts    | 143 ----
 arch/arm64/boot/dts/zte/zx296718.dtsi         | 627 ------------------
 drivers/reset/Kconfig                         |   2 +-
 drivers/soc/Kconfig                           |   1 -
 drivers/soc/Makefile                          |   1 -
 drivers/soc/zte/Kconfig                       |  15 -
 drivers/soc/zte/Makefile                      |   6 -
 drivers/soc/zte/zx296718_pm_domains.c         | 181 -----
 drivers/soc/zte/zx2967_pm_domains.c           | 141 ----
 drivers/soc/zte/zx2967_pm_domains.h           |  44 --
 34 files changed, 1 insertion(+), 2265 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/zte,sysctrl.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/zte.yaml
 delete mode 100644 Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt
 delete mode 100644 Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt
 delete mode 100644 arch/arm/boot/dts/zx296702-ad1.dts
 delete mode 100644 arch/arm/boot/dts/zx296702.dtsi
 delete mode 100644 arch/arm/configs/zx_defconfig
 delete mode 100644 arch/arm/mach-zx/Kconfig
 delete mode 100644 arch/arm/mach-zx/Makefile
 delete mode 100644 arch/arm/mach-zx/core.h
 delete mode 100644 arch/arm/mach-zx/headsmp.S
 delete mode 100644 arch/arm/mach-zx/platsmp.c
 delete mode 100644 arch/arm/mach-zx/zx296702-pm-domain.c
 delete mode 100644 arch/arm/mach-zx/zx296702.c
 delete mode 100644 arch/arm64/boot/dts/zte/Makefile
 delete mode 100644 arch/arm64/boot/dts/zte/zx296718-evb.dts
 delete mode 100644 arch/arm64/boot/dts/zte/zx296718-pcbox.dts
 delete mode 100644 arch/arm64/boot/dts/zte/zx296718.dtsi
 delete mode 100644 drivers/soc/zte/Kconfig
 delete mode 100644 drivers/soc/zte/Makefile
 delete mode 100644 drivers/soc/zte/zx296718_pm_domains.c
 delete mode 100644 drivers/soc/zte/zx2967_pm_domains.c
 delete mode 100644 drivers/soc/zte/zx2967_pm_domains.h

diff --git a/Documentation/devicetree/bindings/arm/zte,sysctrl.txt b/Documentation/devicetree/bindings/arm/zte,sysctrl.txt
deleted file mode 100644
index 7e66b7f7ba96..000000000000
diff --git a/Documentation/devicetree/bindings/arm/zte.yaml b/Documentation/devicetree/bindings/arm/zte.yaml
deleted file mode 100644
index 672f8129cd31..000000000000
diff --git a/Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt b/Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt
deleted file mode 100644
index b015508f9780..000000000000
diff --git a/Documentation/devicetree/bindings/serial/pl011.yaml b/Documentation/devicetree/bindings/serial/pl011.yaml
index c23c93b400f0..1a51c532e8d2 100644
--- a/Documentation/devicetree/bindings/serial/pl011.yaml
+++ b/Documentation/devicetree/bindings/serial/pl011.yaml
@@ -19,7 +19,6 @@ select:
       contains:
         enum:
           - arm,pl011
-          - zte,zx296702-uart
   required:
     - compatible
 
@@ -30,7 +29,6 @@ properties:
           - const: arm,pl011
           - const: arm,primecell
       - items:
-          - const: zte,zx296702-uart
           - const: arm,primecell
 
   reg:
diff --git a/Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt b/Documentation/devicetree/bindings/soc/zte/pd-2967xx.txt
deleted file mode 100644
index 7629de1c2c72..000000000000
diff --git a/MAINTAINERS b/MAINTAINERS
index aeef69cbc7ec..54b5e6dee017 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2704,40 +2704,6 @@ S:	Maintained
 F:	arch/arm/mach-pxa/include/mach/z2.h
 F:	arch/arm/mach-pxa/z2.c
 
-ARM/ZTE ARCHITECTURE
-M:	Jun Nie <jun.nie@linaro.org>
-M:	Shawn Guo <shawnguo@kernel.org>
-L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-S:	Maintained
-F:	Documentation/devicetree/bindings/arm/zte.yaml
-F:	Documentation/devicetree/bindings/clock/zx2967*.txt
-F:	Documentation/devicetree/bindings/dma/zxdma.txt
-F:	Documentation/devicetree/bindings/gpio/zx296702-gpio.txt
-F:	Documentation/devicetree/bindings/i2c/i2c-zx2967.txt
-F:	Documentation/devicetree/bindings/mmc/zx-dw-mshc.txt
-F:	Documentation/devicetree/bindings/pinctrl/pinctrl-zx.txt
-F:	Documentation/devicetree/bindings/reset/zte,zx2967-reset.txt
-F:	Documentation/devicetree/bindings/soc/zte/
-F:	Documentation/devicetree/bindings/sound/zte,*.txt
-F:	Documentation/devicetree/bindings/thermal/zx2967-thermal.txt
-F:	Documentation/devicetree/bindings/watchdog/zte,zx2967-wdt.txt
-F:	arch/arm/boot/dts/zx2967*
-F:	arch/arm/mach-zx/
-F:	arch/arm64/boot/dts/zte/
-F:	drivers/clk/zte/
-F:	drivers/dma/zx_dma.c
-F:	drivers/gpio/gpio-zx.c
-F:	drivers/i2c/busses/i2c-zx2967.c
-F:	drivers/mmc/host/dw_mmc-zx.*
-F:	drivers/pinctrl/zte/
-F:	drivers/soc/zte/
-F:	drivers/thermal/zx2967_thermal.c
-F:	drivers/watchdog/zx2967_wdt.c
-F:	include/dt-bindings/clock/zx2967*.h
-F:	include/dt-bindings/soc/zte,*.h
-F:	sound/soc/codecs/zx_aud96p22.c
-F:	sound/soc/zte/
-
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@xilinx.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -6029,14 +5995,6 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/xlnx/
 F:	drivers/gpu/drm/xlnx/
 
-DRM DRIVERS FOR ZTE ZX
-M:	Shawn Guo <shawnguo@kernel.org>
-L:	dri-devel@lists.freedesktop.org
-S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm-misc
-F:	Documentation/devicetree/bindings/display/zte,vou.txt
-F:	drivers/gpu/drm/zte/
-
 DRM PANEL DRIVERS
 M:	Thierry Reding <thierry.reding@gmail.com>
 R:	Sam Ravnborg <sam@ravnborg.org>
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9d9a7060d365..9f605ab54570 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -718,8 +718,6 @@ source "arch/arm/mach-vexpress/Kconfig"
 
 source "arch/arm/mach-vt8500/Kconfig"
 
-source "arch/arm/mach-zx/Kconfig"
-
 source "arch/arm/mach-zynq/Kconfig"
 
 # ARMv7-M architecture
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index fe8b95069d31..543e29068c08 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -1353,18 +1353,6 @@ choice
 		  This option selects UART0 on VIA/Wondermedia System-on-a-chip
 		  devices, including VT8500, WM8505, WM8650 and WM8850.
 
-	config DEBUG_ZTE_ZX
-		bool "Use ZTE ZX UART"
-		select DEBUG_UART_PL01X
-		depends on ARCH_ZX
-		help
-		  Say Y here if you are enabling ZTE ZX296702 SOC and need
-		  debug uart support.
-
-		  This option is preferred over the platform specific
-		  options; the platform specific options are deprecated
-		  and will be soon removed.
-
 	config DEBUG_ZYNQ_UART0
 		bool "Kernel low-level debugging on Xilinx Zynq using UART0"
 		depends on ARCH_ZYNQ
@@ -1599,7 +1587,6 @@ config DEBUG_UART_PHYS
 	default 0x02531000 if DEBUG_KEYSTONE_UART1
 	default 0x03010fe0 if ARCH_RPC
 	default 0x07000000 if DEBUG_SUN9I_UART0
-	default 0x09405000 if DEBUG_ZTE_ZX
 	default 0x10009000 if DEBUG_REALVIEW_STD_PORT || \
 				DEBUG_VEXPRESS_UART0_CA9
 	default 0x1010c000 if DEBUG_REALVIEW_PB1176_PORT
@@ -1782,7 +1769,6 @@ config DEBUG_UART_VIRT
 	default 0xfb020000 if DEBUG_OMAP3UART3
 	default 0xfb042000 if DEBUG_OMAP3UART4
 	default 0xfb10c000 if DEBUG_REALVIEW_PB1176_PORT
-	default 0xfc705000 if DEBUG_ZTE_ZX
 	default 0xfcfe8600 if DEBUG_BCM63XX_UART
 	default 0xfd000000 if DEBUG_SPEAR3XX || DEBUG_SPEAR13XX
 	default 0xfd883000 if DEBUG_ALPINE_UART0
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 7c4b50852a78..7b8eed93f1fa 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -220,7 +220,6 @@ machine-$(CONFIG_ARCH_U8500)		+= ux500
 machine-$(CONFIG_ARCH_VERSATILE)	+= versatile
 machine-$(CONFIG_ARCH_VEXPRESS)		+= vexpress
 machine-$(CONFIG_ARCH_VT8500)		+= vt8500
-machine-$(CONFIG_ARCH_ZX)		+= zx
 machine-$(CONFIG_ARCH_ZYNQ)		+= zynq
 machine-$(CONFIG_PLAT_SPEAR)		+= spear
 
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index da413b4d5c3f..5fcae846aa00 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1387,7 +1387,6 @@ dtb-$(CONFIG_ARCH_MSTARV7) += \
 	mstar-infinity2m-ssd202d-ssd201htv2.dtb \
 	mstar-infinity3-msc313e-breadbee.dtb \
 	mstar-mercury5-ssc8336n-midrived08.dtb
-dtb-$(CONFIG_ARCH_ZX) += zx296702-ad1.dtb
 dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-ast2500-evb.dtb \
 	aspeed-ast2600-evb.dtb \
diff --git a/arch/arm/boot/dts/zx296702-ad1.dts b/arch/arm/boot/dts/zx296702-ad1.dts
deleted file mode 100644
index bd9400840023..000000000000
diff --git a/arch/arm/boot/dts/zx296702.dtsi b/arch/arm/boot/dts/zx296702.dtsi
deleted file mode 100644
index f378c661b3bf..000000000000
diff --git a/arch/arm/configs/zx_defconfig b/arch/arm/configs/zx_defconfig
deleted file mode 100644
index a046a492bfa7..000000000000
diff --git a/arch/arm/mach-zx/Kconfig b/arch/arm/mach-zx/Kconfig
deleted file mode 100644
index ea29c84a7849..000000000000
diff --git a/arch/arm/mach-zx/Makefile b/arch/arm/mach-zx/Makefile
deleted file mode 100644
index 6f8930cdb8fb..000000000000
diff --git a/arch/arm/mach-zx/core.h b/arch/arm/mach-zx/core.h
deleted file mode 100644
index 25fe873892c9..000000000000
diff --git a/arch/arm/mach-zx/headsmp.S b/arch/arm/mach-zx/headsmp.S
deleted file mode 100644
index 0846859b0573..000000000000
diff --git a/arch/arm/mach-zx/platsmp.c b/arch/arm/mach-zx/platsmp.c
deleted file mode 100644
index d4e1d3792224..000000000000
diff --git a/arch/arm/mach-zx/zx296702-pm-domain.c b/arch/arm/mach-zx/zx296702-pm-domain.c
deleted file mode 100644
index 7a08bf9dd792..000000000000
diff --git a/arch/arm/mach-zx/zx296702.c b/arch/arm/mach-zx/zx296702.c
deleted file mode 100644
index fd8fa3a074fa..000000000000
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6eecdef538bd..ec3c0cb27d1e 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -317,12 +317,6 @@ config ARCH_XGENE
 	help
 	  This enables support for AppliedMicro X-Gene SOC Family
 
-config ARCH_ZX
-	bool "ZTE ZX SoC Family"
-	select PINCTRL
-	help
-	  This enables support for ZTE ZX SoC Family
-
 config ARCH_ZYNQMP
 	bool "Xilinx ZynqMP Family"
 	help
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 9b1170658d60..f1173cd93594 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -29,4 +29,3 @@ subdir-y += synaptics
 subdir-y += ti
 subdir-y += toshiba
 subdir-y += xilinx
-subdir-y += zte
diff --git a/arch/arm64/boot/dts/zte/Makefile b/arch/arm64/boot/dts/zte/Makefile
deleted file mode 100644
index 126896144bda..000000000000
diff --git a/arch/arm64/boot/dts/zte/zx296718-evb.dts b/arch/arm64/boot/dts/zte/zx296718-evb.dts
deleted file mode 100644
index cb2519ecd724..000000000000
diff --git a/arch/arm64/boot/dts/zte/zx296718-pcbox.dts b/arch/arm64/boot/dts/zte/zx296718-pcbox.dts
deleted file mode 100644
index e02509f7082b..000000000000
diff --git a/arch/arm64/boot/dts/zte/zx296718.dtsi b/arch/arm64/boot/dts/zte/zx296718.dtsi
deleted file mode 100644
index cc54837ff4ba..000000000000
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 71ab75a46491..8dd99ca2192c 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -173,7 +173,7 @@ config RESET_SCMI
 
 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST
-	default ARCH_AGILEX || ARCH_ASPEED || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARCH_ZX || ARC
+	default ARCH_AGILEX || ARCH_ASPEED || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARC
 	help
 	  This enables a simple reset controller driver for reset lines that
 	  that can be asserted and deasserted by toggling bits in a contiguous,
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index d097d070f579..f357c6c659d2 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -22,7 +22,6 @@ source "drivers/soc/ti/Kconfig"
 source "drivers/soc/ux500/Kconfig"
 source "drivers/soc/versatile/Kconfig"
 source "drivers/soc/xilinx/Kconfig"
-source "drivers/soc/zte/Kconfig"
 source "drivers/soc/kendryte/Kconfig"
 
 endmenu
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index 699b758d28e4..9bceb12b291d 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -28,5 +28,4 @@ obj-y				+= ti/
 obj-$(CONFIG_ARCH_U8500)	+= ux500/
 obj-$(CONFIG_PLAT_VERSATILE)	+= versatile/
 obj-y				+= xilinx/
-obj-$(CONFIG_ARCH_ZX)		+= zte/
 obj-$(CONFIG_SOC_KENDRYTE)	+= kendryte/
diff --git a/drivers/soc/zte/Kconfig b/drivers/soc/zte/Kconfig
deleted file mode 100644
index 1cf1938da541..000000000000
diff --git a/drivers/soc/zte/Makefile b/drivers/soc/zte/Makefile
deleted file mode 100644
index 728c677addcd..000000000000
diff --git a/drivers/soc/zte/zx296718_pm_domains.c b/drivers/soc/zte/zx296718_pm_domains.c
deleted file mode 100644
index 4daab06bbc26..000000000000
diff --git a/drivers/soc/zte/zx2967_pm_domains.c b/drivers/soc/zte/zx2967_pm_domains.c
deleted file mode 100644
index a4503e31b616..000000000000
diff --git a/drivers/soc/zte/zx2967_pm_domains.h b/drivers/soc/zte/zx2967_pm_domains.h
deleted file mode 100644
index f586c02410ff..000000000000
-- 
2.29.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
