Return-Path: <SRS0=DdcB=OR=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F0DEC433F5
	for <soc@archiver.kernel.org>; Mon, 27 Sep 2021 09:42:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 25D666115C; Mon, 27 Sep 2021 09:42:56 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9455B60F70;
	Mon, 27 Sep 2021 09:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9455B60F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from user91-192-32-221.grape.cz ([91.192.32.221] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1mUn9w-0002Cw-QS; Mon, 27 Sep 2021 11:42:52 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.16 #1
Date: Mon, 27 Sep 2021 11:42:50 +0200
Message-ID: <4439872.CQOukoFCf9@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below and in the next mails the first stack of Rockchip stuff
for 5.16.

As I told Arnd, when he asked on IRC, I've rebased the parts that didn't
make it into 5.15-rc on top of 5.15-rc1 and thus they're part of this
pull request again.

Please pull!

Thanks
Heiko


The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.16-rockchip-dts64-1

for you to fetch changes up to 5a73d7ca7f7a64144e03ef0fc8eb6f8e5ea54df3:

  arm64: dts: rockchip: add phandles to muxed i2c buses on rk3368-lion (2021-09-23 21:44:04 +0200)

----------------------------------------------------------------
This contains the parts that were originally meant for 5.15 + some
new thing:

New boards: Firefly roc-rk3399-pc-pls and rk3328-pc; Scarlet-Dumo
tablet variant; Rock Pi 4 A+, B+; Pine64 Quartz64-A (rk3566-based)

Big additions for the rk3568: tsadc; saradc; gpio-support; gmac 1+2;
watchdog; pmu; io-domains and enabling these new things on the
rk3568-evb.

Addition of the rk3566 - a variant of the rk3568 with slightly less
peripherals.

SFC (serial flash controller) for rk3308 and px30 (including the
Odroid Go2)

Support for the rk3399's second image signal processor and its coresight
component. And camera + vpu support on px30.

A number of smaller additions to multiple boards (Rock Pi 4, Pinebook Pro
and helios64, lion-haikou, Odroid-Go2) and cleanups in some parts.

----------------------------------------------------------------
Alex Bee (7):
      dt-bindings: Add doc for ROCK Pi 4 A+ and B+
      arm64: dts: rockchip: Add RK3399 ROCK Pi 4A+ board
      arm64: dts: rockchip: Add RK3399 ROCK Pi 4B+ board
      arm64: dts: rockchip: add ES8316 codec for ROCK Pi 4
      arm64: dts: rockchip: add SPDIF node for ROCK Pi 4
      arm64: dts: rockchip: Re-add interrupt-names for RK3399's vpu
      arm64: dts: rockchip: Fix GPU register width for RK3328

Brian Norris (2):
      arm64: dts: rockchip: add RK3399 Gru gpio-line-names
      arm64: dts: rockchip: add Coresight debug range for RK3399

Chen-Yu Tsai (2):
      dt-bindings: arm: rockchip: Add gru-scarlet-dumo board
      arm64: dts: rockchip: Add gru-scarlet-dumo board

Chris Morgan (4):
      arm64: dts: rockchip: Add SFC to PX30
      arm64: dts: rockchip: Add SFC to RK3308
      arm64: dts: rockchip: Enable SFC for Odroid Go Advance
      arm64: dts: rockchip: Correct regulator for USB host on Odroid-Go2

Dan Johansen (1):
      arm64: dts: rockchip: Setup USB typec port as datarole on for Pinebook Pro

Dennis Gilmore (3):
      arm64: dts: rockchip: set stdout-path on helios64
      arm64: dts: rockchip: add SPI support to helios64
      arm64: dts: rockchip: enable tsadc on helios64

Heiko Stuebner (6):
      arm64: dts: rockchip: add csi-dphy to px30
      arm64: dts: rockchip: add #phy-cells to mipi-dsi1 on rk3399
      arm64: dts: rockchip: add cif clk-control pinctrl for rk3399
      arm64: dts: rockchip: add isp1 node on rk3399
      arm64: dts: rockchip: add isp node for px30
      arm64: dts: rockchip: hook up camera on px30-evb

Jakob Unterwurzacher (3):
      arm64: dts: rockchip: fix LDO_REG4 / LDO_REG7 confusion on rk3368-lion
      arm64: dts: rockchip: define iodomains for rk3368-lion
      arm64: dts: rockchip: add phandles to muxed i2c buses on rk3368-lion

Johan Jonker (4):
      arm64: dts: rockchip: remove interrupt-names from iommu nodes
      arm64: dts: rockchip: rename flash nodenames
      arm64: dts: rockchip: remove clock_in_out from gmac2phy node in rk3318-a95x-z2.dts
      arm64: dts: rockchip: remove ddc-i2c-scl-* properties from rk3318-a95x-z2.dts

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: align operating-points table name with dtschema

Levin Du (4):
      dt-bindings: add doc for Firefly ROC-RK3328-PC
      arm64: dts: rockchip: add support for Firefly ROC-RK3328-PC
      dt-bindings: add doc for Firefly ROC-RK3399-PC-PLUS
      arm64: dts: rockchip: add support for Firefly ROC-RK3399-PC-PLUS

Liang Chen (3):
      dt-bindings: arm: rockchip: add rk3568 compatible string to pmu.yaml
      arm64: dts: rockchip: add pmu and qos nodes for rk3568
      arm64: dts: rockchip: add watchdog to rk3568

Matthias Brugger (1):
      arm64: dts: rockchip: Disable CDN DP on Pinebook Pro

Michael Riesch (9):
      arm64: dts: rockchip: add gmac0 node to rk3568
      arm64: dts: rockchip: rk3568-evb1-v10: add ethernet support
      arm64: dts: rockchip: add core io domains node for rk356x
      arm64: dts: rockchip: enable io domains on rk3568-evb1-v10
      arm64: dts: rockchip: add regulators of rk809 pmic to rk3568-evb1-v10
      arm64: dts: rockchip: add node for sd card to rk3568-evb1-v10
      arm64: dts: rockchip: add pinctrl and alias to emmc node to rk3568-evb1-v10
      arm64: dts: rockchip: add missing rockchip,grf property to rk356x
      arm64: dts: rockchip: add saradc to rk3568-evb1-v10

Paul Kocialkowski (1):
      arm64: dts: rockchip: Add VPU support for the PX30

Peter Geis (12):
      arm64: dts: rockchip: move rk3568 dtsi to rk356x dtsi
      arm64: dts: rockchip: split rk3568 device tree
      arm64: dts: rockchip: add rk3566 dtsi
      arm64: dts: rockchip: add basic dts for Pine64 Quartz64-A
      arm64: dts: rockchip: fix rk3568 mbi-alias
      arm64: dts: rockchip: add rk356x gmac1 node
      arm64: dts: rockchip: adjust rk3568 pll clocks
      arm64: dts: rockchip: enable gmac node on quartz64-a
      arm64: dts: rockchip: add thermal fan control to rockpro64
      arm64: dts: rockchip: add rk356x gpio debounce clocks
      arm64: dts: rockchip: add rk3568 tsadc nodes
      arm64: dts: rockchip: add thermal support to Quartz64 Model A

Simon Xue (1):
      arm64: dts: rockchip: add saradc node for rk3568

Tommaso Merciai (1):
      arm64: dts: rockchip: fix PCI reg address warning on rk3399-gru

 .../devicetree/bindings/arm/rockchip.yaml          |  48 +-
 .../devicetree/bindings/arm/rockchip/pmu.yaml      |   2 +
 arch/arm64/boot/dts/rockchip/Makefile              |   6 +
 arch/arm64/boot/dts/rockchip/px30-evb.dts          |  52 ++
 arch/arm64/boot/dts/rockchip/px30.dtsi             | 118 ++-
 arch/arm64/boot/dts/rockchip/rk3308.dtsi           |  39 +-
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts    |   3 -
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts |  28 +-
 arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts     | 110 +++
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |   2 +-
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |   9 +-
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi      |  47 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |   5 -
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   | 176 ++++
 .../boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts  |  41 +
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      | 180 ++++
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |   4 +-
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |  36 +
 arch/arm64/boot/dts/rockchip/rk3399-op1-opp.dtsi   |   6 +-
 arch/arm64/boot/dts/rockchip/rk3399-opp.dtsi       |   6 +-
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |   6 +-
 .../arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts | 218 +++++
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |  54 ++
 .../boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts   |  14 +
 .../boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts   |  47 ++
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |  29 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  94 ++-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts | 497 +++++++++++
 arch/arm64/boot/dts/rockchip/rk3566.dtsi           |  20 +
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   | 313 +++++++
 arch/arm64/boot/dts/rockchip/rk3568-pinctrl.dtsi   |   9 +
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           | 644 ++------------
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           | 931 +++++++++++++++++++++
 33 files changed, 3169 insertions(+), 625 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-roc-pc.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk356x.dtsi



