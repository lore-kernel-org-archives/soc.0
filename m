Return-Path: <SRS0=vcIM=6F=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F707C05027
	for <soc@archiver.kernel.org>; Thu,  9 Feb 2023 08:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7AF5C4339B; Thu,  9 Feb 2023 08:51:42 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2AA5AC433EF;
	Thu,  9 Feb 2023 08:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2AA5AC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675932700; x=1707468700;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YO6I4PaVzvyO5fEF8FDM7AzLj4w8NYCH9JHtGHtq0UU=;
  b=D9efp3gxhtTEzaB7nfuzBbFY4kWz1MkTSH9A3XhcbxxYP1pw22Lr7Baa
   2wQP+I4iWyPExw3qBoZ/ir7aERlI+Kv6tJ2hRu6mZN/7m4QPKQJyCsJRX
   jNIlg0344LiHONYgwxm0RlxYrUMDDuZJ94JE8eSEDKQWCjYpOulA2KPDN
   xWBxUg4VYo6JFuV6734l3knA8ftLDgq52keOeghl1TER4GBhhXCtym6JI
   GjHvVo0vWKbjSjXBOcILmKEiJCXLFwTcnxyBLY1K1RxTw738JQcXZvwT/
   Zb4TLdzk0ei9pIyrBwK1KPDQYzhATnHpqsas3MYp/zKQSp8ihjg8XWdUM
   g==;
X-IronPort-AV: E=Sophos;i="5.97,283,1669100400"; 
   d="scan'208";a="136304910"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Feb 2023 01:51:37 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 01:51:37 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Thu, 9 Feb 2023 01:51:35 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 device tree updates for 6.3 #2
Date: Thu, 9 Feb 2023 10:49:30 +0200
Message-ID: <20230209084930.289721-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi, Arnd,

Please pull in case it is not too late.

Thank you,
Claudiu

The following changes since commit bbc9db2da8716759f367ad5754036b58f5371044:

  ARM: dts: at91: sama7g5: add nodes for video capture (2023-01-09 14:02:08 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.3-2

for you to fetch changes up to 3048a4deee801c549259fe044f71a3fcd55591a8:

  ARM: dts: at91: sam9x60_curiosity: Add device tree for sam9x60 curiosity board (2023-02-08 12:02:07 +0200)

----------------------------------------------------------------
AT91 device tree updates for 6.3 #2

It contains:
- cleanups arround flexcom nodes on SAM9X60 SoC as follows:
	- preserve same ID for flexcoms and the embedded nodes (e.g. flx4
	  will embed uart4, spi4, i2c4 but not e.g. uart1, spi2, i2c3);
	- SoC specific bindings were moved from board specific file to SoC
	  specific file
	- DMA bindings for all flexcom nodes were added
	- SoC file was filled with missing flexcom nodes
- new SAM9X60 Curiosity board that contains 1 uSDcard interface, 1 SDcard
  interface, 1 USB device interface, 2 USB Type-A interfaces, 2 CAN
  interfaces, 1 10/100 Ethernet interface, 1 LCD RGB666 interface,
  1 Gb DDR2, 4 Gb NAND Flash, 2Kb EEPROM, leds, button, power
  regulators, UART and JTAG connectors

----------------------------------------------------------------
Durai Manickam KR (3):
      ARM: dts: at91: sam9x60: fix spi4 node
      dt-bindings: arm: at91: Add info on sam9x60 curiosity
      ARM: dts: at91: sam9x60_curiosity: Add device tree for sam9x60 curiosity board

Manikandan Muralidharan (5):
      ARM: dts: at91: sam9x60: Fix the label numbering for the flexcom functions
      ARM: dts: at91: sam9x60: move flexcom definitions
      ARM: dts: at91: sam9x60: Specify the FIFO size for the Flexcom UART
      ARM: dts: at91: sam9x60: Add DMA bindings for the flexcom nodes
      ARM: dts: at91: sam9x60: Add missing flexcom definitions

 .../devicetree/bindings/arm/atmel-at91.yaml        |   6 +-
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/at91-sam9x60_curiosity.dts       | 503 +++++++++++++++++
 arch/arm/boot/dts/at91-sam9x60ek.dts               |  50 +-
 arch/arm/boot/dts/sam9x60.dtsi                     | 622 +++++++++++++++++++++
 5 files changed, 1140 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-sam9x60_curiosity.dts
