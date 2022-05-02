Return-Path: <SRS0=MAlP=VK=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6356C433EF
	for <soc@archiver.kernel.org>; Mon,  2 May 2022 22:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78976C385B5; Mon,  2 May 2022 22:41:37 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53EC5C385AE;
	Mon,  2 May 2022 22:41:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 53EC5C385AE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 72C0F221D4;
	Tue,  3 May 2022 00:41:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1651531293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tETKb6Fxnn9/6vUpKYVDlMbC/k2NaZsHpF6xUJCmZMM=;
	b=CkqX1gmVFxAan00CryNDBgCXlKtpMgZqI3Tbz9d16d2f12xRPgTDGg+x/7e/DPHQqpsWVq
	7Ahf21mfbNc2CmD4255HX2k+nwuvhiKa5GzOB0sUScCSC3Q2zg9FJDHPxhRWaTwNkO3n7Z
	QK8iUggrfKj3ZT5TK+vvZ3x4Q8REVg8=
From: Michael Walle <michael@walle.cc>
To: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor.Ambarus@microchip.com,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Michael Walle <michael@walle.cc>
Subject: [PATCH v4 00/13] ARM: dts: lan966x: dtsi improvements and KSwitch D10 support
Date: Tue,  3 May 2022 00:41:14 +0200
Message-Id: <20220502224127.2604333-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing nodes for the flexcom blocks and a node for the SGPIO
block. Then add basic support for the Kontron KSwitch D10.

The first submission of this patchset was a long time ago. Since
then networking matured and is now working. Thus this now also
contains patches for all the networking related nodes and enables
them on the Kontron D10 switch.

changes since v3:
 - basic d10 switch support dropped the i2c mux and added a
   dedicated bus for the second SFP cage.
 - new patch to add the hwmon node
 - new patches to add the network related nodes and to enable
   the nodes on the d10 switch

changes since v2:
 - add second kontron board variant and moved common stuff into a
   new dtsi
 - moved the uart/i2c nodes inside of the flexcom node
 - moved sgpio child nodes inside of the sgpio node

changes since v1:
 - fixed indendation
 - keep compatible, reg first, move #address-cells and #size-cells
   towards the end

Michael Walle (13):
  ARM: dts: lan966x: swap dma channels for crypto node
  ARM: dts: lan966x: add sgpio node
  ARM: dts: lan966x: add missing uart DMA channel
  ARM: dts: lan966x: add all flexcom usart nodes
  ARM: dts: lan966x: add flexcom SPI nodes
  ARM: dts: lan966x: add flexcom I2C nodes
  ARM: dts: lan966x: add basic Kontron KSwitch D10 support
  ARM: dts: lan966x: add hwmon node
  ARM: dts: lan966x: add MIIM nodes
  ARM: dts: lan966x: add reset switch reset node
  ARM: dts: lan966x: add serdes node
  ARM: dts: lan966x: add switch node
  ARM: dts: kswitch-d10: enable networking

 arch/arm/boot/dts/Makefile                    |   4 +-
 ...lan966x-kontron-kswitch-d10-mmt-6g-2gs.dts |  94 +++++
 .../lan966x-kontron-kswitch-d10-mmt-8g.dts    |  39 ++
 .../dts/lan966x-kontron-kswitch-d10-mmt.dtsi  | 190 ++++++++++
 arch/arm/boot/dts/lan966x.dtsi                | 353 +++++++++++++++++-
 5 files changed, 676 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/lan966x-kontron-kswitch-d10-mmt-6g-2gs.dts
 create mode 100644 arch/arm/boot/dts/lan966x-kontron-kswitch-d10-mmt-8g.dts
 create mode 100644 arch/arm/boot/dts/lan966x-kontron-kswitch-d10-mmt.dtsi

-- 
2.30.2

