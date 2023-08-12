Return-Path: <SRS0=FUiy=D5=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCEDC0015E
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 21:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 141C3C433CB; Sat, 12 Aug 2023 21:25:05 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8D5F1C433C9;
	Sat, 12 Aug 2023 21:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8D5F1C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 512EA20003;
	Sat, 12 Aug 2023 21:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691875500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=F+MlBmamH6atNbGfarESoGclov6JmcOZqX9CO4/AYRs=;
	b=NK6z6u3qX5LY2i8317+7YktfLdJI9NXF97ZytgCZ2sykc46xvBa7EhuMZQLk1pfu/HaKsD
	joSH9SWINBXOC19XVmbXSMQbVCZ/N1hpIcah0nd0sUyJt5AaD3acDtDi1S2xiBxFjRwpf8
	FQ8gSZ92KLoa2M8k+/bBOmH6sDY9+cvN5VEiQYDG0x2PUsmybU8jFJycsSfhm1s+I4quiC
	1B5gE++DLN/lchm/Rx3zKBROEORoMO0EP09QkDWhPhC0j7+vWkPmiL+mVEyh47r8szTbCd
	poEOW8ev5TK3wbPr17E32nUzzMmHHeMi5jms2WQY3HQQHmS1i+gpC5tWSLfkgA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v6.6 (#1)
Date: Sat, 12 Aug 2023 23:25:00 +0200
Message-ID: <87h6p4t0lv.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for dt for mvebu for v6.6.

Gregory

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt-6.6-1

for you to fetch changes up to afc19882dfc89211cf188284c78ff79a08b23802:

  ARM: dts: marvell: dove: drop incorrect reg in fixed regulators (2023-08-12 17:05:33 +0200)

----------------------------------------------------------------
mvebu dt for 6.6 (part 1)

Fix style issue and incorrect syntax

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: marvell: add missing space before {
      ARM: dts: marvell: armada: drop incorrect reg in fixed regulators
      ARM: dts: marvell: dove: drop incorrect reg in fixed regulators

 .../boot/dts/marvell/armada-370-dlink-dns327l.dts  |  83 ++++++++--------
 .../dts/marvell/armada-370-seagate-nas-4bay.dts    |  43 ++++-----
 .../dts/marvell/armada-370-seagate-nas-xbay.dtsi   |  48 ++++------
 .../armada-370-seagate-personal-cloud-2bay.dts     |  21 ++---
 .../marvell/armada-370-seagate-personal-cloud.dtsi |  45 ++++-----
 .../dts/marvell/armada-370-synology-ds213j.dts     |  54 +++++------
 .../dts/marvell/armada-382-rd-ac3x-48g4x2xl.dts    |   6 +-
 .../boot/dts/marvell/armada-xp-synology-ds414.dts  | 105 ++++++++++-----------
 arch/arm/boot/dts/marvell/dove-cm-a510.dtsi        |  18 ++--
 arch/arm/boot/dts/marvell/dove-cubox.dts           |  29 +++---
 arch/arm/boot/dts/marvell/dove-d3plug.dts          |  29 +++---
 arch/arm/boot/dts/marvell/dove-sbc-a510.dts        |  30 +++---
 arch/arm/boot/dts/marvell/kirkwood-l-50.dts        |   4 +-
 arch/arm/boot/dts/marvell/pxa168.dtsi              |   2 +-
 arch/arm/boot/dts/marvell/pxa910.dtsi              |   2 +-
 15 files changed, 228 insertions(+), 291 deletions(-)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
