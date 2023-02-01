Return-Path: <SRS0=2vJj=55=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC43C05027
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 23:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC7E8C433D2; Wed,  1 Feb 2023 23:02:01 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5FABFC433EF;
	Wed,  1 Feb 2023 23:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5FABFC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from p508fda63.dip0.t-ipconnect.de ([80.143.218.99] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pNM72-0007LN-Ls; Thu, 02 Feb 2023 00:01:56 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.2
Date: Thu, 02 Feb 2023 00:01:54 +0100
Message-ID: <3514663.mvXUDI8C0e@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.2-rockchip-dtsfixes1

for you to fetch changes up to b67b09733d8a41eec33d5d37be2f8cff8af82a5e:

  arm64: dts: rockchip: align rk3399 DMC OPP table with bindings (2023-01-29 23:35:12 +0100)

----------------------------------------------------------------
Fixes to adapt to correct binding behaviour and fixes for devices on some boards

Most notably may be the adaption of lower thermal limits for the pinephone
pro, where the original hiher ones could result in (possibly permanent)
display issues.

----------------------------------------------------------------
Andy Yan (1):
      arm64: dts: rockchip: add io domain setting to rk3566-box-demo

Arnaud Ferraris (1):
      arm64: dts: rockchip: fix input enable pinconf on rk3399

Chukun Pan (1):
      arm64: dts: rockchip: remove unsupported property from sdmmc2 for rock-3a

Corentin Labbe (1):
      arm64: dts: rockchip: use correct reset names for rk3399 crypto nodes

Dan Johansen (1):
      arm64: dts: rockchip: set sdmmc0 speed to sd-uhs-sdr50 on rock-3a

Jarrah Gosbell (1):
      arm64: dts: rockchip: reduce thermal limits on rk3399-pinephone-pro

Jensen Huang (1):
      arm64: dts: rockchip: add missing #interrupt-cells to rk356x pcie2x1

Johan Jonker (1):
      ARM: dts: rockchip: add power-domains property to dp node on rk3288

Jonas Karlman (1):
      arm64: dts: rockchip: fix probe of analog sound card on rock-3a

Krzysztof Kozlowski (2):
      arm64: dts: rockchip: drop unused LED mode property from rk3328-roc-cc
      arm64: dts: rockchip: align rk3399 DMC OPP table with bindings

 arch/arm/boot/dts/rk3288.dtsi                         |  1 +
 arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts        |  2 --
 arch/arm64/boot/dts/rockchip/rk3399-op1-opp.dtsi      |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts |  7 +++++++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi              |  6 ++----
 arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts      | 11 +++++++++++
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts       |  5 +++--
 arch/arm64/boot/dts/rockchip/rk356x.dtsi              |  1 +
 8 files changed, 26 insertions(+), 9 deletions(-)



