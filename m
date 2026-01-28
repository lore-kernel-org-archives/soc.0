Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1645376463
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 20:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632507; cv=none; b=OF8NjFOKezZOHTvoQwEza+qGa9DXy+fCh5k3Dv1EPWiP6amLkhA7pH1iy/KhWeQLQKH62HZHeVPiC99SqhXBqo6KZZ1BddIXwfxvK5pLdqZEwC/oBeuDVEjnk39mFoADvluhH/wBQCqzuW76ZnEI3skhkZ2yA1uvpsRXUOvfxpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632507; c=relaxed/simple;
	bh=LnGL5M3OnMcyt86NRMpmz96xbOTiBEW1LKFFd0sG8b4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tvW4/XXkv0MmZnjs6KuDfVGcQTEqpms3S7VFKemM4+IOa5qFxW/KFaXwPMl2711hIWz4m/G1ErAsEEOPCqatuKFYtlMl5MZYiwmoJi1FB6eDC8wixCxtaP/sG2fFMakmqum8dmgPl0CT4Lt2/Dix5GZ7a5C+tb3pPiw8VlOPzjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ptmt41nI; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ptmt41nI"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4359108fd24so175013f8f.2
        for <soc@lists.linux.dev>; Wed, 28 Jan 2026 12:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769632504; x=1770237304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivrCV94WmRsG3UJQEpI4nokKADv1VpiwgzFohf+xhyQ=;
        b=Ptmt41nITNFH3eBwgS6vFMdVlxVBYwpkMK8IGwPiK3QA9xX8XXsTMatIkoweEsmmcA
         /fh8iYHR0sYJfAfArshWqtohyHCri1dxbdW3HtMBO+p3HDUwY76870A6ybwF5kGna421
         jyq6l0vAd2Vm9tojTGOm1dAuTB3ssHU3Z9dnlhdWa+6UafM3zgM2573yluvgfjr3W8Hi
         iHhDGo8G4QuagAHxo7LoA7Gq3jFu6JCalN1g55L34UnRIbFWL1y0rpnMSRHESBojNCQg
         RL3bnDQE+QCiaNrDkIHGhFObKy1AmGxaZRBRG1Ws1exkk2pw9cTQYPWLURSGU1p7cz5s
         eRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769632504; x=1770237304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ivrCV94WmRsG3UJQEpI4nokKADv1VpiwgzFohf+xhyQ=;
        b=wF/oygaoIhzjfktcz+uxjDt1lNJgCLtthfDhUMQ963oCxukLkQSxQJNIb05AfZ0qr1
         4K8mxz+tKL248EQRqxPUa49AikV2PGJwiZDVy+cnUDeuYWo3iVUfFx53mJATLuiuHrBV
         +ysH0JOYYr6UXXlImT6HljExdJ0ro/Nla/7RwtFplKDUbLUP5t58+/gY+6Fq8zoqpgyP
         D9qkM3BoN1aRnOli+kYwsqlAX+/FkFzVEnwNT10W2QnBYZJjrXPC+OVNkBBQeYCcwt5b
         Uv7XhltpQXuzSBGUUB4ld81fvVr9bEY7fNTfuNgLviSWHw5HYicOdwp9Aj/fHmf6ZpEI
         AHqQ==
X-Gm-Message-State: AOJu0YwkMZpk/7S+igH3Ba9clNnt1SDD8YZ3XrlhM5l6jmjQ18AweqFN
	KP8TdpKq1m11DcdgSG4wORRqnDUaqqF/tjFxwsB5vBLwlhnyDIWZe7o9hRyk67Jo
X-Gm-Gg: AZuq6aKwL373m4QJ7B//7YgTBplOfdxkhGQxv7qbwCzI60BlJM/h0LssCi9B/1JEX6y
	rMufpxMsbtIMvdxepYUjeiZnVpYOFHCEJQqDXGv/lys2q5fzTes17MrPHEx2spDOx7pUtQVEXX2
	9bizXnxsEz6hrQWIb+1RAQ0kuXwCdp2PGTtRIYaAeU3KnXNBGr/7dwo2P2/wO5DRCm853XKO0M4
	2Vc7F5+r3BPCWs8ZY6gebAQ7+H0DWTqaDMtdBKgGHEsiv2cEqks7vaVGhh/zG3PXT76dwWrqU6A
	hN+yusIyydX719iq3IUhfJ3W6FG6tbRq2mETS/9Boo88KaTWKFFgdtxayP+ry+IC4uSu+/uFxkn
	1fT8M6kARn8TVe32IkHH+l+Bhh8jGFm5HFkmZExxTqRyWi8S5A/28TJx0YDxh/BbjHGpVsDT1co
	gaddQEZHsh+BqtBL1MptMjbOY5
X-Received: by 2002:a05:6000:401e:b0:431:74:cca with SMTP id ffacd0b85a97d-435dd0b29fcmr9152671f8f.44.1769632503750;
        Wed, 28 Jan 2026 12:35:03 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee04csm9577644f8f.12.2026.01.28.12.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 12:35:03 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev,
	linus.walleij@linaro.org,
	Jun Nie <jun.nie@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Drew Fustini <fustini@kernel.org>
Subject: [RFC PATCH v2 1/7] ARM: zte: Add zx297520v3 platform support.
Date: Wed, 28 Jan 2026 23:34:49 +0300
Message-ID: <20260128203455.38569-2-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128203455.38569-1-stefandoesinger@gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This SoC is used in low end LTE-to-WiFi routers, for example some D-Link
DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are branded
and sold by ISPs themselves. They are widespread in Africa, China,
Russia and Eastern Europe.

This SoC is a relative of the zx296702 and zx296718 that had some
upstream support until commit 89d4f98ae90d ("ARM: remove zte zx
platform"). My eventual goal is to enable OpenWRT to run on these
devices.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 Documentation/arch/arm/zte/zx297520v3.rst | 106 ++++++++++++++++++++++
 MAINTAINERS                               |   4 +
 arch/arm/Kconfig                          |   2 +
 arch/arm/Makefile                         |   1 +
 arch/arm/mach-zte/Kconfig                 |  23 +++++
 arch/arm/mach-zte/Makefile                |   2 +
 arch/arm/mach-zte/zx297520v3.c            |  19 ++++
 7 files changed, 157 insertions(+)
 create mode 100644 Documentation/arch/arm/zte/zx297520v3.rst
 create mode 100644 arch/arm/mach-zte/Kconfig
 create mode 100644 arch/arm/mach-zte/Makefile
 create mode 100644 arch/arm/mach-zte/zx297520v3.c

diff --git a/Documentation/arch/arm/zte/zx297520v3.rst b/Documentation/arch/arm/zte/zx297520v3.rst
new file mode 100644
index 000000000000..cfa40ca6baaf
--- /dev/null
+++ b/Documentation/arch/arm/zte/zx297520v3.rst
@@ -0,0 +1,106 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+====================================
+Booting Linux on ZTE zx297520v3 SoCs
+====================================
+
+...............................................................................
+
+Author:	Stefan Dösinger
+
+Date  : 27 Jan 2026
+
+1. Hardware description
+---------------------------
+Zx297520v3 SoCs use a 64 bit capable Cortex-A53 CPU and GICv3, although they
+run in aarch32 mode only. The CPU has support EL3, but no hypervisor (EL2) and
+it seems to lack VFP and NEON.
+
+The SoC is used in a number of cheap LTE to Wifi routers, both battery powered
+MiFis and stationary CPEs. In addition to the CPU these devices usually have
+64 MB Ram (although some is shared with the LTE chip), 128 MB NAND flash, an
+SDIO connected RTL8192-type Wifi chip limited to 2.4 ghz operation, USB 2,
+and buttons.
+
+Some devices, especially the stationary ones, have 100 mbit Ethernet, and an
+Ethernet switch.
+
+Usually the devices have LEDs for status indication, although some have SPI-
+connected displays.
+
+Some have an SD card slot. If it exists, it is a better choice for the root
+file system because it easily outperforms the built-in NAND.
+
+The LTE interface appears to be run by a separate Cortex-M0 CPU that runs a
+non-Linux binary blob and communicates with the main CPU via RPMsg.
+
+2. Booting
+---------------------------
+
+Generally CPU and GICv3 need to be set up according to the requirements spelled
+out in Documentation/arch/arm64/booting.rst. For zx297520v3 this means:
+
+1. GICD_CTLR.DS=1 to disable GIC security
+2. Enable access to ICC_SRE
+3. Disable trapping IRQs into monitor mode
+4. Configure EL2 and below to run in insecure mode.
+
+And an unrelated: This needs to be moved into a driver eventually:
+5. Configure timer PPIs to active-low.
+
+The kernel sources provided by ZTE do not boot either (interrupts do not work
+at all). They are incomplete in other aspects too, so it is assumed that there
+is some workaround similar to the one described in this document somewhere in
+the binary blobs.
+
+The assembly code below is given as an example of how to achieve this:
+
+```
+#include <linux/irqchip/arm-gic-v3.h>
+#include <asm/assembler.h>
+#include <asm/cp15.h>
+
+@ This allows EL1 to handle ints hat are normally handled by EL2/3.
+ldr     r3, =0xf2000000
+ldr     r4, =#(GICD_CTLR_ARE_NS | GICD_CTLR_DS)
+str     r4, [r3]
+
+cps     #MON_MODE
+
+@ Work in non-secure physical address space: SCR_EL3.NS = 1. At least the UART
+@ seems to respond only to non-secure addresses. I have taken insipiration from
+@ Raspberry pi's armstub7.S here.
+@
+@ ARM docs say modify this bit in monitor mode only...
+mrc     p15, 0, r3, c1, c1, 0
+mov	r3, #0x131			@ non-secure, Make F, A bits in CPSR writeable
+					@ Allow hypervisor call.
+mcr     p15, 0, r3, c1, c1, 0
+
+@ AP_PPI_MODE_REG: Configure timer PPIs (10, 11, 13, 14) to active-low.
+ldr	r3, =0xF22020a8
+ldr	r4, =0x50
+str	r4, [r3]
+ldr	r3, =0xF22020ac
+ldr	r4, =0x14
+str	r4, [r3]
+
+@ Enable EL2 access to ICC_SRE (bit 3, ICC_SRE_EL3.Enable). Enable system reg
+@ access to GICv3 registers (bit 0, ICC_SRE_EL3.SRE) for EL1 and EL3.
+mrc     p15, 6, r3, c12, c12, 5         @ ICC_SRE_EL3
+orr     r3, #0x9                        @ FIXME: No defines for SRE_EL3 values?
+mcr     p15, 6, r3, c12, c12, 5
+mrc     p15, 0, r3, c12, c12, 5         @ ICC_SRE_EL1
+orr     r3, #(ICC_SRE_EL1_SRE)
+mcr     p15, 0, r3, c12, c12, 5
+
+@ Like ICC_SRE_EL3, enable EL1 access to ICC_SRE and system register access
+@ for EL2.
+mrc     p15, 4, r3, c12, c9, 5          @ ICC_SRE_EL2 aka ICC_HSRE
+orr     r3, r3, #(ICC_SRE_EL2_ENABLE | ICC_SRE_EL2_SRE)
+mcr     p15, 4, r3, c12, c9, 5
+isb
+
+@ Back to SVC mode. TODO: Doesn't safe_svcmode_maskall do this for us anyway?
+cps     #SVC_MODE
+```
diff --git a/MAINTAINERS b/MAINTAINERS
index e8f06145fb54..225392cf3b5b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28392,6 +28392,10 @@ F:	lib/zstd/
 N:	zstd
 K:	zstd
 
+ZX29
+M:	Stefan Dösinger <stefandoesinger@gmail.com>
+F:	arch/arm/mach-zte/
+
 ZSWAP COMPRESSED SWAP CACHING
 M:	Johannes Weiner <hannes@cmpxchg.org>
 M:	Yosry Ahmed <yosry.ahmed@linux.dev>
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 4fb985b76e97..bd2cae242603 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -463,6 +463,8 @@ source "arch/arm/mach-versatile/Kconfig"
 
 source "arch/arm/mach-vt8500/Kconfig"
 
+source "arch/arm/mach-zte/Kconfig"
+
 source "arch/arm/mach-zynq/Kconfig"
 
 # ARMv7-M architecture
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index b7de4b6b284c..573813ef5e77 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -223,6 +223,7 @@ machine-$(CONFIG_ARCH_SUNXI)		+= sunxi
 machine-$(CONFIG_ARCH_TEGRA)		+= tegra
 machine-$(CONFIG_ARCH_U8500)		+= ux500
 machine-$(CONFIG_ARCH_VT8500)		+= vt8500
+machine-$(CONFIG_ARCH_ZTE)		+= zte
 machine-$(CONFIG_ARCH_ZYNQ)		+= zynq
 machine-$(CONFIG_PLAT_VERSATILE)	+= versatile
 machine-$(CONFIG_PLAT_SPEAR)		+= spear
diff --git a/arch/arm/mach-zte/Kconfig b/arch/arm/mach-zte/Kconfig
new file mode 100644
index 000000000000..373889b72005
--- /dev/null
+++ b/arch/arm/mach-zte/Kconfig
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+menuconfig ARCH_ZTE
+	bool "ZTE ZX family"
+	depends on ARCH_MULTI_V7
+	help
+	  Support for ZTE ZX-based family of processors.
+
+if ARCH_ZTE
+
+config SOC_ZX297520V3
+	default y if ARCH_ZTE
+	bool "ZX297520v3"
+	select ARM_GIC_V3
+	select HAVE_ARM_ARCH_TIMER
+	select PM_GENERIC_DOMAINS if PM
+	help
+	  Support for ZTE ZX297520v3 SoC. It a single core SoC used in cheap LTE to WiFi routers.
+	  These devices can be Identified by the occurrence of the string "zx297520v3" in the boot
+	  output and /proc/cpuinfo of their stock firmware.
+
+	  Please read Documentation/arch/arm/zte/zx297520v3.rst on how to boot the kernel.
+
+endif
diff --git a/arch/arm/mach-zte/Makefile b/arch/arm/mach-zte/Makefile
new file mode 100644
index 000000000000..1bfe4fddd6af
--- /dev/null
+++ b/arch/arm/mach-zte/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_SOC_ZX297520V3) += zx297520v3.o
diff --git a/arch/arm/mach-zte/zx297520v3.c b/arch/arm/mach-zte/zx297520v3.c
new file mode 100644
index 000000000000..e8db18c2f665
--- /dev/null
+++ b/arch/arm/mach-zte/zx297520v3.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2026 Stefan Dösinger
+ */
+
+#include <asm/mach/arch.h>
+#include <asm/mach/map.h>
+
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+
+static const char *const zx297520v3_dt_compat[] __initconst = {
+	"zte,zx297520v3",
+	NULL,
+};
+
+DT_MACHINE_START(ZX, "ZTE ZX297520v3 (Device Tree)")
+	.dt_compat	= zx297520v3_dt_compat,
+MACHINE_END
-- 
2.52.0

