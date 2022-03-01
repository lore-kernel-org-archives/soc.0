Return-Path: <SRS0=TJev=TM=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D18C433F5
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 14:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9399EC340F6; Tue,  1 Mar 2022 14:19:16 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E8E5C340EE;
	Tue,  1 Mar 2022 14:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E8E5C340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3BEDC240008;
	Tue,  1 Mar 2022 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1646144350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Muk6fy/4Kn+GgGVfjWZeLU/BtZ5qcKTYKFP0fw3SlLw=;
	b=DDQ/hiozA8bXglm+gbtxPHymqPGOO0lVufW9wBtMHWxdon58pwwyZM+aFqI8TyWy59tPsU
	oH+kRZzTODgzgwTcgJeQ7sPdbq2ch0jb3y6O17QR8cpjaAEJEmf6HiblcpQYqdEQ6UKcBK
	mwO7dxWM287UWPFSnGSFPdF6aBheJFxdwU96EryL9sldFvCppDF8tG11WoT8lLjYbnelKh
	k46f9F3WybjkXFr/KKNQ4JXDylpHgdvVHK9cxiNirIfNTG6AZJKUH5hhPGl3/Q/I/GjdDf
	Cis+uCPPQb6TyOaMdddrl8aMdxZsuLs6FQLoBuRDM3hNf7cEOaf2yxmLhDVtmA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v5.18 (#1)
Date: Tue, 01 Mar 2022 15:19:08 +0100
Message-ID: <87sfs1zrfn.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for arm for mvebu for v5.18.

Gregory

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-arm-5.18-1

for you to fetch changes up to bba14b329157d914b81ec764b87d60ee97c05e57:

  ARM: orion/gpio: Get rid of unused first parameter in orion_gpio_init() (2022-02-03 09:25:11 +0100)

----------------------------------------------------------------
mvebu arm for 5.18 (part 1)

gpio clean-up for Orion

----------------------------------------------------------------
Andy Shevchenko (1):
      ARM: orion/gpio: Get rid of unused first parameter in orion_gpio_init()

 arch/arm/mach-dove/irq.c                      | 6 +++---
 arch/arm/mach-mv78xx0/irq.c                   | 3 +--
 arch/arm/mach-orion5x/irq.c                   | 2 +-
 arch/arm/plat-orion/gpio.c                    | 8 ++------
 arch/arm/plat-orion/include/plat/orion-gpio.h | 3 +--
 5 files changed, 8 insertions(+), 14 deletions(-)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
