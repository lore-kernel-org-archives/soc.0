Return-Path: <SRS0=KA1m=BF=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC3EC77B7F
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 07:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 290D4C433EF; Tue, 16 May 2023 07:52:52 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DCBBFC4339B;
	Tue, 16 May 2023 07:52:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DCBBFC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1aaf2ede38fso133761005ad.2;
        Tue, 16 May 2023 00:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684223570; x=1686815570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8OhEt4GIuw43ahn9BPzsd8d+JekOssXjgymx9BYUKc=;
        b=O62EutE8wBuqNF/k2H0gdfnJG5oKug966OvBaMDETvpMjLxWdXrLVYEP0F+tUm6oDY
         SMkfG1xd5nVmDZugzT4gcNCG6rOArZBU4i1Sf2r2X3STBvNubvyQXqqFcVzhvaxMpDrs
         DXG52P5+7DgAgVpsknLqidqtM70cHyutsUlZGkqxUg4lT0Ica7vljZJN8MV1tgzo9zr+
         umxa9sNNh6Row3BnFqwef3zexmsqhBy6l55+3TzvHZgKcNdnFpvlSgyj/Babi7uKtlBv
         GaHHl3zufPt06xgOmweBIlLSXXp9aphT6xzc3DnGi+ttmwYvcocLCEisNYvtxowSI+Ad
         k3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684223570; x=1686815570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c8OhEt4GIuw43ahn9BPzsd8d+JekOssXjgymx9BYUKc=;
        b=FmMXKMUp5CUUv+rRDpUw88DtbBAfaQ3FMrYpi07IhkwcXQwMS+U/kb47WZAFS1n4XI
         Xl5c47XNbte+0k/H53A/peArQM2GmJ3VBNP58cGaqqYF6VhquRplW8OXuj2KoCUIIUYr
         ec3Vcu3Oga34hz6g//1GOABwTFw9Pzj9gCSJ+A7EOPhKvWMdrL5CfEFnrYHpwrWj6QPZ
         QNoa5MtJc7/QgV6UTzpJVxYt6T2dmazTS3LIiReBB/pYVSrWHtRlw+XgVnsTFdjk95RW
         +TnIJ+a4akB6W7AefqGbbN/e8jEcmAv/T9Py37FpHfFdOUA27mOLV515mcheghlO7ISB
         +JHg==
X-Gm-Message-State: AC+VfDwtHncDyr9s0F0sK+JdPn8WSAqzonZ0jV1axxaIDeFg3bQ6dKvp
	KJT0QsghQSg4sr8d0QktzPaYkjLdp8x3EQ==
X-Google-Smtp-Source: ACHHUZ7ukRSUoQIlfcEE13bVDxtfSSci0Di+Mq7CZrE9RxgWc2Evu/vTqdNzkYDV5fFMk4vFv+IhEg==
X-Received: by 2002:a17:902:ec88:b0:1aa:fbaa:ee09 with SMTP id x8-20020a170902ec8800b001aafbaaee09mr49879280plg.49.1684223570121;
        Tue, 16 May 2023 00:52:50 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id n18-20020a170903111200b001ab061e352bsm4793043plh.195.2023.05.16.00.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 00:52:49 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	tmaimon77@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	arnd@arndb.de,
	soc@kernel.org,
	schung@nuvoton.com,
	mjchen@nuvoton.com,
	Jacky Huang <ychuang3@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v11 07/10] arm64: dts: nuvoton: Add initial ma35d1 device tree
Date: Tue, 16 May 2023 07:52:14 +0000
Message-Id: <20230516075217.205401-8-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230516075217.205401-1-ychuang570808@gmail.com>
References: <20230516075217.205401-1-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

Add initial device tree support for Nuvoton ma35d1 SoC, including
cpu, clock, reset, and serial controllers.
Add reference boards som-256m and iot-512m.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/nuvoton/Makefile          |   2 +
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  56 +++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  56 +++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 234 ++++++++++++++++++
 4 files changed, 348 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
 create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
 create mode 100644 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi

diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts/nuvoton/Makefile
index a99dab90472a..3bc9787801a5 100644
--- a/arch/arm64/boot/dts/nuvoton/Makefile
+++ b/arch/arm64/boot/dts/nuvoton/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_MA35) += ma35d1-iot-512m.dtb
+dtb-$(CONFIG_ARCH_MA35) += ma35d1-som-256m.dtb
 dtb-$(CONFIG_ARCH_NPCM) += nuvoton-npcm845-evb.dtb
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
new file mode 100644
index 000000000000..b89e2be6abae
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Nuvoton Technology Corp.
+ * Author: Shan-Chun Hung <schung@nuvoton.com>
+ *         Jacky huang <ychuang3@nuvoton.com>
+ */
+
+/dts-v1/;
+#include "ma35d1.dtsi"
+
+/ {
+	model = "Nuvoton MA35D1-IoT";
+	compatible = "nuvoton,ma35d1-iot", "nuvoton,ma35d1";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	mem: memory@80000000 {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000 0 0x20000000>; /* 512M DRAM */
+	};
+
+	clk_hxt: clock-hxt {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clk_hxt";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&clk {
+	assigned-clocks = <&clk CAPLL>,
+			  <&clk DDRPLL>,
+			  <&clk APLL>,
+			  <&clk EPLL>,
+			  <&clk VPLL>;
+	assigned-clock-rates = <800000000>,
+			       <266000000>,
+			       <180000000>,
+			       <500000000>,
+			       <102000000>;
+	nuvoton,pll-mode = "integer",
+			   "fractional",
+			   "integer",
+			   "integer",
+			   "integer";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
new file mode 100644
index 000000000000..a1ebddecb7f8
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Nuvoton Technology Corp.
+ * Author: Shan-Chun Hung <schung@nuvoton.com>
+ *         Jacky huang <ychuang3@nuvoton.com>
+ */
+
+/dts-v1/;
+#include "ma35d1.dtsi"
+
+/ {
+	model = "Nuvoton MA35D1-SOM";
+	compatible = "nuvoton,ma35d1-som", "nuvoton,ma35d1";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	mem: memory@80000000 {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000 0 0x10000000>; /* 256M DRAM */
+	};
+
+	clk_hxt: clock-hxt {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "clk_hxt";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&clk {
+	assigned-clocks = <&clk CAPLL>,
+			  <&clk DDRPLL>,
+			  <&clk APLL>,
+			  <&clk EPLL>,
+			  <&clk VPLL>;
+	assigned-clock-rates = <800000000>,
+			       <266000000>,
+			       <180000000>,
+			       <500000000>,
+			       <102000000>;
+	nuvoton,pll-mode = "integer",
+			   "fractional",
+			   "integer",
+			   "integer",
+			   "integer";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
new file mode 100644
index 000000000000..781cdae566a0
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2023 Nuvoton Technology Corp.
+ * Author: Shan-Chun Hung <schung@nuvoton.com>
+ *         Jacky huang <ychuang3@nuvoton.com>
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+#include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+/ {
+	compatible = "nuvoton,ma35d1";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a35";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+			next-level-cache = <&L2_0>;
+		};
+
+		L2_0: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x80000>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	gic: interrupt-controller@50801000 {
+		compatible = "arm,gic-400";
+		reg = <0x0 0x50801000 0 0x1000>, /* GICD */
+		      <0x0 0x50802000 0 0x2000>, /* GICC */
+		      <0x0 0x50804000 0 0x2000>, /* GICH */
+		      <0x0 0x50806000 0 0x2000>; /* GICV */
+		#interrupt-cells = <3>;
+		interrupt-parent = <&gic>;
+		interrupt-controller;
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0x13) |
+			      IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) |
+			      IRQ_TYPE_LEVEL_LOW)>, /* Physical Secure */
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) |
+			      IRQ_TYPE_LEVEL_LOW)>, /* Physical Non-Secure */
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) |
+			      IRQ_TYPE_LEVEL_LOW)>, /* Virtual */
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) |
+			      IRQ_TYPE_LEVEL_LOW)>; /* Hypervisor */
+		interrupt-parent = <&gic>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		sys: system-management@40460000 {
+			compatible = "nuvoton,ma35d1-reset";
+			reg = <0x0 0x40460000 0x0 0x200>;
+			#reset-cells = <1>;
+		};
+
+		clk: clock-controller@40460200 {
+			compatible = "nuvoton,ma35d1-clk";
+			reg = <0x00000000 0x40460200 0x0 0x100>;
+			#clock-cells = <1>;
+			clocks = <&clk_hxt>;
+		};
+
+		uart0: serial@40700000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40700000 0x0 0x100>;
+			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART0_GATE>;
+			status = "disabled";
+		};
+
+		uart1: serial@40710000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40710000 0x0 0x100>;
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART1_GATE>;
+			status = "disabled";
+		};
+
+		uart2: serial@40720000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40720000 0x0 0x100>;
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART2_GATE>;
+			status = "disabled";
+		};
+
+		uart3: serial@40730000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40730000 0x0 0x100>;
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART3_GATE>;
+			status = "disabled";
+		};
+
+		uart4: serial@40740000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40740000 0x0 0x100>;
+			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART4_GATE>;
+			status = "disabled";
+		};
+
+		uart5: serial@40750000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40750000 0x0 0x100>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART5_GATE>;
+			status = "disabled";
+		};
+
+		uart6: serial@40760000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40760000 0x0 0x100>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART6_GATE>;
+			status = "disabled";
+		};
+
+		uart7: serial@40770000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40770000 0x0 0x100>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART7_GATE>;
+			status = "disabled";
+		};
+
+		uart8: serial@40780000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40780000 0x0 0x100>;
+			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART8_GATE>;
+			status = "disabled";
+		};
+
+		uart9: serial@40790000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40790000 0x0 0x100>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART9_GATE>;
+			status = "disabled";
+		};
+
+		uart10: serial@407a0000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x407a0000 0x0 0x100>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART10_GATE>;
+			status = "disabled";
+		};
+
+		uart11: serial@407b0000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x407b0000 0x0 0x100>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART11_GATE>;
+			status = "disabled";
+		};
+
+		uart12: serial@407c0000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x407c0000 0x0 0x100>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART12_GATE>;
+			status = "disabled";
+		};
+
+		uart13: serial@407d0000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x407d0000 0x0 0x100>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART13_GATE>;
+			status = "disabled";
+		};
+
+		uart14: serial@407e0000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x407e0000 0x0 0x100>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART14_GATE>;
+			status = "disabled";
+		};
+
+		uart15: serial@407f0000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x407f0000 0x0 0x100>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART15_GATE>;
+			status = "disabled";
+		};
+
+		uart16: serial@40880000 {
+			compatible = "nuvoton,ma35d1-uart";
+			reg = <0x0 0x40880000 0x0 0x100>;
+			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk UART16_GATE>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.34.1

