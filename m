Return-Path: <SRS0=p1VZ=34=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB11C4332F
	for <soc@archiver.kernel.org>; Mon, 28 Nov 2022 00:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 45717C433D6; Mon, 28 Nov 2022 00:43:52 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ED6EAC433C1;
	Mon, 28 Nov 2022 00:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ED6EAC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BEFC31BF205;
	Mon, 28 Nov 2022 00:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669596221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WoCbVDhK9tfW30IVjdi68KtxuiHG/VB6qwTMom2AjXo=;
	b=Rl+qI0KhSSZwRyGd5CDJnU6CgodTNrYVigXuzvXj6v9cFFUWpWQUDj1ng5QgkRsmfOeNxM
	uuB1L9aARTDSx/g0DxFcTVPH1QegCZoEvfEujSlioxRUnL5//3WUX1BoZ8tb8VGHUdZvca
	KCaAproGk8GkO6egr9/LcsBtAJTZiuGC749xRmxL+u1Sv0QpubE4HcZb4o4si1rqV5c3/Q
	CL8RogbammdoHfDuT6cYXBbDp1bbshHjiPoSn1tV8JIDEn/iFPFpJi3fiTRUADB+KR1K1w
	ctzqAmrH0Wi1c07EU2XkDiAwMO0scYS3W/AjbMXHMLtHcEZQ7Ny5J+N+QN1NCA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v6.2 (#1)
Date: Mon, 28 Nov 2022 01:43:40 +0100
Message-ID: <87cz979adf.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt for mvebu for v6.2.

Gregory

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-6.2-1

for you to fetch changes up to 11f24029403e6e24b6136c852511b7cfb7b39f5e:

  ARM: dts: armada-xp: add interrupts for watchdog (2022-11-28 01:22:12 +01=
00)

----------------------------------------------------------------
mvebu dt for 6.2 (part 1)

Fix assigned-addresses for every PCIe Root Port

Align LED node names with dtschema

Add a new kirkwood based board: Zyxel NSA310S

Fix compatible string for gpios for Armada 38x and 39x

Add interrupts for watchdog on Armada XP

Turris Omnia (Armada 385 based):
 - Add switch port 6 node
 - Add ethernet aliases

Switch to using gpiod API in pm-board code

----------------------------------------------------------------
Chris Packham (1):
      ARM: dts: armada-xp: add interrupts for watchdog

Dmitry Torokhov (1):
      ARM: mvebu: switch to using gpiod API in pm-board code

Krzysztof Kozlowski (1):
      ARM: dts: armada: align LED node names with dtschema

Pali Roh=C3=A1r (10):
      ARM: dts: dove: Fix assigned-addresses for every PCIe Root Port
      ARM: dts: armada-370: Fix assigned-addresses for every PCIe Root Port
      ARM: dts: armada-xp: Fix assigned-addresses for every PCIe Root Port
      ARM: dts: armada-375: Fix assigned-addresses for every PCIe Root Port
      ARM: dts: armada-38x: Fix assigned-addresses for every PCIe Root Port
      ARM: dts: armada-39x: Fix assigned-addresses for every PCIe Root Port
      ARM: dts: turris-omnia: Add ethernet aliases
      ARM: dts: turris-omnia: Add switch port 6 node
      ARM: dts: armada-38x: Fix compatible string for gpios
      ARM: dts: armada-39x: Fix compatible string for gpios

Pawel Dembicki (1):
      ARM: dts: kirkwood: Add Zyxel NSA310S board

 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/armada-370-dlink-dns327l.dts     |   6 +-
 arch/arm/boot/dts/armada-370-seagate-nas-4bay.dts  |   4 +-
 arch/arm/boot/dts/armada-370-seagate-nas-xbay.dtsi |   8 +-
 .../dts/armada-370-seagate-personal-cloud.dtsi     |   2 +-
 arch/arm/boot/dts/armada-370.dtsi                  |   2 +-
 arch/arm/boot/dts/armada-375.dtsi                  |   2 +-
 arch/arm/boot/dts/armada-380.dtsi                  |   4 +-
 arch/arm/boot/dts/armada-385-linksys-caiman.dts    |   4 +-
 arch/arm/boot/dts/armada-385-linksys-cobra.dts     |   4 +-
 arch/arm/boot/dts/armada-385-linksys-rango.dts     |   8 +-
 arch/arm/boot/dts/armada-385-linksys-shelby.dts    |   4 +-
 arch/arm/boot/dts/armada-385-linksys.dtsi          |   4 +-
 arch/arm/boot/dts/armada-385-synology-ds116.dts    |   2 +-
 arch/arm/boot/dts/armada-385-turris-omnia.dts      |  18 +-
 arch/arm/boot/dts/armada-385.dtsi                  |   6 +-
 arch/arm/boot/dts/armada-38x.dtsi                  |   4 +-
 arch/arm/boot/dts/armada-39x.dtsi                  |  10 +-
 arch/arm/boot/dts/armada-xp-98dx3236.dtsi          |   1 +
 arch/arm/boot/dts/armada-xp-linksys-mamba.dts      |   2 +-
 arch/arm/boot/dts/armada-xp-mv78230.dtsi           |   8 +-
 arch/arm/boot/dts/armada-xp-mv78260.dtsi           |  16 +-
 arch/arm/boot/dts/armada-xp.dtsi                   |   1 +
 arch/arm/boot/dts/dove.dtsi                        |   2 +-
 arch/arm/boot/dts/kirkwood-nsa310s.dts             | 259 +++++++++++++++++=
++++
 arch/arm/mach-mvebu/pm-board.c                     |  28 +--
 26 files changed, 339 insertions(+), 71 deletions(-)
 create mode 100644 arch/arm/boot/dts/kirkwood-nsa310s.dts

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
