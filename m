Return-Path: <SRS0=f5Ih=FE=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093B7C63777
	for <soc@archiver.kernel.org>; Mon, 30 Nov 2020 16:00:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CDC3F2076E; Mon, 30 Nov 2020 16:00:37 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35C5F205F4;
	Mon, 30 Nov 2020 16:00:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35C5F205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gregory.clement@bootlin.com
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
	(Authenticated sender: gregory.clement@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 5E00660015;
	Mon, 30 Nov 2020 16:00:32 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v5.11 (#1)
Date: Mon, 30 Nov 2020 17:00:32 +0100
Message-ID: <87h7p6j0m7.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt for mvebu for v5.11.

Gregory

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-5.11-1

for you to fetch changes up to 51b632c713d50586a844259c56048a280f375406:

  ARM: dts: mvebu: Add device tree for RD-AC3X-48G4X2XL board (2020-11-30 1=
5:26:01 +0100)

----------------------------------------------------------------
mvebu dt for 5.11 (part 1)

 - Add support for MikroTik CRS3xx switches
 - Add support for RD-AC3X-48G4X2XL board : Armada 382 SoC connected
   to Prestera AC3X ASIC through PCI
 - Clean-up kirkwood device tree: replace "ok" by "okay"
 - Improve device tree for PCA953x gpio expander nodes
 - Use compliant node name for USB3 on armada 375
 - 98dx3236 SoCs:
    - remove non-existent i2c1
    - add i2c0 pinctrl information
 - Improve device tree for Turris Omnia

----------------------------------------------------------------
Adrian Schmutzler (1):
      ARM: dts: kirkwood: replace status value "ok" by "okay"

Aryan Srivastava (1):
      ARM: dts: mvebu: Add device tree for RD-AC3X-48G4X2XL board

Chris Packham (2):
      ARM: dts: Remove non-existent i2c1 from 98dx3236
      ARM: dts: Add i2c0 pinctrl information for 98dx3236

Krzysztof Kozlowski (2):
      ARM: dts: dove: fix PCA95xx GPIO expander properties on A510
      ARM: dts: armada: align GPIO hog names with dtschema

Luka Kovacic (3):
      ARM: dts: mvebu: Add CRS326-24G-2S board
      ARM: dts: mvebu: Add CRS305-1G-4S board
      ARM: dts: mvebu: Add CRS328-4C-20S-4S board

Marek Beh=C3=BAn (7):
      ARM: dts: turris-omnia: enable HW buffer management
      ARM: dts: turris-omnia: add comphy handle to eth2
      ARM: dts: turris-omnia: describe switch interrupt
      ARM: dts: turris-omnia: add SFP node
      ARM: dts: turris-omnia: add LED controller node
      ARM: dts: turris-omnia: update ethernet-phy node and handle name
      ARM: dts: turris-omnia: remove unneeded status =3D "okay" properties

Serge Semin (1):
      arm: dts: marvell: armada-375: Harmonize DWC USB3 DT nodes name

 arch/arm/boot/dts/Makefile                         |   7 +
 arch/arm/boot/dts/armada-375.dtsi                  |   2 +-
 arch/arm/boot/dts/armada-382-rd-ac3x-48g4x2xl.dts  | 112 +++++++++++++
 arch/arm/boot/dts/armada-385-turris-omnia.dts      | 179 +++++++++++++++++=
+++-
 arch/arm/boot/dts/armada-388-clearfog.dts          |   4 +-
 arch/arm/boot/dts/armada-388-clearfog.dtsi         |  10 +-
 arch/arm/boot/dts/armada-388-helios4.dts           |   6 +-
 arch/arm/boot/dts/armada-xp-98dx3236.dtsi          |  12 +-
 arch/arm/boot/dts/armada-xp-crs305-1g-4s-bit.dts   |  43 +++++
 arch/arm/boot/dts/armada-xp-crs305-1g-4s.dts       |  17 ++
 arch/arm/boot/dts/armada-xp-crs305-1g-4s.dtsi      | 104 ++++++++++++
 arch/arm/boot/dts/armada-xp-crs326-24g-2s-bit.dts  |  43 +++++
 arch/arm/boot/dts/armada-xp-crs326-24g-2s.dts      |  17 ++
 arch/arm/boot/dts/armada-xp-crs326-24g-2s.dtsi     | 104 ++++++++++++
 .../boot/dts/armada-xp-crs328-4c-20s-4s-bit.dts    |  43 +++++
 arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s.dts   |  17 ++
 arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s.dtsi  | 104 ++++++++++++
 arch/arm/boot/dts/dove-sbc-a510.dts                |   1 +
 arch/arm/boot/dts/kirkwood-dockstar.dts            |   2 +-
 arch/arm/boot/dts/kirkwood-dreamplug.dts           |   2 +-
 arch/arm/boot/dts/kirkwood-goflexnet.dts           |   2 +-
 .../arm/boot/dts/kirkwood-guruplug-server-plus.dts |   2 +-
 arch/arm/boot/dts/kirkwood-iconnect.dts            |   2 +-
 arch/arm/boot/dts/kirkwood-iomega_ix2_200.dts      |   2 +-
 arch/arm/boot/dts/kirkwood-nsa3x0-common.dtsi      |   2 +-
 arch/arm/boot/dts/kirkwood.dtsi                    |   4 +-
 26 files changed, 810 insertions(+), 33 deletions(-)
 create mode 100644 arch/arm/boot/dts/armada-382-rd-ac3x-48g4x2xl.dts
 create mode 100644 arch/arm/boot/dts/armada-xp-crs305-1g-4s-bit.dts
 create mode 100644 arch/arm/boot/dts/armada-xp-crs305-1g-4s.dts
 create mode 100644 arch/arm/boot/dts/armada-xp-crs305-1g-4s.dtsi
 create mode 100644 arch/arm/boot/dts/armada-xp-crs326-24g-2s-bit.dts
 create mode 100644 arch/arm/boot/dts/armada-xp-crs326-24g-2s.dts
 create mode 100644 arch/arm/boot/dts/armada-xp-crs326-24g-2s.dtsi
 create mode 100644 arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s-bit.dts
 create mode 100644 arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s.dts
 create mode 100644 arch/arm/boot/dts/armada-xp-crs328-4c-20s-4s.dtsi

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
