Return-Path: <SRS0=uyAw=TP=walle.cc=michael@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6933C433FE
	for <soc@archiver.kernel.org>; Fri,  4 Mar 2022 15:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADB87C340F2; Fri,  4 Mar 2022 15:36:21 +0000 (UTC)
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29833C340F0;
	Fri,  4 Mar 2022 15:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 29833C340F0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 2957A22175;
	Fri,  4 Mar 2022 16:36:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1646408176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T9dPXHdGA1VZg8WnVxsyYzelfA1obOsxDGtftJwTRgo=;
	b=gTf/3yn2LOnWm+Zt0G/SGD90UeDuGoLY5DD76Q+V7COAOGRkAPwFY7gPETOWXiQTXn7/Eo
	+2/rmoBKuVyXaQv3ylI7AQPUnekzpKwA/Rzd/nehQ/VWtJCe93RsKRY0iM0EwJp9pMhL4R
	+FQTtuFKZpmq+YE6zbiiJ6/7BgM3uEE=
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
	Michael Walle <michael@walle.cc>
Subject: [PATCH v2 0/7] ARM: dts: lan966x: dtsi improvements and KSwitch D10 support
Date: Fri,  4 Mar 2022 16:35:41 +0100
Message-Id: <20220304153548.3364480-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing nodes for the flexcom blocks and a node for the SGPIO
block. Then add basic support for the Kontron KSwitch D10.

Microchip, please take a closer look at the compatible strings of
the newly added nodes.

changes since v1:
 - fixed indendation
 - keep compatible, reg first, move #address-cells and #size-cells
   towards the end

Michael Walle (7):
  ARM: dts: lan966x: swap dma channels for crypto node
  ARM: dts: lan966x: add sgpio node
  ARM: dts: lan966x: add missing uart DMA channel
  ARM: dts: lan966x: add all flexcom usart nodes
  ARM: dts: lan966x: add flexcom SPI nodes
  ARM: dts: lan966x: add flexcom I2C nodes
  ARM: dts: lan966x: add basic Kontron KSwitch D10 support

 arch/arm/boot/dts/Makefile                    |   3 +-
 ...lan966x-kontron-kswitch-d10-mmt-6g-2gs.dts | 159 ++++++++++++
 arch/arm/boot/dts/lan966x.dtsi                | 227 +++++++++++++++++-
 3 files changed, 385 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/lan966x-kontron-kswitch-d10-mmt-6g-2gs.dts

-- 
2.30.2

