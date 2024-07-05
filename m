Return-Path: <SRS0=IP8z=OF=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E37C3271E
	for <soc@archiver.kernel.org>; Fri,  5 Jul 2024 16:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A51CC4AF0B; Fri,  5 Jul 2024 16:58:34 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C2F66C32786;
	Fri,  5 Jul 2024 16:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C2F66C32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB4A8C0006;
	Fri,  5 Jul 2024 16:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720198710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nfs7xIxjdlyJM0SknZxAvaWWCNtXOH51+Oa6N5mueFo=;
	b=Cq/9SpOL0HGdDk+FQmFu3kBBQVpLBcQlDwcSCxODFAbMG65nHgBqAdh+Mzjjj6EUwBgx8F
	nIbtb/yo6B0QCb+1UVDKkpX7dymZu8Pajti1K3iCgP8VMftET9EgVRf9Q7F8SSewPuAV+6
	sGvFqIlYbtxmaANw0gqGvg0p8Dl6xDQMYGhF5/LmK7tK2CdhHo+yRcL2k2x8MsyQD/h1Lm
	Jx4TLQy/VjsrDgalFD5j7XLYsOs44voyQXmryOgcrNJMlCEswo23Iw9jzH/zSIPsWj1DmI
	1x3o1CCzch8sXhsarkZEC0ig0Sy5bJsxq8Q2/YSxUfsmGmKP8ty7F4+p4ZcYHg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v6.11 (#1)
Date: Fri, 05 Jul 2024 18:58:23 +0200
Message-ID: <87zfqvixn4.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for dt for mvebu for v6.11.

Gregory

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-6.11-1

for you to fetch changes up to 731daaa5093d5c93c3b46dfbe46970cc52e15335:

  ARM: dts: turris-omnia: Add GPIO key node for front button (2024-07-05 14=
:45:47 +0200)

----------------------------------------------------------------
mvebu dt for 6.11 (part 1)

armada-385: Add 7-segment LED display on x530
armada-385: Add Turris Omnia MCU related node
armada-370 irqchip DT changes: Drop #size-cells from mpic node
orion / kirkwood: few cleanups

----------------------------------------------------------------
Chris Packham (1):
      ARM: dts: marvell: Add 7-segment LED display on x530

Krzysztof Kozlowski (7):
      ARM: dts: marvell: kirkwood: align GPIO keys node name with bindings
      ARM: dts: marvell: kirkwood: drop incorrect address/size-cells in GPI=
O keys
      ARM: dts: marvell: kirkwood: align LED node name with bindings
      ARM: dts: marvell: orion: align GPIO keys node name with bindings
      ARM: dts: marvell: orion: drop incorrect address/size-cells in GPIO k=
eys
      ARM: dts: marvell: orion5x-lswsgl: use 'gpios' property for LEDs
      ARM: dts: marvell: orion: align LED node name with bindings

Marek Beh=C3=BAn (3):
      ARM: dts: armada-{370-xp,375,38x,39x}: Drop #size-cells from mpic node
      ARM: dts: turris-omnia: Add MCU system-controller node
      ARM: dts: turris-omnia: Add GPIO key node for front button

 arch/arm/boot/dts/marvell/armada-370-xp.dtsi       |  1 -
 arch/arm/boot/dts/marvell/armada-375.dtsi          |  1 -
 arch/arm/boot/dts/marvell/armada-385-atl-x530.dts  | 13 ++++-
 .../boot/dts/marvell/armada-385-turris-omnia.dts   | 35 ++++++++++++-
 arch/arm/boot/dts/marvell/armada-38x.dtsi          |  1 -
 arch/arm/boot/dts/marvell/armada-39x.dtsi          |  1 -
 .../dts/marvell/kirkwood-blackarmor-nas220.dts     |  6 +--
 arch/arm/boot/dts/marvell/kirkwood-c200-v1.dts     |  8 +--
 arch/arm/boot/dts/marvell/kirkwood-cloudbox.dts    |  8 ++-
 arch/arm/boot/dts/marvell/kirkwood-d2net.dts       |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-dir665.dts      | 22 ++++----
 arch/arm/boot/dts/marvell/kirkwood-dns320.dts      | 10 ++--
 arch/arm/boot/dts/marvell/kirkwood-dns325.dts      | 10 ++--
 arch/arm/boot/dts/marvell/kirkwood-dnskw.dtsi      |  8 ++-
 arch/arm/boot/dts/marvell/kirkwood-dockstar.dts    |  4 +-
 arch/arm/boot/dts/marvell/kirkwood-dreamplug.dts   |  6 +--
 arch/arm/boot/dts/marvell/kirkwood-goflexnet.dts   | 20 ++++----
 .../dts/marvell/kirkwood-guruplug-server-plus.dts  |  8 +--
 arch/arm/boot/dts/marvell/kirkwood-ib62x0.dts      | 12 ++---
 arch/arm/boot/dts/marvell/kirkwood-iconnect.dts    | 20 ++++----
 .../boot/dts/marvell/kirkwood-iomega_ix2_200.dts   | 16 +++---
 arch/arm/boot/dts/marvell/kirkwood-l-50.dts        | 20 ++++----
 arch/arm/boot/dts/marvell/kirkwood-laplug.dts      |  6 +--
 .../arm/boot/dts/marvell/kirkwood-linkstation.dtsi |  2 -
 .../boot/dts/marvell/kirkwood-linksys-viper.dts    | 10 ++--
 arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi       | 18 +++----
 arch/arm/boot/dts/marvell/kirkwood-mplcec4.dts     | 12 ++---
 .../boot/dts/marvell/kirkwood-mv88f6281gtw-ge.dts  | 12 ++---
 arch/arm/boot/dts/marvell/kirkwood-netxbig.dtsi    |  8 ++-
 arch/arm/boot/dts/marvell/kirkwood-ns2-common.dtsi |  6 +--
 arch/arm/boot/dts/marvell/kirkwood-ns2lite.dts     |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-nsa310.dts      | 20 ++++----
 arch/arm/boot/dts/marvell/kirkwood-nsa310a.dts     | 18 +++----
 arch/arm/boot/dts/marvell/kirkwood-nsa310s.dts     |  8 ++-
 arch/arm/boot/dts/marvell/kirkwood-nsa320.dts      | 18 +++----
 arch/arm/boot/dts/marvell/kirkwood-nsa325.dts      | 18 +++----
 .../boot/dts/marvell/kirkwood-nsa3x0-common.dtsi   |  8 ++-
 .../boot/dts/marvell/kirkwood-openblocks_a6.dts    |  4 +-
 .../boot/dts/marvell/kirkwood-openblocks_a7.dts    |  2 -
 arch/arm/boot/dts/marvell/kirkwood-pogo_e02.dts    |  4 +-
 .../dts/marvell/kirkwood-pogoplug-series-4.dts     |  8 ++-
 .../boot/dts/marvell/kirkwood-sheevaplug-esata.dts |  2 +-
 arch/arm/boot/dts/marvell/kirkwood-sheevaplug.dts  |  4 +-
 arch/arm/boot/dts/marvell/kirkwood-synology.dtsi   | 58 +++++++++++-------=
----
 arch/arm/boot/dts/marvell/kirkwood-t5325.dts       |  4 +-
 arch/arm/boot/dts/marvell/kirkwood-ts219-6281.dts  |  6 +--
 arch/arm/boot/dts/marvell/kirkwood-ts219-6282.dts  |  6 +--
 arch/arm/boot/dts/marvell/kirkwood-ts419.dtsi      |  6 +--
 .../dts/marvell/mvebu-linkstation-gpio-simple.dtsi |  2 -
 .../boot/dts/marvell/orion5x-lacie-d2-network.dts  |  9 ++--
 .../orion5x-lacie-ethernet-disk-mini-v2.dts        |  7 ++-
 .../boot/dts/marvell/orion5x-linkstation-lschl.dts |  4 +-
 arch/arm/boot/dts/marvell/orion5x-lswsgl.dts       | 25 +++++-----
 .../marvell/orion5x-maxtor-shared-storage-2.dts    |  7 ++-
 .../boot/dts/marvell/orion5x-netgear-wnr854t.dts   |  2 +-
 .../arm/boot/dts/marvell/orion5x-rd88f5182-nas.dts |  2 +-
 56 files changed, 276 insertions(+), 284 deletions(-)
