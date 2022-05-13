Return-Path: <SRS0=ej+k=VV=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1B8C433EF
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 16:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02859C34115; Fri, 13 May 2022 16:23:57 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 005F8C34100;
	Fri, 13 May 2022 16:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 005F8C34100
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1652459036; x=1683995036;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lTvVHKhQrF/jC75hKWqlkRNNj2gcD0kUzpx0or4f8Mw=;
  b=ZEGHS/bit41guIKvUf9UpUF3/VVnh/PQBaVIE6Y0iZ+XPuKJCOZVw4Om
   4tDbihIEG/hL2fitELsrH0caS8dWwppPyzjC7Z7nLpdeSjqHQhF9hsT6x
   nqdvKrh6Tu6VTuBZtJxg+IOy4sCKQvqn6wRQJthPyNzccPU1s2ZMxAsmk
   sTA3pGekCn6qvXqPkGECPfr9NUAIghSRf3P0Sm/tBh0Pzxfj4lzU6ngNT
   /F5NdkQBojBE6mFa9IHDGeMkoMz5EXQqTs+amCG7q3WNN0MLyAF+1qCzZ
   +Mor/3z0ykSMIC+uDi+w1gVi8G80q+dQ7hk/NFkUNxA2iykke+3FnWleS
   w==;
X-IronPort-AV: E=Sophos;i="5.91,223,1647327600"; 
   d="scan'208";a="155977387"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 May 2022 09:23:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 13 May 2022 09:23:43 -0700
Received: from ROU-LT-M43238L.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Fri, 13 May 2022 09:23:40 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>
Subject: [GIT PULL] ARM: at91: dt for 5.19
Date: Fri, 13 May 2022 18:23:38 +0200
Message-ID: <20220513162338.87717-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here is the first batch of dt changes for 5.19.
Thanks to Claudiu for having collected this series of patches.
It's a bit late in the process but we might have another batch to prepare for
5.19: not a big deal if it's delayed, so tell me if it's closed for this cycle.

Please pull. Thanks, best regards,
  Nicolas

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.19

for you to fetch changes up to 46a9556d977e290a18890fb4cf07d19b0da16f31:

  ARM: dts: kswitch-d10: enable networking (2022-05-13 16:42:43 +0300)

----------------------------------------------------------------
AT91 & LAN966 DT #1 for 5.19:

- at91: DT compliance updates to gic and dataflash nodes
- lan966: addition to many basic nodes for various peripherals
- lan966: Kontron KSwitch D10: support for this new board
  and its network switch

----------------------------------------------------------------
Eugen Hristev (1):
      ARM: dts: at91: sama7g5: remove interrupt-parent from gic node

Krzysztof Kozlowski (1):
      ARM: dts: at91: use generic node name for dataflash

Michael Walle (14):
      ARM: dts: lan966x: rename pinctrl nodes
      ARM: dts: lan966x: swap dma channels for crypto node
      ARM: dts: lan966x: add sgpio node
      ARM: dts: lan966x: add missing uart DMA channel
      ARM: dts: lan966x: add all flexcom usart nodes
      ARM: dts: lan966x: add flexcom SPI nodes
      ARM: dts: lan966x: add flexcom I2C nodes
      ARM: dts: lan966x: add basic Kontron KSwitch D10 support
      ARM: dts: lan966x: add hwmon node
      ARM: dts: lan966x: add MIIM nodes
      ARM: dts: lan966x: add reset switch reset node
      ARM: dts: lan966x: add serdes node
      ARM: dts: lan966x: add switch node
      ARM: dts: kswitch-d10: enable networking

 .../devicetree/bindings/mfd/atmel-flexcom.txt      |   2 +-
 arch/arm/boot/dts/Makefile                         |   4 +-
 arch/arm/boot/dts/at91rm9200ek.dts                 |   4 +-
 arch/arm/boot/dts/at91sam9260ek.dts                |   2 +-
 arch/arm/boot/dts/at91sam9261ek.dts                |   2 +-
 arch/arm/boot/dts/at91sam9263ek.dts                |   2 +-
 arch/arm/boot/dts/at91sam9g20ek_common.dtsi        |   2 +-
 arch/arm/boot/dts/at91sam9m10g45ek.dts             |   2 +-
 arch/arm/boot/dts/at91sam9rlek.dts                 |   2 +-
 .../dts/lan966x-kontron-kswitch-d10-mmt-6g-2gs.dts |  94 ++++++
 .../dts/lan966x-kontron-kswitch-d10-mmt-8g.dts     |  39 +++
 .../boot/dts/lan966x-kontron-kswitch-d10-mmt.dtsi  | 190 +++++++++++
 arch/arm/boot/dts/lan966x-pcb8291.dts              |   2 +-
 arch/arm/boot/dts/lan966x.dtsi                     | 353 ++++++++++++++++++++-
 arch/arm/boot/dts/sama7g5.dtsi                     |   1 -
 arch/arm/boot/dts/usb_a9263.dts                    |   2 +-
 16 files changed, 687 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm/boot/dts/lan966x-kontron-kswitch-d10-mmt-6g-2gs.dts
 create mode 100644 arch/arm/boot/dts/lan966x-kontron-kswitch-d10-mmt-8g.dts
 create mode 100644 arch/arm/boot/dts/lan966x-kontron-kswitch-d10-mmt.dtsi

-- 
Nicolas Ferre
