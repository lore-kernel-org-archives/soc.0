Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EEA03CB55B
	for <soc@lists.linux.dev>; Wed,  5 Aug 2026 17:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785952657; cv=pass; b=YsFLli5O240mRn/HTgJQATW8niTeKvVWWu6/TCqsEf1aRloztO9P3E5UtY5NGj5vpzo+KczQAa5rJhtdwRDOSsq59tuKfamnHSonORb17ilwursctp2HkrrA1P2WeRV9c/B4NV1ba2L7UZKl63tl7nRsQpiMWkViAMwcLwAsnIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785952657; c=relaxed/simple;
	bh=sLqmZHylYJC8XIj3vmgOX+sH6FvjPv43k9RyyJVN41I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pgmMoe3ZFjZOBV3kaJlY8CbGRPU+Ol3gjvKAeeH5RiVEi4syroAwtUeCfq1y92xQrdkLu5gQXFazaegh14fTFunl6wioZiH35UacfZIZIIDiVFGpAd1AjQu781TLPeUVCIWLl4l/OCFpbSHleLUBm9B+2J352EOPW/DkHG8du5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=qE053dCW; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="qE053dCW"
Received: by smtp.kernel.org (Postfix)
	id D6A501F00A3A; Wed,  5 Aug 2026 17:57:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785952653;
	b=J3TaJRacKQseSizCHPapM0xYloSHYkKCjhzUwCDNlBMB5vM7iEvJ8n0yKx4OBR7w8dSH
	 wvn/VnInjDbc5073XMShWnC86PF/NIUHvuaUNQDWMWY18rFqdVmoKMM9tPOAX5IHV3vFu
	 ja1uz+n7UQrcsPvVMqcvCEnTWhwIVFgtvP6T494oZTiPGAXCDadw51E6UPcbUtkeOU+wq
	 ePOKrBRGJ22bx5ldiWeRtHJ5kUHKA1JOGd9eGPYsviPIIUXRJdtHx13q7WpzSM2K4WG/g
	 U/kFJeLyK2ouUkTc0XbdN9NXwyQOWNCM2kxOhuNG62JiLoezBF8ja7GOKzW07PQw+EQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785952653;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=aCudNrsThIpmS08OkACwr0UiJe6LKKY9XXTu59xP2MY=;
	b=Jfwrul3fYEtOoKeg/QAPcthL5WRZpmwaHc+Qi79JwMg5TNXR9cjXAome57uXaDj7C49g
	 zTLqCb96eWzHUEtuwl8PLOpO84cCNyiTws8LDGhh4ZQsDLGsOvkYB1StaC0tTRhiUqb7u
	 +l6C37CsDeDEOXWM36dXo2edJN7CZJQ5XMcFU6XZ8GSHHKszTQAD9FeCt870qTWRgzadl
	 xdzxEe15a9FNLyotn6Ivu3D0Ot4/xCe0h7NtMehO7SCaFQRTt0pAmaEH/Jl98RO63qgZd
	 KCnNBwX9AeAzQUTx69n9S60umErB2aNbH1tGqH25eWGfz4f1MwafyDJanr9yZ3g7Kxg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=qE053dCW;
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3A1B51F000E9;
	Wed,  5 Aug 2026 17:57:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=qE053dCW
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 3A1B51F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=aCudNrsThIpmS08OkACwr0UiJe6LKKY9XXTu59xP2MY=; b=qE053dCWVMU1fedRFkRnyTnmom
	dvY5CEQ0RvwahOTJypZSNRRLHUI4G+tyBzoVIV6gPE31/TJscpjBE8RzjBQg6oYv//ezwIUi4ugab
	vyfJuyFaxgHn14MZ+IDXl6ur3kRic6+5M2nsh0VoOz6snICx6w2ZTcPznagYfiVKgJim1iRq/cIcn
	LqRgmcoZVHD+yHOSHwP4xZSPPEfYSYbzV5clvXq8fjrILPReAVZyg9EXHW8l9gsWAkskeeX8k7lTj
	TUYk0XPCXfOhjIEXMYWl+HpMaFH+w1FC0g6nxruvCZtQQRMT5ia66wYB9YHKFn7teTGTNGWcMoBqt
	LRTwOdFA==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 7.3 #2
Date: Wed, 05 Aug 2026 19:57:31 +0200
Message-ID: <5318464.usQuhbGJ8B@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below some more Rockchip DT64 changes for the merge-window
for 7.3 .

My personal highlight is of course the Anbernic handheld - mostly because
I own (and like) that device and am looking forward to getting rid of the
vendor-BSP-based firmware on it.


Please pull.
Thanks
Heiko


The following changes since commit 7707e4555cf1d52689621e3206df8ad2debaa0dd:

  arm64: dts: rockchip: Fix rk3566-bigtreetech-cb2 touchscreen property (2026-07-24 21:30:31 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.3-rockchip-dts64-2

for you to fetch changes up to 0f4c49bb3e538d01bdec403052ba6c35858aa0cf:

  arm64: dts: rockchip: Add LincStation E1 (2026-08-02 21:05:51 +0200)

----------------------------------------------------------------
More new boards: LincStation E1, Vicharak Vaaman, EmbedFire LubanCat 4,
ArmSoM CM5 + IO-board and the Anbernic RG Vita-Pro handheld

Apart from that some board-level changes and style fixes.

----------------------------------------------------------------
Chris Morgan (3):
      dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
      arm64: dts: rockchip: Add Anbernic RG Vita-Pro
      arm64: dts: rockchip: Add icm42607p IMU for RG-DS

Fabio Estevam (5):
      arm64: dts: rockchip: Drop data-mapping from Engicam PX30 Core
      arm64: dts: rockchip: Add CSI-2 bus type to ROCK 5B+ camera overlays
      arm64: dts: rockchip: Fix rk3399-roc-pc-plus analog audio
      arm64: dts: rockchip: Enable wireless on rk3399-roc-pc-plus
      arm64: dts: rockchip: Keep rk3399-roc-pc-plus work LED on

Hrushiraj Gandhi (2):
      dt-bindings: arm: rockchip: Add Vicharak Vaaman board
      arm64: dts: rockchip: Add Vicharak Vaaman board

Jiaxing Hu (2):
      dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
      arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: Correct white-space style

Pufan Jin (2):
      dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
      arm64: dts: rockchip: Add EmbedFire LubanCat 4 board

Samuel Holland (2):
      dt-bindings: arm: rockchip: Add LincStation E1
      arm64: dts: rockchip: Add LincStation E1

 .../devicetree/bindings/arm/rockchip.yaml          |   28 +
 arch/arm64/boot/dts/rockchip/Makefile              |    5 +
 .../px30-engicam-px30-core-ctouch2-of10.dts        |    1 -
 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts     |    2 +-
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |    2 +-
 .../arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts |   67 +
 .../boot/dts/rockchip/rk3399-vicharak-vaaman.dts   |  458 +++++++
 .../dts/rockchip/rk3566-onething-edge-cube.dts     |    2 +-
 .../boot/dts/rockchip/rk3568-anbernic-rg-ds.dts    |    8 +-
 .../boot/dts/rockchip/rk3568-lincstation-e1.dts    | 1000 +++++++++++++++
 .../dts/rockchip/rk3576-anbernic-rg-vita-pro.dts   | 1283 ++++++++++++++++++++
 .../boot/dts/rockchip/rk3576-armsom-cm5-io.dts     |  384 ++++++
 .../arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi |  566 +++++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      |    2 +
 .../rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      |    2 +
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts      |    2 +-
 .../arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts |  785 ++++++++++++
 17 files changed, 4591 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-lincstation-e1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts



