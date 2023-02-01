Return-Path: <SRS0=2vJj=55=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B31DC636D3
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 23:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D06BC4339C; Wed,  1 Feb 2023 23:04:56 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0BD4DC433EF;
	Wed,  1 Feb 2023 23:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0BD4DC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from p508fda63.dip0.t-ipconnect.de ([80.143.218.99] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pNM9t-0007Mu-6K; Thu, 02 Feb 2023 00:04:53 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.3 #1
Date: Thu, 02 Feb 2023 00:04:52 +0100
Message-ID: <5651506.31r3eYUQgx@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.3-rockchip-dts32-1

for you to fetch changes up to 0f48b0ed356d8868f62f7c6814fc2edcd70d1816:

  dt-bindings: phy: rename phy-rockchip-inno-usb2.yaml (2023-02-01 18:41:42 +0100)

----------------------------------------------------------------
Two new 32bit SoC were added, the rv1126 and rk3128.

New boards are thr rk3128-eval-board, and a number of rv1126-based compute
modules from Edgeble AI.

Also included are some dt-binding improvements with relevant Acks from
maintainers when the changes touch these areas.

----------------------------------------------------------------
Anand Moon (3):
      ARM: dts: rockchip: Add ethernet rgmiim1 pin-control for rv1126
      ARM: dts: rockchip: Add Ethernet GMAC node for RV1126
      ARM: dts: rockchip: Enable Ethernet on rv1126 Neu2-IO

Jagan Teki (8):
      dt-bindings: arm: rockchip: Add pmu compatible for rv1126
      ARM: dts: rockchip: Add Rockchip RV1126 pinctrl
      ARM: dts: rockchip: Add Rockchip RV1126 SoC
      dt-bindings: vendor-prefixes: Add Edgeble AI Technologies Pvt. Ltd.
      dt-bindings: arm: rockchip: Add Edgeble Neural Compute Module 2
      ARM: dts: rockchip: Add Edgeble RV1126 Neural Compute Module 2(Neu2)
      ARM: dts: rockchip: Add Edgeble Neural Compute Module 2(Neu2) IO board
      dt-bindings: arm: rockchip: Add Edgeble Neural Compute Module 6

Johan Jonker (8):
      dt-bindings: arm: rockchip: Add Rockchip RK3128 Evaluation board
      ARM: dts: rockchip: add rk3128 soc dtsi
      ARM: dts: rockchip: add rk3128-evb
      ARM: dts: rockchip: add space between label and nodename nfc pinctrl on rk3128
      ARM: dts: rockchip: add brcmf node to rk3066a-mk808
      dt-bindings: phy: rockchip: convert rockchip-dp-phy.txt to yaml
      dt-bindings: soc: rockchip: grf: add rockchip,rk3288-dp-phy.yaml
      dt-bindings: phy: rename phy-rockchip-inno-usb2.yaml

 .../devicetree/bindings/arm/rockchip.yaml          |  17 +
 .../devicetree/bindings/arm/rockchip/pmu.yaml      |   2 +
 ...p-inno-usb2.yaml => rockchip,inno-usb2phy.yaml} |   2 +-
 .../bindings/phy/rockchip,rk3288-dp-phy.yaml       |  41 +
 .../devicetree/bindings/phy/rockchip-dp-phy.txt    |  26 -
 .../devicetree/bindings/soc/rockchip/grf.yaml      |   7 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 MAINTAINERS                                        |   2 +-
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/rk3066a-mk808.dts                |   7 +
 arch/arm/boot/dts/rk3128-evb.dts                   | 109 +++
 arch/arm/boot/dts/rk3128.dtsi                      | 916 +++++++++++++++++++++
 arch/arm/boot/dts/rv1126-edgeble-neu2-io.dts       |  79 ++
 arch/arm/boot/dts/rv1126-edgeble-neu2.dtsi         | 338 ++++++++
 arch/arm/boot/dts/rv1126-pinctrl.dtsi              | 253 ++++++
 arch/arm/boot/dts/rv1126.dtsi                      | 487 +++++++++++
 16 files changed, 2259 insertions(+), 31 deletions(-)
 rename Documentation/devicetree/bindings/phy/{phy-rockchip-inno-usb2.yaml => rockchip,inno-usb2phy.yaml} (98%)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip,rk3288-dp-phy.yaml
 delete mode 100644 Documentation/devicetree/bindings/phy/rockchip-dp-phy.txt
 create mode 100644 arch/arm/boot/dts/rk3128-evb.dts
 create mode 100644 arch/arm/boot/dts/rk3128.dtsi
 create mode 100644 arch/arm/boot/dts/rv1126-edgeble-neu2-io.dts
 create mode 100644 arch/arm/boot/dts/rv1126-edgeble-neu2.dtsi
 create mode 100644 arch/arm/boot/dts/rv1126-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rv1126.dtsi



