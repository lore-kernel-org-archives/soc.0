Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDD03921EF
	for <soc@lists.linux.dev>; Tue, 13 Jan 2026 13:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768312126; cv=none; b=le5J3xGXswSYPCN9h8ReefCS8cEJdUCXYFkf3bSovVLxJc1nn5vU67flUAWXsVLl7c/pW0rZ61d+cpneraXoQO9cK5nwHHjBN8nXtXgvvRGeLY8YSkFwGzEUB9rqFs+TpUivgKjYYZsXImzY1pzxQrV6UECli+bEIG2NjoAEd8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768312126; c=relaxed/simple;
	bh=EuqQut+EfJl2w22cPGqC7ZhApaY4jCv1BICBfDjs6Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t3DzwREur8tozFx1SF109Jb9hV+rImxRqBgtcBLMbdrRCF5Z1QnazJQV9sidbenm+Teq0UhMtlqAPnZCH90PM8ed772jVZkFtIr5bRlFZ19bWxEmlDpiS+BvNm3dJJotUgLnjIspFgt05PY3zbbAL5uvLQUngrhHak7v+VoAm0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=V2eJ3dhk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="V2eJ3dhk"
Received: by smtp.kernel.org (Postfix)
	id 54D79C19425; Tue, 13 Jan 2026 13:48:46 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7E29BC116C6;
	Tue, 13 Jan 2026 13:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7E29BC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vnwpucTutZgu4yJHHP3FU+mFmj+luApLZAmb/bqv8gM=; b=V2eJ3dhkKylz+y72NXGoxmUGg4
	4QZX7ZLIAQdH8bZrkkjU6/g3FPWCzxoG9sjAmm4HJjYpg11B1Na+YvO190n3z/dTx98ZWWofVzSbS
	Y1Vfq47e/lXHJoFw18IqvMFuElDMMt5OcAoFIsKJR/ElQ5nGzmDS3jttXqTb7cRY3esNf0ga5nvjy
	AXIO1m60bEogfzm9nGQ4DVXwLnYZQn2ciP31switPuMMmUjXvlCxLzqGC94scdKBJrucb2hRtrotn
	MqsoQKPYecMsj3351fUgV56MMp62VQViFfMcH3X8mYf0go1Y86GIFa5lc3mACSM7LqyKqUZLpjzMm
	gk77pO/w==;
Received: from i53875b63.versanet.de ([83.135.91.99] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vfelF-00279P-Tg; Tue, 13 Jan 2026 14:48:42 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.19 #1
Date: Tue, 13 Jan 2026 14:48:41 +0100
Message-ID: <12544161.zAa99ISigo@diego>
In-Reply-To: <3166289.xgJ6IN8ObU@diego>
References: <3166289.xgJ6IN8ObU@diego>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 13. Januar 2026, 14:47:36 Mitteleurop=C3=A4ische Normalzeit sc=
hrieb Heiko Stuebner:
> Hi soc maintainers,
>=20
> please find below and in the next mails Rockchip changes for for 6.20 .

darn ... subject was also supposed to be 6.20

sorry for the typo
Heiko

>=20
> Please pull.
> Thanks
> Heiko
>=20
>=20
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1=
e8:
>=20
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.20-rockchip-dts64-1
>=20
> for you to fetch changes up to da0de806d8b46238ac3891a894806da4d1c26cdf:
>=20
>   arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576 (2026-01-=
09 20:58:40 +0100)
>=20
> ----------------------------------------------------------------
> New boards: Orange Pi CM5 module + Baseboard, Radxa CM5 module + IO-board.
> PCIe-slot-overlay for rk3576-evb1
>=20
> New peripherals: some of the video decoders on rk3576 and rk3588
>=20
> Enabled peripherals: many RK3588-NPUs and a lot of other peripherals on
> a plethora of boards.
>=20
> ----------------------------------------------------------------
> Alexey Charkov (7):
>       arm64: dts: rockchip: Add overlay for the PCIe slot on RK3576 EVB1
>       arm64: dts: rockchip: enable UFS controller on FriendlyElec NanoPi =
M5
>       arm64: dts: rockchip: Use a readable audio card name on NanoPi M5
>       arm64: dts: rockchip: Enable HDMI sound on FriendlyElec NanoPi M5
>       arm64: dts: rockchip: Enable HDMI sound on Luckfox Core3576
>       arm64: dts: rockchip: Enable HDMI sound on RK3576 EVB1
>       arm64: dts: rockchip: Enable analog sound on RK3576 EVB1
>=20
> Chris Morgan (1):
>       arm64: dts: rockchip: Add HDMI to Gameforce Ace
>=20
> Chukun Pan (4):
>       arm64: dts: rockchip: remove rtc regulator for ArmSoM Sige5
>       arm64: dts: rockchip: fix hp-det pin for ArmSoM Sige5
>       arm64: dts: rockchip: enable saradc for ArmSoM Sige5
>       arm64: dts: rockchip: Enable PCIe for ArmSoM Sige1
>=20
> David Petry (1):
>       arm64: dts: rockchip: Enable second HDMI output on CM3588
>=20
> Detlev Casanova (2):
>       arm64: dts: rockchip: Add the vdpu381 Video Decoders on RK3588
>       arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576
>=20
> FUKAUMI Naoki (4):
>       arm64: dts: rockchip: Add EEPROMs for Radxa ROCK 4 boards
>       arm64: dts: rockchip: Add EEPROMs for Radxa rk35xx boards
>       dt-bindings: arm: rockchip: fix description for Radxa CM3I
>       dt-bindings: arm: rockchip: fix description for Radxa CM5
>=20
> Heiko Stuebner (5):
>       arm64: dts: rockchip: add gmac reset property to rk3368
>       arm64: dts: rockchip: add mdio subnode to gmac on rk3368
>       arm64: dts: rockchip: Correctly describe the ethernet phy on rk3368=
=2Dlion
>       arm64: dts: rockchip: enable NPU on rk3588-tiger
>       arm64: dts: rockchip: enable NPU on rk3588-jaguar
>=20
> Joseph Kogut (3):
>       dt-bindings: arm: rockchip: Add Radxa CM5 IO board
>       arm64: dts: rockchip: Add rk3588 based Radxa CM5
>       arm64: dts: rockchip: Add support for CM5 IO carrier
>=20
> Laurent Pinchart (2):
>       dt-bindings: arm: rockchip: Add Orange Pi CM5 Base
>       arm64: dts: rockchip: Add rk3588s-orangepi-cm5-base device tree
>=20
> Ondrej Jirman (3):
>       arm64: dts: rockchip: Add accelerometer sensor to Pinephone Pro
>       arm64: dts: rockchip: Add magnetometer sensor to Pinephone Pro
>       arm64: dts: rockchip: Add light/proximity sensor to Pinephone Pro
>=20
> Rapha=C3=ABl Jakse (1):
>       arm64: dts: rockchip: Fix Bluetooth on the RockPro64 board
>=20
> Ricardo Pardini (3):
>       arm64: dts: rockchip: Enable the NPU on NanoPC T6/T6-LTS
>       arm64: dts: rockchip: Enable the NPU on FriendlyElec CM3588
>       arm64: dts: rockchip: Enable the NPU on Turing RK1
>=20
> Rob Herring (Arm) (1):
>       arm64: dts: rockchip: Add missing everest,es8388 supplies to rk3399=
=2Droc-pc-plus
>=20
> Shawn Lin (2):
>       arm64: dts: rockchip: Add PCIe clkreq stuff for RK3588 EVB1
>       arm64: dts: rockchip: add dma-coherent for pcie and gmac of RK3576
>=20
> Torsten Duwe (1):
>       arm64: dts: rockchip: Enable SPDIF audio on Rock 5 ITX
>=20
>  .../devicetree/bindings/arm/rockchip.yaml          |  15 +-
>  arch/arm64/boot/dts/rockchip/Makefile              |   7 +
>  arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi      |  22 +-
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi           |   8 +
>  .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |  45 ++
>  .../arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts |   4 +
>  arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |   1 -
>  .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      |   8 +
>  arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dts   |  12 +
>  arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |   8 +
>  .../boot/dts/rockchip/rk3399-rockpro64-v2.dts      |   7 +
>  arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts  |   7 +
>  .../boot/dts/rockchip/rk3528-armsom-sige1.dts      |  18 +
>  .../arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi |  10 +-
>  arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    |   8 +
>  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts    |   8 +
>  .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  19 +-
>  .../boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtso   |  31 ++
>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   | 107 +++++
>  .../boot/dts/rockchip/rk3576-luckfox-core3576.dtsi |   8 +
>  arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts  |  34 +-
>  arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    |  14 +
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  40 ++
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  74 ++++
>  arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |   7 +-
>  .../rockchip/rk3588-friendlyelec-cm3588-nas.dts    |  38 ++
>  .../dts/rockchip/rk3588-friendlyelec-cm3588.dtsi   |  35 +-
>  arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  35 +-
>  arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |  36 +-
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |  23 +
>  .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  10 +
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    |  10 +
>  arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  35 +-
>  .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |  35 +-
>  .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |  63 +++
>  .../dts/rockchip/rk3588s-orangepi-cm5-base.dts     | 355 ++++++++++++++++
>  .../boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi    | 472 +++++++++++++++=
++++++
>  .../boot/dts/rockchip/rk3588s-radxa-cm5-io.dts     | 339 +++++++++++++++
>  .../arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi | 280 ++++++++++++
>  39 files changed, 2262 insertions(+), 26 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dt=
so
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-bas=
e.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi
>=20




