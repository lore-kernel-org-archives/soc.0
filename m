Return-Path: <SRS0=PSrN=BT=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3668AC77B73
	for <soc@archiver.kernel.org>; Tue, 30 May 2023 10:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1CD91C433A1; Tue, 30 May 2023 10:59:55 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D036BC4339B;
	Tue, 30 May 2023 10:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D036BC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685444392; x=1716980392;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ksw5Edlpg87FiXk/t2nG6HmrX4rKPJ44kUdQ9dUlc7s=;
  b=J09XEqvVGe+jV+TtFTKHK197BV/9W0XwROs1fx6rkat5KpxzX5E4tXVp
   9XaTBpEqvXpY4l9P3/f9zbZzdiZ6zpkJo+6zHgDAuKQJFnGrD4gj72OWO
   oWmlUHephcK21vpcImcFeo1Jm/NFFZzJdmZZ0PcK+jqto7lyYwfhk977o
   A5Mhg3w4C+6M6slwQ6TPcsmMM3kBZgofYuieKYEH18fB2JyzyK9ahSa0e
   2rlT99e2BCOXmR+XbJD3o/ZRlb8vaHSsWDa+JhwiLxG9hWqsPP5W00zjq
   KqonXMp5U0zMbO74uHJ+DvoQkv61UI4k//K8AyE2bWN/W9ZIXvHBE5lPY
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,204,1681196400"; 
   d="scan'208";a="215418930"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 May 2023 03:59:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 30 May 2023 03:59:51 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Tue, 30 May 2023 03:59:49 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 DT updates for 6.5
Date: Tue, 30 May 2023 13:59:45 +0300
Message-ID: <20230530105945.11638-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.5

for you to fetch changes up to 4ceb0c70d0dae0f1327c4cfda3826b98a885f735:

  ARM: dts: at91: sama5d2: remove extra line (2023-05-24 12:15:29 +0300)

----------------------------------------------------------------
AT91 DT for 6.5

It contains:
- gpio-line-names addition for at91-tse850-3 board
- support for SMA connectors on lan966x-pcb8309 board
- use drive-open-drain as boolean property as this is how code handles
  it
- generic names for clock controller devices
- use of the new clock controller bindings for at91sam9n12 slow clock
  controller
- one blank line removal on sama5d2.dtsi

----------------------------------------------------------------
Claudiu Beznea (4):
      ARM: dts: at91: use clock-controller name for PMC nodes
      ARM: dts: at91: at91sam9n12: witch sckc to new clock bindings
      ARM: dts: at91: use clock-controller name for sckc nodes
      ARM: dts: at91: sama5d2: remove extra line

Horatiu Vultur (1):
      ARM: dts: lan966x: Add support for SMA connectors

Peter Rosin (1):
      ARM: dts: at91: tse850: add properties for gpio-line-names

Ryan Wanner (1):
      ARM: dts: at91: Return to boolean properties

 arch/arm/boot/dts/at91-kizbox3-hs.dts      |  2 +-
 arch/arm/boot/dts/at91-kizbox3_common.dtsi |  2 +-
 arch/arm/boot/dts/at91-tse850-3.dts        | 60 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/at91rm9200.dtsi          |  2 +-
 arch/arm/boot/dts/at91sam9260.dtsi         |  2 +-
 arch/arm/boot/dts/at91sam9261.dtsi         |  2 +-
 arch/arm/boot/dts/at91sam9263.dtsi         |  2 +-
 arch/arm/boot/dts/at91sam9g20.dtsi         |  2 +-
 arch/arm/boot/dts/at91sam9g25.dtsi         |  2 +-
 arch/arm/boot/dts/at91sam9g35.dtsi         |  2 +-
 arch/arm/boot/dts/at91sam9g45.dtsi         |  4 +-
 arch/arm/boot/dts/at91sam9n12.dtsi         | 25 ++-----------
 arch/arm/boot/dts/at91sam9rl.dtsi          |  4 +-
 arch/arm/boot/dts/at91sam9x25.dtsi         |  2 +-
 arch/arm/boot/dts/at91sam9x35.dtsi         |  2 +-
 arch/arm/boot/dts/at91sam9x5.dtsi          |  4 +-
 arch/arm/boot/dts/lan966x-pcb8309.dts      | 14 +++++++
 arch/arm/boot/dts/sam9x60.dtsi             |  4 +-
 arch/arm/boot/dts/sama5d2.dtsi             |  5 +--
 arch/arm/boot/dts/sama5d3.dtsi             |  4 +-
 arch/arm/boot/dts/sama5d3_emac.dtsi        |  2 +-
 arch/arm/boot/dts/sama5d4.dtsi             |  4 +-
 arch/arm/boot/dts/sama7g5.dtsi             |  2 +-
 23 files changed, 105 insertions(+), 49 deletions(-)
