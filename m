Return-Path: <SRS0=ucEE=I7=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2030FC433ED
	for <soc@archiver.kernel.org>; Fri,  2 Apr 2021 20:37:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DA97B610A5; Fri,  2 Apr 2021 20:37:37 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F64161151;
	Fri,  2 Apr 2021 20:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F64161151
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gregory.clement@bootlin.com
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
	(Authenticated sender: gregory.clement@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 3CE591C0003;
	Fri,  2 Apr 2021 20:37:31 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v5.12 (#1)
Date: Fri, 02 Apr 2021 22:37:30 +0200
Message-ID: <87a6qgctit.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for fixes for mvebu for v5.12.

Gregory

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-fixes-5.12-1

for you to fetch changes up to a26c56ae67fa9fbb45a8a232dcd7ebaa7af16086:

  ARM: dts: turris-omnia: configure LED[2]/INTn pin as interrupt pin (2021-=
04-02 22:14:44 +0200)

----------------------------------------------------------------
mvebu fixes for 5.12 (part 1)

2 fixes on on turris-omnia (Armada 38x based:)
 - Fix storm interrupt
 - Enable hardware buffer management as it should be

Unbreak AHCI on all Marvell Armada 7k8k / CN913x platforms

----------------------------------------------------------------
Gregory CLEMENT (1):
      Revert "arm64: dts: marvell: armada-cp110: Switch to per-port SATA in=
terrupts"

Marek Beh=C3=BAn (1):
      ARM: dts: turris-omnia: configure LED[2]/INTn pin as interrupt pin

Rui Salvaterra (1):
      ARM: dts: turris-omnia: fix hardware buffer management

 arch/arm/boot/dts/armada-385-turris-omnia.dts | 4 +++-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
