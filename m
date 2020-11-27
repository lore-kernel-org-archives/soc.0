Return-Path: <SRS0=6kO+=FB=bootlin.com=alexandre.belloni@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01819C63777
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 21:08:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A5A442222C; Fri, 27 Nov 2020 21:08:50 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D2F722210;
	Fri, 27 Nov 2020 21:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D2F722210
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexandre.belloni@bootlin.com
X-Originating-IP: 86.194.74.19
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4614160002;
	Fri, 27 Nov 2020 21:08:45 +0000 (UTC)
Date: Fri, 27 Nov 2020 22:08:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	arm@kernel.org, soc@kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] ARM: at91: Drivers for 5.11
Message-ID: <20201127210844.GA1683573@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Arnd, Olof,

As discussed with Arnd, here are two cleanup patches for at91_cf. My end
goal is to get rid of include/linux/platform_data/atmel.h.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux tags/at91-drivers-5.11

for you to fetch changes up to 91be3e89f450aa738204f6629f06d8b0e3d8d77b:

  pcmcia: at91_cf: remove platform data support (2020-11-24 12:05:24 +0100)

----------------------------------------------------------------
AT91 drivers for 5.11:

 - at91_cf cleanups

----------------------------------------------------------------
Alexandre Belloni (2):
      pcmcia: at91_cf: move definitions locally
      pcmcia: at91_cf: remove platform data support

 drivers/pcmcia/Kconfig              |  1 +
 drivers/pcmcia/at91_cf.c            | 49 ++++++++++++++-----------------------
 include/linux/platform_data/atmel.h | 12 ---------
 3 files changed, 20 insertions(+), 42 deletions(-)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
