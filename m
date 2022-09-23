Return-Path: <SRS0=awD+=Z2=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF9BECAAD8
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 15:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B4B5C4347C; Fri, 23 Sep 2022 15:42:10 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D1B1C433D7;
	Fri, 23 Sep 2022 15:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D1B1C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 78C51FF804;
	Fri, 23 Sep 2022 15:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663947725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5AF+bLKAxL0C7+JD/TWVC17TuEm8prl827GYjGqWwOM=;
	b=OYqboNYLDiFNEiQbjxbyvjmCnbfvgLVWhwo4MeATM7JfuR9DDOmJtKBuXpbi3CMQgUhr7m
	lEfGJm0h6z5eI709izbFpD7tVmhQWQHc6oYN+n3zy2NiFES6vK76W0CiJMXhT54kq1Gu+Z
	AjeljEiEra5ccI9woNciCrGPqZLOnt632A8RtBjLvqMGYBEh++hAhkkbQfbkaM0IPZ+iZX
	iqMLdGpflkcUX9m15MVaD3IDwCo3aox/w19wn5rPUgZg5tF5GWLYzRHpHBUImZIx4cNaBO
	u+DCuog0QbZozp9XBJ8EeDanDRX5QsG66u2dYYVoat8JdRGIORpmy1+rofLBqQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v6.1 (#1)
Date: Fri, 23 Sep 2022 16:42:05 +0100
Message-ID: <87edw2xfle.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt for mvebu for v6.1.

Gregory

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-6.1-1

for you to fetch changes up to 649acf24d8c86ab8861a05cdd6833100a5fe4e78:

  ARM: dts: turris-omnia: Add label for wan port (2022-09-23 17:15:20 +0200)

----------------------------------------------------------------
mvebu dt for 6.1 (part 1)

Add definitions for PCIe legacy INTx interrupts for dts using
pci-mvebu.c controller driver.

Add gpio-ranges for pin muxing for Armada 38x

Add audio support for Armada 38x

Turris-omnia (Armada 385 based) fix a pin name

lsxl (kirkwood based)
 - Fix fix serial line
 - Remove first ethernet port

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: armada-xp: align SPI node name with dtschema

Marcin Wojtas (2):
      ARM: mvebu: add audio I2S controller to Armada 38x Device Tree
      ARM: mvebu: add audio support to Armada 385 DB

Marek Beh=C3=BAn (1):
      ARM: dts: turris-omnia: Fix mpp26 pin name and comment

Michael Walle (2):
      ARM: dts: kirkwood: lsxl: fix serial line
      ARM: dts: kirkwood: lsxl: remove first ethernet port

Pali Roh=C3=A1r (16):
      ARM: dts: kirkwood: Add definitions for PCIe legacy INTx interrupts
      ARM: dts: dove: Add definitions for PCIe legacy INTx interrupts
      ARM: dts: armada-370.dtsi: Add definitions for PCIe legacy INTx inter=
rupts
      ARM: dts: armada-xp-98dx3236.dtsi: Add definitions for PCIe legacy IN=
Tx interrupts
      ARM: dts: armada-xp-mv78230.dtsi: Add definitions for PCIe legacy INT=
x interrupts
      ARM: dts: armada-xp-mv78260.dtsi: Add definitions for PCIe legacy INT=
x interrupts
      ARM: dts: armada-xp-mv78460.dtsi: Add definitions for PCIe legacy INT=
x interrupts
      ARM: dts: armada-375.dtsi: Add definitions for PCIe legacy INTx inter=
rupts
      ARM: dts: armada-380.dtsi: Add definitions for PCIe legacy INTx inter=
rupts
      ARM: dts: armada-39x.dtsi: Add definitions for PCIe legacy INTx inter=
rupts
      ARM: dts: kirkwood: Add definitions for PCIe error interrupts
      ARM: dts: dove: Add definitions for PCIe error interrupts
      ARM: dts: armada-38x: Add gpio-ranges for pin muxing
      ARM: mvebu: Add spdif-pins mpp pins for Armada 38x
      ARM: dts: turris-omnia: Define S/PDIF audio card
      ARM: dts: turris-omnia: Add label for wan port

 arch/arm/boot/dts/armada-370.dtsi               |  28 ++++-
 arch/arm/boot/dts/armada-375.dtsi               |  28 ++++-
 arch/arm/boot/dts/armada-380.dtsi               |  42 ++++++-
 arch/arm/boot/dts/armada-385-turris-omnia.dts   |  32 +++++-
 arch/arm/boot/dts/armada-388-db.dts             |  69 ++++++++++++
 arch/arm/boot/dts/armada-38x.dtsi               |  26 +++++
 arch/arm/boot/dts/armada-39x.dtsi               |  56 ++++++++--
 arch/arm/boot/dts/armada-xp-98dx3236.dtsi       |  14 ++-
 arch/arm/boot/dts/armada-xp-lenovo-ix4-300d.dts |   2 +-
 arch/arm/boot/dts/armada-xp-mv78230.dtsi        |  70 ++++++++++--
 arch/arm/boot/dts/armada-xp-mv78260.dtsi        | 126 ++++++++++++++++++---
 arch/arm/boot/dts/armada-xp-mv78460.dtsi        | 140 ++++++++++++++++++++=
----
 arch/arm/boot/dts/dove.dtsi                     |  28 ++++-
 arch/arm/boot/dts/kirkwood-6192.dtsi            |  14 ++-
 arch/arm/boot/dts/kirkwood-6281.dtsi            |  14 ++-
 arch/arm/boot/dts/kirkwood-6282.dtsi            |  28 ++++-
 arch/arm/boot/dts/kirkwood-98dx4122.dtsi        |  14 ++-
 arch/arm/boot/dts/kirkwood-lsxl.dtsi            |  16 +--
 18 files changed, 647 insertions(+), 100 deletions(-)

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
