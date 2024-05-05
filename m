Return-Path: <SRS0=TkS+=MI=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBB5C4345F
	for <soc@archiver.kernel.org>; Sun,  5 May 2024 21:30:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04DD9C4AF67; Sun,  5 May 2024 21:30:52 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 590FEC113CC;
	Sun,  5 May 2024 21:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 590FEC113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DBAF20004;
	Sun,  5 May 2024 21:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1714944647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=I7HubAbXdWD4ZX2DH21FuMAxBVOtckoFTzUdXDue2hY=;
	b=YxuNwjl+CqeJAZ4dsKAIZHKjJHG2mdeCEy3sU/xXP33H0jvaugDggOyH2yUA6zAxrpuQtd
	Lu8A1ApGRhmnRj4PSkooxXIcBtKoUSuXE52ZUAocGJApLGmH5I6eaSnt7nXYFs7TMdQJ+o
	k92+xqgmp1k3ApH+SSbjDBjAxnrvGg7UcT/108zxmqXVVFs1+hg98Xkoq7cFqErStVI5Wu
	u/gYPvTBFa+g3guQnGvtk6llaIIbmv1Ht5aKbTjw/0FKPz5/VkrMV4DNQCI3i+jmqSS1vx
	W/7mQHhUuAGiUvJsfLd9Rx7PyJ8NNVg4zNTkuDFcCnLhAhW80BQ969OUPfFrBQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.10 (#1)
Date: Sun, 05 May 2024 23:30:45 +0200
Message-ID: <87jzk8ndyy.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for dt64 for mvebu for v6.10.

Gregory

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-6.10-1

for you to fetch changes up to 4289937de5ca3d82e4ee70f30e30f9f0cdcda6a2:

  arm64: dts: marvell: espressobin-ultra: fix Ethernet Switch unit address (2024-05-05 18:03:31 +0200)

----------------------------------------------------------------
mvebu dt64 for 6.10 (part 1)

Few dts fix for dt validation

----------------------------------------------------------------
Krzysztof Kozlowski (9):
      arm64: dts: marvell: ap80x: fix IOMMU unit address
      arm64: dts: marvell: cn9130-db: drop unneeded flash address/size-cells
      arm64: dts: marvell: cn9131-db: drop unneeded flash address/size-cells
      arm64: dts: marvell: cn9130-db: drop wrong unit-addresses
      arm64: dts: marvell: cn9130-crb: drop wrong unit-addresses
      arm64: dts: marvell: cn9130-crb: drop unneeded "status"
      arm64: dts: marvell: eDPU: drop redundant address/size-cells
      arm64: dts: marvell: turris-mox: drop unneeded flash address/size-cells
      arm64: dts: marvell: espressobin-ultra: fix Ethernet Switch unit address

 arch/arm64/boot/dts/marvell/armada-3720-eDPU.dts   |  2 -
 .../dts/marvell/armada-3720-espressobin-ultra.dts  | 98 ++++++++++++++--------
 .../boot/dts/marvell/armada-3720-turris-mox.dts    |  2 -
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi      |  2 +-
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi        | 13 ++-
 arch/arm64/boot/dts/marvell/cn9130-db.dtsi         | 18 ++--
 arch/arm64/boot/dts/marvell/cn9131-db.dtsi         |  8 +-
 arch/arm64/boot/dts/marvell/cn9132-db.dtsi         | 12 +--
 8 files changed, 88 insertions(+), 67 deletions(-)
