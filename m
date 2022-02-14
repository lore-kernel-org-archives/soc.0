Return-Path: <SRS0=K9Br=S5=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D274C433EF
	for <soc@archiver.kernel.org>; Mon, 14 Feb 2022 16:31:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F659C340EB; Mon, 14 Feb 2022 16:31:27 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC6EBC340E9;
	Mon, 14 Feb 2022 16:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DC6EBC340E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A9D78240011;
	Mon, 14 Feb 2022 16:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1644856284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xzLpt9L/hCYOzEf15TVSLTRk7T1nqwclZOX0hy3iaSI=;
	b=oIFl1RREU7E5A/S9OhzG5KR1umXxNfq0Y0+rSIoinf5PliHn/NErif+6WgV6ZhzSe3D0Yj
	+nesY9qdeDYVWRQQZ1wJ3Uej9dQNdtvHVzMouO2NC+TGKyfXqBIbv5F2BtwzPP4O5xRgBN
	B/d9SLoX8Bqbi7laftTW8vDUGtXCoISAVH94teR0K3GDGIlg+3/JoXsNvk8bM4gSieDmx/
	XLGXU4ySy76P3cdgj+ER10BsMI12IcmJ8TwC+u7qIZP8dM1sDz32CTUR4CpvZKvgDwB45n
	JCYiTO26EIXCko03y9n3ITgcfwnk9pRZgSvMMfCftml8yxtIGcEw5hfsb8oY/A==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: fixes for v5.17 (#1)
Date: Mon, 14 Feb 2022 17:31:23 +0100
Message-ID: <87ilthjtpg.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for fixes for mvebu for v5.17.

Gregory

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-fixes-5.17-1

for you to fetch changes up to 0f89e3d718bc0eea2ac52c3ab3321133fd838d12:

  arm64: dts: armada-3720-turris-mox: Add missing ethernet0 alias (2022-01-=
27 10:49:02 +0100)

----------------------------------------------------------------
mvebu fixes for 5.17 (part 1)

 - Add missing ethernet alias on armada-3720-turris-mox to let
   bootloader setting MAC address.

 - Increase PCIe IO size on Armada 3720

----------------------------------------------------------------
Pali Roh=C3=A1r (2):
      arm64: dts: marvell: armada-37xx: Increase PCIe IO size from 64 KiB t=
o 1 MiB
      arm64: dts: armada-3720-turris-mox: Add missing ethernet0 alias

 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts | 3 ++-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi           | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
