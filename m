Return-Path: <SRS0=QxmZ=57=microchip.com=Durai.ManickamKR@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C813CC636CC
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 03:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1C78C4339E; Fri,  3 Feb 2023 03:50:22 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16A27C433D2;
	Fri,  3 Feb 2023 03:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 16A27C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675396221; x=1706932221;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HGkZxVVil+7A8EeF9/dWV7fYzZt4AYdAKP3TOoimAm8=;
  b=R1j5KNiHF/A2EBS/kO3osUNzhqPiUunlS3ez4s+GerBY11UW5QS3UXlx
   PKTjXk/HEre5MUQxTHWDW3qMSDDVcoZNFERK/nOgbVFKQ+RjywJ6pA43s
   qRmYZZWE8b8cGdVdYnXNqU/c2Au7lA8tSE5BjdRtjeYuPL7VKj4VZw7K8
   Pj+l9EHSbynrFLuq/tiADmPo2sI31NHp40ejFqhs3jVQslJBZPIxswHO8
   1NOqDtTrwtUCmA1I+B5IE6bksjVryNNXXzpXNdLfbgefKX3+On8U+U5St
   YikWp4JOnNr83FTjcId2PlKC6eSnyNW98MeKuH8uhD9Rwk3ixXwqQ8SdO
   w==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669100400"; 
   d="scan'208";a="199411172"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Feb 2023 20:50:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 20:50:19 -0700
Received: from che-lt-i66125lx.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 20:50:10 -0700
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
Subject: [PATCH v5 5/8] ARM: dts: at91: sam9x60: Add DMA bindings for the flexcom nodes
Date: Fri, 3 Feb 2023 09:18:30 +0530
Message-ID: <20230203034833.451461-6-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230203034833.451461-1-durai.manickamkr@microchip.com>
References: <20230203034833.451461-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Manikandan Muralidharan <manikandan.m@microchip.com>

Add dma bindings for flexcom nodes in the soc dtsi file. Users those who
don't wish to use the DMA function for their flexcom functions can
overwrite the dma bindings in the board device tree file.

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
[durai.manickamkr@microchip.com: fixed code indentation and updated commit log]
Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 arch/arm/boot/dts/at91-sam9x60ek.dts |  3 +++
 arch/arm/boot/dts/sam9x60.dtsi       | 27 +++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sam9x60ek.dts b/arch/arm/boot/dts/at91-sam9x60ek.dts
index 6b6391d5041e..180e4b1aa2f6 100644
--- a/arch/arm/boot/dts/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/at91-sam9x60ek.dts
@@ -209,6 +209,7 @@ &flx0 {
 	i2c0: i2c@600 {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		dmas = <0>, <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_flx0_default>;
 		i2c-analog-filter;
@@ -230,6 +231,7 @@ &flx4 {
 	status = "disabled";
 
 	spi4: spi@400 {
+		dmas = <0>, <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_flx4_default>;
 		status = "disabled";
@@ -254,6 +256,7 @@ &flx6 {
 	i2c6: i2c@600 {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		dmas = <0>, <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_flx6_default>;
 		i2c-analog-filter;
diff --git a/arch/arm/boot/dts/sam9x60.dtsi b/arch/arm/boot/dts/sam9x60.dtsi
index 1e401a919f56..8442971458e4 100644
--- a/arch/arm/boot/dts/sam9x60.dtsi
+++ b/arch/arm/boot/dts/sam9x60.dtsi
@@ -177,6 +177,15 @@ spi4: spi@400 {
 					interrupts = <13 IRQ_TYPE_LEVEL_HIGH 7>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 13>;
 					clock-names = "spi_clk";
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(8))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(9))>;
+					dma-names = "tx", "rx";
 					atmel,fifo-size = <16>;
 					status = "disabled";
 				};
@@ -417,6 +426,15 @@ i2c6: i2c@600 {
 					reg = <0x600 0x200>;
 					interrupts = <9 IRQ_TYPE_LEVEL_HIGH 7>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 9>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(12))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(13))>;
+					dma-names = "tx", "rx";
 					atmel,fifo-size = <16>;
 					status = "disabled";
 				};
@@ -456,6 +474,15 @@ i2c0: i2c@600 {
 					reg = <0x600 0x200>;
 					interrupts = <5 IRQ_TYPE_LEVEL_HIGH 7>;
 					clocks = <&pmc PMC_TYPE_PERIPHERAL 5>;
+					dmas = <&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(0))>,
+						<&dma0
+						(AT91_XDMAC_DT_MEM_IF(0) |
+						 AT91_XDMAC_DT_PER_IF(1) |
+						 AT91_XDMAC_DT_PERID(1))>;
+					dma-names = "tx", "rx";
 					atmel,fifo-size = <16>;
 					status = "disabled";
 				};
-- 
2.25.1

