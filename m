Return-Path: <SRS0=LCsd=UR=microchip.com=Kavyasree.Kotagiri@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F5DC433EF
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 10:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB750C385A6; Thu,  7 Apr 2022 10:58:58 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 596B6C385A4;
	Thu,  7 Apr 2022 10:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 596B6C385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649329137; x=1680865137;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=EzmSGWlsWjkeqCQgsHDdF/k8eR0xW55Lf0E785X6ELU=;
  b=NIQBqT7lI0EYL1D0P4xN6kCx6GMOqHDeH60q9MJF7b73JwsXAYunKHHf
   PWAHhDmQb/XMdU3RWqlEDh2Zl++xOW24LzHQisUIGkrzmGkFpLsXvOWOz
   rFeg7eEC6Dd6lUOorkmrli956+kQwQ8is/IhiSenTWPjXER85lwk54DxX
   as4lO2HNBTx6/cImcCS31AFhAVx8zLN52vTZeFFk44mTVP94+Na6LvPIx
   cOnJLOMgcr8RX88aTGA1wuRk74+JacFNcB3Pq20GKUcQ7Ux92nJrkBX2j
   g8ZGlS/M7U7s1xz/Flh/0Y+sLq41uDphHIxkziHOHhnUrRuGaa7imgtXz
   g==;
X-IronPort-AV: E=Sophos;i="5.90,241,1643698800"; 
   d="scan'208";a="154758581"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Apr 2022 03:58:56 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 7 Apr 2022 03:58:55 -0700
Received: from kavya-HP-Compaq-6000-Pro-SFF-PC.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Thu, 7 Apr 2022 03:58:50 -0700
From: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
List-Id: <soc.lore.kernel.org>
To: <arnd@arndb.de>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>,
	<alexandre.belloni@bootlin.com>, <olof@lixom.net>, <soc@kernel.org>,
	<nicolas.ferre@microchip.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <UNGLinuxDriver@microchip.com>,
	<tudor.ambarus@microchip.com>, <Kavyasree.Kotagiri@microchip.com>,
	<Manohar.Puri@microchip.com>
Subject: [PATCH 0/2] ARM: dts: Add LAN966x QSPI nodes
Date: Thu, 7 Apr 2022 16:28:33 +0530
Message-ID: <20220407105835.10962-1-kavyasree.kotagiri@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

This patch series adds QSPI nodes of LAN966x Soc.
Also enables qspi0 controller and SST SPI-NOR flash
for pcb8291 board.

Kavyasree Kotagiri (2):
  ARM: dts: lan966x: Add QSPI nodes
  ARM: dts: lan966x-pcb8291: Add QSPI0 and SPI NOR memory nodes

 arch/arm/boot/dts/lan966x-pcb8291.dts | 15 +++++++++
 arch/arm/boot/dts/lan966x.dtsi        | 48 +++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

-- 
2.17.1

