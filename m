Return-Path: <SRS0=aadu=LO=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE05C48BDF
	for <soc@archiver.kernel.org>; Sun, 20 Jun 2021 08:36:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6CF916108E; Sun, 20 Jun 2021 08:36:31 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C7CB6102A;
	Sun, 20 Jun 2021 08:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C7CB6102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gregory.clement@bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A45D6C000A;
	Sun, 20 Jun 2021 08:36:26 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v5.13 (#1)
Date: Sun, 20 Jun 2021 10:36:27 +0200
Message-ID: <87eecx0w6s.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for fixes for mvebu for v5.13.

Gregory

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-fixes-5.13-1

for you to fetch changes up to fae20160992269431507708fb74c1fd9f3c309c1:

  firmware: turris-mox-rwtm: show message about HWRNG registration (2021-06=
-17 14:55:09 +0200)

----------------------------------------------------------------
mvebu fixes for 5.13 (part 1)

Few fixes for the Turris Mox rWTM firmware found on the Armada 3700
SoCs.

----------------------------------------------------------------
Marek Beh=C3=BAn (2):
      firmware: turris-mox-rwtm: fix reply status decoding function
      firmware: turris-mox-rwtm: report failures better

Pali Roh=C3=A1r (2):
      firmware: turris-mox-rwtm: fail probing when firmware does not suppor=
t hwrng
      firmware: turris-mox-rwtm: show message about HWRNG registration

 drivers/firmware/turris-mox-rwtm.c | 55 ++++++++++++++++++++++++++++++++--=
----
 1 file changed, 47 insertions(+), 8 deletions(-)

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
