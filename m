Return-Path: <SRS0=TkS+=MI=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7E4C4345F
	for <soc@archiver.kernel.org>; Sun,  5 May 2024 21:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3D91CC4AF67; Sun,  5 May 2024 21:31:49 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7AC82C113CC;
	Sun,  5 May 2024 21:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7AC82C113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE1D71C0004;
	Sun,  5 May 2024 21:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714944698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=1ZI+z05WrHI8SBqtELnJNtMdn7HbHxw4mWhbbarHVb8=;
	b=GjpsrcjfslGUwkZ4Gtucp3JiO41ujpPYGA95Kfi2IEpTMfJaRJHTYvwgc3WTv+92W4ySKN
	IZgNt1ZUnLdudIF2N0SWjDrI3NduMpKDI8rA0zX96dlkliqGGAGWE1ilNhu3pqkM11+fQQ
	bNKPtoITaxgi5wjqpcX5dLOe2p1Wi2B4FW8hyraPbpJDFiie4MaI+Rd2iccxd3gYPVR0cw
	F0G6a6TVdgNCbo3rVvCC3jdmdqc+750gU2mkEKy4YMFRizJ724w3L25hMtEQTCi5/dVU1g
	1/NeOoOQVjuTIdFrSHVS/HHfnbJG3D3cmHKJF6CCDfeaF2rxi8NZiPczAA/0vQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v6.10 (#1)
Date: Sun, 05 May 2024 23:31:36 +0200
Message-ID: <87h6fcndxj.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for arm for mvebu for v6.10.

Gregory

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-arm-6.10-1

for you to fetch changes up to 3153eb8e047339e5217338d2f3b25e58c8683d7f:

  ARM: orion5x: Convert TS409 board to GPIO descriptors for LEDs (2024-05-05 18:18:18 +0200)

----------------------------------------------------------------
mvebu arm for 6.10 (part 1)

Decrease the usage of global GPIO numbers for LEDs for Orion5x boards

----------------------------------------------------------------
Linus Walleij (5):
      ARM: orion5x: Convert D2Net board to GPIO descriptors for LEDs
      ARM: orion5x: Convert DNS323 board to GPIO descriptors for LEDs
      ARM: orion5x: Convert MV2120 board to GPIO descriptors for LEDs
      ARM: orion5x: Convert Net2big board to GPIO descriptors for LEDs
      ARM: orion5x: Convert TS409 board to GPIO descriptors for LEDs

 arch/arm/mach-orion5x/board-d2net.c   | 16 +++++++--
 arch/arm/mach-orion5x/dns323-setup.c  | 63 ++++++++++++++++++++++++++---------
 arch/arm/mach-orion5x/mv2120-setup.c  | 29 +++++++++++-----
 arch/arm/mach-orion5x/net2big-setup.c | 21 +++++++++---
 arch/arm/mach-orion5x/ts409-setup.c   | 25 +++++++++-----
 5 files changed, 116 insertions(+), 38 deletions(-)
