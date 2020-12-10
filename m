Return-Path: <SRS0=hBlL=FO=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DA3C4167B
	for <soc@archiver.kernel.org>; Thu, 10 Dec 2020 20:03:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 03E4222E01; Thu, 10 Dec 2020 20:03:21 +0000 (UTC)
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com [209.85.167.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C3C422D5A
	for <soc@kernel.org>; Thu, 10 Dec 2020 20:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C3C422D5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=robherring2@gmail.com
Received: by mail-oi1-f193.google.com with SMTP id l200so7108704oig.9
        for <soc@kernel.org>; Thu, 10 Dec 2020 12:03:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qnza3+GCGQf6p7oS/J+H3p7GAfZIqb/GL8lX2/qbj2E=;
        b=H+Sv7tsKGecKD7bP/ZG0dAz9L2m6JoKgR5QiIu18A064cG6Qtxr6byIp5tSkpIuZ2/
         Fnd/GVhfAHNEsmbkzmOwEEWCAUjLGt0nuYTMoyhWswlzZoM8buIZSSsd85mhfSC6uzug
         khrVyR8QAEgxA/INzmsBQm+D3M0mk9bVsyf5FKCjG00OqxBi7lT3oQ8iNn53LtSfxn5W
         OKCBkcnXZZ57FMvlQI0JfMh3F7Qpz7zyHgyOp+kbCeNiResSg5CptB+IhyyR5Fj6pRd/
         aZZTkMqSmO6UKNbv0tUTRqlmMmm8/ILKrQ3NBCgxni475lRt9PdcTxoB9a94GWK+dsPS
         m+DQ==
X-Gm-Message-State: AOAM533ehtmrOvXznsKGhuVd2VrEbIXADZGJKUwMgJ3wLz2EMYe9U9NG
	aoVy8wFaGIWWee1FW7q5xJKaqU9Qow==
X-Google-Smtp-Source: ABdhPJyV8oXTFZPn+tTWrNW80BYuYJNXvKx741uzcpOCPPY4fz8X2WiWckqTYbfsDw/WBmbWdHvdCw==
X-Received: by 2002:aca:1a18:: with SMTP id a24mr6720777oia.29.1607630599432;
        Thu, 10 Dec 2020 12:03:19 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id o82sm1220636oih.5.2020.12.10.12.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 12:03:18 -0800 (PST)
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Jamie Iles <jamie@jamieiles.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] ARM: dts: Remove PicoXcell platforms
Date: Thu, 10 Dec 2020 14:03:12 -0600
Message-Id: <20201210200315.2965567-2-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210200315.2965567-1-robh@kernel.org>
References: <20201210200315.2965567-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PicoXcell has had nothing but treewide cleanups for at least the last 8
years and no signs of activity. The most recent activity is a yocto vendor
kernel based on v3.0 in 2015.

Cc: Jamie Iles <jamie@jamieiles.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/boot/dts/Makefile                   |   3 -
 arch/arm/boot/dts/picoxcell-pc3x2.dtsi       | 239 -------------
 arch/arm/boot/dts/picoxcell-pc3x3.dtsi       | 355 -------------------
 arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts |  78 ----
 arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts |  84 -----
 5 files changed, 759 deletions(-)
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x2.dtsi
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc3x3.dtsi
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
 delete mode 100644 arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index ce66ffd5a1bb..736b7eec4abf 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -878,9 +878,6 @@ dtb-$(CONFIG_ARCH_ACTIONS) += \
 	owl-s500-labrador-base-m.dtb \
 	owl-s500-roseapplepi.dtb \
 	owl-s500-sparky.dtb
-dtb-$(CONFIG_ARCH_PICOXCELL) += \
-	picoxcell-pc7302-pc3x2.dtb \
-	picoxcell-pc7302-pc3x3.dtb
 dtb-$(CONFIG_ARCH_PRIMA2) += \
 	prima2-evb.dtb
 dtb-$(CONFIG_ARCH_PXA) += \
diff --git a/arch/arm/boot/dts/picoxcell-pc3x2.dtsi b/arch/arm/boot/dts/picoxcell-pc3x2.dtsi
deleted file mode 100644
index c4c6c7e9e37b..000000000000
--- a/arch/arm/boot/dts/picoxcell-pc3x2.dtsi
+++ /dev/null
@@ -1,239 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Copyright (C) 2011 Picochip, Jamie Iles
- */
-/ {
-	model = "Picochip picoXcell PC3X2";
-	compatible = "picochip,pc3x2";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	cpus {
-		#address-cells = <0>;
-		#size-cells = <0>;
-
-		cpu {
-			compatible = "arm,arm1176jz-s";
-			device_type = "cpu";
-			clock-frequency = <400000000>;
-			d-cache-line-size = <32>;
-			d-cache-size = <32768>;
-			i-cache-line-size = <32>;
-			i-cache-size = <32768>;
-		};
-	};
-
-	clocks {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		pclk: clock@0 {
-			compatible = "fixed-clock";
-			clock-outputs = "bus", "pclk";
-			clock-frequency = <200000000>;
-			ref-clock = <&ref_clk>, "ref";
-		};
-	};
-
-	paxi {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x80000000 0x400000>;
-
-		emac: gem@30000 {
-			compatible = "cadence,gem";
-			reg = <0x30000 0x10000>;
-			interrupts = <31>;
-		};
-
-		dmac1: dmac@40000 {
-			compatible = "snps,dw-dmac";
-			reg = <0x40000 0x10000>;
-			interrupts = <25>;
-		};
-
-		dmac2: dmac@50000 {
-			compatible = "snps,dw-dmac";
-			reg = <0x50000 0x10000>;
-			interrupts = <26>;
-		};
-
-		vic0: interrupt-controller@60000 {
-			compatible = "arm,pl192-vic";
-			interrupt-controller;
-			reg = <0x60000 0x1000>;
-			#interrupt-cells = <1>;
-		};
-
-		vic1: interrupt-controller@64000 {
-			compatible = "arm,pl192-vic";
-			interrupt-controller;
-			reg = <0x64000 0x1000>;
-			#interrupt-cells = <1>;
-		};
-
-		fuse: picoxcell-fuse@80000 {
-			compatible = "picoxcell,fuse-pc3x2";
-			reg = <0x80000 0x10000>;
-		};
-
-		ssi: picoxcell-spi@90000 {
-			compatible = "picoxcell,spi";
-			reg = <0x90000 0x10000>;
-			interrupt-parent = <&vic0>;
-			interrupts = <10>;
-		};
-
-		ipsec: spacc@100000 {
-			compatible = "picochip,spacc-ipsec";
-			reg = <0x100000 0x10000>;
-			interrupt-parent = <&vic0>;
-			interrupts = <24>;
-			ref-clock = <&pclk>, "ref";
-		};
-
-		srtp: spacc@140000 {
-			compatible = "picochip,spacc-srtp";
-			reg = <0x140000 0x10000>;
-			interrupt-parent = <&vic0>;
-			interrupts = <23>;
-		};
-
-		l2_engine: spacc@180000 {
-			compatible = "picochip,spacc-l2";
-			reg = <0x180000 0x10000>;
-			interrupt-parent = <&vic0>;
-			interrupts = <22>;
-			ref-clock = <&pclk>, "ref";
-		};
-
-		apb {
-			compatible = "simple-bus";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x200000 0x80000>;
-
-			rtc0: rtc@0 {
-				compatible = "picochip,pc3x2-rtc";
-				clock-freq = <200000000>;
-				reg = <0x00000 0xf>;
-				interrupt-parent = <&vic1>;
-				interrupts = <8>;
-			};
-
-			timer0: timer@10000 {
-				compatible = "picochip,pc3x2-timer";
-				interrupt-parent = <&vic0>;
-				interrupts = <4>;
-				clock-freq = <200000000>;
-				reg = <0x10000 0x14>;
-			};
-
-			timer1: timer@10014 {
-				compatible = "picochip,pc3x2-timer";
-				interrupt-parent = <&vic0>;
-				interrupts = <5>;
-				clock-freq = <200000000>;
-				reg = <0x10014 0x14>;
-			};
-
-			timer2: timer@10028 {
-				compatible = "picochip,pc3x2-timer";
-				interrupt-parent = <&vic0>;
-				interrupts = <6>;
-				clock-freq = <200000000>;
-				reg = <0x10028 0x14>;
-			};
-
-			timer3: timer@1003c {
-				compatible = "picochip,pc3x2-timer";
-				interrupt-parent = <&vic0>;
-				interrupts = <7>;
-				clock-freq = <200000000>;
-				reg = <0x1003c 0x14>;
-			};
-
-			gpio: gpio@20000 {
-				compatible = "snps,dw-apb-gpio";
-				reg = <0x20000 0x1000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				banka: gpio-controller@0 {
-					compatible = "snps,dw-apb-gpio-bank";
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-generic,nr-gpio = <8>;
-
-					regoffset-dat = <0x50>;
-					regoffset-set = <0x00>;
-					regoffset-dirout = <0x04>;
-				};
-
-				bankb: gpio-controller@1 {
-					compatible = "snps,dw-apb-gpio-bank";
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-generic,nr-gpio = <8>;
-
-					regoffset-dat = <0x54>;
-					regoffset-set = <0x0c>;
-					regoffset-dirout = <0x10>;
-				};
-			};
-
-			uart0: uart@30000 {
-				compatible = "snps,dw-apb-uart";
-				reg = <0x30000 0x1000>;
-				interrupt-parent = <&vic1>;
-				interrupts = <10>;
-				clock-frequency = <3686400>;
-				reg-shift = <2>;
-				reg-io-width = <4>;
-			};
-
-			uart1: uart@40000 {
-				compatible = "snps,dw-apb-uart";
-				reg = <0x40000 0x1000>;
-				interrupt-parent = <&vic1>;
-				interrupts = <9>;
-				clock-frequency = <3686400>;
-				reg-shift = <2>;
-				reg-io-width = <4>;
-			};
-
-			wdog: watchdog@50000 {
-				compatible = "snps,dw-apb-wdg";
-				reg = <0x50000 0x10000>;
-				interrupt-parent = <&vic0>;
-				interrupts = <11>;
-				bus-clock = <&pclk>, "bus";
-			};
-		};
-	};
-
-	rwid-axi {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "simple-bus";
-		ranges;
-
-		ebi@50000000 {
-			compatible = "simple-bus";
-			#address-cells = <2>;
-			#size-cells = <1>;
-			ranges = <0 0 0x40000000 0x08000000
-				  1 0 0x48000000 0x08000000
-				  2 0 0x50000000 0x08000000
-				  3 0 0x58000000 0x08000000>;
-		};
-
-		axi2pico@c0000000 {
-			compatible = "picochip,axi2pico-pc3x2";
-			reg = <0xc0000000 0x10000>;
-			interrupts = <13 14 15 16 17 18 19 20 21>;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/picoxcell-pc3x3.dtsi b/arch/arm/boot/dts/picoxcell-pc3x3.dtsi
deleted file mode 100644
index 0e85bb6bd150..000000000000
--- a/arch/arm/boot/dts/picoxcell-pc3x3.dtsi
+++ /dev/null
@@ -1,355 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Copyright (C) 2011 Picochip, Jamie Iles
- */
-/ {
-	model = "Picochip picoXcell PC3X3";
-	compatible = "picochip,pc3x3";
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	cpus {
-		#address-cells = <0>;
-		#size-cells = <0>;
-
-		cpu {
-			compatible = "arm,arm1176jz-s";
-			device_type = "cpu";
-			cpu-clock = <&arm_clk>, "cpu";
-			d-cache-line-size = <32>;
-			d-cache-size = <32768>;
-			i-cache-line-size = <32>;
-			i-cache-size = <32768>;
-		};
-	};
-
-	clocks {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		clkgate: clkgate@800a0048 {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			reg = <0x800a0048 4>;
-			compatible = "picochip,pc3x3-clk-gate";
-
-			tzprot_clk: clock@0 {
-				compatible = "picochip,pc3x3-gated-clk";
-				clock-outputs = "bus";
-				picochip,clk-disable-bit = <0>;
-				clock-frequency = <200000000>;
-				ref-clock = <&ref_clk>, "ref";
-			};
-
-			spi_clk: clock@1 {
-				compatible = "picochip,pc3x3-gated-clk";
-				clock-outputs = "bus";
-				picochip,clk-disable-bit = <1>;
-				clock-frequency = <200000000>;
-				ref-clock = <&ref_clk>, "ref";
-			};
-
-			dmac0_clk: clock@2 {
-				compatible = "picochip,pc3x3-gated-clk";
-				clock-outputs = "bus";
-				picochip,clk-disable-bit = <2>;
-				clock-frequency = <200000000>;
-				ref-clock = <&ref_clk>, "ref";
-			};
-
-			dmac1_clk: clock@3 {
-				compatible = "picochip,pc3x3-gated-clk";
-				clock-outputs = "bus";
-				picochip,clk-disable-bit = <3>;
-				clock-frequency = <200000000>;
-				ref-clock = <&ref_clk>, "ref";
-			};
-
-			ebi_clk: clock@4 {
-				compatible = "picochip,pc3x3-gated-clk";
-				clock-outputs = "bus";
-				picochip,clk-disable-bit = <4>;
-				clock-frequency = <200000000>;
-				ref-clock = <&ref_clk>, "ref";
-			};
-
-			ipsec_clk: clock@5 {
-				compatible = "picochip,pc3x3-gated-clk";
-				clock-outputs = "bus";
-				picochip,clk-disable-bit = <5>;
-				clock-frequency = <200000000>;
-				ref-clock = <&ref_clk>, "ref";
-			};
-
-			l2_clk: clock@6 {
-				compatible = "picochip,pc3x3-gated-clk";
-				clock-outputs = "bus";
-				picochip,clk-disable-bit = <6>;
-				clock-frequency = <200000000>;
-				ref-clock = <&ref_clk>, "ref";
-			};
-
-			trng_clk: clock@7 {
-				compatible = "picochip,pc3x3-gated-clk";
-				clock-outputs = "bus";
-				picochip,clk-disable-bit = <7>;
-				clock-frequency = <200000000>;
-				ref-clock = <&ref_clk>, "ref";
-			};
-
-			fuse_clk: clock@8 {
-				compatible = "picochip,pc3x3-gated-clk";
-				clock-outputs = "bus";
-				picochip,clk-disable-bit = <8>;
-				clock-frequency = <200000000>;
-				ref-clock = <&ref_clk>, "ref";
-			};
-
-			otp_clk: clock@9 {
-				compatible = "picochip,pc3x3-gated-clk";
-				clock-outputs = "bus";
-				picochip,clk-disable-bit = <9>;
-				clock-frequency = <200000000>;
-				ref-clock = <&ref_clk>, "ref";
-			};
-		};
-
-		arm_clk: clock@11 {
-			compatible = "picochip,pc3x3-pll";
-			reg = <0x800a0050 0x8>;
-			picochip,min-freq = <140000000>;
-			picochip,max-freq = <700000000>;
-			ref-clock = <&ref_clk>, "ref";
-			clock-outputs = "cpu";
-		};
-
-		pclk: clock@12 {
-			compatible = "fixed-clock";
-			clock-outputs = "bus", "pclk";
-			clock-frequency = <200000000>;
-			ref-clock = <&ref_clk>, "ref";
-		};
-	};
-
-	paxi {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0 0x80000000 0x400000>;
-
-		emac: gem@30000 {
-			compatible = "cadence,gem";
-			reg = <0x30000 0x10000>;
-			interrupt-parent = <&vic0>;
-			interrupts = <31>;
-		};
-
-		dmac1: dmac@40000 {
-			compatible = "snps,dw-dmac";
-			reg = <0x40000 0x10000>;
-			interrupt-parent = <&vic0>;
-			interrupts = <25>;
-		};
-
-		dmac2: dmac@50000 {
-			compatible = "snps,dw-dmac";
-			reg = <0x50000 0x10000>;
-			interrupt-parent = <&vic0>;
-			interrupts = <26>;
-		};
-
-		vic0: interrupt-controller@60000 {
-			compatible = "arm,pl192-vic";
-			interrupt-controller;
-			reg = <0x60000 0x1000>;
-			#interrupt-cells = <1>;
-		};
-
-		vic1: interrupt-controller@64000 {
-			compatible = "arm,pl192-vic";
-			interrupt-controller;
-			reg = <0x64000 0x1000>;
-			#interrupt-cells = <1>;
-		};
-
-		fuse: picoxcell-fuse@80000 {
-			compatible = "picoxcell,fuse-pc3x3";
-			reg = <0x80000 0x10000>;
-		};
-
-		ssi: picoxcell-spi@90000 {
-			compatible = "picoxcell,spi";
-			reg = <0x90000 0x10000>;
-			interrupt-parent = <&vic0>;
-			interrupts = <10>;
-		};
-
-		ipsec: spacc@100000 {
-			compatible = "picochip,spacc-ipsec";
-			reg = <0x100000 0x10000>;
-			interrupt-parent = <&vic0>;
-			interrupts = <24>;
-			ref-clock = <&ipsec_clk>, "ref";
-		};
-
-		srtp: spacc@140000 {
-			compatible = "picochip,spacc-srtp";
-			reg = <0x140000 0x10000>;
-			interrupt-parent = <&vic0>;
-			interrupts = <23>;
-		};
-
-		l2_engine: spacc@180000 {
-			compatible = "picochip,spacc-l2";
-			reg = <0x180000 0x10000>;
-			interrupt-parent = <&vic0>;
-			interrupts = <22>;
-			ref-clock = <&l2_clk>, "ref";
-		};
-
-		apb {
-			compatible = "simple-bus";
-			#address-cells = <1>;
-			#size-cells = <1>;
-			ranges = <0 0x200000 0x80000>;
-
-			rtc0: rtc@0 {
-				compatible = "picochip,pc3x2-rtc";
-				clock-freq = <200000000>;
-				reg = <0x00000 0xf>;
-				interrupt-parent = <&vic0>;
-				interrupts = <8>;
-			};
-
-			timer0: timer@10000 {
-				compatible = "picochip,pc3x2-timer";
-				interrupt-parent = <&vic0>;
-				interrupts = <4>;
-				clock-freq = <200000000>;
-				reg = <0x10000 0x14>;
-			};
-
-			timer1: timer@10014 {
-				compatible = "picochip,pc3x2-timer";
-				interrupt-parent = <&vic0>;
-				interrupts = <5>;
-				clock-freq = <200000000>;
-				reg = <0x10014 0x14>;
-			};
-
-			gpio: gpio@20000 {
-				compatible = "snps,dw-apb-gpio";
-				reg = <0x20000 0x1000>;
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				banka: gpio-controller@0 {
-					compatible = "snps,dw-apb-gpio-bank";
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-generic,nr-gpio = <8>;
-
-					regoffset-dat = <0x50>;
-					regoffset-set = <0x00>;
-					regoffset-dirout = <0x04>;
-				};
-
-				bankb: gpio-controller@1 {
-					compatible = "snps,dw-apb-gpio-bank";
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-generic,nr-gpio = <16>;
-
-					regoffset-dat = <0x54>;
-					regoffset-set = <0x0c>;
-					regoffset-dirout = <0x10>;
-				};
-
-				bankd: gpio-controller@2 {
-					compatible = "snps,dw-apb-gpio-bank";
-					gpio-controller;
-					#gpio-cells = <2>;
-					gpio-generic,nr-gpio = <30>;
-
-					regoffset-dat = <0x5c>;
-					regoffset-set = <0x24>;
-					regoffset-dirout = <0x28>;
-				};
-			};
-
-			uart0: uart@30000 {
-				compatible = "snps,dw-apb-uart";
-				reg = <0x30000 0x1000>;
-				interrupt-parent = <&vic1>;
-				interrupts = <10>;
-				clock-frequency = <3686400>;
-				reg-shift = <2>;
-				reg-io-width = <4>;
-			};
-
-			uart1: uart@40000 {
-				compatible = "snps,dw-apb-uart";
-				reg = <0x40000 0x1000>;
-				interrupt-parent = <&vic1>;
-				interrupts = <9>;
-				clock-frequency = <3686400>;
-				reg-shift = <2>;
-				reg-io-width = <4>;
-			};
-
-			wdog: watchdog@50000 {
-				compatible = "snps,dw-apb-wdg";
-				reg = <0x50000 0x10000>;
-				interrupt-parent = <&vic0>;
-				interrupts = <11>;
-				bus-clock = <&pclk>, "bus";
-			};
-
-			timer2: timer@60000 {
-				compatible = "picochip,pc3x2-timer";
-				interrupt-parent = <&vic0>;
-				interrupts = <6>;
-				clock-freq = <200000000>;
-				reg = <0x60000 0x14>;
-			};
-
-			timer3: timer@60014 {
-				compatible = "picochip,pc3x2-timer";
-				interrupt-parent = <&vic0>;
-				interrupts = <7>;
-				clock-freq = <200000000>;
-				reg = <0x60014 0x14>;
-			};
-		};
-	};
-
-	rwid-axi {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "simple-bus";
-		ranges;
-
-		ebi@50000000 {
-			compatible = "simple-bus";
-			#address-cells = <2>;
-			#size-cells = <1>;
-			ranges = <0 0 0x40000000 0x08000000
-				  1 0 0x48000000 0x08000000
-				  2 0 0x50000000 0x08000000
-				  3 0 0x58000000 0x08000000>;
-		};
-
-		axi2pico@c0000000 {
-			compatible = "picochip,axi2pico-pc3x3";
-			reg = <0xc0000000 0x10000>;
-			interrupt-parent = <&vic0>;
-			interrupts = <13 14 15 16 17 18 19 20 21>;
-		};
-
-		otp@ffff8000 {
-			compatible = "picochip,otp-pc3x3";
-			reg = <0xffff8000 0x8000>;
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts b/arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
deleted file mode 100644
index 3626e5380681..000000000000
--- a/arch/arm/boot/dts/picoxcell-pc7302-pc3x2.dts
+++ /dev/null
@@ -1,78 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Copyright (C) 2011 Picochip, Jamie Iles
- */
-
-/dts-v1/;
-/include/ "picoxcell-pc3x2.dtsi"
-/ {
-	model = "Picochip PC7302 (PC3X2)";
-	compatible = "picochip,pc7302-pc3x2", "picochip,pc3x2";
-
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x08000000>;
-	};
-
-	chosen {
-		stdout-path = &uart0;
-	};
-
-	clocks {
-		ref_clk: clock@1 {
-			compatible = "fixed-clock";
-			clock-outputs = "ref";
-			clock-frequency = <20000000>;
-		};
-	};
-
-	rwid-axi {
-		ebi@50000000 {
-			nand: gpio-nand@2,0 {
-				compatible = "gpio-control-nand";
-				#address-cells = <1>;
-				#size-cells = <1>;
-				reg = <2 0x0000 0x1000>;
-				bus-clock = <&pclk>, "bus";
-				gpio-control-nand,io-sync-reg =
-					<0x00000000 0x80220000>;
-
-				gpios = <&banka 1 0	/* rdy */
-					 &banka 2 0 	/* nce */
-					 &banka 3 0 	/* ale */
-					 &banka 4 0 	/* cle */
-					 0		/* nwp */>;
-
-				boot@100000 {
-					label = "Boot";
-					reg = <0x100000 0x80000>;
-				};
-
-				redundant-boot@200000 {
-					label = "Redundant Boot";
-					reg = <0x200000 0x80000>;
-				};
-
-				boot-env@300000 {
-					label = "Boot Evironment";
-					reg = <0x300000 0x20000>;
-				};
-
-				redundant-boot-env@320000 {
-					label = "Redundant Boot Environment";
-					reg = <0x300000 0x20000>;
-				};
-
-				kernel@380000 {
-					label = "Kernel";
-					reg = <0x380000 0x800000>;
-				};
-
-				fs@b80000 {
-					label = "File System";
-					reg = <0xb80000 0xf480000>;
-				};
-			};
-		};
-	};
-};
diff --git a/arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts b/arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts
deleted file mode 100644
index 3eca65e8ee09..000000000000
--- a/arch/arm/boot/dts/picoxcell-pc7302-pc3x3.dts
+++ /dev/null
@@ -1,84 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Copyright (C) 2011 Picochip, Jamie Iles
- */
-
-/dts-v1/;
-/include/ "picoxcell-pc3x3.dtsi"
-/ {
-	model = "Picochip PC7302 (PC3X3)";
-	compatible = "picochip,pc7302-pc3x3", "picochip,pc3x3";
-
-	memory {
-		device_type = "memory";
-		reg = <0x0 0x08000000>;
-	};
-
-	chosen {
-		stdout-path = &uart0;
-	};
-
-	clocks {
-		ref_clk: clock@10 {
-			compatible = "fixed-clock";
-			clock-outputs = "ref";
-			clock-frequency = <20000000>;
-		};
-
-		clkgate: clkgate@800a0048 {
-			clock@4 {
-				picochip,clk-no-disable;
-			};
-		};
-	};
-
-	rwid-axi {
-		ebi@50000000 {
-			nand: gpio-nand@2,0 {
-				compatible = "gpio-control-nand";
-				#address-cells = <1>;
-				#size-cells = <1>;
-				reg = <2 0x0000 0x1000>;
-				bus-clock = <&ebi_clk>, "bus";
-				gpio-control-nand,io-sync-reg =
-					<0x00000000 0x80220000>;
-
-				gpios = <&banka 1 0	/* rdy */
-					 &banka 2 0 	/* nce */
-					 &banka 3 0 	/* ale */
-					 &banka 4 0 	/* cle */
-					 0		/* nwp */>;
-
-				boot@100000 {
-					label = "Boot";
-					reg = <0x100000 0x80000>;
-				};
-
-				redundant-boot@200000 {
-					label = "Redundant Boot";
-					reg = <0x200000 0x80000>;
-				};
-
-				boot-env@300000 {
-					label = "Boot Evironment";
-					reg = <0x300000 0x20000>;
-				};
-
-				redundant-boot-env@320000 {
-					label = "Redundant Boot Environment";
-					reg = <0x300000 0x20000>;
-				};
-
-				kernel@380000 {
-					label = "Kernel";
-					reg = <0x380000 0x800000>;
-				};
-
-				fs@b80000 {
-					label = "File System";
-					reg = <0xb80000 0xf480000>;
-				};
-			};
-		};
-	};
-};
-- 
2.25.1

