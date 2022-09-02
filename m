Return-Path: <SRS0=b33T=ZF=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68741C54EE9
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 08:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F490C43470; Fri,  2 Sep 2022 08:56:35 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F7F7C433D7;
	Fri,  2 Sep 2022 08:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6F7F7C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662108993; x=1693644993;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Pg3WjXJAxkTowVVJmhAAbzrSkL/eQLHyA6yqIAoIaq4=;
  b=hwXqPCv8tWXJsddY5sSHoTKr/84yHohR43dTlSUBCdjRNnT/qHkKRIm7
   kbBDl2NsLRFNzF3lyXaUuDM4v7N7N17SXTehe4DmgiWMi966QqtvapnDW
   Ncdt8J8g0W21Jbz/o5iqQwIGNa4auOU38wN7Xt+xqyYfxXPgyNf7guLBS
   PZTCXfJ3McVq4REjqBjIr+ZkabzVFU8iKlUW9ReQuhh4Fa4QAjzYOzEcH
   Z8+KYBCVKApZOqUgEYM/vJxsD4Kn7CZTq+PEg+07/b1Eis8jcpmk5OCa0
   suywsOwzvpfOEs7/LZaLTWQ00lO2QBliimYyA/HpN8IAg2cs6JqfMU5ua
   w==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="111892811"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 01:56:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 01:56:25 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 2 Sep 2022 01:56:23 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] AT91 device tree updates for 6.1
Date: Fri, 2 Sep 2022 11:58:45 +0300
Message-ID: <20220902085845.4193579-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.1

for you to fetch changes up to 0b7baa1a307fcc66f66d7ca34244ee7a3899f92d:

  ARM: dts: lan966x: add led configuration (2022-09-02 10:55:00 +0300)

----------------------------------------------------------------
AT91 DT for v6.1

It contains:
- one new LAN966X based board, namely lan966x-pcb8290
- gpio leds support for lan966x-pcb8291 and lan966x-pcb8309
- a cleanup for sam9x60ek to avoid DT compilation warning due to regulators

----------------------------------------------------------------
Claudiu Beznea (1):
      ARM: dts: at91: sam9x60ek: remove simple-bus for regulators

Horatiu Vultur (2):
      ARM: dts: lan966x: add support for pcb8290
      ARM: dts: lan966x: add led configuration

 arch/arm/boot/dts/Makefile            |   1 +
 arch/arm/boot/dts/at91-sam9x60ek.dts  |  78 +++++++--------
 arch/arm/boot/dts/lan966x-pcb8290.dts | 175 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/lan966x-pcb8291.dts |  28 ++++++
 arch/arm/boot/dts/lan966x-pcb8309.dts |  28 ++++++
 5 files changed, 268 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm/boot/dts/lan966x-pcb8290.dts
