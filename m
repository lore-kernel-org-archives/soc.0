Return-Path: <SRS0=6U1h=AJ=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B225C77B75
	for <soc@archiver.kernel.org>; Tue, 18 Apr 2023 09:52:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15332C4339C; Tue, 18 Apr 2023 09:52:15 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F0B06C433D2;
	Tue, 18 Apr 2023 09:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F0B06C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 576FF240005;
	Tue, 18 Apr 2023 09:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681811529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=2gAhcanSMqG2E1c+h/bcgQKJea+88ncGOlC1MPsv0Mk=;
	b=Mdn+ao1DMewSI/ilxGYZFTx0kEzMWKiWVlREh4kY7iXbe5ry3GWH4rGF7itHrwVIMro2jO
	mMK0j0pcQQByDRt1BnEUum0g/By4rig/P8cLf9uKwBJQYuMYn/rImYRgqRTeJuc/xx9XE1
	ypj89IBy4gtExmtvxoxCtjB/LIZD9zZHyWZ1C1QJU2wvJihdKSjZtCaul2TIPJOgtg43u1
	GwBf5/QsFF0rdkEtDJUf1/xAWQuyyUpnyzJBvVsStLSsPZMoXK1pnX5/s08Lq3N6FJVsPE
	+lPh2C1thdtMdFhmeEmQMylbXhQMSTccXLHuhDPRy111i71pJHEt1jHllOV7Kg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt for v6.4 (#1)
Date: Tue, 18 Apr 2023 11:52:07 +0200
Message-ID: <87edohzfeg.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Here is the first pull request for dt for mvebu for v6.4.

Gregory

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt-6.4-1

for you to fetch changes up to 0939de7d89d2efc4f565ce1961b4020787e9f297:

  ARM: dts: armada: Add missing phy-mode and fixed links (2023-04-07 17:28:24 +0200)

----------------------------------------------------------------
mvebu dt for 6.4 (part 1)

Add missing phy-mode and fixed links for kirkwood, orion5 and Armada
(370, XP, 38x) SoCs

----------------------------------------------------------------
Andrew Lunn (3):
      ARM: dts: kirkwood: Add missing phy-mode and fixed links
      ARM: dts: orion5: Add missing phy-mode and fixed links
      ARM: dts: armada: Add missing phy-mode and fixed links

 arch/arm/boot/dts/armada-370-rd.dts               | 2 +-
 arch/arm/boot/dts/armada-381-netgear-gs110emx.dts | 2 +-
 arch/arm/boot/dts/armada-385-clearfog-gtr-l8.dts  | 7 ++++++-
 arch/arm/boot/dts/armada-385-clearfog-gtr-s4.dts  | 7 ++++++-
 arch/arm/boot/dts/armada-385-linksys.dtsi         | 2 +-
 arch/arm/boot/dts/armada-385-turris-omnia.dts     | 2 --
 arch/arm/boot/dts/armada-xp-linksys-mamba.dts     | 2 +-
 arch/arm/boot/dts/kirkwood-dir665.dts             | 3 ++-
 arch/arm/boot/dts/kirkwood-l-50.dts               | 2 +-
 arch/arm/boot/dts/kirkwood-linksys-viper.dts      | 3 ++-
 arch/arm/boot/dts/kirkwood-mv88f6281gtw-ge.dts    | 3 ++-
 arch/arm/boot/dts/kirkwood-rd88f6281.dtsi         | 2 +-
 arch/arm/boot/dts/orion5x-netgear-wnr854t.dts     | 7 ++++++-
 13 files changed, 30 insertions(+), 14 deletions(-)
