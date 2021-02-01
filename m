Return-Path: <SRS0=7E5q=HD=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4F6C433DB
	for <soc@archiver.kernel.org>; Mon,  1 Feb 2021 16:26:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2319164E9E; Mon,  1 Feb 2021 16:26:17 +0000 (UTC)
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4AB264DAF;
	Mon,  1 Feb 2021 16:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4AB264DAF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gregory.clement@bootlin.com
Received: from localhost (lfbn-lyo-1-1912-141.w90-65.abo.wanadoo.fr [90.65.91.141])
	(Authenticated sender: gregory.clement@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id B579A200006;
	Mon,  1 Feb 2021 16:26:11 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v5.12 (#1)
Date: Mon, 01 Feb 2021 17:26:11 +0100
Message-ID: <87sg6fn49o.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for dt for mvebu for v5.12.

Gregory

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt-5.12-1

for you to fetch changes up to 46ecdfc1830eaa40a11d7f832089c82b0e67ea96:

  ARM: dts: armada388-helios4: assign pinctrl to each fan (2021-01-29 16:25:31 +0100)

----------------------------------------------------------------
mvebu dt for 5.12 (part 1)

Improve LED and fan support on Helios4 boad (Armada 388 based)
Add ECC configuration for Linksys board (Aramda 385 based)

----------------------------------------------------------------
Rosen Penev (3):
      ARM: dts: armada-385-linksys: fix usage with newer devices
      ARM: dts: armada388-helios4: assign pinctrl to LEDs
      ARM: dts: armada388-helios4: assign pinctrl to each fan

 arch/arm/boot/dts/armada-385-linksys.dtsi |  2 ++
 arch/arm/boot/dts/armada-388-helios4.dts  | 28 ++++++++++++++++++++++------
 2 files changed, 24 insertions(+), 6 deletions(-)
