Return-Path: <SRS0=6kO+=FB=bootlin.com=alexandre.belloni@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0389EC63777
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 22:04:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C45B622210; Fri, 27 Nov 2020 22:04:06 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 913FB221FF;
	Fri, 27 Nov 2020 22:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 913FB221FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexandre.belloni@bootlin.com
Received: from localhost (lfbn-lyo-1-997-19.w86-194.abo.wanadoo.fr [86.194.74.19])
	(Authenticated sender: alexandre.belloni@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id A4EB4240002;
	Fri, 27 Nov 2020 22:04:03 +0000 (UTC)
Date: Fri, 27 Nov 2020 23:04:03 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	arm@kernel.org, soc@kernel.org
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] ARM: at91: DT for 5.11
Message-ID: <20201127220403.GA1735041@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Arnd, Olof,

Here are the DT changes for 5.11 which contains non urgent fixes.

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/at91/linux tags/at91-dt-5.11

for you to fetch changes up to e1062fa7292f1e3744db0a487c4ac0109e09b03d:

  ARM: dts: at91: sama5d3_xplained: add pincontrol for USB Host (2020-11-24 12:11:27 +0100)

----------------------------------------------------------------
AT91 DT for 5.11:

 - fix USB host pinctrl
 - fix DT schema warnings

----------------------------------------------------------------
Alexander Dahl (2):
      ARM: dts: at91: smartkiz: Reference led node directly
      ARM: dts: at91: Fix schema warnings for pwm-leds

Bartosz Golaszewski (1):
      ARM: dts: at91: at91-sama5d27_som1: fix EEPROM compatible

Cristian Birsan (3):
      ARM: dts: at91: sam9x60: add pincontrol for USB Host
      ARM: dts: at91: sama5d4_xplained: add pincontrol for USB Host
      ARM: dts: at91: sama5d3_xplained: add pincontrol for USB Host

 arch/arm/boot/dts/at91-kizbox.dts             | 10 +++++-----
 arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  8 ++++----
 arch/arm/boot/dts/at91-kizbox3-hs.dts         | 16 ++++++++--------
 arch/arm/boot/dts/at91-kizbox3_common.dtsi    | 10 +++++-----
 arch/arm/boot/dts/at91-kizboxmini-common.dtsi |  8 ++++----
 arch/arm/boot/dts/at91-sam9x60ek.dts          |  9 +++++++++
 arch/arm/boot/dts/at91-sama5d27_som1.dtsi     |  2 +-
 arch/arm/boot/dts/at91-sama5d3_xplained.dts   |  7 +++++++
 arch/arm/boot/dts/at91-sama5d4_xplained.dts   |  7 +++++++
 arch/arm/boot/dts/at91-smartkiz.dts           |  6 ++----
 arch/arm/boot/dts/at91sam9m10g45ek.dts        | 10 +++++-----
 arch/arm/boot/dts/at91sam9rlek.dts            | 10 +++++-----
 12 files changed, 62 insertions(+), 41 deletions(-)

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
