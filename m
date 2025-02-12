Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70E720408A
	for <soc@lists.linux.dev>; Wed, 12 Feb 2025 22:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739400239; cv=none; b=YMbF+j7eocmuvNBGerKAuzLB1pWUkgjK7b/3Yw9D0micKnP+33LRfyCHFQW0H6ByjQWyZCfXqkFQZYk/SeRr0C7KiBTNxCyUrHtzbQjLoOLPOmtabenp9JjlMVtkPbJ7yFb5hfXAWP5/GZ5GMe4flCMnjVgifWF7ChzwDZFC7Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739400239; c=relaxed/simple;
	bh=xD1gNAlM7j8I/eKX+AMvZDpu50fQDDdi+/bb/Zx9Ik0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hGIdJW/XzAV0eHDHPog2a1aGr0TNvZyLBHWIFP6gjBWxnjLgo1HdipoqtUBmSsO1rfkH7BPXIkO049kFXKf7SYI+yTmmLNq1EaUyq8/XwjfKC7RZ4x2QkQbLGHKJ0odkW+aMFccSdgktt9vyqO7o2S91TNBdgnji9yln6ZOIbQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSrhqxsw; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSrhqxsw"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5dccaaca646so477527a12.0
        for <soc@lists.linux.dev>; Wed, 12 Feb 2025 14:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739400236; x=1740005036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WE/cgoI3XjiUZu3YMqrUwPFzZJu1ed8g0cHOG/w2zWM=;
        b=DSrhqxsw1D/+eJXuEOUTFoCLBuobRxsgjuDt/86+t98Hz/vMu+L9/UfzpjkeoO2yOb
         RbteBVAsFSMDiV7BhhTq8ESgM7Es1+rHKSc6ej31Bio3w93kpfyD3tfDYeqgxD0wWBGu
         d9wp9o/l2KL77pwgsmj1Z6dlPVFtCcJYOPW2FOG9QqWqY84SDl5ThrxwpJvJt2VNGd++
         bMcS98ZvrbnJYZjuwblhDHi48il5pcvU7GWHpbhVixZX0H4NrAu/RrYRVjdOJ/suXynZ
         ps2DvueKQRHPJNkBPyIzuK3Q2PgbgU3q3pJAl9FjjN6JXv8NEblEAqSL/wL7aRkqR6ER
         aivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739400236; x=1740005036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WE/cgoI3XjiUZu3YMqrUwPFzZJu1ed8g0cHOG/w2zWM=;
        b=iNq+q8eMXnQcE8wSh3Bx5wS05JT0mn59WuTkHxmXex2GHN04g4QFv4mo6fKwEihyeF
         RqgWp9AAhE52GUACMagGNh3DNa6ubhwjcp+l5I+5CCG4kNyRb9pDFFVD25lvAP6y1v3m
         q3pwyIeO8smOxI4zD5QA6BptCkVbFIdxAtQjsb7QcA2w83r+3XKr0lgBVslxjUTcgDTN
         /fUrHr5Bghso6uexTQZVNxzhPxs34AZSlPnzrfsMGQJKRCGnBr/WxZZv2qoGGuBfWmqZ
         UKlUeBjIf+A+l9QR4NskrhWeHgr4/cy/EwpUu1+EOfkx9t8t7JjLaHiUhNLxv6Po4OQE
         LmWw==
X-Gm-Message-State: AOJu0Yy4c1EMrZlY1gcBGdZOEx2zgWFNxg35j4MGfTty689CN63YgpnN
	Fw25Jk5wLeT5GMrKIzIEngAPLzgr9YSRgJPn3+bN32XIMHkvH0bxpUFQWgwn
X-Gm-Gg: ASbGncucNs/RXe5IhvfvfcH6mqLWhGpmUtC3zM/0kkrYh/kH6/wfKaEHS8CcXkxzV0B
	0H9TJui9VC+Zj2Dcb9s4vcbfwhEYd6fP0W7Jc1+lk8Kf7fHGUfvR7y/Uz0ryOaUYft35YbRsht7
	tf0HO9zp7HzCUyuikQVn8KmLw/IKzrlYneNzCiVKp8bYA9H50AYi+qn1VV7FIfmRx+kpeOAB+xz
	clFHBdu8GF7+zTA2BM/mQgGmgr7b0iGI65M5VPM/ePCiVZb4XjugmZgYAqXactNgYe+b4/CzoeT
	/Vm6N96GPTIcacyNVJR3qGbjvE5H
X-Google-Smtp-Source: AGHT+IFN9XF8EZ92QMiKmnbLf4/Rat6pk17BU7M2pgykUu0O+QYh9n1KLF+iT79Azz1pMcRQF5D5Rg==
X-Received: by 2002:a05:6402:26d2:b0:5d9:a5b:d84c with SMTP id 4fb4d7f45d1cf-5decba35568mr532900a12.3.1739400235594;
        Wed, 12 Feb 2025 14:43:55 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4e02sm119914a12.3.2025.02.12.14.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 14:43:55 -0800 (PST)
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
Subject: [PATCH v3 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific part into SoCs' .dtsi files
Date: Wed, 12 Feb 2025 23:43:33 +0100
Message-ID: <20250212224347.1767819-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
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

On RiscV side this patch has been dtc-compile-tested only. IRQ numbers
substitution with SOC_PERIPHERAL_IRQ() has been scripted in vim.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v3:
- &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
were moved into cv18xx-intc.dtsi to reduce code duplication;
v2:
- instead of carving out peripherals' part, carve out ARCH-specifics (CPU
core, interrupt controllers) and spread them among 3 SoC .dtsi files which
included cv18xx.dtsi;
- define a label for the "soc" node and use it in the newly introduced DTs;

 arch/riscv/boot/dts/sophgo/cv1800b.dtsi     | 28 ++++---
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi     | 28 ++++---
 arch/riscv/boot/dts/sophgo/cv181x.dtsi      |  2 +-
 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi  | 36 ++++++++
 arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi | 23 ++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi      | 91 ++++++---------------
 arch/riscv/boot/dts/sophgo/sg2002.dtsi      | 34 ++++----
 7 files changed, 137 insertions(+), 105 deletions(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index aa1f5df100f0..9fb7dd2dab18 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -3,8 +3,12 @@
  * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
  */
 
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
 #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
+#include "cv18xx-cpu.dtsi"
 #include "cv18xx.dtsi"
+#include "cv18xx-intc.dtsi"
 
 / {
 	compatible = "sophgo,cv1800b";
@@ -13,17 +17,23 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x4000000>;
 	};
+};
+
+&soc {
+	dma-noncoherent;
 
-	soc {
-		pinctrl: pinctrl@3001000 {
-			compatible = "sophgo,cv1800b-pinctrl";
-			reg = <0x03001000 0x1000>,
-			      <0x05027000 0x1000>;
-			reg-names = "sys", "rtc";
-		};
+	pinctrl: pinctrl@3001000 {
+		compatible = "sophgo,cv1800b-pinctrl";
+		reg = <0x03001000 0x1000>,
+		      <0x05027000 0x1000>;
+		reg-names = "sys", "rtc";
 	};
 };
 
+&clk {
+	compatible = "sophgo,cv1800-clk";
+};
+
 &plic {
 	compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
 };
@@ -31,7 +41,3 @@ &plic {
 &clint {
 	compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
 };
-
-&clk {
-	compatible = "sophgo,cv1800-clk";
-};
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 8a1b95c5116b..f23c4dd6687d 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -3,10 +3,14 @@
  * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
  */
 
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
+#include "cv18xx-cpu.dtsi"
 #include "cv18xx.dtsi"
 #include "cv181x.dtsi"
+#include "cv18xx-intc.dtsi"
 
 / {
 	compatible = "sophgo,cv1812h";
@@ -15,17 +19,23 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x10000000>;
 	};
+};
+
+&soc {
+	dma-noncoherent;
 
-	soc {
-		pinctrl: pinctrl@3001000 {
-			compatible = "sophgo,cv1812h-pinctrl";
-			reg = <0x03001000 0x1000>,
-			      <0x05027000 0x1000>;
-			reg-names = "sys", "rtc";
-		};
+	pinctrl: pinctrl@3001000 {
+		compatible = "sophgo,cv1812h-pinctrl";
+		reg = <0x03001000 0x1000>,
+		      <0x05027000 0x1000>;
+		reg-names = "sys", "rtc";
 	};
 };
 
+&clk {
+	compatible = "sophgo,cv1810-clk";
+};
+
 &plic {
 	compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
 };
@@ -33,7 +43,3 @@ &plic {
 &clint {
 	compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
 };
-
-&clk {
-	compatible = "sophgo,cv1810-clk";
-};
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
index 000000000000..93fd9e47a195
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
@@ -0,0 +1,36 @@
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
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi
new file mode 100644
index 000000000000..90817993a326
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
+ */
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
index 7f79de33163c..b3a4b99a3ecb 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -3,10 +3,14 @@
  * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
  */
 
+#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
+
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/pinctrl-sg2002.h>
+#include "cv18xx-cpu.dtsi"
 #include "cv18xx.dtsi"
 #include "cv181x.dtsi"
+#include "cv18xx-intc.dtsi"
 
 / {
 	compatible = "sophgo,sg2002";
@@ -15,23 +19,17 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x10000000>;
 	};
-
-	soc {
-		pinctrl: pinctrl@3001000 {
-			compatible = "sophgo,sg2002-pinctrl";
-			reg = <0x03001000 0x1000>,
-			      <0x05027000 0x1000>;
-			reg-names = "sys", "rtc";
-		};
-	};
 };
 
-&plic {
-	compatible = "sophgo,sg2002-plic", "thead,c900-plic";
-};
+&soc {
+	dma-noncoherent;
 
-&clint {
-	compatible = "sophgo,sg2002-clint", "thead,c900-clint";
+	pinctrl: pinctrl@3001000 {
+		compatible = "sophgo,sg2002-pinctrl";
+		reg = <0x03001000 0x1000>,
+		      <0x05027000 0x1000>;
+		reg-names = "sys", "rtc";
+	};
 };
 
 &clk {
@@ -41,3 +39,11 @@ &clk {
 &sdhci0 {
 	compatible = "sophgo,sg2002-dwcmshc";
 };
+
+&plic {
+	compatible = "sophgo,sg2002-plic", "thead,c900-plic";
+};
+
+&clint {
+	compatible = "sophgo,sg2002-clint", "thead,c900-clint";
+};
-- 
2.48.1

