Return-Path: <SRS0=Lrvw=TH=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38DDAC433F5
	for <soc@archiver.kernel.org>; Thu, 24 Feb 2022 23:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E9C60C340F3; Thu, 24 Feb 2022 23:19:26 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61CC0C340EF;
	Thu, 24 Feb 2022 23:19:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61CC0C340EF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from [185.156.123.69] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nNNOH-0004FM-Cw; Fri, 25 Feb 2022 00:19:17 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.18 #1
Date: Fri, 25 Feb 2022 00:19:16 +0100
Message-ID: <6456947.djgVdjDsCv@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below and in subsequent pull-requests
Rockchip changes for for 5.18 .

Only the arm64-one is on the bigger side.

Please pull!

Thanks
Heiko

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.18-rockchip-dts64-1

for you to fetch changes up to a0024f55eb5b741b76a0b950f1222ddbab6a9fc9:

  arm64: dts: rockchip: align Google CROS EC PWM node name with dtschema (2022-02-24 00:07:56 +0100)

----------------------------------------------------------------
New boards: Pine64 PineNote ereader tablet and Bananapi-R2-Pro (both rk356x)

New peripherals for the rk356x-family (pdm-audio, gpu, another i2s, usb2)

A lot of additions to Quartz-A (connector-header, gpu, sdmmc1, io-domains,
usb2) and rk3568-evb1-v10 (rk809-audio, cpu-regulator, gpu, tsadc, led,
usb2, touchscreen).

Fixes for the pwm-regulators, that used wrong names for their supplies
as well adapting the cros-ec pwm nodes to a changed binding (going via
the pwm tree).

And as sort of misc-changes, defined the logic-regulator on rk3399-puma
as well as enabled the mali-gpu on the rk3399-firefly.

----------------------------------------------------------------
Alex Bee (1):
      arm64: dts: rockchip: add cooling map and trip points for gpu to rk356x

Ezequiel Garcia (2):
      arm64: dts: rockchip: add gpu node to rk356x
      arm64: dts: rockchip: enable the gpu on quartz64-a

Frank Wunderlich (2):
      dt-bindings: rockchip: Add BananaPi R2 Pro Board
      arm64: dts: rockchip: Add Bananapi R2 Pro

Heiko Stuebner (2):
      arm64: dts: rockchip: define vdd_log on rk3399-puma
      arm64: dts: rockchip: fix supplies for pwm regulators

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: align Google CROS EC PWM node name with dtschema

Michael Riesch (11):
      arm64: dts: rockchip: fix vcc3v3_lcd{0,1}_n regulators in rk3568-evb1-10
      arm64: dts: rockchip: add the touchscreen controller to rk3568-evb1-v10
      arm64: dts: rockchip: add the i2s3_2ch node to rk356x
      arm64: dts: rockchip: rename and sort the rk356x usb2 phy handles
      arm64: dts: rockchip: add usb2 support to rk3568-evb1-v10
      arm64: dts: rockchip: enable the gpu on rk3568-evb1-v10
      arm64: dts: rockchip: enable the tsadc on rk3568-evb1-v10
      arm64: dts: rockchip: enable work led on rk3568-evb1-v10
      arm64: dts: rockchip: add the vdd_cpu regulator to rk3568-evb1-v10
      arm64: dts: rockchip: set vdd_gpu regulator on rk3568-evb1-v10 to always on
      arm64: dts: rockchip: enable rk809 audio codec on the rk3568 evb1-v10

Michael Saunders (1):
      arm64: dts: rockchip: enable the mali GPU on rk3399-firefly

Peter Geis (5):
      arm64: dts: rockchip: add usb2 nodes to rk3568 device tree
      arm64: dts: rockchip: add Quartz64-A usb2 support
      arm64: dts: rockchip: add Quartz64-A pmu_io_domains
      arm64: dts: rockchip: add Quartz64-A sdmmc1 node
      arm64: dts: rockchip: add Quartz64-A con40 hardware

Samuel Holland (3):
      dt-bindings: arm: rockchip: Add Pine64 PineNote board
      arm64: dts: rockchip: Add pdm node to rk356x
      arm64: dts: rockchip: Add Pine64 PineNote board

 .../devicetree/bindings/arm/rockchip.yaml          |  13 +
 arch/arm64/boot/dts/rockchip/Makefile              |   3 +
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    |   7 +-
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |   2 +-
 .../boot/dts/rockchip/rk3399-khadas-edge.dtsi      |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts  |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts   |   2 +-
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |  11 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi  |   2 +-
 .../boot/dts/rockchip/rk3566-pinenote-v1.1.dts     |  18 +
 .../boot/dts/rockchip/rk3566-pinenote-v1.2.dts     |  18 +
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  | 639 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts | 136 +++++
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts | 457 +++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   | 205 ++++++-
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           | 210 +++++++
 19 files changed, 1721 insertions(+), 12 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts



