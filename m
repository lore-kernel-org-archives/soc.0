Return-Path: <SRS0=ZUzB=ZK=microchip.com=Hari.PrasathGE@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B121ECAAD3
	for <soc@archiver.kernel.org>; Wed,  7 Sep 2022 09:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2EC44C433B5; Wed,  7 Sep 2022 09:21:11 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 22970C433C1
	for <soc@kernel.org>; Wed,  7 Sep 2022 09:21:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 22970C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662542466; x=1694078466;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=R6uswTVjlmBlaPkaiULFtZiRx5hWhYCfyzgtpFUZqfI=;
  b=dnVlGJMii5EqV4W8B5RUnzYbFDQSjU02JOlS1uVXL9Oi/a9/VOAIvxVG
   4ujslwd1AaA+8kmJSHpRSOg6u6gcORAv4q7OZ5hHfjvuGoI2Y2kchNh1u
   K2x4BwhGXNCw5Tk+n+r3Irw8Bwd01Fyu61v9ObeG7WqGdADXY0zRtCQSx
   YX5y/RL/S2kvDUMSM/q6FGfmFA4DeNlam5lOCMdj8Ud5rc5MYHm0lpvN9
   GnuUBjZSjG96CiWi2/eymvrVuPORtrx8MbS/9t5Fu/W67jilCLz4Fnopq
   /vX4aBIo8GIDKkeFRhvJdFXRtdePOxmWcIV2zSTXMHyMDF2ZxOWvee44+
   w==;
X-IronPort-AV: E=Sophos;i="5.93,296,1654585200"; 
   d="scan'208";a="179494515"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Sep 2022 02:21:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 7 Sep 2022 02:21:03 -0700
Received: from che-lt-i63539lx.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Wed, 7 Sep 2022 02:20:57 -0700
From: Hari Prasath <Hari.PrasathGE@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <nicolas.ferre@microchip.com>, <claudiu.beznea@microchip.com>,
	<davem@davemloft.net>, <krzysztof.kozlowski+dt@linaro.org>,
	<alexandre.belloni@bootlin.com>, <arnd@arndb.de>, <olof@lixom.net>,
	<soc@kernel.org>, <manikandan.m@microchip.com>, <michael@walle.cc>,
	<horatiu.vultur@microchip.com>, <kavyasree.kotagiri@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <durai.manickamkr@microchip.com>
CC: <Hari.PrasathGE@microchip.com>
Subject: [linux][PATCH 0/6] Add support for sam9x60 curiosity board
Date: Wed, 7 Sep 2022 14:50:48 +0530
Message-ID: <20220907092054.29915-1-Hari.PrasathGE@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

This patch series addresses the following:
	- Moving of flexcom definitions from board file to SoC file plus
	  some minor changes to its properties.
	- Add support for the new sam9x60 curiosity board based on the
	  existing sam9x60 SoC.

Durai Manickam KR (1):
  ARM: dts: at91: sam9x60: Add missing flexcom definitions

Hari Prasath (2):
  ARM: dts: at91: sam9x60: Move flexcom definitions to the SoC dtsi
  ARM: dts: at91: sam9x60: Add DMA bindigs for the flexcom nodes

Manikandan M (3):
  ARM: dts: at91: sam9x60: Fix the label numbering for the flexcom
    functions
  ARM: dts: at91: sam9x60: Specify the FIFO size for the Flexcom UART
  ARM: dts: at91: sam9x60_curiosity: Add device tree for
    sam9x60_curiosity board

 .../devicetree/bindings/arm/atmel-at91.yaml   |   6 +
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/at91-sam9x60_curiosity.dts  | 532 +++++++++++++++
 arch/arm/boot/dts/at91-sam9x60ek.dts          |  49 +-
 arch/arm/boot/dts/sam9x60.dtsi                | 623 ++++++++++++++++++
 5 files changed, 1172 insertions(+), 39 deletions(-)
 create mode 100644 arch/arm/boot/dts/at91-sam9x60_curiosity.dts

-- 
2.17.1

