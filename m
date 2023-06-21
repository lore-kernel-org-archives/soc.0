Return-Path: <SRS0=sKO5=CJ=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FC9EB64D7
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 09:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 895BBC433C8; Wed, 21 Jun 2023 09:39:08 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D5ED1C433C9;
	Wed, 21 Jun 2023 09:39:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D5ED1C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687340348; x=1718876348;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sMNuBOL7JFuUxXmzkCxcxwFYbUVZ7zD6QtJeFTRf+d8=;
  b=03ANReSk4OCJ2UZ991ez1Rk3ISATMgnZAnUXo0xMz4gf01qZ8SutZEJn
   4UeBaoTbabsw/dEv1kwxMlj4bH6V9ViXrbGzLjfFpfFCbOaR9HEo3m4EQ
   KjoEK5h6YB6TTvokzhxG0+sEEQQZcAdd+ekQwJafQdngmzWYIToRqDNBw
   EfvbN7wL1iAqbgG3bj3IBzjsqUFtjYRicExjgz8Vvu0Q30xudAQDq8b2O
   eX90EvdjasGZqVOQtHVDRJJzrDANPVTOMBkAPOpq2DNcrPHEKke6HtC6d
   EvouQEQasBWL9hto3zblo8+goa/jc/UnW4OmaMVC9wMG3WyyVn4u7w1Gs
   A==;
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="219676361"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jun 2023 02:39:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 21 Jun 2023 02:39:00 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 21 Jun 2023 02:38:57 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>
CC: <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 DT updates for 6.5 #2
Date: Wed, 21 Jun 2023 12:38:53 +0300
Message-ID: <20230621093853.1575312-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi, Arnd,

Please pull in case it is not too late.

Thank you,
Claudiu

The following changes since commit 4ceb0c70d0dae0f1327c4cfda3826b98a885f735:

  ARM: dts: at91: sama5d2: remove extra line (2023-05-24 12:15:29 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.5-2

for you to fetch changes up to 33c01ff3b1003aea11288f2bf7924ada5b5b8327:

  ARM: dts: lan966x: kontron-d10: add PHY interrupts (2023-06-21 10:22:40 +0300)

----------------------------------------------------------------
AT91 DT for 6.5 #2

It contains:
- generic names for shutdown controller nodes
- enablement of DT overlay support for some AT91 boards
- fix reset and SPI CS for lan966x-kontron-kswitch-d10-mmt based boards
- addition of PHY interrupts for lan966x-kontron-kswitch-d10-mmt-8g
  board

----------------------------------------------------------------
Claudiu Beznea (1):
      ARM: dts: at91: use generic name for shutdown controller

Cristian Birsan (1):
      ARM: dts: at91: Enable device-tree overlay support for AT91 boards

Michael Walle (3):
      ARM: dts: lan966x: kontron-d10: fix board reset
      ARM: dts: lan966x: kontron-d10: fix SPI CS
      ARM: dts: lan966x: kontron-d10: add PHY interrupts

 arch/arm/boot/dts/Makefile                         | 14 +++++++++++
 arch/arm/boot/dts/at91-qil_a9260.dts               |  2 +-
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts        |  2 +-
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts          |  2 +-
 arch/arm/boot/dts/at91-sama5d2_xplained.dts        |  2 +-
 arch/arm/boot/dts/at91sam9260.dtsi                 |  2 +-
 arch/arm/boot/dts/at91sam9260ek.dts                |  2 +-
 arch/arm/boot/dts/at91sam9261.dtsi                 |  2 +-
 arch/arm/boot/dts/at91sam9263.dtsi                 |  2 +-
 arch/arm/boot/dts/at91sam9g20ek_common.dtsi        |  2 +-
 arch/arm/boot/dts/at91sam9g45.dtsi                 |  2 +-
 arch/arm/boot/dts/at91sam9n12.dtsi                 |  2 +-
 arch/arm/boot/dts/at91sam9rl.dtsi                  |  2 +-
 arch/arm/boot/dts/at91sam9x5.dtsi                  |  2 +-
 .../dts/lan966x-kontron-kswitch-d10-mmt-8g.dts     |  2 ++
 .../boot/dts/lan966x-kontron-kswitch-d10-mmt.dtsi  | 29 +++++++++++++++++++++-
 arch/arm/boot/dts/sam9x60.dtsi                     |  2 +-
 arch/arm/boot/dts/sama5d2.dtsi                     |  2 +-
 arch/arm/boot/dts/sama5d3.dtsi                     |  2 +-
 arch/arm/boot/dts/sama5d4.dtsi                     |  2 +-
 arch/arm/boot/dts/sama7g5.dtsi                     |  2 +-
 arch/arm/boot/dts/usb_a9260.dts                    |  2 +-
 arch/arm/boot/dts/usb_a9263.dts                    |  2 +-
 23 files changed, 64 insertions(+), 21 deletions(-)
