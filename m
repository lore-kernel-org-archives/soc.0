Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB98C3D5642
	for <soc@lists.linux.dev>; Mon, 14 Sep 2026 14:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394966; cv=none; b=itVv4H5JOySiWna+A4MSzUhYpxbpUazgUCQhm0pXHDfrGRd1BF2TuMXzs0TcwLRWtq4TlzBIL5Ncia1X7hxFAKqj17Lc2E5o08hxtVato9cSxwmh1vPHH6g2qPDgNA4tvAHQZy93CN6IHC/n224XCike6SemsVH1AXh4i1PLNM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394966; c=relaxed/simple;
	bh=x7NOCweAQa9WZQBz9M0eKCoGIoA2uWsx6bO8h36KeG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GpSJ5JBIn7xcAVnaFRlKwGbqLrBPJe28buOT/AtzkE7vcCqPIa3+75qkRnG9vJko1mTzB5lsfV+Cz/XCZoYTbvFaHE0hcqdai1zBQdFvMmxDb+zNUNKrpx5GCDAzz5vGGOnIRq61YIIoH8SxNiYXFCamSemLm1o3KZr+BiJq/S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+HA/pkZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+HA/pkZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E66A1F0089A;
	Mon, 14 Sep 2026 14:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789394960;
	bh=lz3cWylX00of5kapMAOX05xb5ksdy0KCPWCceChagBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h+HA/pkZSS0J1E2Z9Lq1eTUWnAQ45affJDYiUhqj7gQPNHrJeE0UNnn1xcFCMuPfS
	 9VxD2fUV6aUlDdMU+geW7FYUZPY2+5HW+SmU1tEVwmueDC7Q5YfY9zc+s3x+Nimo/r
	 PmtjZ/CpMp0/q46h7Ixu7neVnAzfo9z9dwIBq+UC7QrBpnklYRfrlPx3iuFneUcCUw
	 SQ79Ue/BVEG1PajNx8P11gKZa1u5fATlOW0Qi+LI5D0RbihRwVgtuYkY6k/pAC8wGw
	 2K3Kc/nuYzXpQvBChuwi9FSiPLU53TA+zIKl4xPbKQ4NnNdWgosyCfPpCBoFzF08Xz
	 KHEAReUTBCe7A==
From: Arnd Bergmann <arnd@kernel.org>
To: soc@lists.linux.dev
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Linus Walleij <linusw@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH v2 13/14] ARM: at91: remove samv7 support
Date: Mon, 14 Sep 2026 16:08:15 +0200
Message-ID: <20260914140821.1805449-14-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914140821.1805449-1-arnd@kernel.org>
References: <20260914140821.1805449-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The Atmel at91 line, now known as Microchip SAM contains both
SoCs using ARM926 and Cortex-A CPUs as well as a number of
microcontrollers. Only a single one of those MCUs currently
has Linux support, and has no known users.

The samv7 platform was deprecated in Linux-7.3LTS, which will
remain supported a while longer after it is gone from mainline.

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
Acked-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/arch/arm/microchip.rst          | 39 -------------------
 .../devicetree/bindings/arm/atmel-at91.yaml   | 39 -------------------
 arch/arm/Kconfig.debug                        | 10 -----
 arch/arm/mach-at91/Kconfig                    | 11 +-----
 arch/arm/mach-at91/Makefile                   |  1 -
 arch/arm/mach-at91/samv7.c                    | 17 --------
 drivers/soc/atmel/soc.c                       | 36 -----------------
 drivers/soc/atmel/soc.h                       | 26 -------------
 8 files changed, 1 insertion(+), 178 deletions(-)
 delete mode 100644 arch/arm/mach-at91/samv7.c

diff --git a/Documentation/arch/arm/microchip.rst b/Documentation/arch/arm/microchip.rst
index e721d855f2c9..b776a6656717 100644
--- a/Documentation/arch/arm/microchip.rst
+++ b/Documentation/arch/arm/microchip.rst
@@ -157,45 +157,6 @@ the Microchip website: http://www.microchip.com.
 
           Coming soon
 
-    * ARM Cortex-M7 MCUs
-      - sams70 family
-
-        - sams70j19
-        - sams70j20
-        - sams70j21
-        - sams70n19
-        - sams70n20
-        - sams70n21
-        - sams70q19
-        - sams70q20
-        - sams70q21
-
-      - samv70 family
-
-        - samv70j19
-        - samv70j20
-        - samv70n19
-        - samv70n20
-        - samv70q19
-        - samv70q20
-
-      - samv71 family
-
-        - samv71j19
-        - samv71j20
-        - samv71j21
-        - samv71n19
-        - samv71n20
-        - samv71n21
-        - samv71q19
-        - samv71q20
-        - samv71q21
-
-          * Datasheet
-
-          http://ww1.microchip.com/downloads/en/DeviceDoc/SAM-E70-S70-V70-V71-Family-Data-Sheet-DS60001527D.pdf
-
-
 Linux kernel information
 ------------------------
 Linux kernel mach directory: arch/arm/mach-at91
diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index bf161e0950ea..d9b32a95b136 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -258,45 +258,6 @@ properties:
           - const: microchip,lan9668
           - const: microchip,lan966
 
-      - items:
-          - enum:
-              - atmel,sams70j19
-              - atmel,sams70j20
-              - atmel,sams70j21
-              - atmel,sams70n19
-              - atmel,sams70n20
-              - atmel,sams70n21
-              - atmel,sams70q19
-              - atmel,sams70q20
-              - atmel,sams70q21
-          - const: atmel,sams70
-          - const: atmel,samv7
-
-      - items:
-          - enum:
-              - atmel,samv70j19
-              - atmel,samv70j20
-              - atmel,samv70n19
-              - atmel,samv70n20
-              - atmel,samv70q19
-              - atmel,samv70q20
-          - const: atmel,samv70
-          - const: atmel,samv7
-
-      - items:
-          - enum:
-              - atmel,samv71j19
-              - atmel,samv71j20
-              - atmel,samv71j21
-              - atmel,samv71n19
-              - atmel,samv71n20
-              - atmel,samv71n21
-              - atmel,samv71q19
-              - atmel,samv71q20
-              - atmel,samv71q21
-          - const: atmel,samv71
-          - const: atmel,samv7
-
 additionalProperties: true
 
 ...
diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
index dac701197182..743a7d37da26 100644
--- a/arch/arm/Kconfig.debug
+++ b/arch/arm/Kconfig.debug
@@ -190,15 +190,6 @@ choice
 		  Say Y here if you want kernel low-level debugging support
 		  on the USART3 port of sama5d4.
 
-	config DEBUG_AT91_SAMV7_USART1
-		bool "Kernel low-level debugging via SAMV7 USART1"
-		select DEBUG_AT91_UART
-		depends on SOC_SAMV7
-		help
-		  Say Y here if you want the debug print routines to direct
-		  their output to the USART1 port on SAMV7 based
-		  machines.
-
 	config DEBUG_AT91_SAMA7G5_FLEXCOM3
 		bool "Kernel low-level debugging on SAMA7G5 FLEXCOM3"
 		select DEBUG_AT91_UART
@@ -1505,7 +1496,6 @@ config DEBUG_UART_PHYS
 	default 0x3e000000 if DEBUG_BCM_KONA_UART
 	default 0x3f201000 if DEBUG_BCM2836
 	default 0x40010000 if STM32MP1_DEBUG_UART
-	default 0x40028000 if DEBUG_AT91_SAMV7_USART1
 	default 0x40090000 if DEBUG_LPC32XX
 	default 0x40100000 if DEBUG_PXA_UART1
 	default 0x42000000 if DEBUG_GEMINI
diff --git a/arch/arm/mach-at91/Kconfig b/arch/arm/mach-at91/Kconfig
index cb0e3ff8e0ca..3df1165d159b 100644
--- a/arch/arm/mach-at91/Kconfig
+++ b/arch/arm/mach-at91/Kconfig
@@ -5,7 +5,7 @@ config ARCH_MICROCHIP
 menuconfig ARCH_AT91
 	bool "AT91/Microchip SoCs"
 	depends on (CPU_LITTLE_ENDIAN && (ARCH_MULTI_V4T || ARCH_MULTI_V5)) || \
-		ARCH_MULTI_V7 || ARM_SINGLE_ARMV7M
+		ARCH_MULTI_V7
 	select ARM_CPU_SUSPEND if PM && ARCH_MULTI_V7
 	select COMMON_CLK_AT91
 	select GPIOLIB
@@ -14,15 +14,6 @@ menuconfig ARCH_AT91
 	select ARCH_MICROCHIP
 
 if ARCH_AT91
-config SOC_SAMV7
-	bool "SAM Cortex-M7 family (DEPRECATED)" if ARM_SINGLE_ARMV7M
-	select COMMON_CLK_AT91
-	select PINCTRL_AT91
-	help
-	  Select this if you are using an SoC from Microchip's SAME7, SAMS7 or SAMV7
-	  families.
-
-	  This platform is scheduled for removal in early 2027
 
 config SOC_SAMA5D2
 	bool "SAMA5D2 family"
diff --git a/arch/arm/mach-at91/Makefile b/arch/arm/mach-at91/Makefile
index 7d8a7bc44e65..8c964e182284 100644
--- a/arch/arm/mach-at91/Makefile
+++ b/arch/arm/mach-at91/Makefile
@@ -10,7 +10,6 @@ obj-$(CONFIG_SOC_SAM9X60)	+= sam9x60.o
 obj-$(CONFIG_SOC_SAM9X7)	+= sam9x7.o
 obj-$(CONFIG_SOC_SAMA5)		+= sama5.o sam_secure.o
 obj-$(CONFIG_SOC_SAMA7)		+= sama7.o
-obj-$(CONFIG_SOC_SAMV7)		+= samv7.o
 
 # Power Management
 obj-$(CONFIG_ATMEL_PM)		+= pm.o pm_suspend.o
diff --git a/arch/arm/mach-at91/samv7.c b/arch/arm/mach-at91/samv7.c
deleted file mode 100644
index 22d00005ec09..000000000000
--- a/arch/arm/mach-at91/samv7.c
+++ /dev/null
@@ -1,17 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Setup code for SAMv7x
- *
- *  Copyright (C) 2013 Atmel,
- *                2016 Andras Szemzo <szemzo.andras@gmail.com>
- */
-#include <asm/mach/arch.h>
-
-static const char *const samv7_dt_board_compat[] __initconst = {
-	"atmel,samv7",
-	NULL
-};
-
-DT_MACHINE_START(samv7_dt, "Atmel SAMV7")
-	.dt_compat	= samv7_dt_board_compat,
-MACHINE_END
diff --git a/drivers/soc/atmel/soc.c b/drivers/soc/atmel/soc.c
index d89f9dcade7d..e276f86326ec 100644
--- a/drivers/soc/atmel/soc.c
+++ b/drivers/soc/atmel/soc.c
@@ -210,41 +210,6 @@ static const struct at91_soc socs[] __initconst = {
 		 AT91_CIDR_VERSION_MASK, SAMA5D44_EXID_MATCH,
 		 "sama5d44", "sama5d4"),
 #endif
-#ifdef CONFIG_SOC_SAMV7
-	AT91_SOC(SAME70Q21_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAME70Q21_EXID_MATCH,
-		 "same70q21", "same7"),
-	AT91_SOC(SAME70Q20_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAME70Q20_EXID_MATCH,
-		 "same70q20", "same7"),
-	AT91_SOC(SAME70Q19_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAME70Q19_EXID_MATCH,
-		 "same70q19", "same7"),
-	AT91_SOC(SAMS70Q21_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMS70Q21_EXID_MATCH,
-		 "sams70q21", "sams7"),
-	AT91_SOC(SAMS70Q20_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMS70Q20_EXID_MATCH,
-		 "sams70q20", "sams7"),
-	AT91_SOC(SAMS70Q19_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMS70Q19_EXID_MATCH,
-		 "sams70q19", "sams7"),
-	AT91_SOC(SAMV71Q21_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMV71Q21_EXID_MATCH,
-		 "samv71q21", "samv7"),
-	AT91_SOC(SAMV71Q20_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMV71Q20_EXID_MATCH,
-		 "samv71q20", "samv7"),
-	AT91_SOC(SAMV71Q19_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMV71Q19_EXID_MATCH,
-		 "samv71q19", "samv7"),
-	AT91_SOC(SAMV70Q20_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMV70Q20_EXID_MATCH,
-		 "samv70q20", "samv7"),
-	AT91_SOC(SAMV70Q19_CIDR_MATCH, AT91_CIDR_MATCH_MASK,
-		 AT91_CIDR_VERSION_MASK, SAMV70Q19_EXID_MATCH,
-		 "samv70q19", "samv7"),
-#endif
 #ifdef CONFIG_SOC_SAMA7
 	AT91_SOC(SAMA7D65_CIDR_MATCH, AT91_CIDR_MASK_SAMA7G5,
 		 AT91_CIDR_VERSION_MASK_SAMA7G5, SAMA7D65_EXID_MATCH,
@@ -396,7 +361,6 @@ static const struct of_device_id at91_soc_allowed_list[] __initconst = {
 	{ .compatible = "atmel,at91rm9200", },
 	{ .compatible = "atmel,at91sam9", },
 	{ .compatible = "atmel,sama5", },
-	{ .compatible = "atmel,samv7", },
 	{ .compatible = "microchip,sama7d65", },
 	{ .compatible = "microchip,sama7g5", },
 	{ }
diff --git a/drivers/soc/atmel/soc.h b/drivers/soc/atmel/soc.h
index 66a74017d9a3..aa5f2ecfbaa7 100644
--- a/drivers/soc/atmel/soc.h
+++ b/drivers/soc/atmel/soc.h
@@ -125,30 +125,4 @@ at91_soc_init(const struct at91_soc *socs);
 #define SAMA5D43_EXID_MATCH		0x00000003
 #define SAMA5D44_EXID_MATCH		0x00000004
 
-#define SAME70Q21_CIDR_MATCH		0x21020e00
-#define SAME70Q21_EXID_MATCH		0x00000002
-#define SAME70Q20_CIDR_MATCH		0x21020c00
-#define SAME70Q20_EXID_MATCH		0x00000002
-#define SAME70Q19_CIDR_MATCH		0x210d0a00
-#define SAME70Q19_EXID_MATCH		0x00000002
-
-#define SAMS70Q21_CIDR_MATCH		0x21120e00
-#define SAMS70Q21_EXID_MATCH		0x00000002
-#define SAMS70Q20_CIDR_MATCH		0x21120c00
-#define SAMS70Q20_EXID_MATCH		0x00000002
-#define SAMS70Q19_CIDR_MATCH		0x211d0a00
-#define SAMS70Q19_EXID_MATCH		0x00000002
-
-#define SAMV71Q21_CIDR_MATCH		0x21220e00
-#define SAMV71Q21_EXID_MATCH		0x00000002
-#define SAMV71Q20_CIDR_MATCH		0x21220c00
-#define SAMV71Q20_EXID_MATCH		0x00000002
-#define SAMV71Q19_CIDR_MATCH		0x212d0a00
-#define SAMV71Q19_EXID_MATCH		0x00000002
-
-#define SAMV70Q20_CIDR_MATCH		0x21320c00
-#define SAMV70Q20_EXID_MATCH		0x00000002
-#define SAMV70Q19_CIDR_MATCH		0x213d0a00
-#define SAMV70Q19_EXID_MATCH		0x00000002
-
 #endif /* __AT91_SOC_H */
-- 
2.53.0

