Return-Path: <SRS0=ZUzB=ZK=microchip.com=Hari.PrasathGE@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CD2ECAAD3
	for <soc@archiver.kernel.org>; Wed,  7 Sep 2022 09:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D661C433D6; Wed,  7 Sep 2022 09:21:37 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2BF8C433B5
	for <soc@kernel.org>; Wed,  7 Sep 2022 09:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2BF8C433B5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662542496; x=1694078496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=JMofcc0/3WtiNBW5HbbI91nM/6aF8hmAmb4q7yBUGxc=;
  b=TNfJYqeoeVWqw5J7a/nwmDPsHgaPf26dPmo5U89W8Nf34i+Gdi05+Ps7
   JsckV2mtqlGTzL2JiYv3HcAAX/u7BOJDVFCYy9Sjr7J0z9ydAIpCnnz91
   8mbwDkUut9vX0wBJ8EmaQNm5NLR5ySTwzgd6sycJ4ffeV5J9UcWz+W3vq
   0g5yieQ150dvMI3NZfeZEzbUQI9ZTe1YdaTZEaAQrQ/iEEsVuYRoIpu0C
   Btde+u8Zfzj4W3/QZSG2Gvx1OwBBzD+4NHRVmtcmkhwElrklOgHLKtKrn
   Xblk5C+DmFfU1gGzkE8T+5vjwkdVNjB0yWqPwdywA6vtUTXx9ANZQxW7f
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="172732977"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 02:21:35 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 02:21:32 -0700
Received: from che-lt-i63539lx.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Wed, 7 Sep 2022 02:21:26 -0700
From: Hari Prasath <Hari.PrasathGE@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <claudiu.beznea@microchip.com>,
	<davem@davemloft.net>, <krzysztof.kozlowski+dt@linaro.org>,
	<alexandre.belloni@bootlin.com>, <arnd@arndb.de>, <olof@lixom.net>,
	<soc@kernel.org>, <manikandan.m@microchip.com>, <michael@walle.cc>,
	<horatiu.vultur@microchip.com>, <kavyasree.kotagiri@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <durai.manickamkr@microchip.com>
CC: <Hari.PrasathGE@microchip.com>
Subject: [linux][PATCH 4/6] ARM: dts: at91: sam9x60: Add DMA bindigs for the flexcom nodes
Date: Wed, 7 Sep 2022 14:50:52 +0530
Message-ID: <20220907092054.29915-5-Hari.PrasathGE@microchip.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220907092054.29915-1-Hari.PrasathGE@microchip.com>
References: <20220907092054.29915-1-Hari.PrasathGE@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain

Add dma bindings for flexcom nodes in the soc dtsi file. Users those who
don't wish to use the DMA function for their flexcom functions can
overwrite the dma bindings in the board device tree file.

Signed-off-by: Manikandan M <manikandan.m@microchip.com>
Signed-off-by: Hari Prasath <Hari.PrasathGE@microchip.com>
---
 arch/arm/boot/dts/at91-sam9x60ek.dts |  3 +++
 arch/arm/boot/dts/sam9x60.dtsi       | 27 +++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/at91-sam9x60ek.dts b/arch/arm/boot/dts/at91-sam9x60ek.dts
index 9d9e50c77794..9ad528e1bdd2 100644
--- a/arch/arm/boot/dts/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/at91-sam9x60ek.dts
@@ -213,6 +213,7 @@
 	i2c0: i2c@600 {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		dmas = <0>, <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_flx0_default>;
 		i2c-analog-filter;
@@ -234,6 +235,7 @@
 	status = "disabled";
 
 	spi4: spi@400 {
+		dmas = <0>, <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_flx4_default>;
 		status = "disabled";
@@ -258,6 +260,7 @@
 	i2c6: i2c@600 {
 		#address-cells = <1>;
 		#size-cells = <0>;
+		dmas = <0>, <0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_flx6_default>;
 		i2c-analog-filter;
diff --git a/arch/arm/boot/dts/sam9x60.dtsi b/arch/arm/boot/dts/sam9x60.dtsi
index 224b406c8384..feeabc53e0ec 100644
--- a/arch/arm/boot/dts/sam9x60.dtsi
+++ b/arch/arm/boot/dts/sam9x60.dtsi
@@ -176,6 +176,15 @@
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
@@ -415,6 +424,15 @@
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
@@ -454,6 +472,15 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
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
2.17.1

