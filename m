Return-Path: <SRS0=UQO0=XY=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF020C433EF
	for <soc@archiver.kernel.org>; Tue, 19 Jul 2022 13:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3428C341CA; Tue, 19 Jul 2022 13:30:32 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0F5DC341C6;
	Tue, 19 Jul 2022 13:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0F5DC341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8BA1E1BF213;
	Tue, 19 Jul 2022 13:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1658237422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=2n4CyaZ7gsIU+nlUQ67WzzeHS367r9u6Hd+9w5i8zvc=;
	b=JSW+6oWIPB3SsOgHjaMjjshoiaEbTm9C0gq+Enk2XR7LHf4TEPA1o+idzHnhMp3DP7JvIn
	FLvX51LfWEwA2OuFgpM2F0pePSZrW4Rt7oC5W5AC3W+l4Fme21QurkRKqBwCV6qpP/LljF
	dal3/LTvw7aCimYAY/+oCbALPXryGfa2lP8jME6MqNJ/ADots72l7M+Xsqba4K12D1g4Jc
	HRbE1hLz/ujhqxPCisZakQQNJ2EE/yG9XEyLn7Z05ftkoah+77+6VfTEXf4PM/z8j7rnIl
	AAMLdQkWhLkqm54pXahb2JXqyWmTMgRiHfafHIcTNCB6BEp50uM8CbeIVuJdoQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>, Vadym Kochan
 <vadym.kochan@plvision.eu>
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.20 (#1) (replacing previous one)
Date: Tue, 19 Jul 2022 15:30:20 +0200
Message-ID: <87cze1qlg3.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for dt64 for mvebu for v5.20.

As seen with Arnd on IRC this pull request is replacing the previous
one. Now the cpu type in cpu nodes are fixed: cortex-a55 instead of
armv8.

Gregory

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-5.20-1

for you to fetch changes up to 8225663e0cd47a049267b9ef627d0b10f6bfc056:

  arm64: marvell: enable the 98DX2530 pinctrl driver (2022-07-19 15:15:00 +0200)

----------------------------------------------------------------
mvebu dt64 for 5.20 (part 1)

Add support for Marvell 98DX2530 (and variants)

----------------------------------------------------------------
Chris Packham (3):
      dt-bindings: marvell: Document the AC5/AC5X compatibles
      arm64: dts: marvell: Add Armada 98DX2530 SoC and RD-AC5X board
      arm64: marvell: enable the 98DX2530 pinctrl driver

 .../bindings/arm/marvell/marvell,ac5.yaml          |  32 +++
 arch/arm64/Kconfig.platforms                       |   2 +
 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi      | 291 +++++++++++++++++++++
 arch/arm64/boot/dts/marvell/ac5-98dx35xx-rd.dts    | 101 +++++++
 arch/arm64/boot/dts/marvell/ac5-98dx35xx.dtsi      |  17 ++
 6 files changed, 444 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/marvell,ac5.yaml
 create mode 100644 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
 create mode 100644 arch/arm64/boot/dts/marvell/ac5-98dx35xx-rd.dts
 create mode 100644 arch/arm64/boot/dts/marvell/ac5-98dx35xx.dtsi

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
