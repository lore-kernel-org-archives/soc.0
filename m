Return-Path: <SRS0=D1Ep=RC=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49814C433EF
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 17:36:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A0A3C36AE9; Fri, 17 Dec 2021 17:36:49 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EEEDCC36AE1;
	Fri, 17 Dec 2021 17:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EEEDCC36AE1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 8640924000A;
	Fri, 17 Dec 2021 17:36:45 +0000 (UTC)
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v5.17 (#1)
Date: Fri, 17 Dec 2021 18:36:45 +0100
Message-ID: <875yrnm8uq.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

Here is the first pull request for dt for mvebu for v5.17.

Gregory

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-dt-5.17-1

for you to fetch changes up to 62480772263ab6b52e758f2346c70a526abd1d28:

  ARM: dts: armada-38x: Add generic compatible to UART nodes (2021-12-17 18=
:11:53 +0100)

----------------------------------------------------------------
mvebu dt for 5.17 (part 1)

Add generic compatible to UART nodes on Armada 38x

----------------------------------------------------------------
Marek Beh=C3=BAn (1):
      ARM: dts: armada-38x: Add generic compatible to UART nodes

 arch/arm/boot/dts/armada-38x.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--=20
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
