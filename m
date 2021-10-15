Return-Path: <SRS0=hAZI=PD=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF35CC433F5
	for <soc@archiver.kernel.org>; Fri, 15 Oct 2021 16:39:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C74D761181; Fri, 15 Oct 2021 16:39:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABED060E0C;
	Fri, 15 Oct 2021 16:39:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABED060E0C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 3790B1BF207;
	Fri, 15 Oct 2021 16:39:50 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: defconfig for v5.16 (#1)
Date: Fri, 15 Oct 2021 18:39:43 +0200
Message-ID: <871r4mmecw.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for defconfig for mvebu for v5.16.

Gregory

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-defconfig-5.16-1

for you to fetch changes up to 8d41453493c28d489aeec583fcf3f9d9f4ef0b9c:

  ARM: mvebu_v7_defconfig: rebuild default configuration (2021-10-13 16:37:12 +0200)

----------------------------------------------------------------
mvebu defconfig for 5.16 (part 1)

Update defconfig and enable mtd physmap

----------------------------------------------------------------
Marcel Ziswiler (2):
      ARM: mvebu_v7_defconfig: enable mtd physmap
      ARM: mvebu_v7_defconfig: rebuild default configuration

 arch/arm/configs/mvebu_v7_defconfig | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
