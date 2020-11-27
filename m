Return-Path: <SRS0=6kO+=FB=bootlin.com=alexandre.belloni@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5001DC3E8C5
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 21:55:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F336921D7A; Fri, 27 Nov 2020 21:55:22 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00D0321534;
	Fri, 27 Nov 2020 21:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00D0321534
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexandre.belloni@bootlin.com
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3AD8D240002;
	Fri, 27 Nov 2020 21:55:18 +0000 (UTC)
Date: Fri, 27 Nov 2020 22:55:17 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	arm@kernel.org, soc@kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] ARM: at91: defconfig for 5.11
Message-ID: <20201127215517.GA1733715@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Arnd, Olof,

Two patches limiting the number of compiled media drivers.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux tags/at91-defconfig-5.11

for you to fetch changes up to 036f224ef8f447928bfd3085220c28e158a4e4d6:

  ARM: configs: at91_dt: resync with media changes (2020-10-29 14:32:07 +0100)

----------------------------------------------------------------
AT91 defconfig for 5.11:

 - filter compiled media drivers

----------------------------------------------------------------
Eugen Hristev (2):
      ARM: configs: at91: sama5: resync with media changes
      ARM: configs: at91_dt: resync with media changes

 arch/arm/configs/at91_dt_defconfig | 5 +++++
 arch/arm/configs/sama5_defconfig   | 9 +++++++++
 2 files changed, 14 insertions(+)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
