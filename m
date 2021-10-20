Return-Path: <SRS0=WQc2=PI=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEACC433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 09:27:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 481F160241; Wed, 20 Oct 2021 09:27:30 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC77160230;
	Wed, 20 Oct 2021 09:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC77160230
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from [213.208.157.36] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1md7sd-0002Zf-UB; Wed, 20 Oct 2021 11:27:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 5.16 #2
Date: Wed, 20 Oct 2021 11:27:22 +0200
Message-ID: <3630369.N7QejLDta5@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 3e6f8124a78840d074fab36853ee1f5a2e7cffe5:

  ARM: dts: rockchip: swap timer clock-names (2021-09-20 15:22:48 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.16-rockchip-dts32-2

for you to fetch changes up to 97ef6931208f7ab09f52dd291320aa53878aaa53:

  ARM: dts: rockchip: remove usb-phy fallback string from rk3066a/rk3188 (2021-10-20 09:39:26 +0200)

----------------------------------------------------------------
Adapt gpio subnode names to match the yaml binding and removal
of the actually non-matching fallback-string for usb-phys
on rk3066/rk3188 (most-specific compatible is and must always
be used).

----------------------------------------------------------------
Johan Jonker (2):
      ARM: dts: rockchip: change gpio nodenames
      ARM: dts: rockchip: remove usb-phy fallback string from rk3066a/rk3188

 arch/arm/boot/dts/rk3036.dtsi  |  6 +++---
 arch/arm/boot/dts/rk3066a.dtsi | 15 +++++++--------
 arch/arm/boot/dts/rk3188.dtsi  | 11 +++++------
 arch/arm/boot/dts/rk322x.dtsi  |  8 ++++----
 arch/arm/boot/dts/rk3288.dtsi  | 18 +++++++++---------
 arch/arm/boot/dts/rv1108.dtsi  |  8 ++++----
 6 files changed, 32 insertions(+), 34 deletions(-)



