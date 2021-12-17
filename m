Return-Path: <SRS0=D1Ep=RC=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8319C433F5
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 17:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 966EFC36AE7; Fri, 17 Dec 2021 17:36:20 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D757DC36AE1;
	Fri, 17 Dec 2021 17:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D757DC36AE1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id ACBE0200004;
	Fri, 17 Dec 2021 17:36:16 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.17 (#1)
Date: Fri, 17 Dec 2021 18:36:16 +0100
Message-ID: <878rwjm8vj.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt64 for mvebu for v5.17.

Gregory

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-5.17-1

for you to fetch changes up to 0734f8311ce72c9041e5142769eff2083889c172:

  arm64: dts: marvell: cn9130: enable CP0 GPIO controllers (2021-12-17 18:1=
0:43 +0100)

----------------------------------------------------------------
mvebu dt64 for 5.17 (part 1)

Enable more network hardware and gpios on CN9130-CRB
Add new clock node needed by comphy on armada-37xx

----------------------------------------------------------------
Chris Packham (2):
      arm/arm64: dts: Enable CP0 GPIOs for CN9130-CRB
      arm/arm64: dts: Add MV88E6393X to CN9130-CRB device tree

Pali Roh=C3=A1r (1):
      arm64: dts: marvell: armada-37xx: Add xtal clock to comphy node

Robert Marko (2):
      arm64: dts: marvell: cn9130: add GPIO and SPI aliases
      arm64: dts: marvell: cn9130: enable CP0 GPIO controllers

 arch/arm64/boot/dts/marvell/armada-37xx.dtsi |   2 +
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi  | 140 +++++++++++++++++++++++=
++++
 arch/arm64/boot/dts/marvell/cn9130.dtsi      |  15 +++
 3 files changed, 157 insertions(+)

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
