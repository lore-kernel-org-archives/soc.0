Return-Path: <SRS0=Y2Br=GB=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23CE9CDB483
	for <soc@archiver.kernel.org>; Thu, 19 Oct 2023 15:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DAE82C433CA; Thu, 19 Oct 2023 15:33:11 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 441E3C433C7;
	Thu, 19 Oct 2023 15:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 441E3C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0FFD71BF20C;
	Thu, 19 Oct 2023 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697729581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=puMxDxyKrGmm7HZbvFQbAB7SBFcrhiQnTmImejIRgcc=;
	b=mthSciSzejId4b/CA+/96HGO4VspL9Z+nIO5VFc6fLlOqKUkWe6RCi5XRcJeCX7jVnkWNH
	T/dq0F2xQudfTb6BrUFx5cJpF7aWrhDzdH67+Nkkh5akuUSPTV0cJ1x9UHgLvo8LFK6ZmM
	g+GG8i6NBC+lyAANoD19Mv6vPC0Trd4DhG9ojDsp1MB529BT+1Ip37TC/Hku6/JFpdkWDu
	+6/nW3NwvNkfu7hHMtgU0qjahx9E87WT4C6DY+8d4IAneFgqZZBD5Gulprv71erZTFtPJV
	cj4bRWMqYaW1LPIzexv/BjMFgfx4Vcum3ge9jNMUH2cOOD5kJDByWf/6Fe936Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.7 (#1)
Date: Thu, 19 Oct 2023 17:33:00 +0200
Message-ID: <8734y6aaqb.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for dt64 for mvebu for v6.7.

Gregory

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-6.7-1

for you to fetch changes up to 660b8b2f394470fae2774daf7473ddc259373a5a:

  arm64: dts: marvell: eDPU: add support for version with external switch (2023-09-20 11:57:00 +0200)

----------------------------------------------------------------
mvebu dt64 for 6.7 (part 1)

Declare switch on eDPU (Armada 3720 based)
Use proper suffix -gpios for SFP GPIO properties on uDPU (Armada 3720 based)
Use appropriate label for spi1 pins on cn9310 boards

----------------------------------------------------------------
Chris Packham (1):
      ARM64: dts: marvell: cn9310: Use appropriate label for spi1 pins

Robert Marko (2):
      arm64: dts: marvell: uDPU: rename the SFP GPIO properties
      arm64: dts: marvell: eDPU: add support for version with external switch

 arch/arm64/boot/dts/marvell/armada-3720-eDPU.dts  | 47 +++++++++++++++++++++++
 arch/arm64/boot/dts/marvell/armada-3720-uDPU.dtsi |  8 ++--
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi       |  4 +-
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi        |  4 +-
 4 files changed, 55 insertions(+), 8 deletions(-)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
