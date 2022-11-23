Return-Path: <SRS0=xvFv=3X=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F203C4332F
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 13:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3E77C43144; Wed, 23 Nov 2022 13:49:54 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15A41C433D6;
	Wed, 23 Nov 2022 13:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 15A41C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oxq8M-0008Jl-Oo; Wed, 23 Nov 2022 14:49:50 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.2 #1
Date: Wed, 23 Nov 2022 14:49:49 +0100
Message-ID: <4716610.aeNJFYEL58@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Arnd, Kevin, Olof,

please find below and in subsequent pull-request
Rockchip changes for for 6.2

As always the 64bit DTS part is the big one, while
I realized too late that the 32bit actually only consists
of one commit this time.


Please pull!

Thanks
Heiko

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v6.2-rockchip-dts64-1

for you to fetch changes up to 848343c0b4d64821aec19b2cff47b58f77362d38:

  arm64: dts: rockchip: update cache properties for rk3308 and rk3328 (2022=
=2D11-22 23:28:44 +0100)

=2D---------------------------------------------------------------
New boards:
=2D Model A and blade baseboards for the SOQuartz (rk3568) SoM,
=2D Anberic RG351M, RG353V, RG353VS; Odroid Go Super, Advance gaming devices
=2D Odroid M1
=2D Theobroma px30 SoM with baseboard
=2D Rockchip's own rk3566 demo board

Some core support for per SoC specifics:
=2D crypto support for rk3399 and rk3328
=2D second I2S controller for rk3568
=2D Cache properties for follow the binding for rk3308 and rk3328

Bigger device support updates for:
=2D SOQuartz: PCIe2, video output, gpu, HDMI sound
=2D Rock 3A: eth regulator, eth clock input, Wifi+Bt, I2S, PCIe3

As well as some minor extensions for Rock960 (hdmi supplies),
rk3566-roc-pc (PCIe2), Rock 4C+ (thermal support), Pinephone Pro (Wifi+Bt)

=2D---------------------------------------------------------------
Anand Moon (2):
      arm64: dts: rockchip: Add support of external clock to ethernet node =
on Rock 3A SBC
      arm64: dts: rockchip: Add support of regulator for ethernet node on R=
ock 3A SBC

Andrew Powers-Holmes (2):
      arm64: dts: rockchip: Add SOQuartz blade board
      arm64: dts: rockchip: Add SOQuartz Model A baseboard

Andy Yan (2):
      dt-bindings: rockchip: Add Rockchip rk3566 box demo board
      arm64: dts: rockchip: Add dts for rockchip rk3566 box demo board

Aurelien Jarno (11):
      arm64: dts: rockchip: add thermal support to ODROID-M1
      arm64: dts: rockchip: Add NOR flash to ODROID-M1
      arm64: dts: rockchip: Add analog audio on ODROID-M1
      arm64: dts: rockchip: Enable vop2 and hdmi tx on ODROID-M1
      arm64: dts: rockchip: Enable HDMI audio on ODROID-M1.
      arm64: dts: rockchip: Enable the GPU on ODROID-M1
      arm64: dts: rockchip: Enable the USB 2.0 ports on ODROID-M1
      arm64: dts: rockchip: Enable the USB 3.0 ports on ODROID-M1
      arm64: dts: rockchip: Add SATA support to ODROID-M1
      arm64: dts: rockchip: Add PCIEe v3 nodes to ODROID-M1
      arm64: dts: rockchip: Add IR receiver node to ODROID-M1

Chris Morgan (5):
      dt-bindings: arm: rockchip: Add Anbernic RG353V and RG353VS
      arm64: dts: rockchip: add Anbernic RG353V and RG353VS
      arm64: dts: rockchip: add rk817 chg to RG353P and RG503
      arm64: dts: rockchip: add poll-interval to RGxx3 devices
      arm64: dts: rockchip: Update joystick to polled for OG2

Chukun Pan (2):
      arm64: dts: rockchip: Add regulator suffix to rock-3a
      arm64: dts: rockchip: Add PCIe v3 nodes to rock-3a

Corentin Labbe (3):
      clk: rockchip: use proper crypto0 name on rk3399
      arm64: dts: rockchip: add rk3328 crypto node
      arm64: dts: rockchip: rk3399: add crypto node

Dongjin Kim (2):
      dt-bindings: rockchip: Add Hardkernel ODROID-M1 board
      arm64: dts: rockchip: Add Hardkernel ODROID-M1 board

=46UKAUMI Naoki (1):
      arm64: dts: rockchip: enable tsadc for ROCK 4C+

=46urkan Kardame (1):
      arm64: dts: rockchip: enable pcie2 on rk3566-roc-pc

Heiko Stuebner (2):
      Merge branch 'v6.2-shared/clockids' into v6.2-armsoc/dts64
      arm64: dts: rockchip: fix spdif@fe460000 ordering on rk356x

Maya Matuszczyk (5):
      arm64: dts: rockchip: Move most of Odroid Go Advance DTS into a DTSI
      dt-bindings: arm: rockchip: Add more RK3326 devices
      arm64: dts: rockchip: Add Odroid Go Advance Black Edition
      arm64: dts: rockchip: Add Odroid Go Super
      arm64: dts: rockchip: Add Anbernic RG351M

Nicolas Frattaroli (6):
      arm64: dts: rockchip: Enable GPU on SOQuartz CM4
      arm64: dts: rockchip: Enable video output and HDMI on SOQuartz
      arm64: dts: rockchip: Enable HDMI sound on SOQuartz
      arm64: dts: rockchip: Enable PCIe 2 on SOQuartz CM4IO
      dt-bindings: arm: rockchip: Add SOQuartz Blade
      dt-bindings: arm: rockchip: Add SOQuartz Model A

Peter Robinson (1):
      arm64: dts: rockchip: Add HDMI supplies on Rock960

Pierre Gondois (1):
      arm64: dts: rockchip: update cache properties for rk3308 and rk3328

Quentin Schulz (2):
      arm64: dts: rockchip: add PX30-=B5Q7 (Ringneck) SoM with Haikou baseb=
oard
      dt-bindings: arm: rockchip: add Theobroma Systems PX30-=B5Q7 (Ringnec=
k) with Haikou

Shengyu Qu (3):
      arm64: dts: rockchip: RK356x: Add I2S2 device node
      arm64: dts: rockchip: Add I2S2 node for RADXA Rock 3A
      arm64: dts: rockchip: Add nodes for SDIO/UART Wi-Fi/Bluetooth modules=
 to Radxa Rock 3A

Tom Fitzhenry (1):
      arm64: dts: rockchip: add BT/wifi nodes to Pinephone Pro

 .../devicetree/bindings/arm/rockchip.yaml          |  42 ++
 arch/arm64/boot/dts/rockchip/Makefile              |  10 +
 .../boot/dts/rockchip/px30-ringneck-haikou.dts     | 232 +++++++
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    | 382 +++++++++++
 arch/arm64/boot/dts/rockchip/rk3308.dtsi           |   1 +
 .../boot/dts/rockchip/rk3326-anbernic-rg351m.dts   |  33 +
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi | 600 +++++++++++++++++
 .../boot/dts/rockchip/rk3326-odroid-go2-v11.dts    | 156 +++++
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts | 620 +----------------
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dts | 185 +++++
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |  12 +
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |  76 +++
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      |   6 +
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi   |   2 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |  20 +
 .../boot/dts/rockchip/rk3566-anbernic-rg353p.dts   | 109 +--
 .../boot/dts/rockchip/rk3566-anbernic-rg353v.dts   | 114 ++++
 .../boot/dts/rockchip/rk3566-anbernic-rg353vs.dts  |  87 +++
 .../boot/dts/rockchip/rk3566-anbernic-rg353x.dtsi  |  60 ++
 .../boot/dts/rockchip/rk3566-anbernic-rg503.dts    |  79 +++
 .../boot/dts/rockchip/rk3566-anbernic-rgxx3.dtsi   |  47 +-
 arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts   | 503 ++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts     |  34 +
 .../boot/dts/rockchip/rk3566-soquartz-blade.dts    | 194 ++++++
 .../boot/dts/rockchip/rk3566-soquartz-cm4.dts      |  11 +
 .../boot/dts/rockchip/rk3566-soquartz-model-a.dts  | 232 +++++++
 arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi  |  75 +++
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts  | 744 +++++++++++++++++=
++++
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    | 146 +++-
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |  50 +-
 include/dt-bindings/clock/rk3399-cru.h             |   6 +-
 31 files changed, 4146 insertions(+), 722 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3326-anbernic-rg351m.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2-v11.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3326-odroid-go3.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353x.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts



