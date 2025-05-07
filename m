Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7657D1DD877
	for <soc@lists.linux.dev>; Wed,  7 May 2025 22:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746655496; cv=none; b=CUTh0Rc6gqT+4uh8rhyzNhTAQ8cGbAcSPYJMg7wLasqCMMtIatNGtuVfEfsWXq+bc2wujQH9vsvafdOlIczyue0AtTuyLFE7T8BSdhDsramIRGLcpgcm/MzUAWOUxystSwNxhNnUYRvxtJZL9UUrojQDTEDiM9U2Ut7iNVFk5Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746655496; c=relaxed/simple;
	bh=lvOfYjyv6pxQjWfu4WDX5nOY4QvMnFvlVxfc6jO/GLM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KGi3G9XsBkty+n4gPJBxlAXaUxGpVvZPQZBg1hreujnBJvaDf0oMF/NUPabmxaRiLgllfJm48wt5lhhCAnsY6nPNXpr8MCGYzLFKEmu3IVaPPMGJkPtvZaWUhtfh7JzpNEZYtBS7S5etCMNhZfOql7bxc4WvYi290YbUoPQ3RBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=JT4CppGj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="JT4CppGj"
Received: by smtp.kernel.org (Postfix)
	id 10F2EC4CEEF; Wed,  7 May 2025 22:04:56 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E42D6C4CEE2;
	Wed,  7 May 2025 22:04:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E42D6C4CEE2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=4gwEUWCpT4YdJpsY/GBKWtpeiTh23Z4zRMGe35KrUtQ=; b=JT4CppGjdz5CcDtyNEhXTIX9/i
	QpGMX1HVTrzaTomaOkFGEIzCqATS+QkJRs4Q2+GFv07ZtQoaF3/U6qRrjHGDkyKFDaRxOBOwwoU3X
	JDW//zKZJmjdw4vGH2tP1pYAxct1p1mdiGs2+2upD0OWTJRXrpYsR7R+RSHk6yIQrHoVS8LjWLuO7
	C3Nqa+bHObxXprm4pLcu7zj34wAPSA811m9CHhW0kyOkdLZHuGxIn6qAoQOADxcHSb0/RPok3jNxC
	se13y93Cs3upseuqyuwpVD9votv17Xt5D4ejiQ0K9E6QGWHI+MuFPQcblSpcO3Nv6KZVGVe1QjDnk
	Y2rBMlfQ==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uCmsk-0001vi-Hd; Thu, 08 May 2025 00:04:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.16 #1
Date: Thu, 08 May 2025 00:04:48 +0200
Message-ID: <2307187.iZASKD2KPV@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below and in a subsequent pull-requests
Rockchip changes for for 6.16 .

Even some arm32 boards got some love (in the next PR)

Please pull.
Thanks
Heiko


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v6.16-rockchip-dts64-1

for you to fetch changes up to a706a593cb19796f31d3a888423ef1a71885ae72:

  arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-rock3c (2025-=
05-07 08:31:09 +0200)

=2D---------------------------------------------------------------
=2D New boards: rk3588-evb2, rk3588-tiger-haikou-video-demo-overlay
=2D New peripherals: RNG+PCIe+SATA on rk3576; eDP on rk3588;
  DMA+I2C+PWM on rk3528; DSI on rk3588
=2D SPI-flash binding got a supply-property, so a number of boards add
  this supply.
=2D RK3588 wrongly declared the shared memory with SCMI in the peripheral
  space - moved to the correct reserved-memory structure now.
=2D The rest is peripheral enablement accross many boards - like hdmi
  output for a big number of boards, regulators, eeprom, etc.

=2D---------------------------------------------------------------
Andy Yan (6):
      arm64: dts: rockchip: aliase sdhci as mmc0 for rk3566 box demo
      arm64: dts: rockchip: Rename hdmi-con to hdmi0-con for Cool Pi CM5 EVB
      arm64: dts: rockchip: Enable HDMI1 on Cool Pi CM5 EVB
      arm64: dts: rockchip: Enable HDMI audio outputs for Cool Pi CM5 EVB
      arm64: dts: rockchip: Add eDP1 dt node for rk3588
      arm64: dts: rockchip: Enable eDP display for Cool Pi GenBook

Chaoyi Chen (2):
      dt-bindings: arm: rockchip: Add rk3588 evb2 board
      arm64: dts: rockchip: Add rk3588 evb2 board

Chris Morgan (1):
      arm64: dts: rockchip: Enable HDMI0 audio output for Indiedroid Nova

Chukun Pan (6):
      arm64: dts: rockchip: Add missing uart3 interrupt for RK3528
      arm64: dts: rockchip: Add DMA controller for RK3528
      arm64: dts: rockchip: Add UART DMA support for RK3528
      arm64: dts: rockchip: Move SHMEM memory to reserved memory on rk3588
      arm64: dts: rockchip: Add pwm nodes for RK3528
      arm64: dts: rockchip: Enable regulators for Radxa E20C

Damon Ding (2):
      arm64: dts: rockchip: Add eDP0 node for RK3588
      arm64: dts: rockchip: Enable eDP0 display on RK3588S EVB1 board

Diederik de Haas (6):
      arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3328-rock64
      arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-rockpro64
      arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-pinetab2
      arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3588-rock-5b
      arm64: dts: rockchip: Add phy-supply to gmac0 on NanoPi R5S
      arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-quartz64-b

Heiko Stuebner (5):
      arm64: dts: rockchip: change rng reset id back to its constant value
      arm64: dts: rockchip: add mipi dcphy nodes to rk3588
      arm64: dts: rockchip: add dsi controller nodes on rk3588
      arm64: dts: rockchip: add overlay for tiger-haikou video-demo adapter
      arm64: dts: rockchip: Add HDMI support for roc-rk3576-pc

Jacobe Zang (3):
      arm64: dts: rockchip: Add bluetooth support to Khadas Edge2
      arm64: dts: rockchip: Add HDMI & VOP2 to Khadas Edge2
      arm64: dts: rockchip: enable HDMI out audio on Khadas Edge2

Jianfeng Liu (1):
      arm64: dts: rockchip: Enable HDMI ports on ArmSoM W3

Jimmy Hon (1):
      arm64: dts: rockchip: Enable bluetooth of AP6611s on OrangePI5 Max/Ul=
tra

John Clark (1):
      arm64: dts: rockchip: fix usb-c port functionality on rk3588-nanopc-t6

Kever Yang (1):
      arm64: dts: rockchip: Add rk3576 pcie nodes

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: Switch to undeprecated qcom,calibration-variant=
 on RK3399

Marcin Juszkiewicz (2):
      arm64: dts: rockchip: enable HDMI1 on FriendlyElec NanoPC-T6
      arm64: dts: rockchip: enable HDMI sound on FriendlyElec NanoPC-T6

Markus Reichl (1):
      arm64: dts: rockchip: Add vcc supply to spi flash on rk3399-roc-pc

Nicolas Frattaroli (3):
      arm64: dts: rockchip: enable pcie on Sige5
      arm64: dts: rockchip: add SATA nodes to RK3576
      arm64: dts: rockchip: add RK3576 RNG node

Peter Robinson (1):
      arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-rock3c

Quentin Schulz (2):
      arm64: dts: rockchip: Enable HDMI audio output for RK3588 Jaguar
      arm64: dts: rockchip: Enable HDMI audio output for RK3588 Tiger Haikou

Shawn Lin (3):
      arm64: dts: rockchip: Enable ufshc on rk3576 evb1 board
      arm64: dts: rockchip: Rename vcc3v3_pcie0 to vcc3v3_pcie1 for rk3576-=
evb1-v10
      arm64: dts: rockchip: Add pcie1 slot for rk3576 evb1 board

Uwe Kleine-K=C3=B6nig (2):
      arm64: dts: rockchip: Correct gmac phy address on QNAP TS433
      arm64: dts: rockchip: Add gmac phy reset GPIO to QNAP TS433

Yao Zi (2):
      arm64: dts: rockchip: Add I2C controllers for RK3528
      arm64: dts: rockchip: Add onboard EEPROM for Radxa E20C

=2E../devicetree/bindings/arm/rockchip.yaml          |   4 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   6 +
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |   1 +
 .../boot/dts/rockchip/rk3399-gru-scarlet-dumo.dts  |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |   1 +
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi |   1 +
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts |  87 ++
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           | 219 ++++-
 arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts   |   6 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi  |   1 +
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts |   1 +
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts    |   1 +
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts |   1 +
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts |  15 +-
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  23 +
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |  17 +-
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts     |  47 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 146 ++++
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts  | 101 +++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 144 +++-
 .../boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts    |  62 +-
 .../dts/rockchip/rk3588-coolpi-cm5-genbook.dts     |  47 ++
 arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts   | 931 +++++++++++++++++=
++++
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |  28 +
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |   8 +
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |  75 +-
 .../dts/rockchip/rk3588-orangepi-5-compact.dtsi    |  36 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |   1 +
 .../rockchip/rk3588-tiger-haikou-video-demo.dtso   | 153 ++++
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts      |   8 +
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts  |  55 ++
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |   8 +
 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts     |  77 +-
 33 files changed, 2281 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-video-=
demo.dtso



