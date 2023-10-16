Return-Path: <SRS0=S59y=F6=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E15CCDB474
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:23:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6F3DC433C9; Mon, 16 Oct 2023 21:23:17 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 665DFC433C8;
	Mon, 16 Oct 2023 21:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 665DFC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qsV3S-00013U-2x; Mon, 16 Oct 2023 23:23:14 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.7
Date: Mon, 16 Oct 2023 23:23:13 +0200
Message-ID: <1870252.CQOukoFCf9@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi Arnd, Kevin, Olof,

please find below and in a subsequent pull-request
Rockchip changes for for 6.7 .

As always the 64bit DTS part is the big one, with some new boards and
some more rk3588 peripherals.


Please pull!

Thanks
Heiko


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v6.7-rockchip-dts64-1

for you to fetch changes up to 1e9ac3e8a6a9d4da9efbad2d8e95cc1140e0e23f:

  arm64: dts: rockchip: add support for Powkiddy RGB30 (2023-10-16 22:58:45=
 +0200)

=2D---------------------------------------------------------------
Work mostly focussed on the still new rk3588 Soc with some new boards the
Orange Pi 5 and Orange Pi 5 Plus as well as the QuartzPro64 from Pine64.

It also gained two new peripherals, the SFC (serial-flash-controller)
as well as support for it's AV1 video decoder.

And of course existing rk3588 boards got support added for various
peripherals (PCIe, usb, sardadc, leds, etc).

And in non-rk3588 news, rk3566-based gaming devices seem to be en-vogue,
and the Powkiddy RGB30 also moved in.

=2D---------------------------------------------------------------
Benjamin Gaignard (1):
      arm64: dts: rockchip: Add AV1 decoder node to rk3588s

Chris Morgan (5):
      arm64: dts: rockchip: add PCIe to rk3588s-indiedroid-nova
      arm64: dts: rockchip: add USB2 to rk3588s-indiedroid
      arm64: dts: rockchip: Add saradc node to Indiedroid Nova
      dt-bindings: arm64: rockchip: add Powkiddy RGB30
      arm64: dts: rockchip: add support for Powkiddy RGB30

John Clark (1):
      arm64: dts: rockchip: Add NanoPC T6 PCIe e-key support

Muhammed Efe Cetin (3):
      dt-bindings: arm: rockchip: Add Orange Pi 5 board
      arm64: dts: rockchip: Add sfc node to rk3588s
      arm64: dts: rockchip: Add Orange Pi 5

Ondrej Jirman (6):
      arm64: dts: rockchip: Add I2S2 M0 pin definitions to rk3588s
      arm64: dts: rockchip: Add UART9 M0 pin definitions to rk3588s
      dt-bindings: arm: rockchip: Add Orange Pi 5 Plus
      arm64: dts: rockchip: Add board device tree for rk3588-orangepi-5-plus
      dt-bindings: arm: rockchip: Add Pine64 QuarzPro64
      arm64: dts: rockchip: Add QuartzPro64 SBC device tree

Sebastian Reichel (7):
      arm64: dts: rockchip: add PCIe network controller to rock-5b
      arm64: dts: rockchip: add PCIe for M.2 M-key to rock-5b
      arm64: dts: rockchip: add PCIe for M.2 E-Key to rock-5b
      arm64: dts: rockchip: add PCIe2 network controller to rk3588-evb1
      arm64: dts: rockchip: add PCIe3 bus to rk3588-evb1
      arm64: dts: rockchip: add ADC buttons to rk3588-evb1
      arm64: dts: rockchip: add status LED to rock-5b

Tam=C3=A1s Sz=C5=B1cs (4):
      arm64: dts: rockchip: Add sdio node to rock-5b
      arm64: dts: rockchip: Remove duplicate regulator vcc3v3_wf from rock-=
5b
      arm64: dts: rockchip: Enable UART6 on rock-5b
      arm64: dts: rockchip: Add missing sdmmc2 SDR rates to rock-3a

 .../devicetree/bindings/arm/rockchip.yaml          |   20 +
 arch/arm64/boot/dts/rockchip/Makefile              |    4 +
 .../boot/dts/rockchip/rk3566-powkiddy-rgb30.dts    |  152 +++
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    |    4 +
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |  136 +++
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts  |   28 +
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |  848 +++++++++++++++
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts | 1137 ++++++++++++++++=
++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  145 +++
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |   84 ++
 .../arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts |  662 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-pinctrl.dtsi  |   44 +
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi          |   24 +
 13 files changed, 3288 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts



