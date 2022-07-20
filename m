Return-Path: <SRS0=Jhuu=XZ=microchip.com=Horatiu.Vultur@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080F8C43334
	for <soc@archiver.kernel.org>; Wed, 20 Jul 2022 19:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9045C341CA; Wed, 20 Jul 2022 19:45:52 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 77F89C341C7;
	Wed, 20 Jul 2022 19:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 77F89C341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1658346352; x=1689882352;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wDZqMEBM/M5rGvDCUK9488p4euVbH3cPHh0S9+ycDDY=;
  b=rfJ2RRgvIWwRLsIsbPa/ztccrNIhkNDxM+yetxV3kksS0DXyfFakPHqz
   rM23MoGBdHodMHmk35UWW2CxMMaoCmpPQO2Dmdllzjt2rXtH0rst7WfbJ
   qV3tcR1Nk2VaFcG/kHgAalImuJHLxvOJkRB/h1l9glz44nQyQlSSMV0UR
   IOtoLdrfq1ddCZQFq+NTMVVS0Q+in8YVaUPVSeGLqRPFb9nZeWM/gE13H
   eztV03w3vZHLeVJX+ud9njSLzidXFCju5w1lt1nBp+3cjUEIyL31HgPGz
   tzsmm1Z76ElKPlsj3QKqXRi83gq276joH/a9Q2fQn7W6cg91YOnZm7XzZ
   w==;
X-IronPort-AV: E=Sophos;i="5.92,287,1650956400"; 
   d="scan'208";a="172966558"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Jul 2022 12:45:51 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 20 Jul 2022 12:45:50 -0700
Received: from soft-dev3-1.microsemi.net (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 20 Jul 2022 12:45:47 -0700
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
Subject: [PATCH 0/2] ARM: add support for pcb8309
Date: Wed, 20 Jul 2022 21:49:02 +0200
Message-ID: <20220720194904.2025384-1-horatiu.vultur@microchip.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add documentation and add the pcb8309.
It features a LAN9662 SoC with 2 internal copport ports and two SFP cages.

Horatiu Vultur (2):
  dt-bindings: arm: at91: add lan966 pcb8309 board
  ARM: dts: lan966x: add support for pcb8309

 .../devicetree/bindings/arm/atmel-at91.yaml   |   6 +
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/lan966x-pcb8309.dts         | 189 ++++++++++++++++++
 3 files changed, 197 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/lan966x-pcb8309.dts

-- 
2.33.0

