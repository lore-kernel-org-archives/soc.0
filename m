Return-Path: <SRS0=xBYX=5J=microchip.com=Durai.ManickamKR@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DE4C54EBD
	for <soc@archiver.kernel.org>; Thu, 12 Jan 2023 11:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E107C433F0; Thu, 12 Jan 2023 11:02:50 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06C53C433EF;
	Thu, 12 Jan 2023 11:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06C53C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673521368; x=1705057368;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1AkioPAmaGGCya2gZ7629DIo0jjKlLKAh9uNoP/tX6M=;
  b=DtD4WmCzo8fg9WolrxIioqFwh0tcJLmTbOwBW2PT8eV9Vc2v5C5ri7Hx
   5xj+ZUjO80r6ONvrG5qzKtOOUL0KF6loE1D574VY3RYNC8AHjbya3Vpxk
   4YlN57vHDFc8uPh8MdWyfcJszEw2thNQKlGUbQltrtp+kUrac3J9GPXMk
   1CLNHKAL63SNehI6ugSyRvuKi+ctTMMhUYSg/eJ0cDBO3resOg2o1n/vI
   fQ2PjZt+kiKqaIqfM9yCw2DdCy7Qqa+OHawa0agcEFs1VA3t7SH0UcAs8
   O4jJz108omtdbE+Z0MW8vZSYj8rXuBBse3BYCUhZmjsQ1CXSgKW1bWk3R
   g==;
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="191903670"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jan 2023 04:02:46 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 04:02:45 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 04:02:37 -0700
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
Subject: [PATCH v4 1/8] ARM: dts: at91: sam9x60: Fix the label numbering for the flexcom functions
Date: Thu, 12 Jan 2023 16:32:01 +0530
Message-ID: <20230112110208.97946-2-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112110208.97946-1-durai.manickamkr@microchip.com>
References: <20230112110208.97946-1-durai.manickamkr@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Manikandan Muralidharan <manikandan.m@microchip.com>

Fixed the label numbering of the flexcom functions so that all
13 flexcom functions of sam9x60 are in the following order when the missing
flexcom functions are added:

flx0: uart0, spi0, i2c0
flx1: uart1, spi1, i2c1
flx2: uart2, spi2, i2c2
flx3: uart3, spi3, i2c3
flx4: uart4, spi4, i2c4
flx5: uart5, spi5, i2c5
flx6: uart6, i2c6
flx7: uart7, i2c7
flx8: uart8, i2c8
flx9: uart9, i2c9
flx10: uart10, i2c10
flx11: uart11, i2c11
flx12: uart12, i2c12

Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
---
 arch/arm/boot/dts/at91-sam9x60ek.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/at91-sam9x60ek.dts b/arch/arm/boot/dts/at91-sam9x60ek.dts
index d929c1ba5789..cf5d786531f2 100644
--- a/arch/arm/boot/dts/at91-sam9x60ek.dts
+++ b/arch/arm/boot/dts/at91-sam9x60ek.dts
@@ -16,8 +16,8 @@ / {
 
 	aliases {
 		i2c0 = &i2c0;
-		i2c1 = &i2c1;
-		serial1 = &uart1;
+		i2c1 = &i2c6;
+		serial1 = &uart5;
 	};
 
 	chosen {
@@ -234,7 +234,7 @@ &flx4 {
 	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_SPI>;
 	status = "disabled";
 
-	spi0: spi@400 {
+	spi4: spi@400 {
 		compatible = "microchip,sam9x60-spi", "atmel,at91rm9200-spi";
 		reg = <0x400 0x200>;
 		interrupts = <13 IRQ_TYPE_LEVEL_HIGH 7>;
@@ -253,7 +253,7 @@ &flx5 {
 	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
 	status = "okay";
 
-	uart1: serial@200 {
+	uart5: serial@200 {
 		compatible = "microchip,sam9x60-dbgu", "microchip,sam9x60-usart", "atmel,at91sam9260-dbgu", "atmel,at91sam9260-usart";
 		reg = <0x200 0x200>;
 		atmel,usart-mode = <AT91_USART_MODE_SERIAL>;
@@ -279,7 +279,7 @@ &flx6 {
 	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
 	status = "okay";
 
-	i2c1: i2c@600 {
+	i2c6: i2c@600 {
 		compatible = "microchip,sam9x60-i2c";
 		reg = <0x600 0x200>;
 		interrupts = <9 IRQ_TYPE_LEVEL_HIGH 7>;
@@ -439,7 +439,7 @@ AT91_PIOA 13 AT91_PERIPH_A AT91_PINCTRL_NONE
 				 AT91_PIOA 14 AT91_PERIPH_A AT91_PINCTRL_NONE>;
 		};
 
-		pinctrl_flx5_default: flx_uart {
+		pinctrl_flx5_default: flx5_uart {
 			atmel,pins =
 				<AT91_PIOA 7 AT91_PERIPH_C AT91_PINCTRL_NONE
 				 AT91_PIOA 8 AT91_PERIPH_B AT91_PINCTRL_NONE
-- 
2.25.1

