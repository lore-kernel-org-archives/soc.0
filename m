Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790703C5855
	for <soc@lists.linux.dev>; Mon, 21 Sep 2026 21:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027077; cv=pass; b=ANMez7Wegg5ZJQgKgg5ESkjLdnCdm9b+fMphlGnJ49iZFfvItRLcL0SaxeGfDC6yzP4IN2QEeIqcwQrpTcGhTM9bKW6SIJSK6S3Dddq9fQ/FfsAaSQ1Vgm8FsiEaoN2TDChd5urujWO3HoruaKR70QidEYgJ4PV2VO+ppr1m0KU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027077; c=relaxed/simple;
	bh=KP38Fp5u/bgG4aGPq7DbMF7m3P6S1VpJ5w4CveIikIk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZkveLILR8fKaMeHGmlZBXL8TiYFDrYVeJ4CyR7ZicgI+kOO1yYa0q0i6ZGZQGYmKMcYpvVdL0N1B5/oo8i1S9o9l6RiUExgegphgq5zpm+YoBL7MHK7UDGtETd+q3NxquuK8M5bEQYY3LjOjGEZg0xlhrrYos4IvNEFeeX8he8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=gkkASxzz; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="gkkASxzz"
Received: by smtp.kernel.org (Postfix)
	id 1A89F1F00898; Mon, 21 Sep 2026 21:44:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790027074;
	b=fwZSF2otszcSexnr85iv+wB1aFu0hyPoCS3M0yMevYf3IlZTFXWq5YsDB+rzWiRdCkDn
	 rqx093e1jns9CIB32yjzNP7iDJ38YFrUztpIHPqsr80CQXpFDUk0PlV5LfC3VLQuMO/pl
	 14Th4pFNETth9PLesfandqHT2+OnP4v2Ts3jnbW9Wbb43JiLofnpRiL8Go+BiyYy3wK4l
	 FJnZ9uu4ZGIOA6O6hqhsUy9MIu0Wu1xRvwl74XktPgwfFSJ0gQPXWscWWzNa8ezTPXIZ1
	 WKoqWFV3oHkfXDhmT1Lyr9efOo0jN5D+ADDisqZU+HG/XMTJaL1+kfzG5lBdJli4I4Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790027074;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=5d8cZcq00OBRMbOBW9FZW3L7ElhwWqksD0+jNdj5kXA=;
	b=fl+t8E62CphHdP0K9DaI5KlKEVaIPWDPSf2V5dfFbMs/pxRVy2SwKrEG6chFPNK9IFX1
	 DzbXpxTmlYGBLgqhrpZu6YBgGAV8oDq37IbtbMN7OFjt0iP7D1WEGicWOofo2R0b7B3Wo
	 XO8w+kDHgvFGmRgfjzGotEZ1XQjjn2R7Dxlm+DF22FrGZzIz0SyaFs30beyyj/7fpAEzU
	 Izp0qxzD1Fxyt9/sj2RZ/sRn8CHTFY6IX++xbboUM6NeGSrunLqqVy+CEO5vcu5LTAHN+
	 FYjudRiVWPUjGdEjqWTCfGDbf352CyPvRGlDsolbyjmyZo/V3H7AN20Ktuo5RyjteUg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=gkkASxzz;
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E1F71F000FF;
	Mon, 21 Sep 2026 21:44:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=gkkASxzz
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8E1F71F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=5d8cZcq00OBRMbOBW9FZW3L7ElhwWqksD0+jNdj5kXA=; b=gkkASxzzZBHosD6yqAXh6sYMMZ
	Idb8SH7+3w4ayXMngQSuX9OU1HO4snKVv5+8fJW9oYhXCcJSF/U30f/JMyt491M99/GNQGMi/hjHh
	dH5UTLnnCK5fEaDhzO5b/Y8LADjcOpGvlQY64VKUHhANuQoKMub4OphyFbs4BdYmfdsolCSKEt/Wm
	QJyQkjIvL8Gxz7keP9OVqiPJkpJUMfGg5Q/7m/Vp7ni4FGuBidcqqGbUrhBLSnBp2HIghiH9Ou/CK
	wR4llBydAXU3O8X/qcPWHx+TqSEjmEeqjs/1fN/vL+7bCEcC7jbMHvpylDPpYshhgsIBFvFJNhgi8
	QVXFdg/Q==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 7.4 #1
Date: Mon, 21 Sep 2026 23:44:31 +0200
Message-ID: <1940582.atdPhlSkOF@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below some initial Rockchip DT64 changes for the merge-window
for 7.4 .


Please pull.
Thanks
Heiko


The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.4-rockchip-dts64-1

for you to fetch changes up to 7aa165b62ccaf340da22c517074e7c6853db55cd:

  arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter for RK3588 Jaguar (2026-09-02 13:07:56 +0200)

----------------------------------------------------------------
New board: LubanCat 5IO

Support for the CAN controllers on RK3588 and enabling them on some
boards.

And a number of board-specific smaller changes/fixes.

----------------------------------------------------------------
Amin Gattout (1):
      arm64: dts: rockchip: correct rk3576 SDGMAC GRF reg size

Chris Morgan (1):
      arm64: dts: rockchip: Correct Device Orientation on Gameforce Ace

Cunhao Lu (3):
      arm64: dts: rockchip: add CAN-FD nodes for RK3588
      dt-bindings: arm: rockchip: Add LubanCat 5IO board
      arm64: dts: rockchip: Add LubanCat 5IO board

Diederik de Haas (7):
      arm64: dts: rockchip: Remove unneeded vcc_3v3_pcie20 on NanoPC-T6
      arm64: dts: rockchip: Fix PCIe 2 pinctrl names and sorting on NanoPC-T6
      arm64: dts: rockchip: Fix hym8563 pinctrl name and sorting on NanoPC-T6
      arm64: dts: rockchip: Don't pull up rtc int pin on NanoPC-T6
      arm64: dts: rockchip: Sort usb nodes on NanoPC-T6
      arm64: dts: rockchip: Improve sound config on NanoPC-T6
      arm64: dts: rockchip: Drop duplicate USB nodes on NanoPC-T6 LTS

Heiko Stuebner (1):
      arm64: dts: rockchip: Enable CAN controller on RK3588-Tiger-Haikou

Jiaxing Hu (1):
      arm64: dts: rockchip: fix an error and a typo in the CM5-IO comment

Quentin Schulz (2):
      arm64: dts: rockchip: enable CAN0 on RK3588 Jaguar
      arm64: dts: rockchip: support CAN1-CAN2-UART4 adapter for RK3588 Jaguar

Rudi Heitbaum (1):
      arm64: dts: rockchip: add i2c2 scl timing to rk3399pro-vmarc-som

 .../devicetree/bindings/arm/rockchip.yaml          |    7 +
 arch/arm64/boot/dts/rockchip/Makefile              |    6 +
 .../boot/dts/rockchip/rk3399pro-vmarc-som.dtsi     |    2 +
 .../boot/dts/rockchip/rk3576-armsom-cm5-io.dts     |    4 +-
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |    2 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   39 +
 .../rockchip/rk3588-jaguar-can1-can2-uart4.dtso    |   26 +
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |   16 +
 .../boot/dts/rockchip/rk3588-lubancat-5-btb.dtsi   |  534 ++++++++++
 .../boot/dts/rockchip/rk3588-lubancat-5io.dts      | 1032 ++++++++++++++++++++
 .../boot/dts/rockchip/rk3588-nanopc-t6-lts.dts     |   17 -
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |  165 ++--
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts      |    4 +
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |    5 +
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |    7 +-
 15 files changed, 1748 insertions(+), 118 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-jaguar-can1-can2-uart4.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-lubancat-5-btb.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-lubancat-5io.dts



