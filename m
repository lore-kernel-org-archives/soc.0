Return-Path: <SRS0=5SgQ=VT=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC67C433EF
	for <soc@archiver.kernel.org>; Wed, 11 May 2022 23:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3653BC34114; Wed, 11 May 2022 23:41:33 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E39CC340EE;
	Wed, 11 May 2022 23:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E39CC340EE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1novxQ-0006Sy-4n; Thu, 12 May 2022 01:41:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.19 #1
Date: Thu, 12 May 2022 01:41:27 +0200
Message-ID: <7748558.DvuYhMxLoT@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below and in subsequent pull-requests
Rockchip changes for for 5.19 .

As always the 64bit DTS part is the big one.

Please pull!

Thanks
Heiko


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-dts64-1

for you to fetch changes up to bc405bb3eeee4b711830ab569e7f3811b92196ab:

  arm64: dts: rockchip: enable otg/drd operation of usb_host0_xhci in rk356x (2022-05-11 06:09:55 +0200)

----------------------------------------------------------------
New peripherals supported on rk356x: sfc, usb3, sata and
the video-decoder on rk3328.
RK3399 received some improvements and nodes for the memory controller.
Additional peripherals for PineNote, Gru and BananaPi-R2-Pro.
New boards are the Firefly Station M2, Pine64 SoQuartz SOM and
Quartz64 model B as well as the Radxa Rock3 model A.

----------------------------------------------------------------
Caleb Connolly (1):
      arm64: dts: rockchip: add an input enable pinconf to rk3399

Christopher Obbard (2):
      arm64: dts: rockchip: Rename vdec_mmu node for RK3328
      arm64: dts: rockchip: Add vdec support for RK3328

Frank Wunderlich (3):
      arm64: dts: rockchip: Add sata nodes to rk356x
      arm64: dts: rockchip: Add USB nodes for BPI-R2-Pro
      arm64: dts: rockchip: Add SATA support to BPI-R2-Pro

Furkan Kardame (1):
      arm64: dts: rockchip: add dts for Firefly Station M2 rk3566

Heiko Stuebner (1):
      arm64: dts: rockchip: fix Makefile sorting for BananaPi R2 Pro

Johan Jonker (2):
      arm64: dts: rockchip: use generic node name for pmucru on rk3399
      arm64: dts: rockchip: add clocks property to cru nodes rk3399

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: correct interrupt flags on rk3399 boards

Lin Huang (2):
      arm64: dts: rockchip: Add dfi and dmc nodes to rk3399
      arm64: dts: rockchip: Enable dmc and dfi nodes on gru

Michael Riesch (6):
      dt-bindings: arm: rockchip: add radxa rock3 model a
      arm64: dts: rockchip: add basic dts for the radxa rock3 model a
      arm64: dts: rockchip: add usb3 support to rk3568-evb1-v10
      arm64: dts: rockchip: add usb3 support to the radxa rock3 model a
      arm64: dts: rockchip: enable usb hub on the radxa rock3 model a
      arm64: dts: rockchip: enable otg/drd operation of usb_host0_xhci in rk356x

Peter Geis (8):
      arm64: dts: rockchip: add rk356x dwc3 usb3 nodes
      arm64: dts: rockchip: enable dwc3 on quartz64-a
      arm64: dts: rockchip: add rk356x sfc support
      dt-bindings: arm: rockchip: Add Pine64 Quartz64 Model B
      dt-bindings: arm: rockchip: Add Pine64 SoQuartz SoM
      dt-bindings: arm: rockchip: Add Firefly Station M2
      arm64: dts: rockchip: add Pine64 Quartz64-B device tree
      arm64: dts: rockchip: add SoQuartz CM4IO dts

Robin Murphy (1):
      arm64: dts: rockchip: Add some pins for NanoPi4

Samuel Holland (2):
      arm64: dts: rockchip: Add accelerometer to rk3566-pinenote
      arm64: dts: rockchip: Add USB and TCPC to rk3566-pinenote

Sascha Hauer (1):
      arm64: dts: rockchip: rename HDMI ref clock to 'ref' on rk3399

Shawn Lin (1):
      arm64: dts: rockchip: Move drive-impedance-ohm to emmc phy on rk3399

 .../devicetree/bindings/arm/rockchip.yaml          |  23 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   6 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |  22 +-
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    |   3 +-
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |   7 +
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |  12 +
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |  28 +
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts |   3 +-
 .../boot/dts/rockchip/rk3399-khadas-edge.dtsi      |   3 +-
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts  |   3 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-op1-opp.dtsi   |  25 +
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts   |   3 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dts |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi   |   3 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  45 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  |  80 +++
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |  37 ++
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts | 615 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts     | 579 +++++++++++++++++++
 .../boot/dts/rockchip/rk3566-soquartz-cm4.dts      | 177 ++++++
 arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi  | 616 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3566.dtsi           |  11 +
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 102 ++++
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   |  46 ++
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    | 562 +++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |  23 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |  74 ++-
 29 files changed, 3096 insertions(+), 18 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts



