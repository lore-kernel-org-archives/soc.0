Return-Path: <SRS0=8ePV=SY=collabora.com=detlev.casanova@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857C2C433F5
	for <soc@archiver.kernel.org>; Wed,  9 Feb 2022 16:25:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4136BC340E7; Wed,  9 Feb 2022 16:25:37 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E0083C340ED;
	Wed,  9 Feb 2022 16:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E0083C340ED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: detlev)
	with ESMTPSA id 7C9811F437CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1644423933;
	bh=wUyTh4TxAaAhhf0GaFyj+4ErZEcZzUH0SZMh0f5d9aI=;
	h=From:To:Cc:Subject:Date:From;
	b=X3Zo1DikBaErEDlbfGfpcfYsLZVVx4HB6xSkJsJDbnuJB3SbWgYHSFkw+yPWfclOQ
	 7BXPGKatk9pqjqTKTJFxaC5RyIxAC8HagGc6y8sAOOAX6mvv9CE1lAcn7XnP8c3ZdL
	 35sxQRLm6g6BEYSYcWhVbzcMvhJbqV76D6fP7/uMDe+/VUZup6i4zSmpZ+iY4FatVh
	 TYqYIo9S28072Qs7SWeibkeZoHIsuYiIfwfiVhH1xygwSF0MaSlOA3WeRP8GN/AEKh
	 d6fgHZCPL/f5TFnL9w5/lO3LVF7DjumyT9fN9I/9QQk4bRy0QDQoJSCb8v1RH4fJ7v
	 dqTGDbv5v7Dkg==
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org (maintainer:ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)),
	Rob Herring <robh+dt@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com (maintainer:BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE...),
	Stefan Wahren <stefan.wahren@i2se.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM AND ARM64 SoC SUB-ARCHITECTURES (COMMON PARTS)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE)
Subject: [PATCH 0/2] ARM: dts: Support official Raspberry Pi 7inch touchscreen
Date: Wed,  9 Feb 2022 11:25:10 -0500
Message-Id: <20220209162515.706729-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a devicetree to support the official Raspberry Pi 7inch touchscreen.

This also demuxes the i2c0 controller to support both pinctrls.

Detlev Casanova (2):
  ARM: dts: bcm2*: Demux i2c0 with a pinctrl
  ARM: dts: Add bcm2711-rpi-4-b-7inch-ts-dsi.dts

 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/bcm2711-rpi-4-b-7inch-ts-dsi.dts | 129 ++++++++++++++++++
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts         |   1 +
 arch/arm/boot/dts/bcm2711.dtsi                |   2 +-
 arch/arm/boot/dts/bcm2835-rpi.dtsi            |   9 +-
 .../boot/dts/bcm283x-rpi-i2c0mux_0_44.dtsi    |   4 +
 arch/arm/boot/dts/bcm283x.dtsi                |  26 +++-
 arch/arm64/boot/dts/broadcom/Makefile         |   1 +
 .../broadcom/bcm2711-rpi-4-b-7inch-ts-dsi.dts |   2 +
 9 files changed, 170 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm2711-rpi-4-b-7inch-ts-dsi.dts
 create mode 100644 arch/arm/boot/dts/bcm283x-rpi-i2c0mux_0_44.dtsi
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b-7inch-ts-dsi.dts

-- 
2.35.1

