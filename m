Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C618622612
	for <soc@lists.linux.dev>; Sun, 18 May 2025 09:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747559652; cv=none; b=qMF3eEjblvFgAhMac7P2ux4WKVJpR1adGXWogCYkS0H3WZSLnDifLu74K+mipz2oyL8X2N2zCtv5ptJW9oyFTPlCqbacwJtzWt6IUjEFYL4kK08wB0GcTjcLwTi6xBo6RRlcgunt7egPXAAc7Q019m9S+RHp2SV5bhvhaEMrCpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747559652; c=relaxed/simple;
	bh=9dVkHd+4JVL3R59Jq4338Vo9SIFovX4ACNPQ7Yxt+04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AYeTW897vnclJJ0bc43zcCeYsVyZsmYybvrf6VumU/VsAThvhLw05Qt+3peMGaUtvv+vB+6d7h1QH59vyOpZJkfuPEYyJFic9ZrZJA9CjKQE5GeaTyxhSo5wWFNEZwBw1ofxPC44HxOyl3tRfyv3rojw3yGDTTttn0tpAQKa+g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=crynOXSZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="crynOXSZ"
Received: by smtp.kernel.org (Postfix)
	id 4E9BAC4CEE9; Sun, 18 May 2025 09:14:11 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD99CC4CEE7;
	Sun, 18 May 2025 09:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD99CC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=BNXyBGuoJC4ONR3bPoLfKKuzOJ3jcXvPaWtk/2/Z8mU=; b=crynOXSZ3VXIllU58NSl5JJUDr
	zrclRfp1E4xkqk+UYx4bt2psKRH9Gcik8IHVq5jMasoB7ZgflfAC+P1tOd+VqA/mQwR69RCgKBhST
	PdgeWks/wVtoPVARTbFwMzOPUqdaxKH4NvSOK0usRkI7FwdS43DPZs8IdbdZEZe3Geajwl1Y4rqRN
	Wce3AcFOeHxE7YFQMkN8rhS7+fiXZPc/N01bKv5Oa5uOBKc9j4mLph3jIJRdoljZ0bUmVt5W0Ijo7
	QduP42dBqV7AvbQllaKAvqObnxqm+nDeOCgj+EnVlOZY+aCzcK3+WnExDMQ9/PzaLcfjrJulRkJEH
	QpJqPvYA==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGa5w-0002GA-8d; Sun, 18 May 2025 11:14:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.16 #2
Date: Sun, 18 May 2025 11:14:07 +0200
Message-ID: <3998939.iIbC2pHGDl@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below and in the next PR some more
Rockchip changes aimed at 6.16 .

Please pull.

Thanks
Heiko


The following changes since commit a706a593cb19796f31d3a888423ef1a71885ae72:

  arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-rock3c (2025-05-07 08:31:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.16-rockchip-dts64-2

for you to fetch changes up to 1631cbdb808963354ef6b6454bc617cd15f90718:

  arm64: dts: rockchip: Improve LED config for NanoPi R5S (2025-05-15 14:57:44 +0200)

----------------------------------------------------------------
New SoC the RK3562 (4xA53, Mali-G52) with one evaluation board.
New boards:
 - Cobra and PP1516 from Theobroma-Systems (build around the PX30)
 - Radxa Rock 5B+ (rk3588)
 - Rockchip RK3399 industrial eval board
New peripherals:
 - GMAC + SDMMC/SDIO on rk3528
 - SAI + HDMI-audio on rk3576
Interesting general updates:
 - move rk3528 i2c + uart aliases as requested
 - rk3568 PCIe3 MSI to use GIC ITS
 - update deprecated dwmac reset properties on some px30 boards
 - updates for cypress usb hubs on some Theobroma boards
   Binding taken with Greg's blessing
   https://lore.kernel.org/all/2025051550-polish-prude-ed56@gregkh/

----------------------------------------------------------------
Chaoyi Chen (2):
      dt-bindings: arm: rockchip: Add rk3399 industry evaluation board
      arm64: dts: rockchip: Add rk3399-evb-ind board

Chukun Pan (1):
      arm64: dts: rockchip: Move rk3568 PCIe3 MSI to use GIC ITS

Diederik de Haas (1):
      arm64: dts: rockchip: Improve LED config for NanoPi R5S

FUKAUMI Naoki (1):
      dt-bindings: arm: rockchip: Add Radxa ROCK 5B+

Finley Xiao (2):
      arm64: dts: rockchip: add core dtsi for RK3562 SoC
      arm64: dts: rockchip: Add RK3562 evb2 devicetree

Heiko Stuebner (9):
      Merge branch 'v6.16-shared/clkids' into v6.16-armsoc/dts64
      arm64: dts: rockchip: drop wrong spdif clock from edp1 on rk3588
      arm64: dts: rockchip: move rk3528 i2c+uart aliases to board files
      arm64: dts: rockchip: add basic mdio node to px30
      arm64: dts: rockchip: move reset to dedicated eth-phy node on ringneck
      dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma Systems
      arm64: dts: rockchip: add px30-cobra base dtsi and board variants
      dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma Systems
      arm64: dts: rockchip: add px30-pp1516 base dtsi and board variants

Jonas Karlman (2):
      arm64: dts: rockchip: Add GMAC nodes for RK3528
      arm64: dts: rockchip: Enable Ethernet controller on Radxa E20C

Kever Yang (3):
      dt-bindings: rockchip: pmu: Add rk3562 compatible
      dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
      dt-bindings: arm: rockchip: Add rk3562 evb2 board

Lukasz Czechowski (2):
      dt-bindings: usb: cypress,hx3: Add support for all variants
      arm64: dts: rockchip: fix internal USB hub instability on RK3399 Puma

Nicolas Frattaroli (5):
      dt-bindings: clock: rk3576: add IOC gated clocks
      arm64: dts: rockchip: Add RK3576 SAI nodes
      arm64: dts: rockchip: Add RK3576 HDMI audio
      arm64: dts: rockchip: Add analog audio on RK3576 Sige5
      arm64: dts: rockchip: Enable HDMI audio on Sige5

Peter Robinson (1):
      arm64: dts: rockchip: Update eMMC for NanoPi R5 series

Quentin Schulz (2):
      arm64: dts: rockchip: disable unrouted USB controllers and PHY on RK3399 Puma
      arm64: dts: rockchip: disable unrouted USB controllers and PHY on RK3399 Puma with Haikou

Sebastian Reichel (2):
      arm64: dts: rockchip: move rock 5b to include file
      arm64: dts: rockchip: add Rock 5B+

Yao Zi (3):
      dt-bindings: clock: Add GRF clock definition for RK3528
      arm64: dts: rockchip: Add SDMMC/SDIO controllers for RK3528
      arm64: dts: rockchip: Enable SD-card interface on Radxa E20C

 .../devicetree/bindings/arm/rockchip.yaml          |   33 +
 .../devicetree/bindings/arm/rockchip/pmu.yaml      |    2 +
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    7 +
 .../devicetree/bindings/usb/cypress,hx3.yaml       |   19 +-
 arch/arm64/boot/dts/rockchip/Makefile              |    9 +
 .../dts/rockchip/px30-cobra-ltk050h3146w-a2.dts    |   39 +
 .../boot/dts/rockchip/px30-cobra-ltk050h3146w.dts  |   39 +
 .../boot/dts/rockchip/px30-cobra-ltk050h3148w.dts  |   39 +
 .../boot/dts/rockchip/px30-cobra-ltk500hd1829.dts  |   73 +
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi       |  566 +++++
 .../dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts   |   39 +
 .../boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts |   39 +
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi      |  602 +++++
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |   22 +-
 arch/arm64/boot/dts/rockchip/px30.dtsi             |    6 +
 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts    |  494 ++++
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |    8 -
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |   48 +-
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts |   62 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |  190 +-
 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts   |  456 ++++
 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi   | 2352 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3562.dtsi           | 1185 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts |   18 +-
 .../arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi |    5 +-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |    8 +-
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |   64 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  217 ++
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |    4 +-
 .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  113 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  953 +-------
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   |  945 ++++++++
 include/dt-bindings/clock/rockchip,rk3528-cru.h    |    6 +
 include/dt-bindings/clock/rockchip,rk3576-cru.h    |   10 +
 34 files changed, 7664 insertions(+), 1008 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi



