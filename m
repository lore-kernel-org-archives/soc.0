Return-Path: <SRS0=aadu=LO=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B001FC48BDF
	for <soc@archiver.kernel.org>; Sun, 20 Jun 2021 08:53:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 661B4610EA; Sun, 20 Jun 2021 08:53:09 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E77361078;
	Sun, 20 Jun 2021 08:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E77361078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gregory.clement@bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 329F8240008;
	Sun, 20 Jun 2021 08:53:03 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.14 (#1)
Date: Sun, 20 Jun 2021 10:53:05 +0200
Message-ID: <878s3429zi.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt64 for mvebu for v5.14.

Gregory

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-5.14-1

for you to fetch changes up to e3850467bf8c82de4a052619136839fe8054b774:

  arch/arm64/boot/dts/marvell: fix NAND partitioning scheme (2021-06-17 17:=
01:21 +0200)

----------------------------------------------------------------
mvebu dt64 for 5.14 (part 1)

on Armada 3700:
Move turris-mox-rwtm firmware node to a more generic place

on AP807:
Make SD/MMC controller still usbale with older kernel

CP11x:
update comphy references

cn9130:
Improve NAND partitioning scheme for cn9130-db

----------------------------------------------------------------
Grzegorz Jaszczyk (1):
      Documentation/bindings: phy: update references to cp11x

Konstantin Porotchkin (1):
      arch/arm64/boot/dts/marvell: fix NAND partitioning scheme

Marcin Wojtas (1):
      arm64: dts: ensure backward compatibility of the AP807 Xenon

Pali Roh=C3=A1r (1):
      arm64: dts: marvell: armada-37xx: move firmware node to generic dtsi =
file

 Documentation/devicetree/bindings/phy/phy-mvebu-comphy.txt | 12 ++++++----=
--
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts     |  6 ++----
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi               |  8 ++++++++
 arch/arm64/boot/dts/marvell/armada-ap807.dtsi              |  3 ++-
 arch/arm64/boot/dts/marvell/cn9130-db.dts                  |  2 +-
 5 files changed, 19 insertions(+), 12 deletions(-)

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
