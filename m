Return-Path: <SRS0=rhIi=O7=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91FCC433EF
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 12:34:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8412F60F5B; Mon, 11 Oct 2021 12:34:56 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41B1160E9C;
	Mon, 11 Oct 2021 12:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 41B1160E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1633955696; x=1665491696;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=19Zf8gS8tbv3mJ7/Vg+/VX208ra+1ZI4GBOQZ9ZBMxs=;
  b=IaK6Beig8FNHqRU6nHlFXFjOBE4by+XKNdGELCcXN0FqoiSATo8cyLKM
   4pLZLV7AItJs3L3v5m///fErp1qVYzL+st/OFkvTS7N6Ue094m9qxhxit
   lOaFuwyvjpfe62Kz6A0ptNpZzyLeXY0ZumBoPTLqe4WsUZs3EpcUyShR+
   rSxQcJZlKsO7XYccCKctJT0Gyrj2F2XOlH+w2SAIp64RvsSi4nyKcn4Gf
   /bLHIgI2f6rMfk6p8u4u5QPPocB9IVEi/JUqClkvkO2R9EZpaqJupJ0yE
   0xW3mIVqoC5rt8uVdi5lcemFaym4CUAiVQBwT2QuguwgXK11oJPFAK3xT
   Q==;
IronPort-SDR: p0mg/WOOlihCpcH/XXXAjeE4kr0V8UQTuuovd36qIMe4cYtgq+6u//P5SzhD70610UngoWyGDe
 GvWW1p9D54eEC/EUbYLfwqsn3YFh61FoZnfcaMC6lmIzegP0mskEwfiHItKqHiPR7akh59T1d6
 lv87CWS2eTFH38R7RABV2/DVhxuES8kuzwYnFVDvE17Gd4jR3Mva2UkaB7cqQiLKuVUINWPwgZ
 etJbwU/hzjCPg2VqbtXhTMFHPUg8Z4Ht3zi/kx0Cy2jSc5A/bQEtQBKcKOCxm9b/JhrGRuEFAX
 a4/q4rzdd4JRCx99yj8t3aBK
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; 
   d="scan'208";a="139834233"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Oct 2021 05:34:55 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 11 Oct 2021 05:34:54 -0700
Received: from ness.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 11 Oct 2021 05:34:52 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>
Subject: [GIT PULL] ARM: at91: dt for 5.16
Date: Mon, 11 Oct 2021 14:34:38 +0200
Message-ID: <20211011123438.16562-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here is the first batch of dt changes for 5.16.

Thanks, best regards,
  Nicolas

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git at91-dt-5.16

for you to fetch changes up to 4c46b991bab640ee91f16967be2b0d00b7d5f992:

  ARM: at91: dts: sama5d29: Add dtsi file for sama5d29 (2021-09-21 12:37:07 +0200)

----------------------------------------------------------------
AT91 DT #1 for 5.16:

- Addition of a new variant in the sama5d2 family: the sama5d29 with
  significant updates being CAN and Ethernet controllers;
- Add support for Exegin Q5xR5 and CalAmp LMU5000 boards which were
  maintained up to this moment, separately, in OpenWrt tree;
- Two more boards gained I2C bus recovery support;
- Tse850 updated with one Ethernet fix;
- Sama7g5ek gained ADC nodes  and sama5d27_wlsom1 WiFi support.

----------------------------------------------------------------
Adam Porter (1):
      ARM: dts: at91: add CalAmp LMU5000 board

Claudiu Beznea (5):
      ARM: dts: at91: at91sam9260: add pinctrl label
      dt-bindings: add vendor prefix for calamp
      dt-bindings: ARM: at91: document CalAmp LMU5000 board
      dt-bindings: add vendor prefix for exegin
      dt-bindings: ARM: at91: document exegin q5xr5 board

Durai Manickam KR (2):
      ARM: dts: at91-sama5d27_som1_ek: Added I2C bus recovery support
      ARM: dts: at91-sama5d2_icp.dts: Added I2C bus recovery support

Eugen Hristev (3):
      ARM: dts: at91: sama5d27_wlsom1: add wifi device
      ARM: dts: at91: sama7g5: add node for the ADC
      ARM: dts: at91: sama7g5ek: enable ADC on the board

Hari Prasath (1):
      ARM: at91: dts: sama5d29: Add dtsi file for sama5d29

Owen Kirby (1):
      ARM: dts: at91: add Exegin Q5xR5 board

Peter Rosin (1):
      ARM: dts: at91: tse850: the emac<->phy interface is rmii

 .../devicetree/bindings/arm/atmel-at91.yaml        |  12 ++
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/at91-lmu5000.dts                 | 147 +++++++++++++++
 arch/arm/boot/dts/at91-q5xr5.dts                   | 199 +++++++++++++++++++++
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi          |  12 +-
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts        |  23 ++-
 arch/arm/boot/dts/at91-sama5d27_wlsom1.dtsi        |  70 ++++++++
 arch/arm/boot/dts/at91-sama5d2_icp.dts             |  22 ++-
 arch/arm/boot/dts/at91-sama7g5ek.dts               |   8 +
 arch/arm/boot/dts/at91-tse850-3.dts                |   2 +-
 arch/arm/boot/dts/at91sam9260.dtsi                 |   2 +-
 arch/arm/boot/dts/sama5d29.dtsi                    |  16 ++
 arch/arm/boot/dts/sama7g5.dtsi                     |  16 ++
 14 files changed, 528 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-lmu5000.dts
 create mode 100644 arch/arm/boot/dts/at91-q5xr5.dts
 create mode 100644 arch/arm/boot/dts/sama5d29.dtsi

-- 
Nicolas Ferre
