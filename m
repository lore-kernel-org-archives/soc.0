Return-Path: <SRS0=6kO+=FB=bootlin.com=alexandre.belloni@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA42C3E8C5
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 21:41:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2AC2721534; Fri, 27 Nov 2020 21:41:45 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53F6120B80;
	Fri, 27 Nov 2020 21:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53F6120B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexandre.belloni@bootlin.com
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 762E8FF804;
	Fri, 27 Nov 2020 21:41:40 +0000 (UTC)
Date: Fri, 27 Nov 2020 22:41:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	arm@kernel.org, soc@kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] ARM: at91: Drivers for 5.11 (bis)
Message-ID: <20201127214140.GA1688544@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Arnd, Olof,

As discussed with Arnd, here are two cleanup patches for at91_cf. My end
goal is to get rid of include/linux/platform_data/atmel.h.
Also a very small patch adding SoC IDs for the sam9x60 SiPs.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux tags/at91-drivers-5.11

for you to fetch changes up to 264788c8f23703d0d3e967fb5aea83eb64d2cb2b:

  pcmcia: at91_cf: remove platform data support (2020-11-27 22:25:15 +0100)

----------------------------------------------------------------
AT91 drivers for 5.11:

 - add sam9x60 SiP IDs
 - at91_cf cleanups

----------------------------------------------------------------
Alexandre Belloni (2):
      pcmcia: at91_cf: move definitions locally
      pcmcia: at91_cf: remove platform data support

Kai Stuhlemmer (1):
      ARM: at91: sam9x60 SiP types added to soc description

 drivers/pcmcia/Kconfig              |  1 +
 drivers/pcmcia/at91_cf.c            | 50 ++++++++++++++-----------------------
 drivers/soc/atmel/soc.c             |  6 +++++
 drivers/soc/atmel/soc.h             |  3 +++
 include/linux/platform_data/atmel.h | 12 ---------
 5 files changed, 29 insertions(+), 43 deletions(-)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
