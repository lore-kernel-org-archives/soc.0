Return-Path: <SRS0=oCBd=HX=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE919C4332F
	for <soc@archiver.kernel.org>; Tue, 12 Dec 2023 21:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7FAB8C433CA; Tue, 12 Dec 2023 21:32:57 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B156CC433C9;
	Tue, 12 Dec 2023 21:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B156CC433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rDAN2-0007Am-ND; Tue, 12 Dec 2023 22:32:52 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.8 #1
Date: Tue, 12 Dec 2023 22:32:52 +0100
Message-ID: <3535836.iIbC2pHGDl@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below and in a subsequent pull-request
Rockchip changes for for 6.8 .


The change that might need the most explanation is probably around the
aliases. In a recent discussion [0] the alias naming came up - with them
aimed at matching labeling / documentation.

As stated there all the Rockchip core busses (i2c, spi, and so on) use
a numbered scheme everywhere - from the SoC manual down to the board
schematics. Meaning i2c2 should always be i2c2.

Together with Krzysztof's additional mention [1] that aliases in board-
files
	"is just generic guideline",
a lot of people involved agreed that we don't want to repeat the same
huge stack of core-bus aliases on each and every board. On the other
hand, all the non-numbered busses should be living in the board dts
files. So a bit of a cleanup got underway to achieve that state on the
newer socs. (both arm64 and arm32).


Please pull!

Thanks
Heiko


[0] https://lore.kernel.org/linux-rockchip/4762834.KRxA6XjA2N@diego/#r
[1] https://lore.kernel.org/linux-rockchip/7b8a830d-42d0-4220-b9fe-3f5fff43e74d@linaro.org/


The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.8-rockchip-dts64-1

for you to fetch changes up to 8174dff9e583f7791dacf6d8ce034eb18ec2b292:

  arm64: dts: rockchip: Add Anbernic RG351V (2023-12-12 21:43:48 +0100)

----------------------------------------------------------------
New boards are the Anberic RG351V handheld (rk3326), Theobroma Systems Jaguar
SBC (rk3588), Powkiddy X55 and RK2023 handheld (rk3566), Edgeble-Neu6b (rk3588)

The rk3588 got attention with one working usb3 host on Rock-5a/5b, Orangepi-5
and audio for the EVB1.

Some smaller improvements for the other socs (fifo-depths on rk3328,
gpio-line-names on rk3308-rock-pi-s, gpu power-coefficients on rk3399,
and a fix for the newly converted gpio-fan yaml binding).

Also a number of aliases were moved. Always-numbered core busses can have their
aliases in the soc dtsi, as is done in a number of cases already and other alises
like ethernet really should be per board.

----------------------------------------------------------------
Chris Morgan (8):
      dt-bindings: arm: rockchip: Add Powkiddy RK2023
      arm64: dts: rockchip: Update powkiddy,rgb30 include to rk2023 DTSI
      arm64: dts: rockchip: Add Powkiddy RK2023
      dt-bindings: arm: rockchip: Add Powkiddy X55
      arm64: dts: rockchip: Add Powkiddy X55
      dt-bindings: arm: rockchip: Add Anbernic RG351V
      arm64: dts: rockchip: Split RG351M from Odroid Go Advance
      arm64: dts: rockchip: Add Anbernic RG351V

David Heidelberg (1):
      arm64: dts: rockchip: make dts use gpio-fan matrix instead of array

Dragan Simic (6):
      arm64: dts: rockchip: Remove ethernet0 alias from the SoC dtsi for RK3399
      arm64: dts: rockchip: Remove ethernet0 alias from the SoC dtsi for RK3368
      arm64: dts: rockchip: Remove ethernetX aliases from the SoC dtsi for RK3328
      arm64: dts: rockchip: Remove ethernet0 alias from the SoC dtsi for PX30
      arm64: dts: rockchip: Add ethernet0 alias to the dts for RK3566 boards
      arm64: dts: rockchip: Add ethernet0 alias to the dts for RK3588(S) boards

Heiko Stuebner (6):
      dt-bindings: arm: rockchip: Add Theobroma-Systems Jaguar SBC
      arm64: dts: rockchip: add Theobroma Jaguar SBC
      arm64: dts: rockchip: move rk3588 serial aliases to soc dtsi
      arm64: dts: rockchip: add rk3588 i2c aliases to soc dtsi
      arm64: dts: rockchip: add rk3588 gpio aliases to soc dtsi
      arm64: dts: rockchip: add rk3588 spi aliases to soc dtsi

Jagan Teki (2):
      dt-bindings: arm: rockchip: Update edgeble-neu6 bindings
      arm64: dts: rockchip: Use NCM6A-IO board for edgeble-neu6b

Jimmy Hon (1):
      arm64: dts: rockchip: add USB3 host on rk3588s-orangepi-5

Johan Jonker (1):
      arm64: dts: rockchip: add gpio alias for gpio dt nodes

Lukasz Luba (1):
      arm64: dts: rockchip: Add dynamic-power-coefficient to rk3399 GPU

Sebastian Reichel (3):
      arm64: dts: rockchip: add analog audio to RK3588 EVB1
      arm64: dts: rockchip: add USB3 host to rock-5b
      arm64: dts: rockchip: add USB3 host to rock-5a

Trevor Woerner (1):
      arm64: dts: rockchip: add gpio-line-names to rk3308-rock-pi-s

shironeko (1):
      arm64: dts: rockchip: add missing tx/rx-fifo-depth for rk3328 gmac

 .../devicetree/bindings/arm/rockchip.yaml          |  32 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   4 +
 .../boot/dts/rockchip/px30-engicam-common.dtsi     |   1 +
 arch/arm64/boot/dts/rockchip/px30-evb.dts          |   1 +
 .../boot/dts/rockchip/px30-ringneck-haikou.dts     |   1 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |   1 -
 arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts  |  58 ++
 arch/arm64/boot/dts/rockchip/rk3308.dtsi           |   5 +
 arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dts    |   1 +
 .../boot/dts/rockchip/rk3326-anbernic-rg351m.dts   |  18 +-
 .../boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi  | 478 +++++++++++
 .../boot/dts/rockchip/rk3326-anbernic-rg351v.dts   |  44 +
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts         |   1 +
 arch/arm64/boot/dts/rockchip/rk3328-evb.dts        |   1 +
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts |   1 +
 .../boot/dts/rockchip/rk3328-orangepi-r1-plus.dts  |   1 +
 arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts     |   1 +
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts  |   2 +
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |   1 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |  10 +-
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi       |   1 +
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts    |   1 +
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi      |   1 +
 .../boot/dts/rockchip/rk3368-orion-r68-meta.dts    |   1 +
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts        |   1 +
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |   5 +-
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts  |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts        |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-ficus.dts      |   4 +
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts |   1 +
 .../dts/rockchip/rk3399-khadas-edge-captain.dts    |   4 +
 .../boot/dts/rockchip/rk3399-khadas-edge-v.dts     |   4 +
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts  |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts   |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |   1 +
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi  |   3 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |   7 +-
 .../boot/dts/rockchip/rk3399pro-vmarc-som.dtsi     |   1 +
 .../boot/dts/rockchip/rk3566-powkiddy-rgb30.dts    | 154 +---
 .../boot/dts/rockchip/rk3566-powkiddy-rk2023.dts   |  38 +
 .../boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi  | 875 +++++++++++++++++++
 .../boot/dts/rockchip/rk3566-powkiddy-x55.dts      | 926 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |   5 +-
 .../boot/dts/rockchip/rk3566-radxa-cm3-io.dts      |   1 +
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts     |   1 +
 .../boot/dts/rockchip/rk3566-soquartz-blade.dts    |   4 +
 .../boot/dts/rockchip/rk3566-soquartz-cm4.dts      |   4 +
 .../boot/dts/rockchip/rk3566-soquartz-model-a.dts  |   4 +
 arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi  |   1 -
 .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dts  |   4 -
 .../boot/dts/rockchip/rk3588-edgeble-neu6b-io.dts  |   6 +-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |  99 ++-
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     | 803 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts  |   1 -
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |   1 -
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |   2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   9 +-
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |   2 -
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |   1 -
 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts     |   1 -
 .../arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts |   6 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |  10 +-
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi          |  32 +
 70 files changed, 3502 insertions(+), 196 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351v.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts



