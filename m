Return-Path: <SRS0=tHfl=XK=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46E8C433EF
	for <soc@archiver.kernel.org>; Tue,  5 Jul 2022 11:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8DF80C341CB; Tue,  5 Jul 2022 11:10:55 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF288C341C7;
	Tue,  5 Jul 2022 11:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF288C341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o8gS8-0000CQ-Pf; Tue, 05 Jul 2022 13:10:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.20 #1
Date: Tue, 05 Jul 2022 13:10:45 +0200
Message-ID: <40088956.J2Yia2DhmK@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Arnd, Kevin, Olof,

please find below and in a subsequent pull-request
Rockchip changes for for 5.20 .

As always the 64bit DTS part is the big one.

Please pull!

Thanks
Heiko


The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v5.20-rockchip-dts64-1

for you to fetch changes up to 9eee552fd8c45ca3628317bc458d8ff9cd670fc4:

  arm64: dts: rockchip: enable hdmi tx audio on rock-3a (2022-07-04 17:06:4=
6 +0200)

=2D---------------------------------------------------------------
New board the Radxa Rock Pi S, enablement of graphics support and hdmi-audio
on rk356x in general plus necessary board-specific changes on Rock-3A,
Quartz64-A, rk3568-evb, BPI-R2-Pro.

A number of additional peripherals on BPI-R2-Pro (gpu, thermal, rtc) and
PCIe2x1 support on rk3568 and enablement on Quart64-A as well as a number
of additional peripherals to this board (sfc node, sdr-104 support, fan).

And finally touch panel support for rockpro64 and some misc dt cleanups
(node names for dtschema and styling).

=2D---------------------------------------------------------------
Akash Gajjar (1):
      arm64: dts: rockchip: add ROCK Pi S DTS support

=46rank Wunderlich (6):
      arm64: dts: rockchip: add RTC to BPI-R2 Pro
      arm64: dts: rockchip: set display regulators to always-on on BPI-R2-P=
ro
      arm64: dts: rockchip: enable vop2 and hdmi tx on BPI-R2-Pro
      arm64: dts: rockchip: Enable HDMI audio on BPI R2 Pro
      arm64: dts: rockchip: configure thermal shutdown for BPI-R2-Pro
      arm64: dts: rockchip: enable the gpu on BPI-R2-Pro

Krzysztof Kozlowski (2):
      arm64: dts: rockchip: adjust whitespace around '=3D'
      arm64: dts: rockchip: align gpio-key node names with dtschema

Michael Riesch (4):
      arm64: dts: rockchip: enable vop2 and hdmi tx on quartz64a
      arm64: dts: rockchip: enable vop2 and hdmi tx on rock-3a
      arm64: dts: rockchip: enable hdmi tx audio on rk3568-evb1-v10
      arm64: dts: rockchip: enable hdmi tx audio on rock-3a

Nicolas Frattaroli (2):
      arm64: dts: rockchip: Add HDMI audio nodes to rk356x
      arm64: dts: rockchip: Enable HDMI audio on Quartz64 A

Niklas S=F6derlund (1):
      arm64: dts: rockchip: Add missing space around regulator-name on rk33=
68-orion-r68

Peter Geis (6):
      arm64: dts: rockchip: add Quartz64-A fan pinctrl
      arm64: dts: rockchip: enable sdr-104 for sdmmc on Quartz A
      arm64: dts: rockchip: enable sfc controller on Quartz64 Model A
      arm64: dts: rockchip: Add rk3568 PCIe2x1 controller
      arm64: dts: rockchip: Enable PCIe controller on quartz64-a
      arm64: dts: rockchip: add pine64 touch panel display to rockpro64

Sascha Hauer (3):
      arm64: dts: rockchip: rk356x: Add VOP2 nodes
      arm64: dts: rockchip: rk356x: Add HDMI nodes
      arm64: dts: rockchip: rk3568-evb: Enable VOP2 and hdmi

Sjoerd Simons (2):
      dt-bindings: arm: rockchip: Add Radxa ROCK Pi S
      arm64: dts: rockchip: rock-pi-s add more peripherals

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |   2 +-
 arch/arm64/boot/dts/rockchip/rk3308-evb.dts        |   2 +-
 arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts  | 253 +++++++++++++++++=
++++
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts |  32 +--
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts |   2 +-
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi       |   2 +-
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts    |   2 +-
 .../boot/dts/rockchip/rk3368-orion-r68-meta.dts    |   4 +-
 arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dts    |   2 +-
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts        |   2 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |   6 +-
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts        |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    |   2 +-
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dts  |   2 +-
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |   2 +-
 .../boot/dts/rockchip/rk3399-khadas-edge.dtsi      |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dts |   4 +-
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts   |   2 +-
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |   4 +-
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |  72 +++++-
 .../dts/rockchip/rk3399-sapphire-excavator.dts     |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi  |   2 +-
 .../boot/dts/rockchip/rk3399pro-vmarc-som.dtsi     |   2 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  |   2 +-
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts | 114 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3566.dtsi           |   4 +
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts |  89 ++++++++
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   |  55 +++++
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    |  55 +++++
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |   4 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           | 166 ++++++++++++++
 37 files changed, 859 insertions(+), 51 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts



