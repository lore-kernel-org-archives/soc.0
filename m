Return-Path: <SRS0=ucEE=I7=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53550C433B4
	for <soc@archiver.kernel.org>; Fri,  2 Apr 2021 21:05:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 058B761158; Fri,  2 Apr 2021 21:05:46 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75F4C610CC;
	Fri,  2 Apr 2021 21:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75F4C610CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gregory.clement@bootlin.com
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
	(Authenticated sender: gregory.clement@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 6A3E1200004;
	Fri,  2 Apr 2021 21:05:42 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.13 (#1)
Date: Fri, 02 Apr 2021 23:05:42 +0200
Message-ID: <874kgocs7t.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt64 for mvebu for v5.13.

Gregory

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-5.13-1

for you to fetch changes up to 99fa8ac5c0f1cf781194dbd04fcd162f4392a9b1:

  arm64: dts: marvell: enable CP110 UTMI PHY usage (2021-04-02 22:43:51 +02=
00)

----------------------------------------------------------------
mvebu dt64 for 5.13 (part 1)

Add DT for fan control on SolidRun Clearfog GT8k platform

Add syscon compatible to NB clk node allowing improving cpufreq
support on Armada 37xx

Add support for UTMI PHY allowing removing kernel dependency from the
boot loader for UBS port connected to this PHY (Armada 7K, 8K and
CN91xx)

----------------------------------------------------------------
Konstantin Porotchkin (2):
      arm64: dts: marvell: add support for Marvell CP110 UTMI PHY
      arm64: dts: marvell: enable CP110 UTMI PHY usage

Marek Beh=C3=BAn (1):
      arm64: dts: marvell: armada-37xx: add syscon compatible to NB clk node

Russell King (2):
      arm64: dts: marvell: clearfog-gt-8k: add pwm-fan
      arm64: dts: marvell: clearfog-gt-8k: add cooling maps

 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |   3 +-
 arch/arm64/boot/dts/marvell/armada-7040-db.dts     |  14 ++-
 .../dts/marvell/armada-8040-clearfog-gt-8k.dts     | 127 +++++++++++++++++=
++++
 arch/arm64/boot/dts/marvell/armada-8040-db.dts     |  21 +++-
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi |  19 ++-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |  19 +++
 arch/arm64/boot/dts/marvell/cn9130-db.dts          |  12 +-
 arch/arm64/boot/dts/marvell/cn9131-db.dts          |   9 +-
 arch/arm64/boot/dts/marvell/cn9132-db.dts          |  11 +-
 9 files changed, 220 insertions(+), 15 deletions(-)

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
