Return-Path: <SRS0=+JNq=ZT=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10E5ECAAD8
	for <soc@archiver.kernel.org>; Fri, 16 Sep 2022 10:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BEF22C433D7; Fri, 16 Sep 2022 10:51:53 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3F21C433C1;
	Fri, 16 Sep 2022 10:51:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B3F21C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663325513; x=1694861513;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Gill2Jxfv5RPobjr+S8sRrYdyedPa0QwnLd1Wvta0Ac=;
  b=XEYCQtXMIriFFto7B6uQ3qFZxxM93zZUw4ej9z9pmhpRj/YETBxBSZJV
   tdCvkyxqkzPYKuQ69jWxAGJzxAfsupFF2WaB/Mdx/nBZNWx/nV9YXKpd4
   iYQzC/rQq0eaRp9aa8XMd7f9/s6uR4NazstM8Jx1S5h6n5IIeSVuhtJPS
   wapg0lJeamV8Kza6d4IzivtJggVthVsgxMc81REbWO49YAd44SpdvDbrB
   YHhReGEx9IBY2HGulVoYlmdEWhMb//dlCzIqlu5KN4F//RLqrhp3wuLZ4
   KzBo2HonpOD0dOnvp7FJJHhALLON3tXQA3GwRw0lBzLAUMiU/GO9U2M1L
   w==;
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="174184396"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Sep 2022 03:51:50 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 16 Sep 2022 03:51:48 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 16 Sep 2022 03:51:46 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 device tree updates for v6.1 #2
Date: Fri, 16 Sep 2022 13:54:07 +0300
Message-ID: <20220916105407.1287452-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 0b7baa1a307fcc66f66d7ca34244ee7a3899f92d:

  ARM: dts: lan966x: add led configuration (2022-09-02 10:55:00 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.1-2

for you to fetch changes up to 0b2eafe1167e756935f293aa7212626d8f89952f:

  spi: dt-bindings: atmel,at91rm9200-spi: Add DMA related properties (2022-09-16 10:52:24 +0300)

----------------------------------------------------------------
AT91 DT for v6.1 #2

It contains:
- new SAMA5D3 based board, namely SAMA5D3-EDS
- adjustments to pass the DT binding validations
- disable AES on some LAN966 based boards as they are reserverd by
  secure OS

----------------------------------------------------------------
Horatiu Vultur (1):
      ARM: dts: lan966x: disable aes

Jerry Ray (2):
      dt-bindings: arm: at91: Add info on SAMA5D3-EDS
      dts: arm: at91: Add SAMA5D3-EDS Board

Sergiu Moga (4):
      ARM: dts: at91: sama7g5: Swap rx and tx for spi11
      ARM: dts: at91: sam9x60ek: Add DBGU compatibles to uart1
      ARM: dts: at91: Add `atmel,usart-mode` required property to serial nodes
      spi: dt-bindings: atmel,at91rm9200-spi: Add DMA related properties

 .../devicetree/bindings/arm/atmel-at91.yaml        |   7 +
 .../bindings/spi/atmel,at91rm9200-spi.yaml         |  10 +
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/at91-sam9x60ek.dts               |   3 +-
 arch/arm/boot/dts/at91-sama5d3_eds.dts             | 307 +++++++++++++++++++++
 arch/arm/boot/dts/at91rm9200.dtsi                  |   6 +
 arch/arm/boot/dts/at91sam9260.dtsi                 |   8 +
 arch/arm/boot/dts/at91sam9261.dtsi                 |   5 +
 arch/arm/boot/dts/at91sam9263.dtsi                 |   5 +
 arch/arm/boot/dts/at91sam9g45.dtsi                 |   6 +
 arch/arm/boot/dts/at91sam9n12.dtsi                 |   6 +
 arch/arm/boot/dts/at91sam9rl.dtsi                  |   6 +
 arch/arm/boot/dts/at91sam9x5.dtsi                  |   7 +
 arch/arm/boot/dts/at91sam9x5_usart3.dtsi           |   2 +
 arch/arm/boot/dts/lan966x-pcb8290.dts              |   4 +
 arch/arm/boot/dts/lan966x-pcb8291.dts              |   4 +
 arch/arm/boot/dts/lan966x-pcb8309.dts              |   4 +
 arch/arm/boot/dts/sam9x60.dtsi                     |   2 +
 arch/arm/boot/dts/sama5d2.dtsi                     |  11 +
 arch/arm/boot/dts/sama5d3.dtsi                     |   7 +
 arch/arm/boot/dts/sama5d3_uart.dtsi                |   3 +
 arch/arm/boot/dts/sama5d4.dtsi                     |   9 +
 arch/arm/boot/dts/sama7g5.dtsi                     |  11 +-
 23 files changed, 430 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-sama5d3_eds.dts
