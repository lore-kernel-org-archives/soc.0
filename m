Return-Path: <SRS0=UQO0=XY=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA554C43334
	for <soc@archiver.kernel.org>; Tue, 19 Jul 2022 12:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A67C8C341CB; Tue, 19 Jul 2022 12:56:22 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C7E8C341C6;
	Tue, 19 Jul 2022 12:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C7E8C341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7A32520007;
	Tue, 19 Jul 2022 12:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658235378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6q2Llhdg8Zb2GItKO9j5ZdwaCaqwA+Iu+jkQAME68a0=;
	b=oaF9s+p2HMO+EhiVH+cy0A8t/1Af2hL563X6k7vKHWUS7aD80thl0fSwKwEXVtoIB15e0W
	EUiDcNnhpwV4XW8WKB5sARoCB5uJcSj32QlR0fWgtCCsADFPNmgouh2CcdRuQf7OTnUjge
	AFCFS6B+/LQsJcahUUkSz27krueOrOxgr9ynQSNbTCYgwNJ6VVluvrRLgyVVYRJicIvo+P
	QOzlABgGEEGRDVjT3r2b+l1+uC+TUBBI8t1VNC409Mtr9sl/nvXDM5qEGIwqD+ftaCB6GM
	3JSg0MBgrnKt8Rrwv+5xZyvI04ZqMr3JCC1yrvq2JqA1+RLKtxtVlWjr4UwUYQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v5.20 (#1)
Date: Tue, 19 Jul 2022 14:56:16 +0200
Message-ID: <87ilntqn0v.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for arm for mvebu for v5.20.

Sorry to be late, actually I've just realized this week we were already
at -rc7.

Gregory

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-arm-5.20-1

for you to fetch changes up to fdaa3725831972284ef2779ddba00491d9dbbfca:

  ARM: Marvell: Update PCIe fixup (2022-07-18 12:32:01 +0200)

----------------------------------------------------------------
mvebu arm for 5.20 (part 1)

Update PCIe fixup for old Marvell SoCs: dove, orion5 and mv78xx0.

----------------------------------------------------------------
Pali Roh=C3=A1r (1):
      ARM: Marvell: Update PCIe fixup

 arch/arm/mach-dove/Kconfig    |  1 +
 arch/arm/mach-dove/pcie.c     | 11 ++++++++---
 arch/arm/mach-mv78xx0/pcie.c  | 11 ++++++++---
 arch/arm/mach-orion5x/Kconfig |  1 +
 arch/arm/mach-orion5x/pci.c   | 12 +++++++++---
 5 files changed, 27 insertions(+), 9 deletions(-)

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
