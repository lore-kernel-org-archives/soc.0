Return-Path: <SRS0=OO9/=JE=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B90C433B4
	for <soc@archiver.kernel.org>; Wed,  7 Apr 2021 20:39:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E11956120E; Wed,  7 Apr 2021 20:39:13 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 746E8611CC;
	Wed,  7 Apr 2021 20:39:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 746E8611CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gregory.clement@bootlin.com
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
	(Authenticated sender: gregory.clement@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 565C8240008;
	Wed,  7 Apr 2021 20:39:08 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v5.13 (#1)
Date: Wed, 07 Apr 2021 22:39:08 +0200
Message-ID: <87v98xbzir.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for dt for mvebu for v5.13.

This one is latter that the other ones, because I've just found a
patch pending since December. I hope it is not too late.

Gregory

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt-5.13-1

for you to fetch changes up to c6dfc019c239c76c179ebbccbac27170ba1e3bb6:

  ARM: dts: mvebu: Add device tree for ATL-x530 Board (2021-04-07 22:31:30 +0200)

----------------------------------------------------------------
mvebu dt for 5.13 (part 1)

Add support for ATL-x530 Board (Armada 38x based)

----------------------------------------------------------------
Aryan Srivastava (1):
      ARM: dts: mvebu: Add device tree for ATL-x530 Board

 arch/arm/boot/dts/Makefile                |   1 +
 arch/arm/boot/dts/armada-385-atl-x530.dts | 235 ++++++++++++++++++++++++++++++
 2 files changed, 236 insertions(+)
 create mode 100644 arch/arm/boot/dts/armada-385-atl-x530.dts
-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
