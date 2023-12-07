Return-Path: <SRS0=HXi2=HS=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAD3C4167B
	for <soc@archiver.kernel.org>; Thu,  7 Dec 2023 20:41:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0E73DC433C8; Thu,  7 Dec 2023 20:41:42 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51C10C433C7;
	Thu,  7 Dec 2023 20:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51C10C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rBLBi-00060I-20; Thu, 07 Dec 2023 21:41:38 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.7
Date: Thu, 07 Dec 2023 21:41:37 +0100
Message-ID: <2709704.mvXUDI8C0e@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find a below a collection of fixes for the current release 6.7
cycle.

Please pull

Thanks
Heiko


The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.7-rockchip-dtsfixes1

for you to fetch changes up to 37f3d6108730713c411827ab4af764909f4dfc78:

  arm64: dts: rockchip: Fix eMMC Data Strobe PD on rk3588 (2023-12-06 10:38:03 +0100)

----------------------------------------------------------------
Devicetree fixes for the 6.7-cycle.

All over the place this time. From adapting the size of the vdec nodes
on rk3328 and rk3399, fixing some wrong pinctrl settings on rk3128 and
the Turing RK1 board, emmc-settings fixes on rk3588 and interrupt-name
mishaps, down to some dt-cleanups.

Also this adds the missing rockchip,rk3588-pmugrf compatible to the soc
grf binding, that I somehow messed up during the pull requests for the
-rc1 . At least with it included the dt-checker is happier.

----------------------------------------------------------------
Alex Bee (2):
      arm64: dts: rockchip: Expand reg size of vdec node for RK3399
      ARM: dts: rockchip: Fix sdmmc_pwren's pinmux setting for RK3128

Heiko Stuebner (2):
      arm64: dts: rockchip: fix rk356x pcie msg interrupt name
      arm64: dts: rockchip: drop interrupt-names property from rk3588s dfi

Jonas Karlman (1):
      arm64: dts: rockchip: Expand reg size of vdec node for RK3328

Krzysztof Kozlowski (2):
      ARM: dts: rockchip: minor whitespace cleanup around '='
      arm64: dts: rockchip: minor whitespace cleanup around '='

Rob Herring (1):
      arm64: dts: rockchip: Fix PCI node addresses on rk3399-gru

Sam Edwards (2):
      arm64: dts: rockchip: Fix Turing RK1 interrupt pinctrls
      arm64: dts: rockchip: Fix eMMC Data Strobe PD on rk3588

Sascha Hauer (1):
      dt-bindings: soc: rockchip: grf: add rockchip,rk3588-pmugrf

 Documentation/devicetree/bindings/soc/rockchip/grf.yaml  | 1 +
 arch/arm/boot/dts/rockchip/rk3128.dtsi                   | 2 +-
 arch/arm/boot/dts/rockchip/rk322x.dtsi                   | 6 +++---
 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts    | 2 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi                 | 2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru-chromebook.dtsi  | 3 +--
 arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts | 4 ++--
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi             | 1 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi                 | 6 ++++--
 arch/arm64/boot/dts/rockchip/rk356x.dtsi                 | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi      | 4 ++--
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts      | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-pinctrl.dtsi        | 2 +-
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi                | 1 -
 14 files changed, 20 insertions(+), 18 deletions(-)



