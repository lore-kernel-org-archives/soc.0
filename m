Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7540E31AF3F
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 15:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757690021; cv=none; b=WBrAEHlRH63hQD8sQEVsF1/GUqQ2vlGfIESG1ZRpNJ90Vts6Xz7iTrbf0QL8zAqGtI6x3gwgyCd0WP9scpE3BDvRu4sWeKoTZfYIH5V7O/VjcDd4aR9urcD1tUZZn501URg0Q11STvIPUu3jhRJ95HE0sobv2+BSBNIJuc9VebQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757690021; c=relaxed/simple;
	bh=7Rve7T1q6L5t4A/verE701mNlZI56/cQWEEEboqXqUs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EX/jV1ykQq65/40MnZybKwLnqEzw0llAZpmJLDIovaqMihQhXx3Q3aJVsA1RMTfB11lXSqHLlIJOB/FqolHVhOeRkQxS88y3ohojs+HXJ1ud/oXbDHjeqSCkE4SE/T3ncGsqR9Q/P00L8fv9kYiz/V48gNm0cAa8MWnR630izeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YUO2Wmfk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YUO2Wmfk"
Received: by smtp.kernel.org (Postfix)
	id 0AC38C4CEF9; Fri, 12 Sep 2025 15:13:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A678C4CEF1
	for <soc@kernel.org>; Fri, 12 Sep 2025 15:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A678C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 69B001A0DC0;
	Fri, 12 Sep 2025 15:13:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3748E60638;
	Fri, 12 Sep 2025 15:13:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6C824102F29C9;
	Fri, 12 Sep 2025 17:13:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757690015; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=mKf2as6BBkWoxSaDquCtCeCYxtNSJDqDRTLH5rwrkxY=;
	b=YUO2WmfkKeRb23RFGkED6wJLMXYx8RFrt/da2FAwwBVXtROhHrbjdKUuxs2NtST17yaF0n
	/+SXSsTxxfMxdg/y3r+if4nLEsZcMy2iw1wWWRR2Odig4Zp3j7iGdT0q5pheqJlQ0XnddV
	kHZKz8gJrDydcy9vbtI/Mzz2/4ycFJsnlu5nQUdMuTjEJHQEGjtpcj+Dpqanbi1W6HbE8b
	iibh607qPa+zU54U9TVzTNedYIcAWCqiH/7h+erneB2p+X75f6x7uxsnbmCPQz1QNCwZZF
	KKSLKFXBcyYuQT6r99qGoP/R2289hY57BLSYUVULr2Nu8FRpiwnbawcGeQ1ezQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v6.17 (#1)
Date: Fri, 12 Sep 2025 17:13:26 +0200
Message-ID: <87ikhnn1pl.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Here is the first pull request for fixes for mvebu for v6.17.

Gregory

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-fixes-6.17-1

for you to fetch changes up to 794a066688038df46c01e177cc6faebded0acba4:

  arm64: dts: marvell: cn9132-clearfog: fix multi-lane pci x2 and x4 ports (2025-09-12 14:54:38 +0200)

----------------------------------------------------------------
mvebu fixes for 6.17 (part 1)

Fix SATA ports on various boards: Macchiatobin, CN913x-solidrun.
Fix audio on Armada 370 DB and OpenRD.
Disable eMMC high-speed modes on the CN9132 CEX-7 module.
Disable runtime reconfiguration for PCIe lanes on the CN9132 CEX-7 module.

----------------------------------------------------------------
Jihed Chaibi (2):
      ARM: dts: armada-370-db: Fix stereo audio input routing on Armada 370
      ARM: dts: kirkwood: Fix sound DAI cells for OpenRD clients

Josua Mayer (3):
      arm64: dts: marvell: cn913x-solidrun: fix sata ports status
      arm64: dts: marvell: cn9132-clearfog: disable eMMC high-speed modes
      arm64: dts: marvell: cn9132-clearfog: fix multi-lane pci x2 and x4 ports

Russell King (Oracle) (1):
      ARM64: dts: mcbin: fix SATA ports on Macchiatobin

 arch/arm/boot/dts/marvell/armada-370-db.dts        |  2 +-
 .../boot/dts/marvell/kirkwood-openrd-client.dts    |  2 +-
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi |  2 ++
 arch/arm64/boot/dts/marvell/cn9130-cf.dtsi         |  7 ++++---
 arch/arm64/boot/dts/marvell/cn9131-cf-solidwan.dts |  6 ++++--
 arch/arm64/boot/dts/marvell/cn9132-clearfog.dts    | 22 ++++++++++++++++------
 arch/arm64/boot/dts/marvell/cn9132-sr-cex7.dtsi    |  8 ++++++++
 7 files changed, 36 insertions(+), 13 deletions(-)
