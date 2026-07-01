Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B313B635B;
	Wed,  1 Jul 2026 21:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782941074; cv=none; b=UOXBNgKcuAGxOwKaoabArElQAuELjq3BDOhnzuSKCtzoPhuRY+PYMhpHmlb1eyrsnWxqkYYQHEqTqbxwG/BN94qjEp1O/3qrKm3w+j8PeidRoKh+YkaeHqGCOWajG8aM8d5MAPDQKMxws7bshNZ8lfJJJtojv7IJ/yY08TAL6AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782941074; c=relaxed/simple;
	bh=m8ripGyiE37MyMaja2sSYbzInMCUq9VMHD8hMKTIxns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=doGC+yGFa5yd+ZHZSPyBgHke8+10yHXKNDx1TurOrBvJ1dfphrVubTV/19Xc/vza3frGZBiPAxA1Ox4eS9QPiyw6Rdt2+WNLaS9eyNTp1TzP4tWcuKrPQFCD4ECx7OSTJUCeTN7dcRTTqUvmLTjdNRJ4ltziYMQY0oKek6JOj0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWfXviz+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWfXviz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5F8A1F000E9;
	Wed,  1 Jul 2026 21:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782941070;
	bh=GwWQmzYjQdM3SVlSIcY+d2H7VNHT4JMX0xuI/U6wIOs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YWfXviz+HCivxfTHB4c03kpN+ZmhDPe3BsHPYZJaCTJcRAAcoYLkiddoonuHDAqNj
	 sM7G6M8pNbQIlOWNSdBZJT7M0zcsgcNveU/FwI1z1d9tQvTKGJDqKDCyfUQWu7l60W
	 PdYJvyfvxnR1XmvjPwg7xy3lDyK6Rlh9IJ+CWuwD9bQ/IFU6gka7hcD739pV5/SIZY
	 UUmLy4P8wtYUguVcJkEiRCzB1sUtw+Z4yMSoMl6BWEaLcX+38K21QnxccazyNO00x0
	 y2fwJS3/1lRVx6ZnDAt0I8h72BKY9/fUnKoZwnB2OgN2GPmlhFAJX3auUhVskRMcau
	 ZpZk4sF9DShog==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Ard Biesheuvel <ardb@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Mack <daniel@zonque.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Stefan Wiehler <stefan.wiehler@nokia.com>,
	Tony Lindgren <tony@atomide.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 02/19] ARM: limit OABI support to StrongARM CPUs
Date: Wed,  1 Jul 2026 23:23:36 +0200
Message-Id: <20260701212353.2196041-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260701212353.2196041-1-arnd@kernel.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

As discussed on the mailing lists, there is no way to build OABI userspace
binaries any more since gcc-4.8, and now support is also getting dropped in
binutils, which will make it impossible to build pure OABI kernels at some
point in the future.

I found no evidence of anyone still sing OABI userspace on embedded systems
that keep getting kernel updates, but there are a few desktop-class machines
that date back to the 1990s using Intel StrongARM processors that were
supported by old versions of Debian, Red Hat or the official Corel
Netwinder distribution.

Add a much stricter Kconfig dependency for both native OABI and OABI_COMPAT
enabled kernels, only allowing either of them to be selected when building
a kernel that targets a StrongARM based machine.

Link: https://lore.kernel.org/lkml/2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com/
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig                       | 14 +++++++-------
 arch/arm/configs/am200epdkit_defconfig |  1 -
 arch/arm/configs/axm55xx_defconfig     |  1 -
 arch/arm/configs/footbridge_defconfig  |  2 +-
 arch/arm/configs/neponset_defconfig    |  2 +-
 arch/arm/configs/versatile_defconfig   |  1 -
 6 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ccc0114d30de..3b2316dc9d13 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1151,8 +1151,7 @@ config ARM_PATCH_IDIV
 	  code to do integer division.
 
 config AEABI
-	bool "Use the ARM EABI to compile the kernel" if !CPU_V7 && \
-		!CPU_V7M && !CPU_V6 && !CPU_V6K && !CC_IS_CLANG
+	bool "Use the ARM EABI to compile the kernel" if CPU_SA110 || CPU_SA1100
 	default y
 	help
 	  The Arm EABI is the default ABI on all modern Linux
@@ -1162,9 +1161,13 @@ config AEABI
 	  Everyone should enable this, as support for OABI user space
 	  was dropped in gcc-4.8 and most distributions after ca. 2013.
 
+	  Support for OABI mode will be removed from the kernel
+	  once Intel StrongARM CPUs are phased out.
+
 config OABI_COMPAT
 	bool "Allow old ABI binaries to run with this kernel (EXPERIMENTAL)"
 	depends on AEABI && !THUMB2_KERNEL
+	depends on CPU_SA110 || CPU_SA1100
 	help
 	  This option preserves the old syscall interface along with the
 	  new (ARM EABI) one. It also provides a compatibility layer to
@@ -1177,11 +1180,8 @@ config OABI_COMPAT
 	  selected, since there is no way yet to sensibly distinguish
 	  between calling conventions during filtering.
 
-	  If you know you'll be using only pure EABI user space then you
-	  can say N here. If this option is not selected and you attempt
-	  to execute a legacy ABI binary then the result will be
-	  UNPREDICTABLE (in fact it can be predicted that it won't work
-	  at all). If in doubt say N.
+	  Support for OABI_COMPAT will be removed from the kernel
+	  once Intel StrongARM CPUs are phased out.
 
 config ARCH_SELECT_MEMORY_MODEL
 	def_bool y
diff --git a/arch/arm/configs/am200epdkit_defconfig b/arch/arm/configs/am200epdkit_defconfig
index b3f81237c6e1..d4745b0f3dcb 100644
--- a/arch/arm/configs/am200epdkit_defconfig
+++ b/arch/arm/configs/am200epdkit_defconfig
@@ -7,7 +7,6 @@ CONFIG_EXPERT=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_PXA=y
 CONFIG_ARCH_GUMSTIX=y
-# CONFIG_OABI_COMPAT is not set
 CONFIG_CMDLINE="console=ttyS0,115200n8 root=1f01 rootfstype=jffs2"
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/arm/configs/axm55xx_defconfig b/arch/arm/configs/axm55xx_defconfig
index 12c59a4ee504..541e38e2205b 100644
--- a/arch/arm/configs/axm55xx_defconfig
+++ b/arch/arm/configs/axm55xx_defconfig
@@ -38,7 +38,6 @@ CONFIG_PCIE_AXXIA=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=16
 CONFIG_HOTPLUG_CPU=y
-CONFIG_OABI_COMPAT=y
 CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
diff --git a/arch/arm/configs/footbridge_defconfig b/arch/arm/configs/footbridge_defconfig
index 589b7b1df8c6..e8bf9847d35d 100644
--- a/arch/arm/configs/footbridge_defconfig
+++ b/arch/arm/configs/footbridge_defconfig
@@ -9,9 +9,9 @@ CONFIG_ARCH_MULTI_V4=y
 CONFIG_ARCH_FOOTBRIDGE=y
 CONFIG_ARCH_EBSA285_HOST=y
 CONFIG_ARCH_NETWINDER=y
+# CONFIG_AEABI is not set
 CONFIG_FPE_NWFPE=y
 CONFIG_FPE_NWFPE_XP=y
-# CONFIG_AEABI is not set
 CONFIG_MODULES=y
 CONFIG_PARTITION_ADVANCED=y
 CONFIG_ACORN_PARTITION=y
diff --git a/arch/arm/configs/neponset_defconfig b/arch/arm/configs/neponset_defconfig
index c3010a4d93a8..16f0afd770c1 100644
--- a/arch/arm/configs/neponset_defconfig
+++ b/arch/arm/configs/neponset_defconfig
@@ -6,12 +6,12 @@ CONFIG_ARCH_MULTI_V4=y
 CONFIG_ARCH_SA1100=y
 CONFIG_SA1100_ASSABET=y
 CONFIG_ASSABET_NEPONSET=y
+# CONFIG_AEABI is not set
 CONFIG_ZBOOT_ROM_TEXT=0x80000
 CONFIG_ZBOOT_ROM_BSS=0xc1000000
 CONFIG_ZBOOT_ROM=y
 CONFIG_CMDLINE="console=ttySA0,38400n8 cpufreq=221200 rw root=/dev/mtdblock2 mtdparts=sa1100:512K(boot),1M(kernel),2560K(initrd),4M(root) mem=32M noinitrd initrd=0xc0800000,3M"
 CONFIG_FPE_NWFPE=y
-# CONFIG_AEABI is not set
 CONFIG_PM=y
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
diff --git a/arch/arm/configs/versatile_defconfig b/arch/arm/configs/versatile_defconfig
index 8e89debb5a5b..bb9eb9ccbbde 100644
--- a/arch/arm/configs/versatile_defconfig
+++ b/arch/arm/configs/versatile_defconfig
@@ -6,7 +6,6 @@ CONFIG_LOG_BUF_SHIFT=14
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_VERSATILE=y
-CONFIG_OABI_COMPAT=y
 CONFIG_CMDLINE="root=1f03 mem=32M"
 CONFIG_FPE_NWFPE=y
 CONFIG_VFP=y
-- 
2.39.5

