Return-Path: <SRS0=FE/q=TV=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09FAC433F5
	for <soc@archiver.kernel.org>; Thu, 10 Mar 2022 01:38:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BDC1C340EF; Thu, 10 Mar 2022 01:38:04 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 73C11C340E8;
	Thu, 10 Mar 2022 01:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 73C11C340E8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nS7kc-0000Oz-Oy; Thu, 10 Mar 2022 02:37:58 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.18 #2
Date: Thu, 10 Mar 2022 02:37:57 +0100
Message-ID: <13959624.7hp8jFWaoN@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below some somewhat tiny additional Rockchip changes
ideally still for 5.18.

I can also move them to 5.19 if needed though.


So if it's not too late yet, please pull!

Thanks
Heiko


The following changes since commit a0024f55eb5b741b76a0b950f1222ddbab6a9fc9:

  arm64: dts: rockchip: align Google CROS EC PWM node name with dtschema (2022-02-24 00:07:56 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.18-rockchip-dts64-2

for you to fetch changes up to 9d25aadd55bb8c37c468661b506f932d15492028:

  arm64: dts: rockchip: Add #clock-cells value for rk805 (2022-03-05 18:16:45 +0100)

----------------------------------------------------------------
Some corrections for the rk80x pmic nodes, a supply fix for rk3399-firefly
and addition of the usb/sata combophys for rk3568.

----------------------------------------------------------------
Chris Morgan (2):
      arm64: dts: rockchip: Remove vcc13 and vcc14 for rk808
      arm64: dts: rockchip: Add #clock-cells value for rk805

Rob Herring (1):
      arm64: dts: rockchip: Fix SDIO regulator supply properties on rk3399-firefly

Yifeng Zhao (1):
      arm64: dts: rockchip: add naneng combo phy nodes for rk3568

 arch/arm64/boot/dts/rockchip/rk3328-a1.dts         |  1 +
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    |  4 +-
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |  2 -
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |  2 -
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           | 21 ++++++++++
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           | 47 ++++++++++++++++++++++
 6 files changed, 71 insertions(+), 6 deletions(-)



