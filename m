Return-Path: <SRS0=7E5q=HD=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB9ECC433E0
	for <soc@archiver.kernel.org>; Mon,  1 Feb 2021 16:26:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6D02D64D9D; Mon,  1 Feb 2021 16:26:50 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DCA864DAF;
	Mon,  1 Feb 2021 16:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DCA864DAF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gregory.clement@bootlin.com
X-Originating-IP: 90.65.91.141
Received: from localhost (lfbn-lyo-1-1912-141.w90-65.abo.wanadoo.fr [90.65.91.141])
	(Authenticated sender: gregory.clement@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 12FD320007;
	Mon,  1 Feb 2021 16:26:43 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.12 (#1)
Date: Mon, 01 Feb 2021 17:26:43 +0100
Message-ID: <87pn1jn48s.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt64 for mvebu for v5.12.

Gregory

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-5.12-1

for you to fetch changes up to 35db5e32ebc16330ae6275c24783efa4091af1bc:

  arm64: dts: armada: add pwm offsets for ap/cp gpios (2021-01-29 16:54:48 =
+0100)

----------------------------------------------------------------
mvebu dt64 for 5.12 (part 1)

 - rename u-boot mtd partition to a53-firmware on Turris Mox (Armada 3720 b=
ased)
 - improve SDHCI support on AP807 based board
 - move SATA comphy into main armada-37xx.dtsi
 - add Armada 8K/7K PWM support

----------------------------------------------------------------
Baruch Siach (1):
      arm64: dts: armada: add pwm offsets for ap/cp gpios

Konstantin Porotchkin (1):
      arm64: dts: change AP807 SDHCI compatibility string

Marcin Wojtas (1):
      arm64: dts: cn913x-db: enable MMC HS400

Marek Beh=C3=BAn (1):
      arm64: dts: armada-3720-turris-mox: rename u-boot mtd partition to a5=
3-firmware

Pali Roh=C3=A1r (1):
      arm64: dts: marvell: armada-37xx: Add SATA comphy into main armada-37=
xx.dtsi file

 arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi |  2 --
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts   |  2 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi             |  2 ++
 arch/arm64/boot/dts/marvell/armada-ap807.dtsi            |  5 +++++
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi            |  3 +++
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi            | 10 ++++++++++
 arch/arm64/boot/dts/marvell/cn9130-db.dts                |  2 ++
 7 files changed, 23 insertions(+), 3 deletions(-)
