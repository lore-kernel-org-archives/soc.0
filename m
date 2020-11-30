Return-Path: <SRS0=f5Ih=FE=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C030EC63777
	for <soc@archiver.kernel.org>; Mon, 30 Nov 2020 16:00:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7BBFE2076E; Mon, 30 Nov 2020 16:00:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2F9A205F4;
	Mon, 30 Nov 2020 15:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2F9A205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gregory.clement@bootlin.com
X-Originating-IP: 91.175.115.186
Received: from localhost (91-175-115-186.subs.proxad.net [91.175.115.186])
	(Authenticated sender: gregory.clement@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 0CC21FF80B;
	Mon, 30 Nov 2020 15:59:56 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v5.11 (#1)
Date: Mon, 30 Nov 2020 16:59:56 +0100
Message-ID: <87k0u2j0n7.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for arm for mvebu for v5.11.

Gregory

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-arm-5.11-1

for you to fetch changes up to d7ce8739f50e9e8c55a3c7651ebfbca57199553f:

  MAINTAINERS: switch mvebu tree to kernel.org (2020-11-29 11:59:17 +0100)

----------------------------------------------------------------
mvebu arm for 5.11 (part 1)

Update MAINTAINER file:
 - add new 98DX3236 based boards
 - point new git repository for mvebu

----------------------------------------------------------------
Gregory CLEMENT (1):
      MAINTAINERS: switch mvebu tree to kernel.org

Luka Kovacic (1):
      MAINTAINERS: Add an entry for MikroTik CRS3xx 98DX3236 boards

 MAINTAINERS | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
