Return-Path: <SRS0=QxmZ=57=microchip.com=Durai.ManickamKR@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5B7C636CC
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 03:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C02D9C4339B; Fri,  3 Feb 2023 03:48:53 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C90CC433D2;
	Fri,  3 Feb 2023 03:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C90CC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675396131; x=1706932131;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=JFaiq8Uy7g2ekDEu+Kn7RVB3cY0kIP8tcC2f4cR4cOU=;
  b=PdzKLwBYb033U6eIUTfF7oaAisfufmccu7eS8fsWBx26uiH3g9jaibyv
   erySb8M+fr1l3JAsLn58eECGm+3F7yY/6vkrv743ckFZ6lbmojj/s2SaO
   DSevFEOTdbk+seIrCUDhNcJbgJJJgkS6qHC+pM87Ft37YM+mLBgoZ6uMq
   7TL0nU46ZnWxli0PUYHopnwGeihaa++OpPQwzeTJ8PRlSj5Uyiv3iN17J
   BsIbSnBI7fA1ZyPCWBRgfQJbPKlthM1JP6WMnsaLiG83gh2Aib68aYDlp
   ioq7IphqHIjRXvDW+MG4+iI589w6o8wJjIj7t0esbm275bkT/LN3qzETV
   w==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669100400"; 
   d="scan'208";a="199165002"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Feb 2023 20:48:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 2 Feb 2023 20:48:49 -0700
Received: from che-lt-i66125lx.amer.actel.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 2 Feb 2023 20:48:35 -0700
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
Subject: [PATCH v5 0/8] Add support for sam9x60 curiosity board
Date: Fri, 3 Feb 2023 09:18:25 +0530
Message-ID: <20230203034833.451461-1-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series of patches is meant to address the following:
- Moving of flexcom definitions from board file to SoC file and
   some minor changes to its properties.
- Add support for the new sam9x60 curiosity board based on the
   existing sam9x60 SoC.

Changes in v5:
--------------
All the patches are accepted except the below patches which are 
updated based on the comments receied on PATCH v4,
- [PATCH v4 2/8] Updated from field and first SOB as same author.
- [PATCH v4 2/8] Added the missing compatibles for the UART.
- [PATCH v4 8/8] Fixed the dtb warnings.

Changes in v4:
--------------
- Added the missed property atmel,usart-mode in uart5
- Renamed the led label.

Changes in v3:
--------------
- Updated commit logs mentioning each author's contribution.
- Author name is updated based on the linux mainline guidelines.
- updated the description file such that sam9x60 curiosity is
  added together with sam9x60ek as an enum.
- Updated the entries in the regulator container alphabetically
  sorted.
- Added label name and node name following the guidelines.

Changes in v2:
--------------
- Added generic names for regulator node.
- Removed the #addredd-cells and #size-cells property which shows
  compilation warning.
- Removed the property "status=okay" as this is default.
- No underscores used for the pinctrl definitions and node names.
- Organised the patches in the logical way.
- Bindings are made separate patch.

Durai Manickam KR (3):
  ARM: dts: at91: sam9x60: fix spi4 node
  dt-bindings: arm: at91: Add info on sam9x60 curiosity
  ARM: dts: at91: sam9x60_curiosity: Add device tree for sam9x60
    curiosity board

Manikandan Muralidharan (5):
  ARM: dts: at91: sam9x60: Fix the label numbering for the flexcom
    functions
  ARM: dts: at91: sam9x60: move flexcom definitions
  ARM: dts: at91: sam9x60: Specify the FIFO size for the Flexcom UART
  ARM: dts: at91: sam9x60: Add DMA bindings for the flexcom nodes
  ARM: dts: at91: sam9x60: Add missing flexcom definitions

 .../devicetree/bindings/arm/atmel-at91.yaml   |   6 +-
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/at91-sam9x60_curiosity.dts  | 501 ++++++++++++++
 arch/arm/boot/dts/at91-sam9x60ek.dts          |  50 +-
 arch/arm/boot/dts/sam9x60.dtsi                | 622 ++++++++++++++++++
 5 files changed, 1138 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-sam9x60_curiosity.dts

-- 
2.25.1

