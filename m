Return-Path: <SRS0=xBYX=5J=microchip.com=Durai.ManickamKR@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E20C54EBC
	for <soc@archiver.kernel.org>; Thu, 12 Jan 2023 11:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A830C43396; Thu, 12 Jan 2023 11:03:47 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F499C433D2;
	Thu, 12 Jan 2023 11:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8F499C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673521424; x=1705057424;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8NMSukgDSjcnA9hGKJMLP7HlTdjoXYA0BmMPbZE9TC4=;
  b=DObyNK26rc2VUdMNxeHPanDMpKvYnO3xbj4S9NTEFPSlf/413rY0BbUW
   pB5WRsFHrajRc58ewJ2g1hkGZKaEd9jGsX3pMH2biiio5d/rAeVjZY2EE
   ZkEySSEx+l9ELsakaUl61HjXj/UDbZt4cUp4RjBOCD74iie61JSYK1K+P
   MkKeB45P56ZTsdK8E7HpnF94Jg1jf2pu6YoxDPuaTJHbSVXUfBqOBllaA
   d+My8dOk4Ct5fc3bOuOP8r51eMKcoqiGnPZ98Q6ohraqLvBr9TnNq7Dyq
   pcUrzLlvAKLohUTXpZNLeIXsRMvnvk2L5Bi8/qWgbzjqkroP2pcYFaz0z
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="196344280"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jan 2023 04:03:43 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 04:03:42 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 04:03:34 -0700
From: Durai Manickam KR <durai.manickamkr@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <Hari.PrasathGE@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<manikandan.m@microchip.com>, <varshini.rajendran@microchip.com>,
	<dharma.b@microchip.com>, <nayabbasha.sayed@microchip.com>,
	<balakrishnan.s@microchip.com>, <claudiu.beznea@microchip.com>,
	<cristian.birsan@microchip.com>, <nicolas.ferre@microchip.com>,
	<krzysztof.kozlowski@linaro.org>, <alexandre.belloni@bootlin.com>,
	<davem@davemloft.net>, <arnd@arndb.de>, <olof@lixom.net>, <soc@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <Kavyasree.Kotagiri@microchip.com>,
	<Horatiu.Vultur@microchip.com>, <robh+dt@kernel.org>, <andrew@lunn.ch>,
	<michael@walle.cc>, <jerry.ray@microchip.com>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>
Subject: [PATCH v4 6/8] ARM: dts: at91: sam9x60: Add missing flexcom definitions
Date: Thu, 12 Jan 2023 16:32:06 +0530
Message-ID: <20230112110208.97946-7-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112110208.97946-1-durai.manickamkr@microchip.com>
References: <20230112110208.97946-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Manikandan Muralidharan <manikandan.m@microchip.com>

Added the missing flexcom functions for all the flexcom nodes.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 arch/arm/boot/dts/sam9x60.dtsi | 545 +++++++++++++++++++++++++++++++++
 1 file changed, 545 insertions(+)

diff --git a/arch/arm/boot/dts/sam9x60.dtsi b/arch/arm/boot/dts/sam9x60.dtsi
index 8f44854dd8fa..0b5a49bee064 100644
--- a/arch/arm/boot/dts/sam9x60.dtsi
+++ b/arch/arm/boot/dts/sam9x60.dtsi
@@ -171,6 +171,27 @@ flx4: flexcom@f0000000 {
 				ranges = <0x0 0xf0000000 0x800>;
 				status = "disabled";
 
+				uart4: serial@200 {
+					compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+					reg = <0x200 0x200>;
+					interrupts = <13 IRQ_TYPE_LEVEL_HIGH 7>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(8))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(9))>;
+					dma-names = "tx", "rx";
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 13>;
+					clock-names = "usart";
+					atmel,use-dma-rx;
+					atmel,use-dma-tx;
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
 				spi4: spi@400 {
 					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
 					reg = <0x400 0x200>;
@@ -189,6 +210,24 @@ AT91_XDMAC_DT_PER_IF(1) |
 					atmel,fifo-size = <16>;
 					status = "disabled";
 				};
+
+				i2c4: i2c@600 {
+					compatible = "microchip,sam9x60-i2c";
+					reg = <0x600 0x200>;
+					interrupts = <13 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 13>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(8))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(9))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
 			};
 
 			flx5: flexcom@f0004000 {
@@ -221,6 +260,43 @@ AT91_XDMAC_DT_PER_IF(1) |
 					atmel,fifo-size = <16>;
 					status = "disabled";
 				};
+
+				spi5: spi@400 {
+					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
+					reg = <0x400 0x200>;
+					interrupts = <14 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 14>;
+					clock-names = "spi_clk";
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(10))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(11))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
+				i2c5: i2c@600 {
+					compatible = "microchip,sam9x60-i2c";
+					reg = <0x600 0x200>;
+					interrupts = <14 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 14>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(10))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(11))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
 			};
 
 			dma0: dma-controller@f0008000 {
@@ -292,6 +368,45 @@ flx11: flexcom@f0020000 {
 				#size-cells = <1>;
 				ranges = <0x0 0xf0020000 0x800>;
 				status = "disabled";
+
+				uart11: serial@200 {
+					compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+					reg = <0x200 0x200>;
+					interrupts = <32 IRQ_TYPE_LEVEL_HIGH 7>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(22))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(23))>;
+					dma-names = "tx", "rx";
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 32>;
+					clock-names = "usart";
+					atmel,use-dma-rx;
+					atmel,use-dma-tx;
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
+				i2c11: i2c@600 {
+					compatible = "microchip,sam9x60-i2c";
+					reg = <0x600 0x200>;
+					interrupts = <32 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 32>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(22))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(23))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
 			};
 
 			flx12: flexcom@f0024000 {
@@ -302,6 +417,45 @@ flx12: flexcom@f0024000 {
 				#size-cells = <1>;
 				ranges = <0x0 0xf0024000 0x800>;
 				status = "disabled";
+
+				uart12: serial@200 {
+					compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+					reg = <0x200 0x200>;
+					interrupts = <33 IRQ_TYPE_LEVEL_HIGH 7>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(24))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(25))>;
+					dma-names = "tx", "rx";
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 33>;
+					clock-names = "usart";
+					atmel,use-dma-rx;
+					atmel,use-dma-tx;
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
+				i2c12: i2c@600 {
+					compatible = "microchip,sam9x60-i2c";
+					reg = <0x600 0x200>;
+					interrupts = <33 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 33>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(24))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(25))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
 			};
 
 			pit64b: timer@f0028000 {
@@ -421,6 +575,27 @@ flx6: flexcom@f8010000 {
 				ranges = <0x0 0xf8010000 0x800>;
 				status = "disabled";
 
+				uart6: serial@200 {
+					compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+					reg = <0x200 0x200>;
+					interrupts = <9 IRQ_TYPE_LEVEL_HIGH 7>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(12))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(13))>;
+					dma-names = "tx", "rx";
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 9>;
+					clock-names = "usart";
+					atmel,use-dma-rx;
+					atmel,use-dma-tx;
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
 				i2c6: i2c@600 {
 					compatible = "microchip,sam9x60-i2c";
 					reg = <0x600 0x200>;
@@ -448,6 +623,45 @@ flx7: flexcom@f8014000 {
 				#size-cells = <1>;
 				ranges = <0x0 0xf8014000 0x800>;
 				status = "disabled";
+
+				uart7: serial@200 {
+					compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+					reg = <0x200 0x200>;
+					interrupts = <10 IRQ_TYPE_LEVEL_HIGH 7>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(14))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(15))>;
+					dma-names = "tx", "rx";
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 10>;
+					clock-names = "usart";
+					atmel,use-dma-rx;
+					atmel,use-dma-tx;
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
+				i2c7: i2c@600 {
+					compatible = "microchip,sam9x60-i2c";
+					reg = <0x600 0x200>;
+					interrupts = <10 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 10>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(14))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(15))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
 			};
 
 			flx8: flexcom@f8018000 {
@@ -458,6 +672,45 @@ flx8: flexcom@f8018000 {
 				#size-cells = <1>;
 				ranges = <0x0 0xf8018000 0x800>;
 				status = "disabled";
+
+				uart8: serial@200 {
+					compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+					reg = <0x200 0x200>;
+					interrupts = <11 IRQ_TYPE_LEVEL_HIGH 7>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(16))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(17))>;
+					dma-names = "tx", "rx";
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 11>;
+					clock-names = "usart";
+					atmel,use-dma-rx;
+					atmel,use-dma-tx;
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
+				i2c8: i2c@600 {
+					compatible = "microchip,sam9x60-i2c";
+					reg = <0x600 0x200>;
+					interrupts = <11 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 11>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(16))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(17))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
 			};
 
 			flx0: flexcom@f801c000 {
@@ -469,6 +722,46 @@ flx0: flexcom@f801c000 {
 				ranges = <0x0 0xf801c000 0x800>;
 				status = "disabled";
 
+				uart0: serial@200 {
+					compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+					reg = <0x200 0x200>;
+					interrupts = <5 IRQ_TYPE_LEVEL_HIGH 7>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(0))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(1))>;
+					dma-names = "tx", "rx";
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 5>;
+					clock-names = "usart";
+					atmel,use-dma-rx;
+					atmel,use-dma-tx;
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
+				spi0: spi@400 {
+					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
+					reg = <0x400 0x200>;
+					interrupts = <5 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 5>;
+					clock-names = "spi_clk";
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(0))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(1))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
 				i2c0: i2c@600 {
 					compatible = "microchip,sam9x60-i2c";
 					reg = <0x600 0x200>;
@@ -496,6 +789,64 @@ flx1: flexcom@f8020000 {
 				#size-cells = <1>;
 				ranges = <0x0 0xf8020000 0x800>;
 				status = "disabled";
+
+				uart1: serial@200 {
+					compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+					reg = <0x200 0x200>;
+					interrupts = <6 IRQ_TYPE_LEVEL_HIGH 7>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(2))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(3))>;
+					dma-names = "tx", "rx";
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 6>;
+					clock-names = "usart";
+					atmel,use-dma-rx;
+					atmel,use-dma-tx;
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
+				spi1: spi@400 {
+					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
+					reg = <0x400 0x200>;
+					interrupts = <6 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 6>;
+					clock-names = "spi_clk";
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(2))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(3))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
+				i2c1: i2c@600 {
+					compatible = "microchip,sam9x60-i2c";
+					reg = <0x600 0x200>;
+					interrupts = <6 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 6>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(2))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(3))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
 			};
 
 			flx2: flexcom@f8024000 {
@@ -506,6 +857,64 @@ flx2: flexcom@f8024000 {
 				#size-cells = <1>;
 				ranges = <0x0 0xf8024000 0x800>;
 				status = "disabled";
+
+				uart2: serial@200 {
+					compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+					reg = <0x200 0x200>;
+					interrupts = <7 IRQ_TYPE_LEVEL_HIGH 7>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(4))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(5))>;
+					dma-names = "tx", "rx";
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 7>;
+					clock-names = "usart";
+					atmel,use-dma-rx;
+					atmel,use-dma-tx;
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
+				spi2: spi@400 {
+					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
+					reg = <0x400 0x200>;
+					interrupts = <7 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 7>;
+					clock-names = "spi_clk";
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(4))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(5))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
+				i2c2: i2c@600 {
+					compatible = "microchip,sam9x60-i2c";
+					reg = <0x600 0x200>;
+					interrupts = <7 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 7>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(4))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(5))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
 			};
 
 			flx3: flexcom@f8028000 {
@@ -516,6 +925,64 @@ flx3: flexcom@f8028000 {
 				#size-cells = <1>;
 				ranges = <0x0 0xf8028000 0x800>;
 				status = "disabled";
+
+				uart3: serial@200 {
+					compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+					reg = <0x200 0x200>;
+					interrupts = <8 IRQ_TYPE_LEVEL_HIGH 7>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(6))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(7))>;
+					dma-names = "tx", "rx";
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 8>;
+					clock-names = "usart";
+					atmel,use-dma-rx;
+					atmel,use-dma-tx;
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
+				spi3: spi@400 {
+					compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
+					reg = <0x400 0x200>;
+					interrupts = <8 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 8>;
+					clock-names = "spi_clk";
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(6))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(7))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
+				i2c3: i2c@600 {
+					compatible = "microchip,sam9x60-i2c";
+					reg = <0x600 0x200>;
+					interrupts = <8 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 8>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(6))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(7))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
 			};
 
 			macb0: ethernet@f802c000 {
@@ -581,6 +1048,45 @@ flx9: flexcom@f8040000 {
 				#size-cells = <1>;
 				ranges = <0x0 0xf8040000 0x800>;
 				status = "disabled";
+
+				uart9: serial@200 {
+					compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+					reg = <0x200 0x200>;
+					interrupts = <15 IRQ_TYPE_LEVEL_HIGH 7>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(18))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(19))>;
+					dma-names = "tx", "rx";
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 15>;
+					clock-names = "usart";
+					atmel,use-dma-rx;
+					atmel,use-dma-tx;
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
+				i2c9: i2c@600 {
+					compatible = "microchip,sam9x60-i2c";
+					reg = <0x600 0x200>;
+					interrupts = <15 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 15>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(18))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(19))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
 			};
 
 			flx10: flexcom@f8044000 {
@@ -591,6 +1097,45 @@ flx10: flexcom@f8044000 {
 				#size-cells = <1>;
 				ranges = <0x0 0xf8044000 0x800>;
 				status = "disabled";
+
+				uart10: serial@200 {
+					compatible = "microchip,sam9x60-usart", "atmel,at91sam9260-usart";
+					reg = <0x200 0x200>;
+					interrupts = <16 IRQ_TYPE_LEVEL_HIGH 7>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(20))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(21))>;
+					dma-names = "tx", "rx";
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 16>;
+					clock-names = "usart";
+					atmel,use-dma-rx;
+					atmel,use-dma-tx;
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
+
+				i2c10: i2c@600 {
+					compatible = "microchip,sam9x60-i2c";
+					reg = <0x600 0x200>;
+					interrupts = <16 IRQ_TYPE_LEVEL_HIGH 7>;
+					clocks = <&pmc PMC_TYPE_PERIPHERAL 16>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(20))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(21))>;
+					dma-names = "tx", "rx";
+					atmel,fifo-size = <16>;
+					status = "disabled";
+				};
 			};
 
 			isi: isi@f8048000 {
-- 
2.25.1

