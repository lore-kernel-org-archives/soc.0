Return-Path: <SRS0=RoS7=H7=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A47C3DA6E
	for <soc@archiver.kernel.org>; Wed, 20 Dec 2023 16:52:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3075C433CA; Wed, 20 Dec 2023 16:52:21 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA2F8C433C8;
	Wed, 20 Dec 2023 16:52:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA2F8C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BEA3D1BF20B;
	Wed, 20 Dec 2023 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703091138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=9cOvSdk8j4XO95vSLzZDaIW5FLaLfTn6Pyp+jwHVNCc=;
	b=GDOsQn2PeHRdY/FWe87yfLbikSWEHpHZP/6qe7EbSRzy7m7FHfxhAUSoVLiy3R8lG0V4zb
	HuTxuJlCr3p+JZi0DvGp9SM6NXTrdZ7+dSdgixzWEDhiJucdRjz7b2bQlKWwOIw720SKTz
	7GAeipEt04yIQIrdvkfK9TCcwWjjv8/pubG5Y4qrkwTrGXc8IxHq/PqfHK96ElfdHeRCHi
	d+jBhImigFv59+PNEh6KyRVoZj431KyUrZPRC3wF/mF/kd3RXVkQeW5Di/4vrYODZV4ebG
	eB7CwDuO4ZBytmS923JVpjwGQs3pbyX/LwxFSKufXnZnWLcWvTCn1jORkjaWXg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v6.8 (#1)
Date: Wed, 20 Dec 2023 17:52:17 +0100
Message-ID: <87o7ekbyv2.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for dt for mvebu for v6.8.

Gregory

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt-6.8-1

for you to fetch changes up to 62f34e3ec2befcbe5d8a5003f21d53dab80bb03c:

  ARM: dts: marvell: make dts use gpio-fan matrix instead of array (2023-12-15 15:26:41 +0100)

----------------------------------------------------------------
mvebu dt for 6.8 (part 1)

Fix dt for gpio and switch nodes

----------------------------------------------------------------
David Heidelberg (1):
      ARM: dts: marvell: make dts use gpio-fan matrix instead of array

Linus Walleij (1):
      ARM: dts: marvell: Fix some common switch mistakes

 arch/arm/boot/dts/marvell/armada-370-rd.dts        |  26 +++---
 .../dts/marvell/armada-370-seagate-nas-2bay.dts    |   8 +-
 .../dts/marvell/armada-370-seagate-nas-4bay.dts    |   8 +-
 .../dts/marvell/armada-370-synology-ds213j.dts     |  16 ++--
 .../dts/marvell/armada-381-netgear-gs110emx.dts    |  44 +++++----
 .../dts/marvell/armada-385-clearfog-gtr-l8.dts     |  38 ++++----
 .../dts/marvell/armada-385-clearfog-gtr-s4.dts     |  22 ++---
 arch/arm/boot/dts/marvell/armada-385-linksys.dtsi  |  18 ++--
 .../boot/dts/marvell/armada-385-synology-ds116.dts |  16 ++--
 .../boot/dts/marvell/armada-385-turris-omnia.dts   |  20 ++--
 arch/arm/boot/dts/marvell/armada-388-clearfog.dts  |  20 ++--
 arch/arm/boot/dts/marvell/armada-388-gp.dts        |   4 +-
 .../boot/dts/marvell/armada-xp-linksys-mamba.dts   |  18 ++--
 arch/arm/boot/dts/marvell/kirkwood-dnskw.dtsi      |   6 +-
 .../dts/marvell/kirkwood-linkstation-6282.dtsi     |   9 +-
 .../dts/marvell/kirkwood-linkstation-lswxl.dts     |   9 +-
 arch/arm/boot/dts/marvell/kirkwood-lsxl.dtsi       |   9 +-
 arch/arm/boot/dts/marvell/kirkwood-ns2max.dts      |  18 ++--
 arch/arm/boot/dts/marvell/kirkwood-ns2mini.dts     |  18 ++--
 arch/arm/boot/dts/marvell/kirkwood-synology.dtsi   | 102 +++++++++++----------
 .../boot/dts/marvell/mvebu-linkstation-fan.dtsi    |   8 +-
 21 files changed, 217 insertions(+), 220 deletions(-)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
