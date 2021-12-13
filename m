Return-Path: <SRS0=pF1p=Q6=microchip.com=Nicolas.Ferre@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F15C433F5
	for <soc@archiver.kernel.org>; Mon, 13 Dec 2021 16:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4D896C34602; Mon, 13 Dec 2021 16:15:06 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AFFAC34603;
	Mon, 13 Dec 2021 16:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5AFFAC34603
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1639412106; x=1670948106;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Aj1jLscTd8hqfDx51zkQXy34te0g7lf175kTteg7blc=;
  b=zECZmjvZT9gvw3j6SU1Hswep7UIvnGNwnDiFavTzKUjlltt7d+A2OCxG
   navz3T/u+oorKY9HfPaFomGjSfcAukZMrGzTBCr1JLeubtFofmdeptAY5
   KCP4aiXRoJWxnpU734pACC5GnWrq9Qkd2ex2o2RIdam71Q5R6bMnzCaXO
   Q9IY0jIbRrQA6uieqwlxht24MlyS2xDS4aZjXtTjara+HXPHybwsnGB7m
   ImQVfMJ0PAFWycKEElMmaT1ez3ZD2j6/JiSBt1MnsVWXxoR6KfBKGSgdp
   wiq0QPIWcVCwyz1XM4OcxEXrbHaWhhv5zQu9qnnMA+XZJDdsIiw8NVbM7
   w==;
IronPort-SDR: 0LCS69UiOgr0BMxl1dXM1FA+3fj2H0o5gNufGfQR+iwt0AGMiZ+EOFSaxtaY9rWN4QZpGx5OPh
 PkN7jGXryz1DFJRFQMB8baijW408PH8Gv+Rl7NZBZhFn17npCj4VvVHOgJtXmuDTXQEeOyozeL
 MxHoq27AZmHbgsibxwWgAw050SDDDEBF7cqaUtCd9qZmsXY/boAaEg8+R4Y4Y11n2qa27MYb6M
 DFY+BlPnZJrD2+R9WkSEZ9QRDw4y3WjO+nPgUl/otCwnmE5i+bzilhpRjG+oU9sBNTiye6l+GL
 eWhPjvotAVHGIGewBdFdw3Cr
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="146488750"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Dec 2021 09:15:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 13 Dec 2021 09:15:03 -0700
Received: from ness.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Mon, 13 Dec 2021 09:15:01 -0700
From: <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	<arm@kernel.org>, <soc@kernel.org>
CC: Nicolas Ferre <nicolas.ferre@microchip.com>, Linux Kernel list
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Ludovic Desroches
	<ludovic.desroches@microchip.com>, Claudiu Beznea
	<claudiu.beznea@microchip.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Hari Prasath <Hari.PrasathGE@microchip.com>
Subject: [GIT PULL] ARM: at91: dt for 5.17
Date: Mon, 13 Dec 2021 17:14:51 +0100
Message-ID: <20211213161451.90786-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Organization: microchip
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nicolas Ferre <nicolas.ferre@microchip.com>

Arnd, Olof,

Here are the dt changes for 5.17.
The QSPI nodes have their bindings translated to YAML and updated here:
https://lore.kernel.org/lkml/20211209122939.339810-1-tudor.ambarus@microchip.com/
They are not merged yet but I see no major push back as of today.
Moreover, one of the low priority fix below remove one of the error highlighted
during the conversion to YAML.

Thanks, best regards,
  Nicolas

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-5.17

for you to fetch changes up to 078c2a0e8e60bb3fe78cf50b5da1620a4e13e0cd:

  ARM: dts: at91: sama7g5ek: Add QSPI0 node (2021-12-13 14:48:04 +0100)

----------------------------------------------------------------
AT91 DT #1 for 5.17:

- 2 low priority fixes about pin function for sama7g5 and better
  tailored mmc interface on sama5d2 xplained
- Addition of the Microchip EVB-KSZ9477: a Gigabit Ethernet
  managed Switch Evaluation Board
- QSPI: addition of sama5d2 clock name and nodes for new sama7g7 and its
  associated Evaluation Kit

----------------------------------------------------------------
Hari Prasath (1):
      ARM: dts: at91: update alternate function of signal PD20

Mihai Sain (1):
      ARM: dts: at91: sama5d2_xplained: remove PA11__SDMMC0_VDDSEL from pinctrl

Oleksij Rempel (1):
      ARM: dts: at91: add Microchip EVB-KSZ9477 board

Tudor Ambarus (3):
      ARM: dts: at91: sama5d2: Name the qspi clock
      ARM: dts: at91: sama7g5: Add QSPI nodes
      ARM: dts: at91: sama7g5ek: Add QSPI0 node

 arch/arm/boot/dts/Makefile                     |   1 +
 arch/arm/boot/dts/at91-sama5d2_xplained.dts    |   5 +-
 arch/arm/boot/dts/at91-sama5d3_ksz9477_evb.dts | 209 +++++++++++++++++++++++++
 arch/arm/boot/dts/at91-sama7g5ek.dts           |  73 +++++++++
 arch/arm/boot/dts/sama5d2.dtsi                 |   2 +
 arch/arm/boot/dts/sama7g5-pinfunc.h            |   2 +-
 arch/arm/boot/dts/sama7g5.dtsi                 |  30 ++++
 7 files changed, 318 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-sama5d3_ksz9477_evb.dts

-- 
Nicolas Ferre
