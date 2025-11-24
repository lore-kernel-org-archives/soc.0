Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7534832FA11
	for <soc@lists.linux.dev>; Mon, 24 Nov 2025 21:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764021378; cv=none; b=kZ2h1GRmKyWCcjMIOPad9e/FuvtcNoJSb5nrWA4ZH/Ag0OXRFdguHkItYwWH9mOrWbVjHYPlWZWjWXQVVHouxXqjNCY/UCU0AJRNJap44jXGNU7bZqT5eGWfI9kGJ1kZlTIIFe2iCgt/U1iHHUk4VCZCeEtWJjoIReDEn/FsjUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764021378; c=relaxed/simple;
	bh=Diwxc8cUwDlnQqZ5qI5qVLIgpRsiqY/VHybmKgv/+dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f7b6ILLFqjF2vn/1CJRvLVeX4SMhzw6Cwqn17CVTqZ7DrNAdFU5Zjp2fDMJEzIZ1iPWUlPuIviM7RmRDsRsIobnUhX7P8lukecN62CwLErMSfsfrBxqLBaS9+MGg9TuuVwMb07lhp13YC81mBVaiWPREDA0Ps8QuIW0UY0jeMPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=kBvBcq2C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="kBvBcq2C"
Received: by smtp.kernel.org (Postfix)
	id 568BBC19421; Mon, 24 Nov 2025 21:56:18 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6F3CC4CEF1;
	Mon, 24 Nov 2025 21:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6F3CC4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=YGk5LrRjjNWp266IfkQTW7GlnTyeUi/G1mCLsjenO7A=; b=kBvBcq2CYjibiX4nk8fXrxwIvj
	HMCZgq3ajUCpivUOywRObu7AEsiTpjD1YdMo48g9oYoNk42u4VWx00U40G04WvPwS5jK/TF06pSC2
	GZ6p1TUiLkSiCbvKvpqTpcjSv0nrgY/G36bIdMB7VgsBofIW/Kg5nhVXDC54PRaLUt0NmvEtra1XT
	4pC1JWR8UECA5moP0HoILidRwWYQyR9dS3xCeDYog688FrChw3g23meJ4Mz3nOPVM1t85C0pSlcWB
	ioPaGLNxq75ihF/Nh+0FRIzPPGc+EWsol0PR06WBKaNxZulAotPNMEg/MIaV8fAgVhDP1sgJrux7z
	bOEb4PWA==;
Received: from i53875be6.versanet.de ([83.135.91.230] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vNeXX-0006N1-Am; Mon, 24 Nov 2025 22:56:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.19 #2
Date: Mon, 24 Nov 2025 22:56:06 +0100
Message-ID: <2244391.irdbgypaU6@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi soc maintainers,

please find below some more Rockchip arm64 dts changes for for 6.19 
on top of the previous changes.

Please pull.
Thanks
Heiko


The following changes since commit 78f316e90906d54c8aa6029e5c19ae83e420e56a:

  arm64: dts: rockchip: add vicap node to rk356x (2025-11-16 00:39:47 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.19-rockchip-dts64-2

for you to fetch changes up to e34003dd2fb05da8f420bbd7b8ec62ab88242c45:

  arm64: dts: rockchip: enable RTC for 100ASK DshanPi A1 (2025-11-21 22:39:06 +0100)

----------------------------------------------------------------
New boards: QNAP TS233 (2-bay variant of the RK3568 NAS series) and
Asus Tinkerboard 3 + 3S.
Additional peripherals enabled on 100ASK DshanPi A1, Orange Pi 3B,
Indiedroid Nova, QNAP-TSx33 series + LED states on Radxa boards,
power-domains for the previously added RK3368 display components.

----------------------------------------------------------------
Chris Morgan (4):
      arm64: dts: rockchip: Add clk32k_in for Indiedroid Nova
      arm64: dts: rockchip: Define regulator for pcie2x1l2 on Indiedroid Nova
      arm64: dts: rockchip: Correct pinctrl for pcie for Indiedroid Nova
      arm64: dts: rockchip: Add host wake pin for wifi on Indiedroid Nova

Chukun Pan (5):
      arm64: dts: rockchip: remove mmc max-frequency for 100ASK DshanPi A1
      arm64: dts: rockchip: add mmc aliases for 100ASK DshanPi A1
      arm64: dts: rockchip: enable button for 100ASK DshanPi A1
      arm64: dts: rockchip: enable USB for 100ASK DshanPi A1
      arm64: dts: rockchip: enable RTC for 100ASK DshanPi A1

Coia Prant (1):
      arm64: dts: rockchip: fix PCIe 3.3V regulator voltage on 9Tripod X3568 v4

FUKAUMI Naoki (1):
      arm64: dts: rockchip: Use default-state for power LED for Radxa boards

Heiko Stuebner (7):
      arm64: dts: rockchip: move cpu_thermal node to the correct position
      arm64: dts: rockchip: describe mcu eeprom cells on rk3568-ts433
      arm64: dts: rockchip: move common qnap tsx33 parts to dtsi
      dt-bindings: arm: rockchip: add TS233 to RK3568-based QNAP NAS devices
      arm64: dts: rockchip: add QNAP TS233 devicetree
      arm64: dts: rockchip: Add power-domain to RK3368 DSI controller
      arm64: dts: rockchip: Add power-domain to RK3368 VOP controller

Michael Opdenacker (4):
      dt-bindings: arm: rockchip: merge Asus Tinker and Tinker S
      dt-bindings: arm: rockchip: Add Asus Tinker Board 3/3S
      arm64: dts: rockchip: Add Asus Tinker Board 3 and 3S device tree
      arm64: dts: rockchip: Enable i2c2 on Orange Pi 3B

 .../devicetree/bindings/arm/rockchip.yaml          |  18 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   3 +
 arch/arm64/boot/dts/rockchip/rk3308-rock-pi-s.dts  |   1 -
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |   2 +
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      |   2 +-
 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts    |   1 -
 .../boot/dts/rockchip/rk3566-orangepi-3b.dtsi      |   5 +
 .../boot/dts/rockchip/rk3566-tinker-board-3.dts    |  13 +
 .../boot/dts/rockchip/rk3566-tinker-board-3.dtsi   | 278 ++++++++++
 .../boot/dts/rockchip/rk3566-tinker-board-3s.dts   |  30 +
 .../boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts  |  14 +-
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts | 131 +++++
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts | 604 ++------------------
 .../arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi | 608 +++++++++++++++++++++
 .../boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts |  93 +++-
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    |   2 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |   2 +-
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |  43 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |   2 +-
 19 files changed, 1249 insertions(+), 603 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3s.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi



