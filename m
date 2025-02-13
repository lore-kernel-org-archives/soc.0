Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79961242929
	for <soc@lists.linux.dev>; Thu, 13 Feb 2025 18:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739470941; cv=none; b=NJUHJ7kRdqj7/ddpMUMag+kaLpjX3Tp61zY5mgyfMfWRJS+FJZA1f3mBAE5OG+WDnK3Gu+UppPxOUbNzntJo6hqSJuWfyGaam1zeOKByLzoN2ieXlNuYZt503uHVC5/LXO8XDU8FaGWyFp8/Rq7ka0VhACz/xDp//PHnXmBZsB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739470941; c=relaxed/simple;
	bh=YhkGAMpsSHXdE/w7wyxbwW6jgsDVkD0UEpcFGSSFgNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xc3XPNYQXLWslNzHONx8DlZuy4kDoLeg2FEe1OUPAkxBW6ioN/MPre8S2u0tNcJVOs1RJm2XwDi4N/evpcR6rpzQOYz5Lo5LdrU16/FPxcA79SVYWUofIhJT88H3vwh/z0McRKcuYYj5mY9HMcnB0bZ0GAA+wrq6ZyCEOHrQ69Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AB8vtqSE; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AB8vtqSE"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5de47cf9329so1920250a12.3
        for <soc@lists.linux.dev>; Thu, 13 Feb 2025 10:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739470937; x=1740075737; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emtVrE88a/udeqXCOA0jPNP7Xe99uTxpCHXfK09rSEM=;
        b=AB8vtqSEdma0eaz6HY13u4m0rzP76/A22XNU+BnJnT+fgO7Shd5TeYErbMkrqB2J2n
         PwbMzvqNa+Sti4L3uYlCZ5gjbId0V2fTw+mzSInVY5Rq5eh3O9YuaUc2ly8XQEjeHHqc
         uYacO77Q5Yf6eZw4ktrO9E/JF0iEsXDh4sfTu9E6F/0GQBsBmm8jwmaJrox/FSP/oIsp
         8BxbJEN9VCuNg5Z7Zijf80m6p4c7SRAjvaH+7abkp5mi7ziyZc4RBVOGGWUGgZX2nUmO
         tJJ6J9uG4mihKZPq4//2wr/zoFaCZnj1/EkafYSPDYUoZZcLoyCgMvW1V1Rmz/7lY+rH
         8rzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739470937; x=1740075737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emtVrE88a/udeqXCOA0jPNP7Xe99uTxpCHXfK09rSEM=;
        b=df93AocQvyI9sxAsJTJ83HLZct+AZFLoCbEusMjKOyLCNf7PwxpNSsdWmoTFVwF6pk
         0OLjfw+9SSJT2i/2y+v1DdnpN8bYU+sMPLw30fuBCWPxSmNPs0ttmYvG1EXfZBJeFSG5
         wkYYFfKrqwN4QvrQ3pp93FOKxBjJZl4WU+y2k+6Mx1fslRByBYBz/7KWulG1ujfdw4zk
         ouvGSc9AqcnMZ9UCF5JSgDB+ARpeb5k62CI7XeeBvjh5PngHzLRo1PAbW5F+Yc/ofInA
         wxldxfdUORYaVH7/7WPEks91qt23Xsb3uH703MrSfoMc1iD0cDbR8PB7IQ2BwsCbpmUb
         UNbg==
X-Gm-Message-State: AOJu0YyU3PBEbadcSBfXcnaEG/KSyvly0vwdQTOOYtO03yqmRjVyILgk
	8R3TIjoXzEHZu+57zO0FHjkES50JYG+Ns2Bk/giJJeBlIJ2MjJbmNLMgNqMA
X-Gm-Gg: ASbGncsWyMX6N/Mvcu2u4J/KRC6NXZ71lswmW4C+7OgCMv52YkzRrOXZeUGzPfwXDgf
	i1zZSUdeJ8do0TY8e4A7SLui8wcZyUkWG7SESIA+sEaEiAHxkIrXlaJlFpZR29UheAe7ujf8/Uz
	PlDUdR1GqBGgJlXK6e/Xiipg99hfC3GflBUYzKJXJBQUXDa6VhSyvWg36ZBlAVcYLe22crgzSF2
	r6etJMXEQfkLLdUZfCl06pU4521F7PpeA4jcZeC9/FtDuIV0yMLIM5O/Idd4c2ecYYkW/72sA7b
	Kk1TRc3aWwEURFwyv0BPrNggqcm0
X-Google-Smtp-Source: AGHT+IG5RBWUZNQpGErMop2HaEXH5zVDaO2+2/91CwJE9eOU2mEMg0/GLHSCEF9Km/RY9nu3uTdvwg==
X-Received: by 2002:a05:6402:50cc:b0:5dc:7464:2228 with SMTP id 4fb4d7f45d1cf-5deb086a58bmr7194616a12.2.1739470936292;
        Thu, 13 Feb 2025 10:22:16 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece270a66sm1559230a12.52.2025.02.13.10.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 10:22:15 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Subject: [PATCH v4 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific part into SoCs' .dtsi files
Date: Thu, 13 Feb 2025 19:22:02 +0100
Message-ID: <20250213182210.2098718-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
References: <20250213182210.2098718-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the peripheral device tree re-usable on ARM64 platform by moving CPU
core and interrupt controllers' parts into new cv18xx-cpu.dtsi and
cv18xx-intc.dtsi.

Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
into "plic" interrupt-controller numbering.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v4:
- cleanups dropped
- cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi
v3:
- &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
were moved into cv18xx-intc.dtsi to reduce code duplication;
v2:
- instead of carving out peripherals' part, carve out ARCH-specifics (CPU
core, interrupt controllers) and spread them among 3 SoC .dtsi files which
included cv18xx.dtsi;
- define a label for the "soc" node and use it in the newly introduced DTs;

 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  5 +
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi       |  5 +
 arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
 .../boot/dts/sophgo/cv18xx-cpu-intc.dtsi      | 54 +++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 91 +++++--------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi        |  5 +
 6 files changed, 93 insertions(+), 69 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index aa1f5df100f0..e5494f0f1f45 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -3,8 +3,11 @@
  * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
  */
 
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
 #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
 #include "cv18xx.dtsi"
+#include "cv18xx-cpu-intc.dtsi"
 
 / {
 	compatible = "sophgo,cv1800b";
@@ -15,6 +18,8 @@ memory@80000000 {
 	};
 
 	soc {
+		dma-noncoherent;
+
 		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,cv1800b-pinctrl";
 			reg = <0x03001000 0x1000>,
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 8a1b95c5116b..96e1a2f14d3e 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -3,9 +3,12 @@
  * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
  */
 
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
 #include "cv18xx.dtsi"
+#include "cv18xx-cpu-intc.dtsi"
 #include "cv181x.dtsi"
 
 / {
@@ -17,6 +20,8 @@ memory@80000000 {
 	};
 
 	soc {
+		dma-noncoherent;
+
 		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,cv1812h-pinctrl";
 			reg = <0x03001000 0x1000>,
diff --git a/arch/riscv/boot/dts/sophgo/cv181x.dtsi b/arch/riscv/boot/dts/sophgo/cv181x.dtsi
index 5fd14dd1b14f..bbdb30653e9a 100644
--- a/arch/riscv/boot/dts/sophgo/cv181x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv181x.dtsi
@@ -11,7 +11,7 @@ soc {
 		emmc: mmc@4300000 {
 			compatible = "sophgo,cv1800b-dwcmshc";
 			reg = <0x4300000 0x1000>;
-			interrupts = <34 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(18) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_AXI4_EMMC>,
 				 <&clk CLK_EMMC>;
 			clock-names = "core", "bus";
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi
new file mode 100644
index 000000000000..5e5d163e79d4
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-cpu-intc.dtsi
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+/ {
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <25000000>;
+
+		cpu0: cpu@0 {
+			compatible = "thead,c906", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <512>;
+			d-cache-size = <65536>;
+			i-cache-block-size = <64>;
+			i-cache-sets = <128>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
+					       "zifencei", "zihpm";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+};
+
+&soc {
+	interrupt-parent = <&plic>;
+
+	plic: interrupt-controller@70000000 {
+		reg = <0x70000000 0x4000000>;
+		interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		riscv,ndev = <101>;
+	};
+
+	clint: timer@74000000 {
+		reg = <0x74000000 0x10000>;
+		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+	};
+};
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index c18822ec849f..62c1464a0490 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -12,47 +12,16 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	cpus: cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		timebase-frequency = <25000000>;
-
-		cpu0: cpu@0 {
-			compatible = "thead,c906", "riscv";
-			device_type = "cpu";
-			reg = <0>;
-			d-cache-block-size = <64>;
-			d-cache-sets = <512>;
-			d-cache-size = <65536>;
-			i-cache-block-size = <64>;
-			i-cache-sets = <128>;
-			i-cache-size = <32768>;
-			mmu-type = "riscv,sv39";
-			riscv,isa = "rv64imafdc";
-			riscv,isa-base = "rv64i";
-			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
-					       "zifencei", "zihpm";
-
-			cpu0_intc: interrupt-controller {
-				compatible = "riscv,cpu-intc";
-				interrupt-controller;
-				#interrupt-cells = <1>;
-			};
-		};
-	};
-
 	osc: oscillator {
 		compatible = "fixed-clock";
 		clock-output-names = "osc_25m";
 		#clock-cells = <0>;
 	};
 
-	soc {
+	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&plic>;
 		#address-cells = <1>;
 		#size-cells = <1>;
-		dma-noncoherent;
 		ranges;
 
 		clk: clock-controller@3002000 {
@@ -75,7 +44,7 @@ porta: gpio-controller@0 {
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				interrupts = <60 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <SOC_PERIPHERAL_IRQ(44) IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
@@ -93,7 +62,7 @@ portb: gpio-controller@0 {
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				interrupts = <61 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <SOC_PERIPHERAL_IRQ(45) IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
@@ -111,7 +80,7 @@ portc: gpio-controller@0 {
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <SOC_PERIPHERAL_IRQ(46) IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
@@ -129,7 +98,7 @@ portd: gpio-controller@0 {
 				reg = <0>;
 				interrupt-controller;
 				#interrupt-cells = <2>;
-				interrupts = <63 IRQ_TYPE_LEVEL_HIGH>;
+				interrupts = <SOC_PERIPHERAL_IRQ(47) IRQ_TYPE_LEVEL_HIGH>;
 			};
 		};
 
@@ -137,7 +106,7 @@ saradc: adc@30f0000 {
 			compatible = "sophgo,cv1800b-saradc";
 			reg = <0x030f0000 0x1000>;
 			clocks = <&clk CLK_SARADC>;
-			interrupts = <100 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(84) IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -162,7 +131,7 @@ i2c0: i2c@4000000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C0>;
 			clock-names = "ref", "pclk";
-			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(33) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -173,7 +142,7 @@ i2c1: i2c@4010000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C1>;
 			clock-names = "ref", "pclk";
-			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(34) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -184,7 +153,7 @@ i2c2: i2c@4020000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C2>;
 			clock-names = "ref", "pclk";
-			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(35) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -195,7 +164,7 @@ i2c3: i2c@4030000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C3>;
 			clock-names = "ref", "pclk";
-			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(36) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -206,14 +175,14 @@ i2c4: i2c@4040000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C4>;
 			clock-names = "ref", "pclk";
-			interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(37) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
 		uart0: serial@4140000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04140000 0x100>;
-			interrupts = <44 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(28) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_UART0>, <&clk CLK_APB_UART0>;
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
@@ -224,7 +193,7 @@ uart0: serial@4140000 {
 		uart1: serial@4150000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04150000 0x100>;
-			interrupts = <45 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(29) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_UART1>, <&clk CLK_APB_UART1>;
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
@@ -235,7 +204,7 @@ uart1: serial@4150000 {
 		uart2: serial@4160000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04160000 0x100>;
-			interrupts = <46 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(30) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_UART2>, <&clk CLK_APB_UART2>;
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
@@ -246,7 +215,7 @@ uart2: serial@4160000 {
 		uart3: serial@4170000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x04170000 0x100>;
-			interrupts = <47 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(31) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_UART3>, <&clk CLK_APB_UART3>;
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
@@ -261,7 +230,7 @@ spi0: spi@4180000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
 			clock-names = "ssi_clk", "pclk";
-			interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(38) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -272,7 +241,7 @@ spi1: spi@4190000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
 			clock-names = "ssi_clk", "pclk";
-			interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(39) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -283,7 +252,7 @@ spi2: spi@41a0000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
 			clock-names = "ssi_clk", "pclk";
-			interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(40) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
@@ -294,14 +263,14 @@ spi3: spi@41b0000 {
 			#size-cells = <0>;
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
 			clock-names = "ssi_clk", "pclk";
-			interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(41) IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
 
 		uart4: serial@41c0000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x041c0000 0x100>;
-			interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(32) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_UART4>, <&clk CLK_APB_UART4>;
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
@@ -312,7 +281,7 @@ uart4: serial@41c0000 {
 		sdhci0: mmc@4310000 {
 			compatible = "sophgo,cv1800b-dwcmshc";
 			reg = <0x4310000 0x1000>;
-			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(20) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_AXI4_SD0>,
 				 <&clk CLK_SD0>;
 			clock-names = "core", "bus";
@@ -322,7 +291,7 @@ sdhci0: mmc@4310000 {
 		sdhci1: mmc@4320000 {
 			compatible = "sophgo,cv1800b-dwcmshc";
 			reg = <0x4320000 0x1000>;
-			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(22) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_AXI4_SD1>,
 				 <&clk CLK_SD1>;
 			clock-names = "core", "bus";
@@ -332,7 +301,7 @@ sdhci1: mmc@4320000 {
 		dmac: dma-controller@4330000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0x04330000 0x1000>;
-			interrupts = <29 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
 			clock-names = "core-clk", "cfgr-clk";
 			#dma-cells = <1>;
@@ -344,19 +313,5 @@ dmac: dma-controller@4330000 {
 			snps,data-width = <4>;
 			status = "disabled";
 		};
-
-		plic: interrupt-controller@70000000 {
-			reg = <0x70000000 0x4000000>;
-			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
-			interrupt-controller;
-			#address-cells = <0>;
-			#interrupt-cells = <2>;
-			riscv,ndev = <101>;
-		};
-
-		clint: timer@74000000 {
-			reg = <0x74000000 0x10000>;
-			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
-		};
 	};
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index 7f79de33163c..a0cb8080dfa5 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -3,9 +3,12 @@
  * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
  */
 
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-sg2002.h>
 #include "cv18xx.dtsi"
+#include "cv18xx-cpu-intc.dtsi"
 #include "cv181x.dtsi"
 
 / {
@@ -17,6 +20,8 @@ memory@80000000 {
 	};
 
 	soc {
+		dma-noncoherent;
+
 		pinctrl: pinctrl@3001000 {
 			compatible = "sophgo,sg2002-pinctrl";
 			reg = <0x03001000 0x1000>,
-- 
2.48.1

