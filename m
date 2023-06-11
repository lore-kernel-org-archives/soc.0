Return-Path: <SRS0=EKYy=B7=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B35A3C7EE23
	for <soc@archiver.kernel.org>; Sun, 11 Jun 2023 21:11:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9293DC4339C; Sun, 11 Jun 2023 21:11:24 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1A09C433D2;
	Sun, 11 Jun 2023 21:11:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1A09C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b22.versanet.de ([83.135.91.34] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1q8SLI-0005sV-Nr; Sun, 11 Jun 2023 23:11:20 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.5 #1
Date: Sun, 11 Jun 2023 23:11:20 +0200
Message-ID: <3239799.44csPzL39Z@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below and in a subsequent pull-request
Rockchip changes for for 6.5 .

As always the 64bit DTS part is the big one, with some new boards and
yet another lot of added support for rk3588 peripherals.


Please pull!

Thanks
Heiko


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.5-rockchip-dts64-1

for you to fetch changes up to a68e1aec587a75a51496f1b207272b6034cca190:

  arm64: dts: rockchip: Add saradc node to rock5b (2023-06-11 22:40:01 +0200)

----------------------------------------------------------------
New boards are
- Indiedroid Nova (rk3588)
- Add Edgeble Neural Compute Module 6B (rk3588)
- FriendlyARM NanoPi R2C Plus (rk3328)
- Anbernic RG353PS (rk3566)
- Lunzn Fastrhino R66S / R68S (rk3568)

The rk3588 got a lot of attention and gained support for the GIC ITS
(needed an errata from Rockchip), timers, otp memory, saradc and sdio.
The rk356x got support for its RGA block

With all the core improvements to rk3588 support, the Rock5b got a lot
improvements from that too, namely support for its PMIC, sd-card and
saradc, as well as a clock-rate fix for its es8316 codec.
Similarly the rk3588-evb1 also got support for its PMIC.

The Anberic RGxx3 series got a better bluetooth compatible and updates
to its LEDs to make them use the PWM blocks they're connected to.

----------------------------------------------------------------
Chris Morgan (9):
      dt-bindings: arm: rockchip: add Anbernic RG353PS
      arm64: dts: rockchip: add Anbernic RG353PS
      arm64: dts: rockchip: Update leds for Anbernic RGxx3 Series
      arm64: dts: rockchip: add default pinctrl for rk3588 emmc
      arm64: dts: rockchip: Add sdio node to rk3588
      dt-bindings: vendor-prefixes: add Indiedroid
      dt-bindings: arm: rockchip: Add Indiedroid Nova
      arm64: dts: rockchip: Add Indiedroid Nova board
      arm64: dts: rockchip: Fix compatible for Bluetooth on rk3566-anbernic

Cristian Ciocaltea (3):
      arm64: dts: rockchip: Add rk3588 timer
      arm64: dts: rockchip: Add rk3588 OTP node
      arm64: dts: rockchip: Assign ES8316 MCLK rate on rk3588-rock-5b

Jagan Teki (4):
      dt-bindings: arm: rockchip: Add Edgeble Neural Compute Module 6B
      arm64: dts: rockchip: Add Rockchip RK3588J
      arm64: dts: rockchip: Add rk3588 Edgeble Neu6 Model B SoM
      arm64: dts: rockchip: Add rk3588 Edgeble Neu6 Model B IO

Lucas Tanure (1):
      arm64: dts: rockchip: Add SD card support to rock-5b

Michael Tretter (2):
      media: dt-bindings: media: rockchip-rga: add rockchip,rk3568-rga
      arm64: dts: rockchip: Add RGA2 support to rk356x

Sebastian Reichel (3):
      arm64: dts: rockchip: add GIC ITS support to rk3588
      arm64: dts: rockchip: add PMIC to rk3588-evb1
      arm64: dts: rockchip: add PMIC to rock-5b

Shreeya Patel (2):
      arm64: dts: rockchip: Add DT node for ADC support in RK3588
      arm64: dts: rockchip: Add saradc node to rock5b

Tianling Shen (5):
      dt-bindings: Add doc for Fastrhino R66S / R68S
      arm64: dts: rockchip: Add Lunzn Fastrhino R66S
      arm64: dts: rockchip: Add Lunzn Fastrhino R68S
      dt-bindings: arm: rockchip: add FriendlyARM NanoPi R2C Plus
      arm64: dts: rockchip: Add FriendlyARM NanoPi R2C Plus

 .../devicetree/bindings/arm/rockchip.yaml          |  24 +
 .../devicetree/bindings/media/rockchip-rga.yaml    |   4 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 arch/arm64/boot/dts/rockchip/Makefile              |   6 +
 .../boot/dts/rockchip/rk3328-nanopi-r2c-plus.dts   |  33 +
 .../boot/dts/rockchip/rk3566-anbernic-rg353ps.dts  | 116 ++++
 .../boot/dts/rockchip/rk3566-anbernic-rgxx3.dtsi   |  41 +-
 .../boot/dts/rockchip/rk3568-fastrhino-r66s.dts    |  27 +
 .../boot/dts/rockchip/rk3568-fastrhino-r66s.dtsi   | 484 +++++++++++++
 .../boot/dts/rockchip/rk3568-fastrhino-r68s.dts    | 112 +++
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |  11 +
 .../boot/dts/rockchip/rk3588-edgeble-neu6b-io.dts  |  27 +
 .../boot/dts/rockchip/rk3588-edgeble-neu6b.dtsi    |  32 +
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   | 637 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    | 371 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3588j.dtsi          |   7 +
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  | 763 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi          | 109 +++
 18 files changed, 2789 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2c-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588j.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts



