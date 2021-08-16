Return-Path: <SRS0=yFtV=NH=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E3EC4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 06:46:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 246A861A54; Mon, 16 Aug 2021 06:46:25 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB3B961A53;
	Mon, 16 Aug 2021 06:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB3B961A53
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1629096384; x=1660632384;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Fa+HDUhrzM19UbPMgeqxqr6FMdoF3kvbbnJcNb1KEuo=;
  b=fOqyn+ElIgD2C5FcHFMG7VJ6+iqwuXlz0AsAjIQyd0RiIIyE2Kt1HWCC
   hmINJTKBJPVU/XbRcrXiY1AwCA7iPcc8cN27lyd+VKbiSnN4/LNXpfNwd
   wKKzgkGLsNOms8/5g5wgWKb8eZdoySPY1zCHT1isUY332tuMZzHb993tZ
   tDujw3dZJ4AvhqduVn+5/+5A3Ikz8Z0Ixfh+I+mjJrDir/14Cu4xGDa3d
   Xya80IUbg6OFzhIrIIf1fKc6B/BU3lYGcvoQFAlJj4giWSJyCfqN4WB5S
   G06CVrZ2yJWgM30xIixA8Fg/gGnNj+uvs2mi9MbiQj67ou6KIs6cWPWWe
   g==;
IronPort-SDR: RZG8+ZbFhaZfug3g9E+DwfbwypFrDJ3MQmF26e4kMUHT+dUzqmdZWyt1UlGJ8pDrU85WlibnCm
 Cs6cdGP9aH70WuvBQPz36drcfwHoTdGyeQtPUJ2At6yCANp4Bu94Vl25VJbbcn8d7epLaWpYP0
 2gECqFc91nvZqSleK6Ia97o1A0n4h6PChKqIBlZfdHSySIud07Bks797CbJxXzB69EwDy8FTjl
 mQHJmdf3u09j884D+xifrI2f/JEY95XQeAcCckhk3YN4MNneAS1fZYtD7yOuQLAuAG/uvq+BBT
 2O0rNERXRUCO77Rks1eXXhMj
X-IronPort-AV: E=Sophos;i="5.84,324,1620716400"; 
   d="scan'208";a="128382240"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2021 23:46:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sun, 15 Aug 2021 23:46:23 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sun, 15 Aug 2021 23:46:19 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<ludovic.desroches@microchip.com>, <robh+dt@kernel.org>, <arnd@arndb.de>,
	<olof@lixom.net>, <soc@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 0/7] ARM: dts: at91: add Exegin Q5xR5 and CalAmp LMU5000
Date: Mon, 16 Aug 2021 09:44:09 +0300
Message-ID: <20210816064416.1630674-1-claudiu.beznea@microchip.com>
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

Changes in v2:
- swapped commit message and diff b/w patches
  "dt-bindings: ARM: at91: document exegin q5xr5 board" and
  "dt-bindings: ARM: at91: document CalAmp LMU5000 board"
- re-ordered patches to accommodate the above swapping
- collected tags

Adam Porter (1):
  ARM: dts: at91: add CalAmp LMU5000 board

Claudiu Beznea (5):
  ARM: dts: at91: at91sam9260: add pinctrl label
  dt-bindings: add vendor prefix for calamp
  dt-bindings: ARM: at91: document CalAmp LMU5000 board
  dt-bindings: add vendor prefix for exegin
  dt-bindings: ARM: at91: document exegin q5xr5 board

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

