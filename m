Return-Path: <SRS0=hAZI=PD=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C526C433EF
	for <soc@archiver.kernel.org>; Fri, 15 Oct 2021 16:38:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5394861151; Fri, 15 Oct 2021 16:38:58 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6303860C41;
	Fri, 15 Oct 2021 16:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6303860C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A77CB60009;
	Fri, 15 Oct 2021 16:38:52 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v5.16 (#1)
Date: Fri, 15 Oct 2021 18:38:42 +0200
Message-ID: <874k9imeel.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for dt for mvebu for v5.16.

Gregory

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt-5.16-1

for you to fetch changes up to bf05b706a6eaf769b7a99c475ac702b7e29fc25a:

  ARM: dts: mvebu: add device tree for netgear gs110emx switch (2021-10-13 16:41:44 +0200)

----------------------------------------------------------------
mvebu dt for 5.16 (part 1)

Add support for Netgear GS110EMX switch (Armada 381 SoC based)

----------------------------------------------------------------
Marcel Ziswiler (1):
      ARM: dts: mvebu: add device tree for netgear gs110emx switch

 arch/arm/boot/dts/Makefile                        |   1 +
 arch/arm/boot/dts/armada-381-netgear-gs110emx.dts | 295 ++++++++++++++++++++++
 2 files changed, 296 insertions(+)
 create mode 100644 arch/arm/boot/dts/armada-381-netgear-gs110emx.dts

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
