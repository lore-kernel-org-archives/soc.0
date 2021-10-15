Return-Path: <SRS0=hAZI=PD=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97F03C433F5
	for <soc@archiver.kernel.org>; Fri, 15 Oct 2021 16:38:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 71C3D61164; Fri, 15 Oct 2021 16:38:05 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E199D60E0C;
	Fri, 15 Oct 2021 16:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E199D60E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 057FA10000A;
	Fri, 15 Oct 2021 16:37:59 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v5.16 (#1)
Date: Fri, 15 Oct 2021 18:37:53 +0200
Message-ID: <877deemefy.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for dt64 for mvebu for v5.16.

Gregory

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-5.16-1

for you to fetch changes up to 73792919128304938412194d047be3c61cccc76d:

  arm64: dts: marvell: add Globalscale MOCHAbin (2021-10-13 16:45:59 +0200)

----------------------------------------------------------------
mvebu dt64 for 5.16 (part 1)

Add support for Globalscale MOCHAbin an Armada 7040 based development
board.

----------------------------------------------------------------
Robert Marko (1):
      arm64: dts: marvell: add Globalscale MOCHAbin

 arch/arm64/boot/dts/marvell/Makefile               |   1 +
 .../boot/dts/marvell/armada-7040-mochabin.dts      | 458 +++++++++++++++++++++
 2 files changed, 459 insertions(+)
 create mode 100644 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
