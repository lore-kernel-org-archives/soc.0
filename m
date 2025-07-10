Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9092D0C93
	for <soc@lists.linux.dev>; Thu, 10 Jul 2025 11:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752146989; cv=none; b=Vj8S0uKRoYoKhqmaTYYw3U1byzulUC5Jf3CDQbfg4L8nmJPmLWn63Jb8KaPseR3mFtWgkMNhdK5IWvkIRMeDKu9cQHV5ro46BHAYbXxXZtaqZFMQFaXleSihDR4k1c66vXEFbYBlK0bCWHoiPNDza9iU4CLumXfq5nIJt+RJrMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752146989; c=relaxed/simple;
	bh=/osK/bBy3pTJ4UNHciHNVoknbLXXNW6Lo7iPp3uPb5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Li1bIH7YjB4whuM+t037F6sQD8R8adlpM5ib99v6hHt+n7M1Ned9Rlw4a/IaB5iv/NJCGQMhtyBO7mY/4e+/kfznAXI+Kbju7UuIvQwjDp6rMY8qVD+xA02uIbGE+VpBYiL8XoioXmyge5F00Hbp58n1Ra0CDuggtXpDgzdNcOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=jO79uTOS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="jO79uTOS"
Received: by smtp.kernel.org (Postfix)
	id B20B6C4CEF6; Thu, 10 Jul 2025 11:29:48 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76E48C4CEF5;
	Thu, 10 Jul 2025 11:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76E48C4CEF5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=1EgepSYSqMC2d+tiMF08mf9aOpOjLIUIm5ANMd7Ncp0=; b=jO79uTOS8NQh0rwX2mm2tH1mbf
	5k3Sy+I3gn4FafoeluVnGsiCFxpMN9rnzVJOCdoTmr6o+2xAPaRMQcwHd8KqjFYHU7SIUMbl32qh6
	tE5uK/3QWIsbCBuTLMUY1jQgpOUYlWalOSe/lmHAPokmVTTDLYj+Iyw+rorZz2P0RFysRGDCyV0sJ
	aAE4lKQgr8+AualDp2KON+qmW/I52wg4i4W0kh+y+wx1ctp0sN1jIgbwnZx3dKa6Rw9oHDWq7ljdw
	0BpQtgYcIHVRUsRW+3dG0xA0yZvmdRb5VXA/Csrx5QQe7VLykOGWGr1e+PR5ZBZ8w4SJMH/ve96nj
	VUWP6zSQ==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZpTF-0004WL-Hb; Thu, 10 Jul 2025 13:29:45 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.17 #1
Date: Thu, 10 Jul 2025 13:29:45 +0200
Message-ID: <15465458.uLZWGnKmhe@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below Rockchip changes for for 6.17 .


Please pull.
Thanks
Heiko


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v6.17-rockchip-dts64-1

for you to fetch changes up to 6e3071f4e03997ca0e4388ca61aa06df2802dcd1:

  arm64: dts: rockchip: Enable eMMC HS200 mode on Radxa E20C (2025-06-30 11=
:44:12 +0200)

=2D---------------------------------------------------------------
New boards: ROC-RK3588S-PC, Luckfox Omni3576, Radxa Rock 5T,
Sakura Pi RK3308B - all of them have the used soc in their name.

New overlays: RockPro64 screen, optional Sige5 Wifi/BT module,
ethernet-switch addon for Jaguar.

Added peripherals on rk3528 (spi, power-domain controller, gpu)
and sdio controller on rk3576.

DSI display support for the Gameforce-ACE handheld, a fix for the
cover-detection (closed/open) on the PineNote, camera support for
the Haikou Video Demo overlay on PX30 Ringneck as well as a number
of other newly enabled peripherals on a number of boards.

=2D---------------------------------------------------------------
Alexey Charkov (3):
      arm64: dts: rockchip: add SDIO controller on RK3576
      arm64: dts: rockchip: add version-independent WiFi/BT nodes on Sige5
      arm64: dts: rockchip: add overlay for the WiFi/BT module on Sige5 v1.2

Andy Yan (1):
      arm64: dts: rockchip: Enable gpu on rk3576-evb1-v10

Chris Morgan (2):
      arm64: dts: rockchip: Add DSI panel support for gameforce-ace
      arm64: dts: rockchip: Document unused device on i2c1

Chukun Pan (1):
      arm64: dts: rockchip: Add spi nodes for RK3528

Cristian Ciocaltea (2):
      arm64: dts: rockchip: Enable HDMI PHY clk provider on rk3576
      arm64: dts: rockchip: Add HDMI PHY PLL clock source to VOP2 on rk3576

Diederik de Haas (1):
      arm64: dts: rockchip: Fix cover detection on PineNote

Heiko Stuebner (1):
      arm64: dts: rockchip: convert rk3562 to their dt-binding constants

Hsun Lai (5):
      dt-bindings: vendor-prefixes: Add SakuraPi prefix
      dt-bindings: arm: rockchip: Add Sakura Pi RK3308B
      arm64: dts: rockchip: add DTs for Sakura Pi RK3308B
      dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
      arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC

Jianfeng Liu (1):
      arm64: dts: rockchip: Add bluetooth support to ArmSoM Sige7

John Clark (4):
      arm64: dts: rockchip: Use standard PHY reset properties for RK3576 Ar=
mSoM Sige5
      dt-bindings: vendor-prefixes: Add luckfox prefix
      dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
      arm64: dts: rockchip: Add Luckfox Omni3576 Board support

Jonas Karlman (4):
      arm64: dts: rockchip: Add power controller for RK3528
      arm64: dts: rockchip: Add GPU node for RK3528
      arm64: dts: rockchip: Enable GPU on Radxa E20C
      arm64: dts: rockchip: Enable eMMC HS200 mode on Radxa E20C

Nicolas Frattaroli (6):
      dt-bindings: arm: rockchip: add RADXA ROCK 5T
      arm64: dts: rockchip: rename rk3588-rock-5b.dtsi
      arm64: dts: rockchip: move common ROCK 5B/+ nodes into own tree
      arm64: dts: rockchip: add ROCK 5T device tree
      arm64: dts: rockchip: enable USB on Sige5
      arm64: dts: rockchip: enable PCIe on ROCK 4D

Olivier Benjamin (1):
      arm64: dts: rockchip: Update the PinePhone Pro panel description

Peter Robinson (2):
      arm64: dts: rockchip: drop touch panel display from rockpro64
      arm64: dts: rockchip: add overlay for RockPro64 screen

Quentin Schulz (4):
      arm64: dts: rockchip: support Ethernet Switch adapter for RK3588 Jagu=
ar
      arm64: dts: rockchip: fix endpoint dtc warning for PX30 ISP
      arm64: dts: rockchip: add label to first port of ISP on px30
      arm64: dts: rockchip: support camera module on Haikou Video Demo on P=
X30 Ringneck

Sam Edwards (1):
      arm64: dts: rockchip: Remove workaround that prevented Turing RK1 GPU=
 power regulator control

Valentin H=C4=83loiu (1):
      arm64: dts: rockchip: Enable HDMI receiver on CM3588

 .../devicetree/bindings/arm/rockchip.yaml          |  22 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 arch/arm64/boot/dts/rockchip/Makefile              |  23 +
 arch/arm64/boot/dts/rockchip/px30-evb.dts          |   3 +-
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi      |   3 +-
 .../rockchip/px30-ringneck-haikou-video-demo.dtso  |  53 ++
 arch/arm64/boot/dts/rockchip/px30.dtsi             |   4 +-
 .../boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts  | 265 +++++++
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |  33 +-
 .../boot/dts/rockchip/rk3399-rockpro64-screen.dtso |  86 ++
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |  64 --
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts |   6 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           | 150 ++++
 arch/arm64/boot/dts/rockchip/rk3562.dtsi           |  37 +-
 .../boot/dts/rockchip/rk3566-anbernic-rgxx3.dtsi   |   2 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  |   2 +-
 .../rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtso  |  49 ++
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 253 +++++-
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |   5 +
 .../boot/dts/rockchip/rk3576-luckfox-core3576.dtsi | 749 ++++++++++++++++++
 .../boot/dts/rockchip/rk3576-luckfox-omni3576.dts  |  51 ++
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    |  15 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  23 +-
 .../boot/dts/rockchip/rk3588-armsom-sige7.dts      |  36 +
 .../rockchip/rk3588-friendlyelec-cm3588-nas.dts    |  17 +
 .../rockchip/rk3588-jaguar-ethernet-switch.dtso    | 195 +++++
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 878 +++++++++++++++++=
++++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   | 875 +----------------=
=2D--
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    | 105 +++
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |  11 -
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |  66 +-
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts    | 840 +++++++++++++++++=
+++
 32 files changed, 3923 insertions(+), 1002 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dt=
so
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5-v1.2-w=
ifibt.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dt=
si
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-swi=
tch.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts



