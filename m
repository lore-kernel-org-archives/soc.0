Return-Path: <SRS0=xvFv=3X=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC71C4332F
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 13:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0164C433C1; Wed, 23 Nov 2022 13:50:38 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39158C433D6;
	Wed, 23 Nov 2022 13:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 39158C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oxq95-0008K2-CI; Wed, 23 Nov 2022 14:50:35 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.1 #2
Date: Wed, 23 Nov 2022 14:50:34 +0100
Message-ID: <9661382.T7Z3S40VBb@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.2-rockchip-dts32-1

for you to fetch changes up to da74858a475782a3f16470907814c8cc5950ad68:

  ARM: dts: rockchip: disable arm_global_timer on rk3066 and rk3188 (2022-11-15 12:02:38 +0100)

----------------------------------------------------------------
Disabling of the unreliable arm-global-timer on earliest
Rockchip SoCs, due to its frequency being bound to the
changing cpu clock.

----------------------------------------------------------------
Johan Jonker (1):
      ARM: dts: rockchip: disable arm_global_timer on rk3066 and rk3188

 arch/arm/boot/dts/rk3188.dtsi | 1 -
 arch/arm/boot/dts/rk3xxx.dtsi | 7 +++++++
 2 files changed, 7 insertions(+), 1 deletion(-)



