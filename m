Return-Path: <SRS0=gfAI=TO=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098BCC433EF
	for <soc@archiver.kernel.org>; Thu,  3 Mar 2022 16:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E8C45C340F0; Thu,  3 Mar 2022 16:03:49 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 70473C340F1;
	Thu,  3 Mar 2022 16:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 70473C340F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id E47A3223F6;
	Thu,  3 Mar 2022 17:03:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1646323420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BOHb81f6UjTpy/o++osD43lpaRTuWZcu/2E7PE6CXxA=;
	b=abuUEQ/zGzluu5mT0ZzbVlfNgbdmEbU1+ftwK2a2CuMvWek5MqX7RGD3gKJbhydWzHmv0S
	DO2cf5V1DlYHeBfBRDJCRnKYetqf2ywawas5RqHrugybdeR2N1pVRxLbCiZ2AzGZzMhvck
	97FlmFBGObbciyYoaVm+FCYAxUnCgs8=
From: Michael Walle <michael@walle.cc>
To: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v1 5/6] ARM: dts: lan966x: add flexcom I2C nodes
Date: Thu,  3 Mar 2022 17:03:22 +0100
Message-Id: <20220303160323.3316317-6-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303160323.3316317-1-michael@walle.cc>
References: <20220303160323.3316317-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all I2C nodes of the flexcom IP blocks. The driver supports
FIFO, DMA or both combined. But the latter isn't working correctly.
Thus, skip the fifo-size property for now. DMA is doing single byte
reads in this case.

Keep the nodes disabled by default.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 arch/arm/boot/dts/lan966x.dtsi | 65 ++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm/boot/dts/lan966x.dtsi b/arch/arm/boot/dts/lan966x.dtsi
index 0616927f1bb1..c4aab7f65790 100644
--- a/arch/arm/boot/dts/lan966x.dtsi
+++ b/arch/arm/boot/dts/lan966x.dtsi
@@ -120,6 +120,19 @@ spi0: spi@400 {
 				atmel,fifo-size = <32>;
 				status = "disabled";
 			};
+
+			i2c0: i2c@600 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(3)>,
+					   <&dma0 AT91_XDMAC_DT_PERID(2)>;
+				dma-names = "tx", "rx";
+				clocks = <&nic_clk>;
+				status = "disabled";
+			};
 		};
 
 		flx1: flexcom@e0044000 {
@@ -158,6 +171,19 @@ spi1: spi@400 {
 				atmel,fifo-size = <32>;
 				status = "disabled";
 			};
+
+			i2c1: i2c@600 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(5)>,
+					   <&dma0 AT91_XDMAC_DT_PERID(4)>;
+				dma-names = "tx", "rx";
+				clocks = <&nic_clk>;
+				status = "disabled";
+			};
 		};
 
 		trng: rng@e0048000 {
@@ -213,6 +239,19 @@ spi2: spi@400 {
 				atmel,fifo-size = <32>;
 				status = "disabled";
 			};
+
+			i2c2: i2c@600 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(7)>,
+					   <&dma0 AT91_XDMAC_DT_PERID(6)>;
+				dma-names = "tx", "rx";
+				clocks = <&nic_clk>;
+				status = "disabled";
+			};
 		};
 
 		flx3: flexcom@e0064000 {
@@ -251,6 +290,19 @@ spi3: spi@400 {
 				atmel,fifo-size = <32>;
 				status = "disabled";
 			};
+
+			i2c3: i2c@600 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(9)>,
+					   <&dma0 AT91_XDMAC_DT_PERID(8)>;
+				dma-names = "tx", "rx";
+				clocks = <&nic_clk>;
+				status = "disabled";
+			};
 		};
 
 		dma0: dma-controller@e0068000 {
@@ -308,6 +360,19 @@ spi4: spi@400 {
 				atmel,fifo-size = <32>;
 				status = "disabled";
 			};
+
+			i2c4: i2c@600 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "microchip,sam9x60-i2c";
+				reg = <0x600 0x200>;
+				interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(11)>,
+					   <&dma0 AT91_XDMAC_DT_PERID(10)>;
+				dma-names = "tx", "rx";
+				clocks = <&nic_clk>;
+				status = "disabled";
+			};
 		};
 
 		timer0: timer@e008c000 {
-- 
2.30.2

