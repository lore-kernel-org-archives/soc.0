Return-Path: <SRS0=Bfw1=VF=collabora.com=detlev.casanova@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379BBC433FE
	for <soc@archiver.kernel.org>; Wed, 27 Apr 2022 18:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 051DAC385AF; Wed, 27 Apr 2022 18:53:03 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3FA4AC385A7;
	Wed, 27 Apr 2022 18:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3FA4AC385A7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: detlev)
	with ESMTPSA id 70F871F44C76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1651085578;
	bh=OV0Z+SXN5LTYQytPf5y0kDwTuGPnGohLGzr4axQ+7yw=;
	h=From:To:Cc:Subject:Date:From;
	b=AY6LsKCA/lI55xWW2jetqHmqlqE0JMO7i5IAIbxL2lRP+b1zh69hkwb7ptIHxTCfU
	 3FdEN21owDZZLmhrOowfjMTzqZPh6yetG8IUxry7w7Ow9kHTPCj9PhDN3MnjJPOzl6
	 1W+YZJ5HmVotKypHriO5kFEuxQZtRG/GplyNGEM3WEdlhvGtP7bP9a5GTYVky22kWH
	 w91t7BXVh1Ukc2aHGr4EdEHBqHIifnKJ4m7ej8mNWoEggYTuJXzB7RdA5+bV7/1J+V
	 TPxuJUBtOz0u4X4f1nObiflnwu43pyNseFexaHJXxe1yB/SuUlriNTEtb2DRuOYloP
	 4TZ4tKkj7tc4w==
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de,
	bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	f.fainelli@gmail.com,
	frowand.list@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	masahiroy@kernel.org,
	michal.lkml@markovi.net,
	ndesaulniers@google.com,
	nsaenz@kernel.org,
	olof@lixom.net,
	rjui@broadcom.com,
	robh+dt@kernel.org,
	sbranden@broadcom.com,
	soc@kernel.org,
	stefan.wahren@i2se.com,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [RFC PATCH v2 0/3] ARM: dts: Support official Raspberry Pi 7inch touchscreen
Date: Wed, 27 Apr 2022 14:52:40 -0400
Message-Id: <20220427185243.173594-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a devicetree overlay to support the official Raspberry Pi 7inch touchscreen.

This also demuxes the i2c0 controller to support both pinctrls.

Changes in v2:
 * The device tree in now an overlay
 * The i2c demux patch is kept for now to have a working patch set. It has
   not been merged yet in [1].
 * The device tree overlay doesn't use fragments. It is working as is 
   but not enough literature was found to go one way or the other.

[1] https://www.spinics.net/lists/arm-kernel/msg944330.html

Detlev Casanova (3):
  ARM: dts: bcm2*: Demux i2c0 with a pinctrl
  of: Add support for -@ when compiling overlays
  ARM: dto: Add bcm2711-rpi-7-inches-ts.dts overlay

 arch/arm/boot/dts/Makefile                    |   4 +
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts         |   1 +
 arch/arm/boot/dts/bcm2711.dtsi                |   2 +-
 arch/arm/boot/dts/bcm2835-rpi.dtsi            |   9 +-
 .../boot/dts/bcm283x-rpi-i2c0mux_0_44.dtsi    |   4 +
 arch/arm/boot/dts/bcm283x.dtsi                |  26 +++-
 arch/arm/boot/dts/overlays/Makefile           |   3 +
 .../dts/overlays/bcm2711-rpi-7-inches-ts.dts  | 125 ++++++++++++++++++
 arch/arm64/boot/dts/broadcom/Makefile         |   4 +
 .../arm64/boot/dts/broadcom/overlays/Makefile |   3 +
 .../overlays/bcm2711-rpi-7-inches-ts.dts      |   2 +
 drivers/of/Kconfig                            |   8 ++
 scripts/Makefile.lib                          |   9 +-
 13 files changed, 193 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm283x-rpi-i2c0mux_0_44.dtsi
 create mode 100644 arch/arm/boot/dts/overlays/Makefile
 create mode 100644 arch/arm/boot/dts/overlays/bcm2711-rpi-7-inches-ts.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/overlays/Makefile
 create mode 100644 arch/arm64/boot/dts/broadcom/overlays/bcm2711-rpi-7-inches-ts.dts

-- 
2.36.0

