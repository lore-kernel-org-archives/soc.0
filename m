Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B14423A88
	for <soc@lists.linux.dev>; Wed, 29 Apr 2026 19:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490077; cv=none; b=fNRY1FH65qyskLVvkEKBphXMjwbayebeA6rAUdVU62RSb96t5wurhhU+aE1IWJwioBr/C0FcWXy/IXZU5TCeh2Osj5YK+yWpMkXLwyAL/fike1inTNfFZ/zf+/ygY0dCkcqjHTG+85VgGp3omCTHoF/UGnZ+WGS+oPTc1R23R1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490077; c=relaxed/simple;
	bh=7LiDLxjelI1MRSngPzWRBkqRNsscbkTyc8tG8Vfm5PA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QltHzhee0s5Hr22QTktU6mvZ8gEtK7ftwRIHU9iN/LIS36oZxxpfLH3bhaNTUyyftXwKSUw+ZUnfuPv6GdrTMjA/48FlrFeVdwC3QvlKYbsYqpoFGLmRi+F3pyJGQCoMrfd2n3K2YiqziXp8odlhUZD0IZDbUpknClpHiKK8yHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qQJqFI+E; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qQJqFI+E"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso518595e9.3
        for <soc@lists.linux.dev>; Wed, 29 Apr 2026 12:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777490072; x=1778094872; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mK1m9udRxQHj0zYCLQVzg/V9Z3Gw4DlTQK/hyL0gOMA=;
        b=qQJqFI+EdvAXZGZGFLiqyqOq/CSVsTla0wk8kSjbSCdWxl7r2Ds6/GlZI0Lp860gkg
         oZV7gFne6Uc8EzON9TlOrXBCdPzf1XA7J/+TSRIuqbXcJGgPNQTSRsbaHIwlyL7Pjfx6
         OpuDesckzgjxZBpCzx1IxIhZ8sdkQUIRReRCt1iTNnofdtb8HJftwBNKlyuzFP4CV/2X
         /rDYiENgk1d6082oo8lQWGYmj9c7yq4tNQL7+4pVVRCggEoEfRqPlbPpoD7VNOZzghzv
         0HA0Ve4H9FSHPAL7TBqe7da/GQBlrBgRrwDyAvtoJc/xhx95QOEzYaoT1v0x9xHt8o3X
         ENzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490072; x=1778094872;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mK1m9udRxQHj0zYCLQVzg/V9Z3Gw4DlTQK/hyL0gOMA=;
        b=cr+lg93d60VFkIFxJl3D/sxEqfQsHEeiE3zS5jPzRt7A+hkzucLyUFOpTfYfleXya7
         91P0x6YLyPv3vqH6BJ+jlpMfeN9/4mmddB/K/CeNm+k1dKTapHh2c7dJJrpcSIb34d6u
         eOEoc0JyIKBCPB/kPb+DLS+Xvhjw3iC0dM5BDVGR4TxRnInzQmCfuAe6RbqVkdMEEkMu
         zOANChEVELtV+Q6jh3yJjkwD+GGGOYR/ogM+jZcVuWbthsNXlMi2fSt4c5hmIjzNrK8D
         J3ZUOwa+hEJ8FTy1LGSccMgwJTOF65JLrVX8qj/i/7orSd154Q6qootPCA/QloPD51Tc
         IZbA==
X-Forwarded-Encrypted: i=1; AFNElJ8x+W9d7n3i/7AgLUEvgTjR8n6mGXBaYhIUNSNA/JGbKYd6JZWeceEKyDL0KKZRFQwGwMM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHqmZYo84trWmfJqUxfEZM/Xh7/PQ9xpB6BfjvN0zGnGuqxOnL
	pO2dbI5OlkurxGh6zgHUhxI7nkkSGSloE+SCZPcSlPghYEqy4lLFTUzY
X-Gm-Gg: AeBDievxF7L/1kNUxUl8OSdC4qV1BZdqyyImGoQF3Dez1ED31B8GwVhEuS6MmEfkUCs
	ZwEzS1+nZkWzMV2jT/vTLtcfbLxux7ke6TXruHivzK7NpbEclxTfeJiDY0/YNNoWkFs1qg2c7xz
	PqkRHPGUGXzZXiXVI9i3CqjDTzFvzxuBfLNvKViSz1yxSLSt1cneaMFYZ2/B5qPeKjbzOMvt/Jy
	f8wiumDTjyWyh3W3PAiSXHpnTOOuFhDy29SwER0N1m4gvNWhaSZg3qppXNqihzX80X/8ruv8SoO
	B+N3arxEfopy9+IL7M5V0YPDq2QL4rhAEsSe8fcntOkjuYV1iVq2dQ5rSRS0AQALH5yc0jYFpYO
	mzd5YGEPM2516DVH1oRELihdDVT3zgRsXrSzoW6ToR2FcB+gqI0o46CP62Ht5aky1EYvrUkK9gh
	4YN8bdFzHFs0dNlY4Fo55Hy4VGXX26JEtrFUyxaVk17Ow=
X-Received: by 2002:a05:600c:530f:b0:488:b241:2c5f with SMTP id 5b1f17b1804b1-48a77b298b3mr135131605e9.26.1777490072141;
        Wed, 29 Apr 2026 12:14:32 -0700 (PDT)
Received: from [192.168.0.2] ([197.250.51.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c316d7esm23315005e9.24.2026.04.29.12.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 12:14:31 -0700 (PDT)
From: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Date: Wed, 29 Apr 2026 22:13:16 +0300
Subject: [PATCH v7 5/6] ARM: dts: zte: Add D-Link DWR-932M support
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260429-send-v7-5-b432e00d2db8@gmail.com>
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
 =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6135;
 i=stefandoesinger@gmail.com; h=from:subject:message-id;
 bh=7LiDLxjelI1MRSngPzWRBkqRNsscbkTyc8tG8Vfm5PA=;
 b=owEBiQJ2/ZANAwAIAT0TvMhUTxoiAcsmYgBp8lh1tloJjoHTz5voAxHKCRFWLmhY6bogPiefG
 IyMGNt2a96JAk8EAAEIADkWIQRDFvS2qgVbJ5UyXWw9E7zIVE8aIgUCafJYdRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQPRO8yFRPGiKS5w/+NyLFdHQ/LwCkbgeqQ3GufVgE0dd5DoK
 cRlXxYxtphF+Lv5/bOgLDme3hrWzpHqHpkGaRBCkd00oBRRlpTdL38en49eQuJZVHrvma2TqoTU
 9rqOFZcJ3N31UWuJ/urEcfHNFT6KkLa8k4mzRSp9VGdpQQQr3PvaybOgqBmfGs5T8tFn+rRO1Bp
 76+AAhs1aOjv1GLIExEwiE6RWiCB4WIwEWoHllkdSec4pn04S2ItHiYp6yqcpRE4s/vFVDOdO+o
 rihGz8U45p01J05ssBBkbSYZJWIM5Cor4hKRQ5gi9Jyf3HczyuGB8OBzJsY4n1Ubrz4E5fPSRO7
 e1dGUlCe+v+/R39MRyX9I7zbIoyGwi/lhCG/gqAxQNXpTrI8wjSe9qu5TYj+o2aTvlzSe4i7yte
 zcw0rnYtahTzM6hIgRgfeoXaMZ7POVVReLcBOzdHGEeY8o1oxPU9dqtnc/qD0msFntFgBm4nitn
 tDpSlps9k08RIXHUC3/tlM9J/YfNq8o5/G8obxDrGCKFCuvnFsB4x90iXFzGvykKdyJz1lxd0zg
 ytzzicSoiQkhLVoOuVJaRdBUdm72MrQX4ANfGnzZhbfbMZaW9BCwMuCzN8lLvcvBdP6/bJXU+AE
 +n8AqzPfZwlX0y1TFWq8MZP8Mab7EOq3bmswyD9VyceVXjeCUrRo=
X-Developer-Key: i=stefandoesinger@gmail.com; a=openpgp;
 fpr=4F9C2C8728019633893EBBB98CB81F9A72BBA155

This adds base DT definition for zx297520v3 and one board that consumes it.

The stock kernel does not use the armv7 timer, but it seems to work
fine. The board has other board-specific timers that would need a driver
and I see no reason to bother with them since the arm standard timer
works.

The caveat is the non-standard GIC setup needed to handle the timer's
level-low PPI. This is the responsibility of the boot loader and
documented in Documentation/arch/arm/zte/zx297520v3.rst.

Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

---

Changes in
v6: Squash board + timer + uart patches into one
v5: Prepend the SoC name in the device specific DTS filename.
v4:
  Declare all uarts
  Remove the UART aliases for now. I can revisit this when I get my
  hands on a board that exposes two UARTs.
---
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/zte/Makefile                     |   3 +
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts |  22 +++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi              | 103 +++++++++++++++++++++
 5 files changed, 130 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e707176c2114..6f51ba1c5ada 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3775,6 +3775,7 @@ F:	drivers/video/fbdev/wmt_ge_rops.*
 ARM/ZTE ZX29 SOC SUPPORT
 M:	Stefan Dösinger <stefandoesinger@gmail.com>
 F:	Documentation/devicetree/bindings/arm/zte.yaml
+F:	arch/arm/boot/dts/zte/
 F:	arch/arm/mach-zte/
 
 ARM/ZYNQ ARCHITECTURE
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe38eb25301..28fba538d552 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -39,3 +39,4 @@ subdir-y += unisoc
 subdir-y += vt8500
 subdir-y += xen
 subdir-y += xilinx
+subdir-y += zte
diff --git a/arch/arm/boot/dts/zte/Makefile b/arch/arm/boot/dts/zte/Makefile
new file mode 100644
index 000000000000..f052cfbd636c
--- /dev/null
+++ b/arch/arm/boot/dts/zte/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+dtb-$(CONFIG_SOC_ZX297520V3) += \
+	zx297520v3-dlink-dwr932m.dtb
diff --git a/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
new file mode 100644
index 000000000000..1700f46aba86
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "zx297520v3.dtsi"
+
+/ {
+	model = "D-Link DWR-932M";
+	compatible = "dlink,dwr932m", "zte,zx297520v3";
+
+	memory@20000000 {
+		device_type = "memory";
+		reg = <0x20000000 0x04000000>;
+	};
+};
+
+&uart1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
new file mode 100644
index 000000000000..ca65797ed926
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Stefan Dösinger <stefandoesinger@gmail.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0>;
+		};
+	};
+
+	/* Base bus clock and default for the UART. It will be replaced once a clock driver has
+	 * been added.
+	 */
+	uartclk: uartclk: uartclk-26000000 {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <26000000>;
+	};
+
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+		clock-frequency = <26000000>;
+		interrupt-parent = <&gic>;
+		/* I don't think uboot sets CNTVOFF and the stock kernel doesn't use the
+		 * arm timer at all. Since this is a single CPU system I don't think it
+		 * really matters that the offset is random though.
+		 */
+		arm,cpu-registers-not-fw-configured;
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		/* The GIC has a non-standard way of configuring ints between level-low/level
+		 * high or rising edge/falling edge at 0xf2202070 and onwards. See AP_INT_MODE_BASE
+		 * and AP_PPI_MODE_REG in the ZTE kernel, although the offsets in the kernel source
+		 * seem wrong.
+		 *
+		 * Everything defaults to active-high/rising edge, but the timer is active-low. We
+		 * currently rely on the boot loader to change timer IRQs to active-low for us for
+		 * now.
+		 */
+		gic: interrupt-controller@f2000000 {
+			compatible = "arm,gic-v3";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0xf2000000 0x10000>,
+			      <0xf2040000 0x20000>;
+		};
+
+		uart0: serial@131000 {
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x00131000 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart1: serial@1408000 {
+			compatible = "arm,pl011", "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x01408000 0x1000>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+
+		uart2: serial@140d000 {
+			compatible = "arm,primecell";
+			arm,primecell-periphid = <0x0018c011>;
+			reg = <0x0140d000 0x1000>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&uartclk>, <&uartclk>;
+			clock-names = "uartclk", "apb_pclk";
+			status = "disabled";
+		};
+	};
+};

-- 
2.53.0

