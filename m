Return-Path: <SRS0=YB89=M4=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5201EC4338F
	for <soc@archiver.kernel.org>; Thu,  5 Aug 2021 15:56:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 34386610FE; Thu,  5 Aug 2021 15:56:12 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F12861004;
	Thu,  5 Aug 2021 15:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F12861004
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1628178971; x=1659714971;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=81T3ky8ph63ood5pQ7YHc+7hsAzYVUGV/KsU2nTP3y0=;
  b=gQb+9MYkNmNPOOEEXCXWPgxpwP7msYPpB6tKyTNEO0G4wExaA2pAcskC
   P9QvnOHvIIlDAJl2AuHGBvUis94hHvJk+Slc5ndbGu+YBUchs5duHYuQR
   Fga9j5ehp50PszOv2hmq434Lj42jRsiAeZGstKHMh10OvHX+ad26xFQv+
   fwJNt+DtvppfaLMOzeU/2b4sirqzu2LSzo7hCeoUAYAnvsJCYyQV2ZLvo
   oVJiROgrkHlLrc1TtqT6tg7GwRf6ss5+hGAz1B7cEpfhhU3+GZY7OWJk9
   JTY63eIaHjnliddnhmAiDopJdmgUMDeZpq5HHq18WiakaS+5RZtx5s27C
   w==;
IronPort-SDR: QpyF9jmWrkSPZ/OK/apAvqbwN7X0djrfrAh05jX/GF0Ghw8TGzwCGKcWgAEFE0ggetctzP8jYQ
 N0t7tUuJ+NzBvzQLL+fWsLJJbN/o8/HUy8ebxzrtbvmjOu0+g+I2Lgl2bcZvttYxw16tXYhd/V
 ElekBNKPYsR55ragKf9onJtyaqv6mk/pJPPFHsdVvY9e54rDqPbo0qHDsieO1HNvGe3gAooPIX
 avXQZ0Os4JG8+NnPbTHG1/GM5az0BpWDnLk93qZ9YwThwvFe8m0EcXQavj2xDlxp8CGzVeOr+w
 Hur4Eji3bJJBZwr/AdQ/vlRH
X-IronPort-AV: E=Sophos;i="5.84,296,1620716400"; 
   d="scan'208";a="64834627"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Aug 2021 08:56:05 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 5 Aug 2021 08:56:05 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 5 Aug 2021 08:56:01 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH 0/7] ARM: dts: at91: add Exegin Q5xR5 and CalAmp LMU5000
Date: Thu, 5 Aug 2021 18:53:50 +0300
Message-ID: <20210805155357.594414-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi,

This series adds support for Exegin Q5xR5 and CalAmp LMU5000 boards
which were maintained up to this moment, separatelly, in OpenWrt tree.
With these patches the support for these boards will be included in
upstream kernel and there will be no need to forward port the proper
patches in OpenWrt every time the OpenWrt kernel version is changed.

Thank you,
Claudiu Beznea

Adam Porter (1):
  ARM: dts: at91: add CalAmp LMU5000 board

Claudiu Beznea (5):
  ARM: dts: at91: at91sam9260: add pinctrl label
  dt-bindings: add vendor prefix for exegin
  dt-bindings: ARM: at91: document exegin q5xr5 board
  dt-bindings: add vendor prefix for calamp
  dt-bindings: ARM: at91: document CalAmp LMU5000 board

Owen Kirby (1):
  ARM: dts: at91: add Exegin Q5xR5 board

 .../devicetree/bindings/arm/atmel-at91.yaml   |  12 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/at91-lmu5000.dts            | 148 +++++++++++++
 arch/arm/boot/dts/at91-q5xr5.dts              | 200 ++++++++++++++++++
 arch/arm/boot/dts/at91sam9260.dtsi            |   2 +-
 6 files changed, 367 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/at91-lmu5000.dts
 create mode 100644 arch/arm/boot/dts/at91-q5xr5.dts

-- 
2.25.1

