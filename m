Return-Path: <SRS0=xBYX=5J=microchip.com=Durai.ManickamKR@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91540C54EBC
	for <soc@archiver.kernel.org>; Thu, 12 Jan 2023 11:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B3FEC433F1; Thu, 12 Jan 2023 11:02:24 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21E11C433D2;
	Thu, 12 Jan 2023 11:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 21E11C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673521342; x=1705057342;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YsL7sE396yrR5jfUPnxxTkKkI0gksABIVbLh3VwylF0=;
  b=LnJrxxEIOXKW8mEk23h5YGYmmOf4Y5cL5pl4ctf2GJD/hZauoeAlAsna
   hdHrChY6pHEbdwRv5ws8Ohp7NwBhEA4KSLpiVlbDmbzf0EQFTzqwuDSWG
   Svh4jr1a6dV5G4z4viI9PeTnkUwmoJkK898dXfPsV+dPvdo25ci0GmOW7
   G42/lY6eXZI0/97ocmXoOK27mdAn2rPcj9uqWoZo/C2HDkDf4e8t3qva8
   Kn0xJgQtsx7/+inULCv+Z63X3UaNIMqB9HyrG9ZaiJ+0hW4yTOnEM4546
   6JjyTNEOD7ZC09AaONbWuAacHig33FT4nhAQJICy5NRnmEO9KBDze3NZR
   A==;
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; 
   d="scan'208";a="196343931"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jan 2023 04:02:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 04:02:18 -0700
Received: from che-lt-i66125lx.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 04:02:10 -0700
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
Subject: [PATCH v4 0/8] Add support for sam9x60 curiosity board
Date: Thu, 12 Jan 2023 16:32:00 +0530
Message-ID: <20230112110208.97946-1-durai.manickamkr@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This series of patches is meant to address the following:
- Moving of flexcom definitions from board file to SoC file and
   some minor changes to its properties.
- Add support for the new sam9x60 curiosity board based on the
   existing sam9x60 SoC.

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

Durai Manickam KR (4):
  ARM: dts: at91: sam9x60: move flexcom definitions
  ARM: dts: at91: sam9x60: fix spi4 node
  dt-bindings: arm: at91: Add info on sam9x60 curiosity
  ARM: dts: at91: sam9x60_curiosity: Add device tree for sam9x60
    curiosity board

Manikandan Muralidharan (4):
  ARM: dts: at91: sam9x60: Fix the label numbering for the flexcom
    functions
  ARM: dts: at91: sam9x60: Specify the FIFO size for the Flexcom UART
  ARM: dts: at91: sam9x60: Add DMA bindings for the flexcom nodes
  ARM: dts: at91: sam9x60: Add missing flexcom definitions

 .../devicetree/bindings/arm/atmel-at91.yaml   |   6 +-
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/at91-sam9x60_curiosity.dts  | 499 ++++++++++++++
 arch/arm/boot/dts/at91-sam9x60ek.dts          |  50 +-
 arch/arm/boot/dts/sam9x60.dtsi                | 622 ++++++++++++++++++
 5 files changed, 1136 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-sam9x60_curiosity.dts

-- 
2.25.1

