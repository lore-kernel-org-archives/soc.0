Return-Path: <SRS0=aadu=LO=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF36C48BDF
	for <soc@archiver.kernel.org>; Sun, 20 Jun 2021 08:51:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 82A4A610EA; Sun, 20 Jun 2021 08:51:25 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E2B561059;
	Sun, 20 Jun 2021 08:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E2B561059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gregory.clement@bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 7C34E1C0005;
	Sun, 20 Jun 2021 08:51:21 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: drivers for v5.14 (#1)
Date: Sun, 20 Jun 2021 10:51:22 +0200
Message-ID: <87bl802a2d.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for drivers for mvebu for v5.14.

Gregory

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-drivers-5.14-1

for you to fetch changes up to 90ae47215de3fec862aeb1a0f0e28bb505ab1351:

  firmware: turris-mox-rwtm: add marvell,armada-3700-rwtm-firmware compatib=
le string (2021-06-17 15:02:35 +0200)

----------------------------------------------------------------
mvebu drivers for 5.14 (part 1)

Make the turris mox rwtm firmware more generic for Armada 3700 SoCs

----------------------------------------------------------------
Pali Roh=C3=A1r (1):
      firmware: turris-mox-rwtm: add marvell,armada-3700-rwtm-firmware comp=
atible string

 drivers/firmware/turris-mox-rwtm.c | 1 +
 1 file changed, 1 insertion(+)

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
