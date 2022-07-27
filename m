Return-Path: <SRS0=DB73=YA=microchip.com=Claudiu.Beznea@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEBDC04A68
	for <soc@archiver.kernel.org>; Wed, 27 Jul 2022 07:55:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45581C433C1; Wed, 27 Jul 2022 07:55:27 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ABE12C433D7;
	Wed, 27 Jul 2022 07:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ABE12C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658908525; x=1690444525;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OEw1QDJ4eZDDGDSQH3ABovGcqjHVrEUdZxsZUUQ2DBA=;
  b=TvtatztiESy/xf7AishPEuwJgBhTcjPVShXZ1u0pOQ1bmGSfyWOTsSn/
   FSFh2Ja8APj2RkQEL2wee4vJ2BU0kvVeGSzuyACZz21OIy3vYoCA8j0fG
   4oScC/BPu8TpFf4UTFKafKWzs/jHf17GBb3DDI98wqOkJAiovcW/CBTJr
   5A2IZZv1zEdPWUAAF35Cu+jMbVzdLCU6lXxOAgyT/0ceZzZxj72sVWn4u
   c0cdCa1lPQteuH4LlA5IZvuIra9WfUQnIUwanA4s2l9LzcjKZ1uurcAIA
   artwQyulm0q9zUFGK3mAJVH6QRIeKi0aV1hGHDzJbtVqDqEWl4YkGepsC
   A==;
X-IronPort-AV: E=Sophos;i="5.93,195,1654585200"; 
   d="scan'208";a="169701627"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Jul 2022 00:55:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 27 Jul 2022 00:55:24 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.28 via Frontend Transport; Wed, 27 Jul 2022 00:55:22 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <olof@lixom.net>, <arm@kernel.org>, <soc@kernel.org>
CC: <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] T91 device tree updates for v5.20 #4
Date: Wed, 27 Jul 2022 10:57:49 +0300
Message-ID: <20220727075749.2445000-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi, Arnd,

There were few updates posted lately. If its not too late, please pull.

Thank you,
Claudiu Beznea

The following changes since commit d3e71a2eae1f43fd318922694b843d34b4920b07:

  ARM: dts: lan966x: Enable network driver on pcb8291 (2022-07-22 17:54:09 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.20-4

for you to fetch changes up to e48ef9a9c52972d14c788d59024dcc7f566ed2c9:

  dt-bindings: soc: microchip: use absolute path to other schema (2022-07-27 09:50:11 +0300)

----------------------------------------------------------------
AT91 DT for v5.20 #4

It contains one new LAN966 based board, namely pcb8309, a cleanup
on Makefile to sort alphabetically LAN966 entries and 2 cleanups
on bindings.

----------------------------------------------------------------
Claudiu Beznea (1):
      ARM: dts: lan966x: keep lan966 entries alphabetically sorted

Horatiu Vultur (2):
      dt-bindings: arm: at91: add lan966 pcb8309 board
      ARM: dts: lan966x: add support for pcb8309

Krzysztof Kozlowski (2):
      dt-bindings: soc: microchip: drop quotes when not needed
      dt-bindings: soc: microchip: use absolute path to other schema

 .../devicetree/bindings/arm/atmel-at91.yaml        |   6 +-
 .../soc/microchip/atmel,at91rm9200-tcb.yaml        |   6 +-
 .../microchip/microchip,mpfs-sys-controller.yaml   |   4 +-
 arch/arm/boot/dts/Makefile                         |   5 +-
 arch/arm/boot/dts/lan966x-pcb8309.dts              | 184 +++++++++++++++++++++
 5 files changed, 196 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm/boot/dts/lan966x-pcb8309.dts
