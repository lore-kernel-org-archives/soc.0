Return-Path: <SRS0=6U1h=AJ=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E275C77B76
	for <soc@archiver.kernel.org>; Tue, 18 Apr 2023 09:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 754FCC4339C; Tue, 18 Apr 2023 09:53:11 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 478D5C433D2;
	Tue, 18 Apr 2023 09:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 478D5C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5A9FFC0006;
	Tue, 18 Apr 2023 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681811587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=kyGVHHf3qgre9thhCTEQ2Ok4plsYxnMoorPxOcIIwt4=;
	b=U7OoJr7ntd8wc7sJT1PQVjAoAe1FL4h+ejwutjQugKsZpOaPxPrpQvTHNdtezyV6ewlKh+
	2deTPx0mkGXF3d6JrUJNg3o8ubL5iQ5HNtvZUsldXGSmZdg07z/NqxLoak8Y0zFWz49RUE
	gTVd7O1x8LRcuBJPzREcaONBBzIjtZ1FcbWaj8qw544jPfRrOtgW3K549l4etRNZLCnhX5
	TwJDEYYZJFc299yu9oZx70J8Z6QoIuiLSq7jK7IwCanVcT5WkViHw2+y1ydieuicsDAzXW
	JCR055gRnp/QGb96u9An2u+eYSrPr9/6DQUp8AJTmuacEXWp/bTKVXpy7uya0A==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.4 (#1)
Date: Tue, 18 Apr 2023 11:53:03 +0200
Message-ID: <87bkjlzfcw.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for dt64 for mvebu for v6.4.

Gregory

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-6.4-1

for you to fetch changes up to 218669c662e3a38fdbd7e0ce56a20784da29546e:

  ARM64: dts: marvell: cn9310: Add missing phy-mode (2023-04-07 17:41:05 +0200)

----------------------------------------------------------------
mvebu dt64 for 6.4 (part 1)

Enlarge PCI memory window on Machiatobin (Armada 7040 based)
Add supoport for the GL.iNet GL-MV1000 (Armada 3700 based)
Add missing phy-mode on the cn9310
Align thermal node names with bindings

----------------------------------------------------------------
Andrew Lunn (1):
      ARM64: dts: marvell: cn9310: Add missing phy-mode

Enrico Mioso (1):
      arm64: dts: marvell: add DTS for GL.iNet GL-MV1000

Krzysztof Kozlowski (1):
      arm64: dts: marvell: align thermal node names with bindings

Robert Marko (1):
      arm64: dts: marvell: mochabin: enlarge PCI memory window

 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 .../boot/dts/marvell/armada-3720-gl-mv1000.dts     | 239 +++++++++++++++++++++
 .../boot/dts/marvell/armada-7040-mochabin.dts      |   1 +
 arch/arm64/boot/dts/marvell/armada-ap80x.dtsi      |  10 +-
 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi      |   2 +-
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi        |   3 +-
 6 files changed, 249 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-3720-gl-mv1000.dts
