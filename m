Return-Path: <SRS0=7SGH=VV=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E07BC433EF
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 13:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 358BDC34114; Fri, 13 May 2022 13:13:40 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 87B81C34100;
	Fri, 13 May 2022 13:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 87B81C34100
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BEB62240006;
	Fri, 13 May 2022 13:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652447610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=uCnGTOBVFug6LQtqTL6WHNZj2tl4ixL7MjXFJtGhJtE=;
	b=c9Sew0sAQF7nyrwKafrw2RZXbMKkLd4ZGoMy35ilNsYBunP3UewP1A+NMoBiNPACqmoMHN
	TXrJAPzXxl/lA+7x9k7D4l9IG2LQHznP3d2UcUCtBImECmOEasL+K/GXDsbTbuv2Tp5yPD
	qaAkXfcEODtbKJ5TdyZ2q2sKi0la32S82itKKb2IgmKJe1xJTsTMeLTKpVJO9blLw9ir67
	VpyF1P7+7ibrTqq6Wngc+scdd2ibBs6nNiLdfLygUGN6MZ3ElvitwFvVUSY2WSbYYT4/Eq
	nUs9m9ObK1zM4uva/5DvaUiWsxn+VsNtL24+y02hx6ZwWD8sjou62nLizPm7Dg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.19 (#1)
Date: Fri, 13 May 2022 15:13:19 +0200
Message-ID: <87r14xr2xc.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for dt64 for mvebu for v5.19.

There is a conflict with the arm-soc tree and as pointed by Stephen
Rothwell and confirmed by Krzysztof Kozlowski, the correct resolution is
to take the commit 2f00bb4a69c7 ("arm64: dts: marvell: align SPI NOR
node name with dtschema"), so the node name should be "flash", not
"spi-flash".

Gregory

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-5.19-1

for you to fetch changes up to 239466bddfc02f9643f64be74ba9a1d80c286f4b:

  arm64: dts: marvell: Update sdhci node names to match schema (2022-05-09 11:23:33 +0200)

----------------------------------------------------------------
mvebu dt64 for 5.19 (part 1)

Update sdhci node names to match schema on all mvebu dt64 dtsi files

Armada 3720:
  uDPU board:
   - correct temperature sensors
   - update partition table

  espressobin-ultra board:
   - enable front USB3 port
   - add PHY and switch reset pins
   - fix SPI-NOR config

----------------------------------------------------------------
Chris Packham (1):
      arm64: dts: marvell: Update sdhci node names to match schema

Robert Marko (5):
      arm64: dts: uDPU: update partition table
      arm64: dts: uDPU: correct temperature sensors
      arm64: dts: marvell: espressobin-ultra: fix SPI-NOR config
      arm64: dts: marvell: espressobin-ultra: add PHY and switch reset pins
      arm64: dts: marvell: espressobin-ultra: enable front USB3 port

 .../dts/marvell/armada-3720-espressobin-ultra.dts   |  9 ++++-----
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts    | 21 +++++++++++++--------
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi        |  4 ++--
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi       |  2 +-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi       |  2 +-
 5 files changed, 21 insertions(+), 17 deletions(-)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
