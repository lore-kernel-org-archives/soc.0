Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8A21A6820
	for <soc@lists.linux.dev>; Sat, 14 Mar 2026 18:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773513938; cv=none; b=Z7y7bQNff92zIzonrEIpL4TgLarLn9UD4C6d9hbitiXcdMpwaHBnd1qgO1qw3wPViyL+1I0qoa6qT1qO2mJs0dA1FwX1gTmwBXqKXr0ZKUsBqZYIJwlXIK2M9RUsMXgY6T9kenS55ED3xiXkxjLOKPNNXhQaNqkSv3XGDTyynJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773513938; c=relaxed/simple;
	bh=5vVrPfjQQjHttowno1NR6a+4Cb29pxHcshSMyHYH8HI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bEWUR3/8ZGxn+2CcnymeXE7/7Kbe9MfuZcyMwcLeFrjhLzjZZlRdhBX+zNzHCRupbnXLV7avtVRdflsH5USzW09sKxxxbYbmT5sN6X2ZvyVCQi5dUYZRkgl04awx9DwpfGYA9CCkpJPEZ6a9aWmAa+JbQBO3d+jRkmY4Ct6zBHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=Jj9xgp1g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="Jj9xgp1g"
Received: by smtp.kernel.org (Postfix)
	id CD034C2BC87; Sat, 14 Mar 2026 18:45:37 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9779CC116C6;
	Sat, 14 Mar 2026 18:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9779CC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=kE6rooa9lpNkvv+MRXc7iLpUu314ODoCUYLjOHYbKho=; b=Jj9xgp1gGQy3wARyMmNTlprcun
	k6xqBSey9NBlP2aQ06vcaBmY1CWnZuXhMRA+qtsKB95C+KvME0ASEnOgk3IekAWWJtoJu9nx0rSM+
	vw7NpNUsi5+2FiKvvDFGnwioEu9kDsYFB0jykcyt95AjShSbl7g0/Gj9nfYTlY0At4f79uVy3/GJ4
	vSfGsJd6VGFJfzB/NSnJS+BsE557O8omCzTAayx6p6LsTVmdXQb6rA9deEKSjviTmN4bpieve2XdY
	QDknAC0EymnX6y9lyoA48jchIeiR8Jd+HVfcq9TBOoSa0/nHg57umw4e6G6wY5GoREh6tuUho/CS3
	jvvcQ5xQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 7.1 #1
Date: Sat, 14 Mar 2026 19:45:34 +0100
Message-ID: <13966995.uLZWGnKmhe@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below Rockchip DT changes for the merge-window for 7.1 .

So far only arm64 changes :-)


Please pull.
Thanks
Heiko


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.1-rockchip-dts64-1

for you to fetch changes up to d7787a77cf8b129304f590233032556dec10dfc6:

  arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander (2026-03-13 21:39:34 +0100)

----------------------------------------------------------------
New boards: RK3576-EVB2, OneThing Edge Cube
New soc-peripherals: DisplayPort on RK3576
New overlays: TSx33 device-revisions, HD702E display/touchscreen on
NanoPC-T4

And as always a number of per-board changes for added or enabled
peripherals, added supplies, things moved to more fitting positions.

----------------------------------------------------------------
Alexey Charkov (1):
      arm64: dts: rockchip: Add analog audio switches to RK3576 EVB1

Andy Yan (1):
      arm64: dts: rockchip: Add DisplayPort dt node for rk3576

Chaoyi Chen (4):
      dt-bindings: arm: rockchip: Add rk3576 evb2 board
      arm64: dts: rockchip: Add rk3576 evb2 board
      arm64: dts: rockchip: Fix sdmmc pwren pinctrl for rk3576-evb2
      arm64: dts: rockchip: Enable displayport for rk3576 evb2

Chris Morgan (1):
      arm64: dts: rockchip: add Awinic aw87391 amplifiers for Anbernic RG-DS

Heiko Stuebner (8):
      arm64: dts: rockchip: Add port subnodes to RK356x SATA controllers
      arm64: dts: rockchip: add overlay for qnap-ts433 device revision
      arm64: dts: rockchip: add overlay for qnap-ts233 device revision
      arm64: dts: rockchip: add overlay for qnap-ts133 device revision
      arm64: dts: rockchip: use gated-fixed-clock for pcie-refclk on rk3588-jaguar
      arm64: dts: rockchip: use gated-fixed-clock for pcie-refclk on rk3588-tiger
      arm64: dts: rockchip: add pinctrl for clk-generator GPIO on rk3588-tiger
      arm64: dts: rockchip: Make Jaguar PCIe-refclk pin use pull-up config

Hugh Cole-Baker (1):
      arm64: dts: rockchip: add pwm-fan for NanoPC-T6

Jun Yan (3):
      dt-bindings: vendor-prefixes: Add Shenzhen OneThing Technologies Co., Ltd.
      dt-bindings: arm: rockchip: Add OneThing Edge Cube series
      arm64: dts: rockchip: Add OneThing Edge Cube series

Michael Riesch (1):
      arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander

Robin Murphy (4):
      arm64: dts: rockchip: Move RK3399 eDP pinctrl to boards
      arm64: dts: rockchip: Add overlay for FriendlyElec HD702E
      arm64: dts: rockchip: Clean up NanoPi-R2S Plus gmac2io
      arm64: dts: rockchip: Describe HDMI supplies for nanopi4 boards

Samuel Holland (2):
      arm64: dts: rockchip: Add battery and charger on rk3566-pinenote
      arm64: dts: rockchip: Enable GPU on rk3566-pinenote

Shawn Lin (2):
      arm64: dts: rockchip: add node name for RK3588_PD_RKVDEC0/1 and RK3588_PD_VENC0/1
      arm64: dts: rockchip: Add supply for pd_rkvdec and pd_venc on rk3388-evbs

 .../devicetree/bindings/arm/rockchip.yaml          |    9 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/rockchip/Makefile              |   22 +
 .../boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts   |   17 -
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi      |    3 +-
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |    2 +
 .../boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso |   96 ++
 arch/arm64/boot/dts/rockchip/rk3399-nanopi4.dtsi   |    2 +
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |    2 -
 .../dts/rockchip/rk3399-sapphire-excavator.dts     |    2 +
 .../dts/rockchip/rk3566-onething-edge-cube.dts     |  342 +++++++
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  |   31 +
 .../dts/rockchip/rk3566-qnap-ts133-pcb-13.dtso     |   64 ++
 .../boot/dts/rockchip/rk3568-anbernic-rg-ds.dts    |   44 +-
 .../dts/rockchip/rk3568-qnap-ts233-pcb-12-11.dtso  |   93 ++
 .../dts/rockchip/rk3568-qnap-ts433-pcb-12-10.dtso  |  151 +++
 .../rk3568-wolfvision-pf5-io-expander.dtso         |   20 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |   27 +-
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |    1 +
 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts   | 1071 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |   28 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |    8 +-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |   16 +
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |   21 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |   39 +
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |   27 +-
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts  |   16 +
 27 files changed, 2093 insertions(+), 63 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-edge-cube.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-qnap-ts133-pcb-13.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233-pcb-12-11.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433-pcb-12-10.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts



