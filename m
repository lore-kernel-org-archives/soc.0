Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC00024CEEB
	for <soc@lists.linux.dev>; Mon, 10 Feb 2025 22:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739225407; cv=none; b=e3B2yv/Yrvfvfxb2W2lzCDkyPLfPXgOiHXkmkTs7FrgfBcovmKS/PyauutdkBMOc3zkVv+LFiE4s/Xx4wYPFX3/Exv9gKP9rdWBS30TNTQPdEirkLltHWGRIJyzwnp6qAYU0hWelZ7cEoKMbwnC8uXk9NClHHKscHmvAAiDMbNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739225407; c=relaxed/simple;
	bh=aVmMv3gSg+myp9H8JiotQvb+dp0CF+XuguseRfSLLR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rEHtC5T6hSxXsxjIlnGPVk5AqCYL9GZqN4uOCex5HWmk9lW3FAduT+ekQItT+ZX8eQkfXOYLTw5BhSlqoE7N5OqNFwNTQ4UZN/Y2ZNaIIygf281panhkIqn90+JuMjkwnUfCg8lngLmjyBQX4oE9D7FNgX1BLxhUHkOqnFXXooc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQm52FR/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQm52FR/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43946b5920cso8754425e9.1
        for <soc@lists.linux.dev>; Mon, 10 Feb 2025 14:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739225403; x=1739830203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycacqOivXCpuiiDgsNxx0+xAkMZRAd46lqRqXyDUmhE=;
        b=kQm52FR/xF3OuoNwmL49/MBpqLBOPe30GtZ94QT1J6b5cjpkH371A9zeLBQaphSLd1
         G9Z30HODrp9OBTubyYE/NyXtk/AySVTdHAIAWrhWMSX0O0WeGCt9ntjbD2KgRRDqNcYg
         Dv6vGOT2e1ru2fB8LY+CbLsEwvsWAREKlX0DjZ+NKde827Tvj6coFw9hu7IlDHHpqiYn
         pqETHNVO7iiEtbjkzEhogKh9YXf+PwI7+hd2qauMklwe0DEa0XeQ+G9bQHasW0HCHi1g
         wHUiR9B1yrWY2xcJ0wzc3iMeOACs4QRuUsfP2SRMZq1sltd07oqr72JIADg9IqTfP/4s
         7ZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225403; x=1739830203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ycacqOivXCpuiiDgsNxx0+xAkMZRAd46lqRqXyDUmhE=;
        b=H3PovjGbx6JYjIprKLI/UBfq5nmHehGh21e7NMDDPmDqpDMiXs4QrexjcngAoSKwZL
         kduL1Zhu6l3Yxcfi/rYoza+60+p4jQ+oCCA/lXW1gY8mkf70bputZtGyIOmjIaVdHucf
         iKhC90ci/eH1UPrzQrBI9w06dJmdqdDDayDWx5+VUUJoDmkodUD9pYgzgP7j7uObL551
         t4NwBTCK7Ww13GR8DVLRhrcwo5fAF6mAXwD/kYwzH4qb4EUaTSRKq+dnKzuI+hS6FHC8
         DgAO8/uVfaxbx4y+leGFm/S7kBM6g2/H1aunlTuYkpuNzujtelNsYEHcMJ/9uf2SBQKj
         VgxA==
X-Gm-Message-State: AOJu0YxbdhvfLyUb27lBy/Cvj4+b8Lr6HB9Kj2gj5irKqJBF5flAXwJe
	lgSMRsfhqPOIb581SruH3v0g/lhQ2m7XtJdcpYVXWlunBLtpSm7ysI0Vkh0T
X-Gm-Gg: ASbGncvbxeNi+VdLvlt4i2jzgFms+J5mogBMvK75k7Doi5DKACfvEqWAtEC4l5r2REy
	shuXUz0DSLxd413b0O8z+kex5h7Xt/STb4xoVzxIN8/KDtfg2ENFWGCwdyQXrdCH06fdIydUwbH
	FTg4O4GCxW3x8aH4nRBO6y6F7PKWTZsdSmJcsOhpQM7IUxbsVvb+d83XM3PbykWwhSdV9X9WY6u
	o6q8ectYTgt6kkN5IowiyREP8MK88jkkzOQeWG3UR+32lXu4C9db+UwePASRg7c1rbzHHAG7zFW
	COjlejVP/iqXAD8o7a7QRn7+WD9L
X-Google-Smtp-Source: AGHT+IF0vxhyYmoHMueP8NN7Qu1KBzOLRXRa5VzXyW6nA9poUPt4CKv2oJx28349+0Ii2IhZoSFc5Q==
X-Received: by 2002:a05:600c:1911:b0:439:34d3:63c0 with SMTP id 5b1f17b1804b1-43934d365ebmr99807915e9.16.1739225402816;
        Mon, 10 Feb 2025 14:10:02 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13443450f8f.90.2025.02.10.14.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:10:02 -0800 (PST)
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
Subject: [PATCH v2 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific part into SoCs' .dtsi files
Date: Mon, 10 Feb 2025 23:09:41 +0100
Message-ID: <20250210220951.1248533-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the peripheral device tree re-usable on ARM64 platform by moving CPU
core and interrupt controllers' parts into the respective per-SoC .dtsi
files.

Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
into "plic" interrupt-controller numbering.

Have a nice refactoring side-effect that "plic" and "clint" "compatible"
property is not specified outside of the corresponding device itself.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2:
- instead of carving out peripherals' part, carve out ARCH-specifics (CPU
core, interrupt controllers) and spread them among 3 SoC .dtsi files which
included cv18xx.dtsi;
- define a label for the "soc" node and use it in the newly introduced DTs;

 arch/riscv/boot/dts/sophgo/cv1800b.dtsi    | 64 ++++++++++++---
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi    | 64 ++++++++++++---
 arch/riscv/boot/dts/sophgo/cv181x.dtsi     |  2 +-
 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi | 57 ++++++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi     | 91 ++++++----------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi     | 64 ++++++++++++---
 6 files changed, 240 insertions(+), 102 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index aa1f5df100f0..eef2884b36f9 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -3,6 +3,8 @@
  * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
  */
 
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
 #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
 #include "cv18xx.dtsi"
 
@@ -14,22 +16,62 @@ memory@80000000 {
 		reg = <0x80000000 0x4000000>;
 	};
 
-	soc {
-		pinctrl: pinctrl@3001000 {
-			compatible = "sophgo,cv1800b-pinctrl";
-			reg = <0x03001000 0x1000>,
-			      <0x05027000 0x1000>;
-			reg-names = "sys", "rtc";
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
 		};
 	};
 };
 
-&plic {
-	compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
-};
+&soc {
+	interrupt-parent = <&plic>;
+	dma-noncoherent;
 
-&clint {
-	compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
+	pinctrl: pinctrl@3001000 {
+		compatible = "sophgo,cv1800b-pinctrl";
+		reg = <0x03001000 0x1000>,
+		      <0x05027000 0x1000>;
+		reg-names = "sys", "rtc";
+	};
+
+	plic: interrupt-controller@70000000 {
+		compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
+		reg = <0x70000000 0x4000000>;
+		interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		riscv,ndev = <101>;
+	};
+
+	clint: timer@74000000 {
+		compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
+		reg = <0x74000000 0x10000>;
+		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+	};
 };
 
 &clk {
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 8a1b95c5116b..54f7e229bcd8 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -3,6 +3,8 @@
  * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
  */
 
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
 #include "cv18xx.dtsi"
@@ -16,22 +18,62 @@ memory@80000000 {
 		reg = <0x80000000 0x10000000>;
 	};
 
-	soc {
-		pinctrl: pinctrl@3001000 {
-			compatible = "sophgo,cv1812h-pinctrl";
-			reg = <0x03001000 0x1000>,
-			      <0x05027000 0x1000>;
-			reg-names = "sys", "rtc";
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
 		};
 	};
 };
 
-&plic {
-	compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
-};
+&soc {
+	interrupt-parent = <&plic>;
+	dma-noncoherent;
 
-&clint {
-	compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
+	pinctrl: pinctrl@3001000 {
+		compatible = "sophgo,cv1812h-pinctrl";
+		reg = <0x03001000 0x1000>,
+		      <0x05027000 0x1000>;
+		reg-names = "sys", "rtc";
+	};
+
+	plic: interrupt-controller@70000000 {
+		compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
+		reg = <0x70000000 0x4000000>;
+		interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		riscv,ndev = <101>;
+	};
+
+	clint: timer@74000000 {
+		compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
+		reg = <0x74000000 0x10000>;
+		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+	};
 };
 
 &clk {
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
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
new file mode 100644
index 000000000000..a68d61131efb
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
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
+	dma-noncoherent;
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
index 7f79de33163c..732d0e72cf13 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -3,6 +3,8 @@
  * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
  */
 
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-sg2002.h>
 #include "cv18xx.dtsi"
@@ -16,22 +18,62 @@ memory@80000000 {
 		reg = <0x80000000 0x10000000>;
 	};
 
-	soc {
-		pinctrl: pinctrl@3001000 {
-			compatible = "sophgo,sg2002-pinctrl";
-			reg = <0x03001000 0x1000>,
-			      <0x05027000 0x1000>;
-			reg-names = "sys", "rtc";
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
 		};
 	};
 };
 
-&plic {
-	compatible = "sophgo,sg2002-plic", "thead,c900-plic";
-};
+&soc {
+	interrupt-parent = <&plic>;
+	dma-noncoherent;
 
-&clint {
-	compatible = "sophgo,sg2002-clint", "thead,c900-clint";
+	pinctrl: pinctrl@3001000 {
+		compatible = "sophgo,sg2002-pinctrl";
+		reg = <0x03001000 0x1000>,
+		      <0x05027000 0x1000>;
+		reg-names = "sys", "rtc";
+	};
+
+	plic: interrupt-controller@70000000 {
+		compatible = "sophgo,sg2002-plic", "thead,c900-plic";
+		reg = <0x70000000 0x4000000>;
+		interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <2>;
+		riscv,ndev = <101>;
+	};
+
+	clint: timer@74000000 {
+		compatible = "sophgo,sg2002-clint", "thead,c900-clint";
+		reg = <0x74000000 0x10000>;
+		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+	};
 };
 
 &clk {
-- 
2.48.1

