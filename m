Return-Path: <SRS0=pj2G=KI=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5955AC5478C
	for <soc@archiver.kernel.org>; Sat,  2 Mar 2024 12:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1DE02C43394; Sat,  2 Mar 2024 12:17:07 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A638C433C7;
	Sat,  2 Mar 2024 12:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2A638C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rgOIa-0005Ih-9D; Sat, 02 Mar 2024 13:17:04 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.9 #2
Date: Sat, 02 Mar 2024 13:17:03 +0100
Message-ID: <3258282.tdWV9SEqCh@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 15a5ed03000cf61daf87d14628085cb1bc8ae72c:

  ARM: dts: rockchip: fix rk322x hdmi ports node (2024-02-13 20:22:34 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.9-rockchip-dts32-2

for you to fetch changes up to 391f46c775fa2108952c8f9a88b5bea2c3c74d1d:

  ARM: dts: rockchip: Wifi improvements for Sonoff iHost (2024-02-28 00:00:55 +0100)

----------------------------------------------------------------
Small Sonoff iHost improvements (wifi and mmc aliases)

----------------------------------------------------------------
Tim Lunn (2):
      ARM: dts: rockchip: mmc aliases for Sonoff iHost
      ARM: dts: rockchip: Wifi improvements for Sonoff iHost

 arch/arm/boot/dts/rockchip/rv1126-sonoff-ihost.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)



