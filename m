Return-Path: <SRS0=nhTP=P7=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6D3CA101E
	for <soc@archiver.kernel.org>; Sun,  1 Sep 2024 22:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A529BC4CEC8; Sun,  1 Sep 2024 22:10:58 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D11CC4CEC3;
	Sun,  1 Sep 2024 22:10:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1D11CC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9HRhxhGrRFoS0p7XJlnXnSx8z9a6FfRVHv1cK4UUpWg=; b=Owk+8wapxbTpii52ucw3FnOTbU
	cXmlFWM219Q8NyaXT0YpDmI+i1NFZDhBPj/2po24M2O7WfpdeeHfAHn/5caBB9l/Oudzm3Yr2K7ce
	xezKgUvB2RKgWBCW2yacmeBYNw6b8brzCqXFTUYcZCWdzPYX5aULuzLak4JH5K+yAh9ERyTOcYlfL
	zPN946yJGP9Lg1O5MsJlpss5qUrUuSlZyqJnlpS7P/+ZKpjSPEu9XmrKImlCkLLEwIBbid9BHf7XU
	+JE/ldKmO1ZCBsJxJ+74W0xixGcfFsjQ8uJTpt+faLZSjFH2qQq9vyZ7Nh4qJ9PLsbnX/UF5uiM24
	O2IlDqAg==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sksmb-0006h7-Tn; Mon, 02 Sep 2024 00:10:53 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.12 #1
Date: Mon, 02 Sep 2024 00:12:27 +0200
Message-ID: <6322098.17fYzF0512@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Arnd, Kevin, Olof,

please find below and in a subsequent pull-requests
Rockchip changes for for 6.12 .

Some new boards, some new peripherals.

This time we have the necessary dtc changes in linux-next for the overlay
that did not compile cleanly last time :-)

The VPU bindings _are_ in the media-tree "pipeline" [0], but I still got
a warning mail from a builder-bot on next last week. But I assume this
will right itself during the next days hopefully.


Please pull.
Thanks
Heiko


[0] https://git.linuxtv.org/media_stage.git/commit/?id=3D1e490a1ea64396b98d=
b8c233360093e264b0c10b
https://git.linuxtv.org/media_stage.git/commit/?id=3Db92346d2dba0048bfce711=
4225250bef73f83ad2
https://git.linuxtv.org/media_stage.git/commit/?id=3D1575740813de649199e68f=
c29bbb9707acebd34e


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v6.12-rockchip-dts64-1

for you to fetch changes up to 78d500329b65217c45422ac0adf5c030783d3e58:

  arm64: dts: rockchip: drop unsupported regulator-property from NanoPC-T6 =
(2024-08-29 23:55:32 +0200)

=2D---------------------------------------------------------------
New boards: Firefly PX30 Core SoM with JD4 baseboard, NanoPi 2S Plus,
Taishan Pi RK3566, ODROID-M1S,NanoPC-T6 LTS, Cool Pi CM5 GenBook

Big number of improvements for NanoPC-T6,QNAP-TS433 and FastRhino R66S
With recent dtc changes making it into linux-next the Wolfvision Visualizer
overlay finally compiles without warnings. And smaller number of
improvements on a number of Radxa boards.

Interesting new additions on a soc-level are the hardware RNG on rk3568,
an additional sdmmc-controller (not supported before) on rk3328 and
v4l video codecs for the rk3588 (decoding of h.264 amongst others).

=2D---------------------------------------------------------------
Alex Bee (2):
      arm64: dts: rockchip: Add sdmmc_ext for RK3328
      arm64: dts: rockchip: Add sdmmc/sdio/emmc reset controls for RK3328

Andy Yan (2):
      dt-bindings: arm: rockchip: Add Cool Pi CM5 GenBook
      arm64: dts: rockchip: Add support for rk3588 based Cool Pi CM5 GenBook

Aurelien Jarno (1):
      arm64: dts: rockchip: add DT entry for RNG to RK356x

Christopher Obbard (3):
      dt-bindings: arm: rockchip: Add Firefly Core-PX30-JD4 on baseboard
      arm64: dts: rockchip: add Firefly Core-PX30-JD4 SoM
      arm64: dts: rockchip: add Firefly JD4 baseboard with Core-PX30-JD4 SoM

Chukun Pan (4):
      arm64: dts: rockchip: use generic Ethernet PHY reset bindings for Lun=
zn Fastrhino R68S
      arm64: dts: rockchip: remove useless tx/rx_delay for Lunzn Fastrhino =
R68S
      arm64: dts: rockchip: Enable UHS-I SDR-50 for Lunzn FastRhino R66S
      arm64: dts: rockchip: disable display subsystem only for Radxa E25

Dragan Simic (3):
      arm64: dts: rockchip: Correct the Pinebook Pro battery design capacity
      arm64: dts: rockchip: Move RK3399 OPPs to dtsi files for SoC variants
      arm64: dts: rockchip: Raise Pinebook Pro's panel backlight PWM freque=
ncy

Emmanuel Gil Peyrot (1):
      arm64: dts: rockchip: Add VEPU121 to RK3588

=46UKAUMI Naoki (3):
      arm64: dts: rockchip: drop dr_mode for Radxa ZERO 3W/3E
      arm64: dts: rockchip: remove unnecessary properties for Radxa ROCK 5A
      arm64: dts: rockchip: enable PCIe on M.2 E key for Radxa ROCK 5A

=46lorian Klink (1):
      arm64: dts: rockchip: add rfkill node for M.2 E wifi on orangepi-5-pl=
us

Heiko Stuebner (20):
      arm64: dts: rockchip: add PCIe supply regulator to Qnap-TS433
      arm64: dts: rockchip: enable second PCIe controller on the Qnap-TS433
      arm64: dts: rockchip: enable uart0 on Qnap-TS433
      arm64: dts: rockchip: enable usb ports on Qnap-TS433
      arm64: dts: rockchip: add stdout path on Qnap-TS433
      arm64: dts: rockchip: enable sata1+2 on Qnap-TS433
      arm64: dts: rockchip: add board-aliases for Qnap-TS433
      arm64: dts: rockchip: add hdd leds to Qnap-TS433
      arm64: dts: rockchip: enable the tsadc on the Qnap-TS433
      arm64: dts: rockchip: add gpio-keys to Qnap-TS433
      arm64: dts: rockchip: define cpu-supply on the Qnap-TS433
      arm64: dts: rockchip: add missing pmic information on Qnap-TS433
      arm64: dts: rockchip: enable gpu on Qnap-TS433
      arm64: dts: rockchip: add 2 pmu_io_domain supplies for Qnap-TS433
      arm64: dts: rockchip: actually enable pmu-io-domains on qnap-ts433
      arm64: dts: rockchip: add product-data eeproms to QNAP TS433
      arm64: dts: rockchip: drop obsolete reset-names from rk356x rng node
      arm64: dts: rockchip: use correct fcs,suspend-voltage-selector on Nan=
oPC-T6
      arm64: dts: rockchip: drop unsupported regulator property from NanoPC=
=2DT6
      arm64: dts: rockchip: drop unsupported regulator-property from NanoPC=
=2DT6

Jianfeng Liu (1):
      arm64: dts: rockchip: Add VPU121 support for RK3588

Jonas Karlman (4):
      dt-bindings: arm: rockchip: Correct vendor for Hardkernel ODROID-M1
      arm64: dts: rockchip: Correct vendor prefix for Hardkernel ODROID-M1
      dt-bindings: arm: rockchip: Add Hardkernel ODROID-M1S
      arm64: dts: rockchip: Add Hardkernel ODROID-M1S

Jonathan Liu (1):
      arm64: dts: rockchip: Enable RK809 audio codec for Radxa ROCK 4C+

Junhao Xie (3):
      dt-bindings: vendor-prefixes: Add Shenzhen JLC Technology Group LCKFB
      dt-bindings: arm: rockchip: Add LCKFB Taishan Pi RK3566
      arm64: dts: rockchip: add dts for LCKFB Taishan Pi RK3566

Marcin Juszkiewicz (9):
      dt-bindings: arm: rockchip: Add NanoPC-T6 LTS
      arm64: dts: rockchip: prepare NanoPC-T6 for LTS board
      arm64: dts: rockchip: move NanoPC-T6 parts to DTS
      arm64: dts: rockchip: add NanoPC-T6 LTS
      arm64: dts: rockchip: add SPI flash on NanoPC-T6
      arm64: dts: rockchip: add IR-receiver to NanoPC-T6
      arm64: dts: rockchip: enable GPU on NanoPC-T6
      arm64: dts: rockchip: enable USB-C on NanoPC-T6
      arm64: dts: rockchip: add Mask Rom key on NanoPC-T6

Michael Riesch (1):
      arm64: dts: rockchip: add wolfvision pf5 visualizer display

Sergey Bostandzhyan (2):
      dt-bindings: arm: rockchip: Add NanoPi R2S Plus
      arm64: dts: rockchip: Add DTS for FriendlyARM NanoPi R2S Plus

Uwe Kleine-K=F6nig (1):
      arm64: dts: rockchip: Simplify network PHY connection on qnap-ts433

 .../devicetree/bindings/arm/rockchip.yaml          |   32 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/rockchip/Makefile              |    7 +
 .../boot/dts/rockchip/px30-firefly-jd4-core-mb.dts |  179 ++
 .../boot/dts/rockchip/px30-firefly-jd4-core.dtsi   |  320 ++
 .../boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts   |   32 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |   20 +
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi      | 3019 ++++++++++++++++=
+++
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts  |    1 -
 arch/arm64/boot/dts/rockchip/rk3399-evb.dts        |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-firefly.dts    |    1 -
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |    3 +-
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts |    1 -
 .../boot/dts/rockchip/rk3399-khadas-edge.dtsi      |    1 -
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |    1 -
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts  |    1 -
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   |    1 -
 .../{rk3399-op1-opp.dtsi =3D> rk3399-op1.dtsi}       |    2 +
 arch/arm64/boot/dts/rockchip/rk3399-opp.dtsi       |  133 -
 arch/arm64/boot/dts/rockchip/rk3399-orangepi.dts   |    1 -
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |    5 +-
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |    1 -
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |    1 -
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |    1 -
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      |   49 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dts   |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |    2 -
 .../boot/dts/rockchip/rk3399-rock-pi-4a-plus.dts   |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dts |    2 +-
 .../boot/dts/rockchip/rk3399-rock-pi-4b-plus.dts   |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dts |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dts |    2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi   |    3 +-
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |    1 -
 arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtsi  |    1 -
 .../rockchip/{rk3399-t-opp.dtsi =3D> rk3399-t.dtsi}  |    2 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           | 3070 +---------------=
=2D---
 .../boot/dts/rockchip/rk3399pro-rock-pi-n10.dts    |    1 -
 arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts |  725 +++++
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts |  663 +++++
 .../boot/dts/rockchip/rk3566-radxa-zero-3.dtsi     |    1 -
 .../boot/dts/rockchip/rk3568-fastrhino-r66s.dts    |    2 +-
 .../boot/dts/rockchip/rk3568-fastrhino-r68s.dts    |   18 +-
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts  |    2 +-
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts |  571 +++-
 .../arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi |    4 -
 arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dts  |    4 +
 .../rockchip/rk3568-wolfvision-pf5-display-vz.dtso |   17 +
 .../rockchip/rk3568-wolfvision-pf5-display.dtsi    |  121 +
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |    4 +
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |    9 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  101 +
 .../dts/rockchip/rk3588-coolpi-cm5-genbook.dts     |  349 +++
 .../boot/dts/rockchip/rk3588-nanopc-t6-lts.dts     |   60 +
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts  |  909 +-----
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi | 1042 +++++++
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |    7 +
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |   54 +-
 58 files changed, 7469 insertions(+), 4102 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-firefly-jd4-core-mb.d=
ts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-firefly-jd4-core.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi
 rename arch/arm64/boot/dts/rockchip/{rk3399-op1-opp.dtsi =3D> rk3399-op1.d=
tsi} (99%)
 delete mode 100644 arch/arm64/boot/dts/rockchip/rk3399-opp.dtsi
 rename arch/arm64/boot/dts/rockchip/{rk3399-t-opp.dtsi =3D> rk3399-t.dtsi}=
 (98%)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-disp=
lay-vz.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-disp=
lay.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.=
dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi



