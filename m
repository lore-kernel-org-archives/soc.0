Return-Path: <SRS0=Sahy=MW=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F8DC4338F
	for <soc@archiver.kernel.org>; Fri, 30 Jul 2021 14:36:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 20CB860184; Fri, 30 Jul 2021 14:36:54 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 244D560EFD;
	Fri, 30 Jul 2021 14:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 244D560EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 13A4B40006;
	Fri, 30 Jul 2021 14:36:48 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v5.14 (#1)
Date: Fri, 30 Jul 2021 16:36:48 +0200
Message-ID: <87k0l7zx4v.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for fixes for mvebu for v5.14.

Gregory

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-fixes-5.14-1

for you to fetch changes up to ee7ab3f263f8131722cff3871b9618b1e7478f07:

  arm64: dts: armada-3720-turris-mox: remove mrvl,i2c-fast-mode (2021-07-23=
 14:40:11 +0200)

----------------------------------------------------------------
mvebu fixes for 5.14 (part 1)

- Fix i2c property for armada-3720-turris-mox in order to use SFP

- Add mmc alias on armada-3720-turris-mox to allow rootfs using the
  right mmc

----------------------------------------------------------------
Pali Roh=C3=A1r (1):
      arm64: dts: armada-3720-turris-mox: remove mrvl,i2c-fast-mode

Vladimir Oltean (1):
      arm64: dts: armada-3720-turris-mox: fixed indices for the SDHC contro=
llers

 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts | 3 +++
 1 file changed, 3 insertions(+)

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
