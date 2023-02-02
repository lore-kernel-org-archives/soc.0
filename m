Return-Path: <SRS0=6DOZ=56=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7524C61DA4
	for <soc@archiver.kernel.org>; Thu,  2 Feb 2023 15:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75E93C4339C; Thu,  2 Feb 2023 15:32:57 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16E1CC433EF;
	Thu,  2 Feb 2023 15:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 16E1CC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 35D0624000E;
	Thu,  2 Feb 2023 15:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675351971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qKDWIGRPeb9do0mn6l6hEY6pjRhrWcc15yCE/sJxZgc=;
	b=PPwJ5O4nt2AiZWue4iOr17ThmCy97JK10MxMmXiWRCdQYpiBkYBXom6NqTJAm/OzqV2Aga
	m0uIydHAOuyEal6WZ7XWMdyCXMdCyWQFHpZgs2GZzSdi3cMET+DBY2OLUydw52tnwKMzdG
	elOUtq2/oMOtmISBU841u/XTfNI9l3T6yvqEQ+hBXZ9lk6S1v1Of6zEwHZRybOBvnmWuQ0
	siP2s/HH6vjcEGU5ou4vz0mLbSYDQqIKfp4FYoDQg6qftaTuDLSe9lRu6Ht71FdRM94YFE
	PwUQwBtiXC9kg3JjjGLBSQkY8AuZ+3W4zuPniAviPdVgi2pdcWAK8j6Ka6bi4w==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.3 (#1)
Date: Thu, 02 Feb 2023 16:32:50 +0100
Message-ID: <87zg9w9j6l.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt64 for mvebu for v6.3.

Gregory

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt64-6.3-1

for you to fetch changes up to 5a7363821281f981b3f6cb8e77d1868d092705c8:

  arm64: dts: marvell: Fix compatible strings for Armada 3720 boards (2023-=
02-01 08:45:01 +0100)

----------------------------------------------------------------
mvebu dt64 for 6.3 (part 1)

Do not use anymore "marvell,armada3710" compatible string for the
Armada 3720 boards.

----------------------------------------------------------------
Pali Roh=C3=A1r (1):
      arm64: dts: marvell: Fix compatible strings for Armada 3720 boards

 arch/arm64/boot/dts/marvell/armada-3720-db.dts                  | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin-emmc.dts    | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin-ultra.dts   | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7-emmc.dts | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin-v7.dts      | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-espressobin.dts         | 2 +-
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts          | 2 +-
 arch/arm64/boot/dts/marvell/armada-372x.dtsi                    | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)
