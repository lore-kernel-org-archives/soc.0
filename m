Return-Path: <SRS0=Tvk5=Z3=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A90C6FA82
	for <soc@archiver.kernel.org>; Sat, 24 Sep 2022 18:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A11D6C433D7; Sat, 24 Sep 2022 18:58:38 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 285F2C433C1;
	Sat, 24 Sep 2022 18:58:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 285F2C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from p57b775e6.dip0.t-ipconnect.de ([87.183.117.230] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ocAMD-0001hc-FK; Sat, 24 Sep 2022 20:58:33 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.1 #2
Date: Sat, 24 Sep 2022 20:58:30 +0200
Message-ID: <38114097.10thIPus4b@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below and in subsequent pull-requests
some more Rockchip changes for for 6.1

Please pull!

Thanks
Heiko


The following changes since commit 91419ae0420f0c91a326655d687b740826d0a3f9:

  arm64: dts: rockchip: use BCLK to GPIO switch on rk3399 (2022-09-10 01:08:48 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.1-rockchip-dts64-2

for you to fetch changes up to 19d4aaf640913c5a8f1b06c9ef46287c32635299:

  arm64: dts: rockchip: use pin constant for reset-gpios on px30-evb (2022-09-23 15:53:18 +0200)

----------------------------------------------------------------
RK3399-Nanopi-R4S-enterprise as variant board, Gru-Scarlet SKU variants,
DSI support for rk356x, display-gamma-control for rk3399, display
output for quartz64-b and rk3566-roc-pc, hdmi supplies for rk3399-roc-pc,
some pinctrl improvements for the px30-evb and a number of changes to
bring rk3399 rock4 and rock-pi4 structure closer to names used in schematics.

----------------------------------------------------------------
Brian Norris (2):
      dt-bindings: arm: rockchip: Add gru-scarlet sku{2,4} variants
      arm64: dts: rockchip: Support gru-scarlet sku{2,4} variants

Chris Morgan (1):
      arm64: dts: rockchip: Add DSI and DSI-DPHY nodes to rk356x

FUKAUMI Naoki (6):
      arm64: dts: rockchip: connect vcca_1v8 to APIO5_VDD on rk3399-rock-4c-plus
      arm64: dts: rockchip: fix regulator structure on rk3399-rock-4c-plus
      arm64: dts: rockchip: sort nodes/properties on rk3399-rock-4c-plus
      arm64: dts: rockchip: fix regulator name on rk3399-rock-4
      arm64: dts: rockchip: sort nodes/properties on rk3399-rock-4
      arm64: dts: rockchip: add avdd-0v9-supply and avdd-1v8-supply on rk3399 rock 4c and pi4

Furkan Kardame (1):
      arm64: dts: rockchip: Enable video output on rk3566-roc-pc

Hugh Cole-Baker (1):
      arm64: dts: rockchip: enable gamma control on RK3399

Markus Reichl (1):
      arm64: dts: rockchip: Add HDMI supplies on rk3399-roc-pc

Nicolas Frattaroli (1):
      arm64: dts: rockchip: Enable HDMI and GPU on quartz64-b

Quentin Schulz (1):
      arm64: dts: rockchip: add i2s0 I2S/PDM/TDM 8ch controller to px30

Tianling Shen (2):
      dt-bindings: Add doc for FriendlyARM NanoPi R4S Enterprise Edition
      arm64: dts: rockchip: Add RK3399 NanoPi R4S Enterprise Edition

Tommaso Merciai (3):
      arm64: dts: rockchip: set max drive-strength for cif_clkout_m0 on px30-evb
      arm64: dts: rockchip: add pinctrl for mipi-pdn pin on px30-evb
      arm64: dts: rockchip: use pin constant for reset-gpios on px30-evb

 .../devicetree/bindings/arm/rockchip.yaml          |  28 +++-
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 arch/arm64/boot/dts/rockchip/px30-evb.dts          |  17 ++-
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  22 ++++
 .../boot/dts/rockchip/rk3399-gru-scarlet-inx.dts   |  14 +-
 .../dts/rockchip/rk3399-nanopi-r4s-enterprise.dts  |  29 +++++
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |   6 +-
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      | 114 ++++++++++-------
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi | 141 +++++++++++----------
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |   4 +-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts |  60 +++++++++
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts     |  52 ++++++++
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |  80 ++++++++++++
 13 files changed, 445 insertions(+), 123 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s-enterprise.dts



