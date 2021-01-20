Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8073EC433E6
	for <soc@archiver.kernel.org>; Wed, 20 Jan 2021 12:48:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4525F23382; Wed, 20 Jan 2021 12:48:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D201E23380;
	Wed, 20 Jan 2021 12:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611146927;
	bh=4BxAf1FTOYShE682lWGMYU0CsMqPExM7BYzadGDryks=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iXskoELhldg0eFmx6sfXmYtXpg8a2TmXIX2aa6JCvBpRLR+uCmSQrMax+9W8rKvnL
	 seCdje87i63xUTF80XylUusgVjHdH5zulPMYvNWsa6w6TKB9aQPC75dyTKeJeAmvLR
	 x3LfDGRn7IsCjrNEXke3PRIdmIegHW9eJOxXDHQgYQHD0ZMuFtawk6SDtSJ+t+6bNO
	 jwvTaSgxQsHPwRI24frZYAmyk98Nx4z+NrFQqegotLhVijuVDZ1LnZTrhA535TfWQ0
	 UO78x1id2rkVV3wqMgT3FRdiI5meR2JVypcf96NxHp19gB2/GFqEQJqTYd6nefnf/n
	 PJ6ECkc0CW/zA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Marc Gonzalez <marc.w.gonzalez@free.fr>,
	Mans Rullgard <mans@mansr.com>
Subject: [PATCH 4/5] ARM: remove tango platform
Date: Wed, 20 Jan 2021 13:48:11 +0100
Message-Id: <20210120124812.2800027-5-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120124812.2800027-1-arnd@kernel.org>
References: <20210120124812.2800027-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The smp8758 (tango4) SoC was the last generation of set-top-box chips
to come out of Sigma Designs, and support was added by Marc Gonzalez
and Måns Rullgård between 2015 and 2017, before the company went out of
business and the products were abandoned.

The chip is used in some set-top-boxes such as the Popcorn Hour A-500,
which could have seen some adoption by hobbyists. This has not happened
in the past four years, and support for the more widely used MIPS based
SoCs was never merged at all.

Thanks to Marc and Måns for maintaining for the past years even after the
death of the platform.

Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc: Mans Rullgard <mans@mansr.com>
Link: https://lore.kernel.org/lkml/2d643ebc-09af-a809-eb3f-2aec8ecee501@free.fr/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 MAINTAINERS                               |   7 -
 arch/arm/Kconfig                          |   2 -
 arch/arm/Makefile                         |   1 -
 arch/arm/boot/dts/Makefile                |   2 -
 arch/arm/boot/dts/tango4-common.dtsi      | 184 ----------------------
 arch/arm/boot/dts/tango4-smp8758.dtsi     |  57 -------
 arch/arm/boot/dts/tango4-vantage-1172.dts |  42 -----
 arch/arm/configs/tango4_defconfig         |  93 -----------
 arch/arm/mach-tango/Kconfig               |  13 --
 arch/arm/mach-tango/Makefile              |   4 -
 arch/arm/mach-tango/platsmp.c             |  52 ------
 arch/arm/mach-tango/pm.c                  |  31 ----
 arch/arm/mach-tango/pm.h                  |   7 -
 arch/arm/mach-tango/setup.c               |  20 ---
 arch/arm/mach-tango/smc.S                 |  12 --
 arch/arm/mach-tango/smc.h                 |   9 --
 drivers/i2c/busses/Kconfig                |   4 +-
 17 files changed, 2 insertions(+), 538 deletions(-)
 delete mode 100644 arch/arm/boot/dts/tango4-common.dtsi
 delete mode 100644 arch/arm/boot/dts/tango4-smp8758.dtsi
 delete mode 100644 arch/arm/boot/dts/tango4-vantage-1172.dts
 delete mode 100644 arch/arm/configs/tango4_defconfig
 delete mode 100644 arch/arm/mach-tango/Kconfig
 delete mode 100644 arch/arm/mach-tango/Makefile
 delete mode 100644 arch/arm/mach-tango/platsmp.c
 delete mode 100644 arch/arm/mach-tango/pm.c
 delete mode 100644 arch/arm/mach-tango/pm.h
 delete mode 100644 arch/arm/mach-tango/setup.c
 delete mode 100644 arch/arm/mach-tango/smc.S
 delete mode 100644 arch/arm/mach-tango/smc.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 54b5e6dee017..bb2a153f76d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2538,13 +2538,6 @@ F:	arch/arm/boot/dts/berlin*
 F:	arch/arm/mach-berlin/
 F:	arch/arm64/boot/dts/synaptics/
 
-ARM/TANGO ARCHITECTURE
-M:	Marc Gonzalez <marc.w.gonzalez@free.fr>
-M:	Mans Rullgard <mans@mansr.com>
-L:	linux-arm-kernel@lists.infradead.org
-S:	Odd Fixes
-N:	tango
-
 ARM/TECHNOLOGIC SYSTEMS TS7250 MACHINE SUPPORT
 M:	Lennert Buytenhek <kernel@wantstofly.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 9f605ab54570..70d6bfbcd164 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -702,8 +702,6 @@ source "arch/arm/mach-stm32/Kconfig"
 
 source "arch/arm/mach-sunxi/Kconfig"
 
-source "arch/arm/mach-tango/Kconfig"
-
 source "arch/arm/mach-tegra/Kconfig"
 
 source "arch/arm/mach-u300/Kconfig"
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 7b8eed93f1fa..1291fdc869f2 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -213,7 +213,6 @@ machine-$(CONFIG_ARCH_SOCFPGA)		+= socfpga
 machine-$(CONFIG_ARCH_STI)		+= sti
 machine-$(CONFIG_ARCH_STM32)		+= stm32
 machine-$(CONFIG_ARCH_SUNXI)		+= sunxi
-machine-$(CONFIG_ARCH_TANGO)		+= tango
 machine-$(CONFIG_ARCH_TEGRA)		+= tegra
 machine-$(CONFIG_ARCH_U300)		+= u300
 machine-$(CONFIG_ARCH_U8500)		+= ux500
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5fcae846aa00..a13112f8730c 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1221,8 +1221,6 @@ dtb-$(CONFIG_MACH_SUN9I) += \
 	sun9i-a80-cubieboard4.dtb
 dtb-$(CONFIG_MACH_SUNIV) += \
 	suniv-f1c100s-licheepi-nano.dtb
-dtb-$(CONFIG_ARCH_TANGO) += \
-	tango4-vantage-1172.dtb
 dtb-$(CONFIG_ARCH_TEGRA_2x_SOC) += \
 	tegra20-acer-a500-picasso.dtb \
 	tegra20-harmony.dtb \
diff --git a/arch/arm/boot/dts/tango4-common.dtsi b/arch/arm/boot/dts/tango4-common.dtsi
deleted file mode 100644
index d584da314500..000000000000
diff --git a/arch/arm/boot/dts/tango4-smp8758.dtsi b/arch/arm/boot/dts/tango4-smp8758.dtsi
deleted file mode 100644
index 1c6a5bf1a86b..000000000000
diff --git a/arch/arm/boot/dts/tango4-vantage-1172.dts b/arch/arm/boot/dts/tango4-vantage-1172.dts
deleted file mode 100644
index d237d7f02c51..000000000000
diff --git a/arch/arm/configs/tango4_defconfig b/arch/arm/configs/tango4_defconfig
deleted file mode 100644
index cbc9ade78f14..000000000000
diff --git a/arch/arm/mach-tango/Kconfig b/arch/arm/mach-tango/Kconfig
deleted file mode 100644
index a9eeda36aeb1..000000000000
diff --git a/arch/arm/mach-tango/Makefile b/arch/arm/mach-tango/Makefile
deleted file mode 100644
index 97cd04508fa1..000000000000
diff --git a/arch/arm/mach-tango/platsmp.c b/arch/arm/mach-tango/platsmp.c
deleted file mode 100644
index 65012afbc1a3..000000000000
diff --git a/arch/arm/mach-tango/pm.c b/arch/arm/mach-tango/pm.c
deleted file mode 100644
index a32c3b631484..000000000000
diff --git a/arch/arm/mach-tango/pm.h b/arch/arm/mach-tango/pm.h
deleted file mode 100644
index 35ea705a0ee2..000000000000
diff --git a/arch/arm/mach-tango/setup.c b/arch/arm/mach-tango/setup.c
deleted file mode 100644
index 824f90737b04..000000000000
diff --git a/arch/arm/mach-tango/smc.S b/arch/arm/mach-tango/smc.S
deleted file mode 100644
index b1752aaa72bc..000000000000
diff --git a/arch/arm/mach-tango/smc.h b/arch/arm/mach-tango/smc.h
deleted file mode 100644
index 455ce3e06daf..000000000000
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index d4d60ad0eda0..0e284fb750e5 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1174,8 +1174,8 @@ config I2C_XILINX
 	  will be called xilinx_i2c.
 
 config I2C_XLR
-	tristate "Netlogic XLR and Sigma Designs I2C support"
-	depends on CPU_XLR || ARCH_TANGO || COMPILE_TEST
+	tristate "Netlogic XLR I2C support"
+	depends on CPU_XLR || COMPILE_TEST
 	help
 	  This driver enables support for the on-chip I2C interface of
 	  the Netlogic XLR/XLS MIPS processors and Sigma Designs SOCs.
-- 
2.29.2

