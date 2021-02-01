Return-Path: <SRS0=7E5q=HD=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02789C433E0
	for <soc@archiver.kernel.org>; Mon,  1 Feb 2021 16:25:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B08AB64E8D; Mon,  1 Feb 2021 16:25:30 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9401164E9E;
	Mon,  1 Feb 2021 16:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9401164E9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gregory.clement@bootlin.com
X-Originating-IP: 90.65.91.141
Received: from localhost (lfbn-lyo-1-1912-141.w90-65.abo.wanadoo.fr [90.65.91.141])
	(Authenticated sender: gregory.clement@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 2AD081BF207;
	Mon,  1 Feb 2021 16:25:25 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v5.12 (#1)
Date: Mon, 01 Feb 2021 17:25:24 +0100
Message-ID: <87v9bbn4az.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for arm for mvebu for v5.12.

Gregory

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-arm-5.12-1

for you to fetch changes up to 2241ed9205ed91072d20ae10ad6904dc2bec5612:

  bus: mvebu-mbus: make iounmap() symmetric with ioremap() (2021-01-29 17:57:07 +0100)

----------------------------------------------------------------
mvebu arm for 5.12 (part 1)

Improve mvebu-mbus code readability.

----------------------------------------------------------------
Chris Packham (1):
      bus: mvebu-mbus: make iounmap() symmetric with ioremap()

 drivers/bus/mvebu-mbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
