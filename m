Return-Path: <SRS0=O1yd=UP=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347FFC4332F
	for <soc@archiver.kernel.org>; Tue,  5 Apr 2022 16:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 195D8C385A9; Tue,  5 Apr 2022 16:08:54 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 18662C385A0;
	Tue,  5 Apr 2022 16:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 18662C385A0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 85B5422255;
	Tue,  5 Apr 2022 18:08:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1649174929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yOxddNobkG29CG4y5YoXQEAGgvfg9n1rTfCuIDFre0A=;
	b=cZzpRljaNUvDJAkqSLGiEmVvdluyyTyNu0gChI6jqsE3XcgxAXjbhf1opHhFNeisVVYRu7
	RIOdf5WvHvJb2UQ+qnPVNgi98dmJnu2teE+HeBvrl3pKZ06KQZRswxe9dhGyTOVoan6JUU
	Lj5evrmR0hUhB2gk/7w6YTIj/y0KcJ0=
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
	Tudor.Ambarus@microchip.com,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v3 4/7] ARM: dts: lan966x: add all flexcom usart nodes
Date: Tue,  5 Apr 2022 18:08:34 +0200
Message-Id: <20220405160837.4093563-5-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220405160837.4093563-1-michael@walle.cc>
References: <20220405160837.4093563-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all the remaining usart nodes for the flexcom block. Although the
DMA channels are specified, DMA is not enabled by default because break
detection doesn't work with DMA.

Keep the nodes disabled by default.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 arch/arm/boot/dts/lan966x.dtsi | 52 ++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/lan966x.dtsi b/arch/arm/boot/dts/lan966x.dtsi
index e9d6c16d04cf..ae3ac08cfc3b 100644
--- a/arch/arm/boot/dts/lan966x.dtsi
+++ b/arch/arm/boot/dts/lan966x.dtsi
@@ -92,6 +92,19 @@ flx0: flexcom@e0040000 {
 			#size-cells = <1>;
 			ranges = <0x0 0xe0040000 0x800>;
 			status = "disabled";
+
+			usart0: serial@200 {
+				compatible = "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(3)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(2)>;
+				dma-names = "tx", "rx";
+				clocks = <&nic_clk>;
+				clock-names = "usart";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
 		};
 
 		flx1: flexcom@e0044000 {
@@ -102,6 +115,19 @@ flx1: flexcom@e0044000 {
 			#size-cells = <1>;
 			ranges = <0x0 0xe0044000 0x800>;
 			status = "disabled";
+
+			usart1: serial@200 {
+				compatible = "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(5)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(4)>;
+				dma-names = "tx", "rx";
+				clocks = <&nic_clk>;
+				clock-names = "usart";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
 		};
 
 		trng: rng@e0048000 {
@@ -129,6 +155,19 @@ flx2: flexcom@e0060000 {
 			#size-cells = <1>;
 			ranges = <0x0 0xe0060000 0x800>;
 			status = "disabled";
+
+			usart2: serial@200 {
+				compatible = "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(7)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(6)>;
+				dma-names = "tx", "rx";
+				clocks = <&nic_clk>;
+				clock-names = "usart";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
 		};
 
 		flx3: flexcom@e0064000 {
@@ -181,6 +220,19 @@ flx4: flexcom@e0070000 {
 			#size-cells = <1>;
 			ranges = <0x0 0xe0070000 0x800>;
 			status = "disabled";
+
+			usart4: serial@200 {
+				compatible = "atmel,at91sam9260-usart";
+				reg = <0x200 0x200>;
+				interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&dma0 AT91_XDMAC_DT_PERID(11)>,
+				       <&dma0 AT91_XDMAC_DT_PERID(10)>;
+				dma-names = "tx", "rx";
+				clocks = <&nic_clk>;
+				clock-names = "usart";
+				atmel,fifo-size = <32>;
+				status = "disabled";
+			};
 		};
 
 		timer0: timer@e008c000 {
-- 
2.30.2

