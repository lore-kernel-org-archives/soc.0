Return-Path: <SRS0=CH86=FK=bootlin.com=alexandre.belloni@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89D8EC4361B
	for <soc@archiver.kernel.org>; Sun,  6 Dec 2020 01:38:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 33C1A22D2A; Sun,  6 Dec 2020 01:38:46 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A00BB23108;
	Sun,  6 Dec 2020 01:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A00BB23108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexandre.belloni@bootlin.com
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 61E80100003;
	Sun,  6 Dec 2020 01:38:40 +0000 (UTC)
Date: Sun, 6 Dec 2020 02:38:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	arm@kernel.org, soc@kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] ARM: at91: DT for 5.11 #2
Message-ID: <20201206013840.GA627225@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Arnd, Olof,

Here is a second round of DT updates, Some are following patches series
that made it in other subsystems and it would be nice to have them in
the same release. Other are fixes worth having in v5.11.

The following changes since commit e1062fa7292f1e3744db0a487c4ac0109e09b03d:

  ARM: dts: at91: sama5d3_xplained: add pincontrol for USB Host (2020-11-24 12:11:27 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux tags/at91-dt-5.11-2

for you to fetch changes up to 85b8350ae99d1300eb6dc072459246c2649a8e50:

  ARM: dts: at91: sama5d2: fix CAN message ram offset and size (2020-12-03 21:44:36 +0100)

----------------------------------------------------------------
AT91 DT for 5.11 #2:

 - switch to new TCB PWM bindings
 - rework ADC bindings
 - fix sama5d2 securam and can1

----------------------------------------------------------------
Alexandre Belloni (4):
      ARM: dts: at91: kizbox: switch to new pwm-atmel-tcb binding
      ARM: dts: at91: sama5d3: use proper ADC compatible
      ARM: dts: at91: at91sam9rl: fix ADC triggers
      ARM: dts: at91: remove deprecated ADC properties

Claudiu Beznea (2):
      ARM: dts: at91: sam9x60ek: remove bypass property
      ARM: dts: at91: sama5d2: map securam as device

Nicolas Ferre (1):
      ARM: dts: at91: sama5d2: fix CAN message ram offset and size

 arch/arm/boot/dts/at91-kizbox.dts    | 45 ++++++++++++++++++++++++------------
 arch/arm/boot/dts/at91-sam9x60ek.dts |  4 ----
 arch/arm/boot/dts/at91sam9260.dtsi   | 25 --------------------
 arch/arm/boot/dts/at91sam9g45.dtsi   | 27 ----------------------
 arch/arm/boot/dts/at91sam9rl.dtsi    | 25 --------------------
 arch/arm/boot/dts/at91sam9x5.dtsi    | 28 ----------------------
 arch/arm/boot/dts/sama5d2.dtsi       |  7 +++---
 arch/arm/boot/dts/sama5d3.dtsi       | 26 +--------------------
 arch/arm/boot/dts/sama5d4.dtsi       | 22 ------------------
 9 files changed, 35 insertions(+), 174 deletions(-)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
