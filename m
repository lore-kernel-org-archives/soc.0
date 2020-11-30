Return-Path: <SRS0=f5Ih=FE=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80C59C63777
	for <soc@archiver.kernel.org>; Mon, 30 Nov 2020 16:03:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 308272073C; Mon, 30 Nov 2020 16:03:03 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE6F620665;
	Mon, 30 Nov 2020 16:03:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE6F620665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gregory.clement@bootlin.com
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
	(Authenticated sender: gregory.clement@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 5E6A9E0010;
	Mon, 30 Nov 2020 16:02:59 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.11 (#1)
Date: Mon, 30 Nov 2020 17:02:59 +0100
Message-ID: <87eekaj0i4.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt64 for mvebu for v5.11.

It is based on v5.10-rc2 because some fixes on the device tree has been
merged after v5.10-rc1.

Gregory

The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-5.11-1

for you to fetch changes up to a2081c09d7410c3e55d902a09602b833dc96c58a:

  arm64: dts: armada-3720-turris-mox: add 3W power capability to SFP cage (=
2020-11-30 16:46:30 +0100)

----------------------------------------------------------------
mvebu dt64 for 5.11 (part 1)

 - Add support for IEI Puzzle-M801 board (Armada 8040 based)
 - Add support ESPRESSObin-Ultra (Armada 3720 based)
 - Clean-up and improve espressobin device tree
 - Switch to per-port SATA interrupts on CP110 based SoC
 - Use compliant node name for USB3  on CP110 based SoC
 - Add heartbeat LED on mcbin singleshot
 - Disable SMMU by default for Armada 7040 and 8040 to continued
   supporting custom bot firmware
 - Turris mox:
   - add 3W power capability to SFP cage
   - update ethernet-phy handle name

----------------------------------------------------------------
Andre Heider (2):
      arm64: dts: marvell: espressobin: Simplify v7 ethernet port labeling
      arm64: dts: marvell: espressobin: Get rid of duplicate serial aliases

Luka Kovacic (1):
      arm64: dts: marvell: Add a device tree for the IEI Puzzle-M801 board

Marek Beh=C3=BAn (2):
      arm64: dts: armada-3720-turris-mox: update ethernet-phy handle name
      arm64: dts: armada-3720-turris-mox: add 3W power capability to SFP ca=
ge

Pali Roh=C3=A1r (3):
      arm64: dts: marvell: espressobin: De-duplicate eMMC definitions
      arm64: dts: marvell: espressobin: Add support for LED2
      arm64: dts: marvell: espressobin: Update link to V7 schematic

Serge Semin (1):
      arm64: dts: marvell: cp11x: Harmonize xHCI DT nodes name

Sven Auhagen (1):
      arm64: dts: marvell: armada-cp110: Switch to per-port SATA interrupts

Tomasz Maciej Nowak (1):
      arm64: dts: mcbin-singleshot: add heartbeat LED

Tomasz Nowicki (1):
      arm64: dts: marvell: keep SMMU disabled by default for Armada 7040 an=
d 8040

Vladimir Vid (1):
      arm64: dts: marvell: add DT for ESPRESSObin-Ultra

 arch/arm64/boot/dts/marvell/Makefile               |   2 +
 .../dts/marvell/armada-3720-espressobin-emmc.dts   |  18 -
 .../dts/marvell/armada-3720-espressobin-ultra.dts  | 165 +++++++
 .../marvell/armada-3720-espressobin-v7-emmc.dts    |  40 +-
 .../dts/marvell/armada-3720-espressobin-v7.dts     |  24 +-
 .../boot/dts/marvell/armada-3720-espressobin.dtsi  |  39 +-
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |   3 +-
 arch/arm64/boot/dts/marvell/armada-7040.dtsi       |   4 -
 .../dts/marvell/armada-8040-mcbin-singleshot.dts   |  22 +
 .../boot/dts/marvell/armada-8040-puzzle-m801.dts   | 523 +++++++++++++++++=
++++
 arch/arm64/boot/dts/marvell/armada-8040.dtsi       |   4 -
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |  10 +-
 12 files changed, 775 insertions(+), 79 deletions(-)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-3720-espressobin-ult=
ra.dts
 create mode 100644 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
