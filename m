Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D30421F14
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 19:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490059; cv=none; b=l22FiGcNE34NeRFJDMHHecFnU+nvU3UObPgQBKtaSnB7GDvTsPvQUvuSmcynB/H5mIItKeWcIkwt8RtwEcMQdDC75o/i05NjEOOqyphdQx51YGHpbmCRvUloNMsqk1UxOX6brl3MFZcAa0ENkMHjojH/BC2oxDHhXmtiRmgaZY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490059; c=relaxed/simple;
	bh=nxN5/0rRZY8FTzO+2xY/r21EeVORf1nKhdKvcv+Ajmw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e6dva4foZJlit8LJvNjOPC3l2u92bK/aOYiOLLR4CPTsS4InDfmPP4bHvtD88yFf7NnfaGX7cn6gAhsaeMN5xIkxt7Mxf2wGq1XuFXC5Vz4BMMgPHxVSK7tH0cINPKmuv1FtDEqfpYjZ7nBlBdrUbVA1JHkirxHyun6G88BcBVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmEIbHiQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmEIbHiQ"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891f625344so1559075e9.0
        for <soc@lists.linux.dev>; Wed, 29 Apr 2026 12:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777490056; x=1778094856; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNlGbXijzAU9cD2KSe6Fd/Wzn/728CxuTr4l+WCmYKU=;
        b=RmEIbHiQd8m+5KDOI344tkXNx/QTbLDvMGItp5KfH/r1Rkjl0vhLuXZlgpVLr+9BeT
         EIkDs0nvzZuSRs8xTQPbu1wTgqLWIx17lbDKS09+4PaxG7mm/qeHIwrJvJoR/pu6PGSB
         ENtH5FjlbL8C7GiksfvU1kW7J8ajjOOWjl92LqS3GyJw4Q9h2hG0bIB9hJeNu1av2JQa
         xZ3+mIy6+CFVNdaL13zFTgdcVtaIHMYQ8E2DBQJ++DqnKsRw+6/KiApOi32x5lHy1n+i
         B4iuG3tp4JUJTxBI9Hb/HQ8WoZRKEAUxOh34MKOU233+fTVjAkxXgBZfAhHpCmoTW3WO
         gujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490056; x=1778094856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZNlGbXijzAU9cD2KSe6Fd/Wzn/728CxuTr4l+WCmYKU=;
        b=CLIT5tgXPPuDYgIQZbJau0TO1Wswrwr5pfOgtd/Fv0Z5QoFNavkrxK8Dju5WCUBSsN
         NeUt71UVPEkx9Lxlt0cacONk1DL6fNziKFcAT6kekT5UY08wHf0RFvoSldWaRKjeNxJH
         vvHz+/cFTwLmXM7wSV5A8ZGgbSyqngXmYYxRS84ShYC/Ih0ByycllNzADp5YXtpnMRAy
         xRBfpkvBm59cV6fn5EkGtg2p94sy7jdtwJU6xEgAV0DffcXZC7kdTEQTH8dsu2RKpISi
         zyOHoQglpCS80C0fHUnTpjpXJN/luPSx06jzsFBUpYF9zeDTr8G4D93u43YIzGUKCfd3
         Z0Sg==
X-Forwarded-Encrypted: i=1; AFNElJ+aQrTEFmujPuIGyIhzJZrWRGGjDamb5CC5fXIcCSRXqggJLQsrx40HifzoTNWxmRnBWdA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWYTD7iLJN+eQVll0bQIhTZwfVM+XgumRlcp7C7FSY6MHe13ow
	QR5VVK57u8NvroIsfDDscFaADTKHAWXHN8mNwoRBDYWS6Erxm/w31l7+
X-Gm-Gg: AeBDietG1udmZNkq9DLWLFn6uS/UkDsmbkVH+wKe+nOLZDy4ma3+FTZwdXl/sEMz0Zq
	nuTvbyFbnfk5LYDwBOV8/3OkSzexvu/eOtIU+snP8uOOmQp5zheoSKADjzO0lijamY83RvI04XE
	whyfDMUcnwGi51V7QCwmmAgvKmpFBhx94RSt0c81TPCt2UNnuWSbNMZiLJx8/YK1aZpexlGk1jg
	MDYABjk0DxZjKz5oeqYwWf+IWtEht1/gl1wVdTL/7u/7r7DSyNaUQ2kbzXJBPq1+qw1hmr85Vqo
	2xI4AJERhsuvg1AqVNlzmaAvxUkQn7KuQp6zz5iT+j5atSEw5oeG7B1jekhWu0CcVYq3X3qWkS6
	dZ9samfVJ+ZrVjJlWTZdT4b69N0dqbOyXc9ntTelybHsgZAaLprXTi570ORTlVDd4hK/Rh9ztQI
	DyUbZELx7htyd8gRGELqAskVs80Iy8tJ6yxPPhcrZ87p81SKr3GZg6Fw==
X-Received: by 2002:a05:600c:8b82:b0:486:faa8:9e4 with SMTP id 5b1f17b1804b1-48a7bfc4cd5mr69661385e9.12.1777490055429;
        Wed, 29 Apr 2026 12:14:15 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c316d7esm23315005e9.24.2026.04.29.12.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:14:13 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 29 Apr 2026 22:13:13 +0300
Subject: [PATCH v7 2/6] ARM: zte: Add zx297520v3 platform support
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-send-v7-2-b432e00d2db8@gmail.com>
References: <20260429-send-v7-0-b432e00d2db8@gmail.com>
In-Reply-To: <20260429-send-v7-0-b432e00d2db8@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 soc@lists.linux.dev, linux-serial@vger.kernel.org, 
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10975;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=nxN5/0rRZY8FTzO+2xY/r21EeVORf1nKhdKvcv+Ajmw=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp8lh1IKa4jf6wIAJZHg1AaWvc9LC0BXrcb5VWX
 136Rkn+HvOJAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafJYdRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiJsIQ/+MGT7XKpoFBHCyI3aCwVdH5MyHeps40c
 +wPZCIH//b5tJUbE8XBEyfriQfF/+Gn77nE7/neJEDU6m2dTVyJpb4wQvB/XWn0jx76OXGCk8YF
 pXgkj7s6Cuw96EA3/R9HZO0nnWo3xYC3cQ6L6Zty+d+li/KOSHmSeez2oLxDVahnCPIFs/fv9vA
 TPRIFhfgpIz7Z8fiE5D0P/qa/vibKZ1Iyqv+GhRYOhnYeJU97GEp5kff1ACXMJeDlR2jKYnrje6
 cS5kgffQs5thq+/7OagCXsrryVyI0g6PM8T/momLxkQYGcpKnrj7bgBeIvxxf4DvFVUf+VUQPY0
 G5xMQiKA1VrYb3WHFJpAIFM0g+xe9j9B6nWyMJ9rNlnd41PVIzsKxCquNBAvlqqKsnMZHim8N6q
 hjYV5wQYzYdGwopRooIKliQfdu3bgSRxPMrz4EZPvpLz1WaEX90aiUr6Ud+Y2IImDB52zo4iAVy
 iQjBGaptxZdIm2twffMwLhHs2y7nLqHWupw1ZNY46RhHDYKEzUSp6OuEUzdaxYsXwkF8wTBs3Vv
 kC11tHhE1rNK6+pYSiQR/guVVUYen7ds6nt2HnbC510753dfjaafSTiOGKDyx3dFp2udvhSRh3a
 ciyjhDky/SCplmd3uXF4Jv/3T8Texa78dtgizBog3tLJYXVXNTm8=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This SoC is used in low end LTE-to-WiFi routers, for example some D-Link
DWR 932 revisions, ZTE K10, ZLT S10 4G, but also models that are branded
and sold by ISPs themselves. They are widespread in Africa, China,
Russia and Eastern Europe.

This SoC is a relative of the zx296702 and zx296718 that had some
upstream support until commit 89d4f98ae90d ("ARM: remove zte zx
platform"). My eventual goal is to enable OpenWRT to run on these
devices.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
---
 Documentation/arch/arm/zte/zx297520v3.rst | 158 ++++++++++++++++++++++++++++++
 MAINTAINERS                               |   1 +
 arch/arm/Kconfig                          |   2 +
 arch/arm/Makefile                         |   1 +
 arch/arm/mach-zte/Kconfig                 |  26 +++++
 arch/arm/mach-zte/Makefile                |   2 +
 arch/arm/mach-zte/zx297520v3.c            |  19 ++++
 7 files changed, 209 insertions(+)

diff --git a/Documentation/arch/arm/zte/zx297520v3.rst b/Documentation/arch/arm/zte/zx297520v3.rst
new file mode 100644
index 000000000000..6621ea72769f
--- /dev/null
+++ b/Documentation/arch/arm/zte/zx297520v3.rst
@@ -0,0 +1,158 @@
+.. SPDX-License-Identifier: GPL-2.0-only
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
+run in arm32 mode only. The CPU has support EL3, but no hypervisor (EL2) and
+it seems to lack VFP and NEON.
+
+The SoC is used in a number of cheap LTE to WiFi routers, both battery powered
+MiFis and stationary CPEs. In addition to the CPU these devices usually have
+64 MB Ram (although some is shared with the LTE chip), 128 MB NAND flash, an
+SDIO connected RTL8192-type Wifi chip limited to 2.4 ghz operation, USB 2,
+and buttons. Devices with as low as 32 MB or as high as 128 MB ram exist, as
+do devices with 8 or 16 MB of NOR flash.
+
+Some devices, especially the stationary ones, have 100 mbit Ethernet and an
+Ethernet switch.
+
+Usually the devices have LEDs for status indication, although some have SPI or
+I2C connected displays
+
+Some have an SD card slot. If it exists, it is a better choice for the root
+file system because it easily outperforms the built-in NAND.
+
+The LTE interface runs on a separate DSP called ZSP880. It is probably derived
+from LSI ZSPs and has an undocumented instruction set. The ZSP communicates
+with the main CPU via SRAM and DRAM and a mailbox hardware that can generate
+IRQs on either ends.
+
+There is also a Cortex M0 CPU, which is responsible for early HW initialization
+and starting the Cortex A53 CPU. It does not have any essential purpose once
+U-Boot is started. A SRAM-Based handover protocol exists to run custom code on
+this CPU.
+
+2. Booting via USB
+---------------------------
+
+The Boot ROM has support for booting custom code via USB. This mode can be
+entered by connecting a Boot PIN to GND or by modifying the third byte on NAND
+(set it to anything other than 0x5A aka 'Z'). A free software tool to start
+custom U-Boot and kernels can be found here:
+
+https://github.com/zx297520v3-mainline/zx297520v3-loader
+
+If USB download mode is entered but no boot commands are sent through USB, the
+device will proceed to boot normally after a few seconds. It is therefore
+possible to enable USB boot permanently and still leave the default boot files
+in place.
+
+3. Building for built-in U-Boot
+---------------------------
+The devices come with an ancient U-Boot that loads legacy uImages from NAND and
+boots them without a chance for the user to interrupt. The images are stored in
+files ap_cpuap.bin and ap_recovery.bin on a jffs2 partition named imagefs,
+usually mtd4. A file named "fotaflag" switches between the two modes.
+
+In addition to the uImage header, those files have a 384 byte signature header,
+which is used for authenticating the images on some devices. Most devices have
+this authentication disabled and it is enough to pad the uImage files with 384
+zero bytes.
+
+Builtin U-Boot also poorly sets up the CPU. Read the next section for details
+on this. It has no support for loading DTBs, so CONFIG_ARM_APPENDED_DTB is
+needed.
+
+So to build an image that boots from NAND the following steps are necessary:
+
+1) Patch the assembly code from section 3 into arch/arm/kernel/head.S.
+2) make zx29_defconfig
+3) make [-j x]
+4) cat arch/arm/boot/zImage arch/arm/boot/dts/zte/[device].dtb > kernel+dtb
+5) mkimage -A arm -O linux -T kernel -C none -a 0x20008000 -d kernel+dtb uimg
+6) dd if=/dev/zero bs=1 count=384 of=ap_recovery.bin
+7) cat uimg >> ap_recovery.bin
+8) Place this file onto imagefs on the device. Delete ap_cpuap.bin if the
+free space is not enough.
+9) Create the file fotaflag: echo -n FOTA-RECOVERY > fotaflag
+
+For development, booting ap_recovery.bin is recommended because the normal boot
+mode arms the watchdog before starting the kernel.
+
+4. CPU and GIC Setup
+---------------------------
+
+Generally CPU and GICv3 need to be set up according to the requirements spelled
+out in Documentation/arch/arm64/booting.rst. For zx297520v3 this means:
+
+1. GICD_CTLR.DS=1 to disable GIC security
+2. Enable access to ICC_SRE
+3. Disable trapping IRQs into monitor mode
+4. Configure EL2 and below to run in insecure mode.
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
+ldr     r4, =(GICD_CTLR_ARE_NS | GICD_CTLR_DS)
+str     r4, [r3]
+
+cps     #MON_MODE
+
+@ Work in non-secure physical address space: SCR_EL3.NS = 1. At least the UART
+@ seems to respond only to non-secure addresses. I have taken insipiration from
+@ Raspberry pi's armstub7.S here.
+@
+@ ARM docs say modify this bit in monitor mode only...
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
index b768b9da37a4..e707176c2114 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3775,6 +3775,7 @@ F:	drivers/video/fbdev/wmt_ge_rops.*
 ARM/ZTE ZX29 SOC SUPPORT
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	arch/arm/mach-zte/
 
 ARM/ZYNQ ARCHITECTURE
 M:	Michal Simek <michal.simek@amd.com>
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ec33376f8e2b..4217ed704e48 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -464,6 +464,8 @@ source "arch/arm/mach-versatile/Kconfig"
 
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
index 000000000000..4effbe3f8215
--- /dev/null
+++ b/arch/arm/mach-zte/Kconfig
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menuconfig ARCH_ZTE
+	bool "ZTE zx family"
+	depends on ARCH_MULTI_V7
+	help
+	  Support for ZTE zx-based family of processors.
+
+if ARCH_ZTE
+
+config SOC_ZX297520V3
+	bool "zx297520v3 SoC"
+	default y if ARCH_ZTE
+	select ARM_GIC_V3
+	select ARM_AMBA
+	select HAVE_ARM_ARCH_TIMER
+	select PM_GENERIC_DOMAINS if PM
+	help
+	  Support for ZTE zx297520v3 SoC. It is a single core SoC used in cheap
+	  LTE to WiFi routers. These devices can be identified by the occurrence
+	  of the string "zx297520v3" in the boot output and /proc/cpuinfo of
+	  their stock firmware.
+
+	  Please read Documentation/arch/arm/zte/zx297520v3.rst on how to boot
+	  the kernel.
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
index 000000000000..c11c7e836f91
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
+DT_MACHINE_START(ZX, "ZTE zx297520v3 (Device Tree)")
+	.dt_compat	= zx297520v3_dt_compat,
+MACHINE_END

-- 
2.53.0

