Return-Path: <SRS0=o4ym=NI=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB35C4338F
	for <soc@archiver.kernel.org>; Tue, 17 Aug 2021 16:52:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DFED660FE6; Tue, 17 Aug 2021 16:52:17 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C721D60FD9;
	Tue, 17 Aug 2021 16:52:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C721D60FD9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id BCBA2E0009;
	Tue, 17 Aug 2021 16:52:13 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.15 (#1)
Date: Tue, 17 Aug 2021 18:52:13 +0200
Message-ID: <878s10ypxe.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt64 for mvebu for v5.15.

Gregory

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-5.15-1

for you to fetch changes up to 514ef1e62d6521c2199d192b1c71b79d2aa21d5a:

  arm64: dts: marvell: armada-37xx: Extend PCIe MEM space (2021-08-17 18:30=
:14 +0200)

----------------------------------------------------------------
mvebu dt64 for 5.15 (part 1)

 - DTS updates for Marvell Armada CN913x platforms

   + Add support for Armada CN913x Development Board topology "B"
   + Add support for Armada CN913x Reference Design boards (CRB)
   + Fixes the NAND partitioning scheme in DTS eliminating gap between
     consecutive partitions
   + Fix 10Gb ports PHY mode names

 - Extend PCIe MEM space on Armada 37xx: useful for some combination
    of PCIe cards where the initial 16MB was not enough

----------------------------------------------------------------
Konstantin Porotchkin (3):
      arm64: dts: cn913x: add device trees for topology B boards
      arm64: dts: add support for Marvell cn9130-crb platform
      arch/arm64: dts: change 10gbase-kr to 10gbase-r in Armada

Pali Roh=C3=A1r (1):
      arm64: dts: marvell: armada-37xx: Extend PCIe MEM space

Stefan Chulski (1):
      dts: marvell: Enable 10G interfaces on 9130-DB and 9131-DB boards

 arch/arm64/boot/dts/marvell/Makefile               |   5 +
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |  17 +
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi       |  11 +-
 arch/arm64/boot/dts/marvell/armada-7040-db.dts     |   2 +-
 arch/arm64/boot/dts/marvell/armada-8040-db.dts     |   4 +-
 arch/arm64/boot/dts/marvell/cn9130-crb-A.dts       |  38 ++
 arch/arm64/boot/dts/marvell/cn9130-crb-B.dts       |  46 +++
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi        | 222 +++++++++++
 arch/arm64/boot/dts/marvell/cn9130-db-B.dts        |  22 ++
 arch/arm64/boot/dts/marvell/cn9130-db.dts          | 403 +----------------=
---
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi         | 410 +++++++++++++++++=
++++
 arch/arm64/boot/dts/marvell/cn9131-db-B.dts        |  22 ++
 arch/arm64/boot/dts/marvell/cn9131-db.dts          | 197 +---------
 arch/arm64/boot/dts/marvell/cn9131-db.dtsi         | 206 +++++++++++
 arch/arm64/boot/dts/marvell/cn9132-db-B.dts        |  22 ++
 arch/arm64/boot/dts/marvell/cn9132-db.dts          | 218 +----------
 arch/arm64/boot/dts/marvell/cn9132-db.dtsi         | 227 ++++++++++++
 17 files changed, 1267 insertions(+), 805 deletions(-)
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-crb-A.dts
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-crb-B.dts
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-db-B.dts
 create mode 100644 arch/arm64/boot/dts/marvell/cn9130-db.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/cn9131-db-B.dts
 create mode 100644 arch/arm64/boot/dts/marvell/cn9131-db.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/cn9132-db-B.dts
 create mode 100644 arch/arm64/boot/dts/marvell/cn9132-db.dtsi
--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
