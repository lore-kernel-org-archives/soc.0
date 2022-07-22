Return-Path: <SRS0=1moK=X3=microchip.com=Horatiu.Vultur@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F08C43334
	for <soc@archiver.kernel.org>; Fri, 22 Jul 2022 13:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB5FFC341C6; Fri, 22 Jul 2022 13:15:08 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D154C341CA;
	Fri, 22 Jul 2022 13:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D154C341CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658495708; x=1690031708;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MMtFLVJCVURsH50ncvaBwx10bJP26mdv9/GtQkv07yo=;
  b=yHy5VSCHAPsbxViPefXltTkPSKdZ7bh3TGufF+Ngt3c0TGJAz7FojOXL
   qT4EKIbQvgFbr+cjc9tygFE3BK0h7U/gs5Zki4B70TmC+cqblsNFzwb+y
   I4TVHu1COt6FsG8wyjCK6Vgfqpf6CTUPFv48NC8foqbuyBr1SL69aXuSW
   sy+4xrNlew1E7c8Vx/fbiKcmNZHc+wYowim+BuXhGndDB6Y+DLj3Edw7G
   H7ig8IP5ntgojum5aF/cZM1KpaGSW6Ul2OQtCAYBWj9JWOyW1UwrrLGG+
   edNiTDeSV37mxZfMWVUgDr8qnkpfeRpTtCtj7b8hNQ1sFr3VHdIZHIQ+u
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; 
   d="scan'208";a="165969827"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Jul 2022 06:15:04 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 22 Jul 2022 06:15:02 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.28 via Frontend Transport; Fri, 22 Jul 2022 06:14:59 -0700
From: Horatiu Vultur <horatiu.vultur@microchip.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@microchip.com>, <arnd@arndb.de>, <olof@lixom.net>,
	<soc@kernel.org>, <UNGLinuxDriver@microchip.com>,
	<maxime.chevallier@bootlin.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>
Subject: [PATCH v2 0/2] ARM: add support for pcb8309
Date: Fri, 22 Jul 2022 15:18:34 +0200
Message-ID: <20220722131836.2377720-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add pcb8309 and the documentation for it.
It features a LAN9662 SoC with 2 internal copper ports and two SFP cages.

v1->v2:
- remove unneeded properties from i2c102,i2c103,i2c4 nodes.
- set status property to be the last prorty of the nodes.
- fix typo in commit message.

Horatiu Vultur (2):
  dt-bindings: arm: at91: add lan966 pcb8309 board
  ARM: dts: lan966x: add support for pcb8309

 .../devicetree/bindings/arm/atmel-at91.yaml   |   6 +-
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/lan966x-pcb8309.dts         | 184 ++++++++++++++++++
 3 files changed, 190 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/lan966x-pcb8309.dts

-- 
2.33.0

