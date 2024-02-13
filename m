Return-Path: <SRS0=mL58=JW=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092EDC4829A
	for <soc@archiver.kernel.org>; Tue, 13 Feb 2024 20:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5176C43390; Tue, 13 Feb 2024 20:02:57 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E239BC433F1;
	Tue, 13 Feb 2024 20:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E239BC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rZyzP-0000Dw-94; Tue, 13 Feb 2024 21:02:47 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.8
Date: Tue, 13 Feb 2024 21:02:46 +0100
Message-ID: <2450634.jE0xQCEvom@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Arnd, Kevin, Olof,

please find a below a collection of fixes for the current release 6.8
cycle.

Please pull

Thanks
Heiko


The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v6.8-rockchip-dtsfixes1

for you to fetch changes up to c22d03a95b0d815cd186302fdd93f74d99f1c914:

  arm64: dts: rockchip: Correct Indiedroid Nova GPIO Names (2024-02-13 20:2=
8:19 +0100)

=2D---------------------------------------------------------------
Some fixes to make devicetrees conform to bindings better (pwm irqs), dt
styling fixes (unneeded jaguar status, whitespaces, Cool Pi regulator
naming) and functionality fixes (px30 spi chipselect number, allowing
rk3588-evb1 to turn off, pcie lane numbers on CoolPi, wrong gpio-names
on Indidroid Nova and some CoolPi sdmmc aliases to match what uboot uses).

=2D---------------------------------------------------------------
Andy Yan (4):
      arm64: dts: rockchip: aliase sdmmc as mmc1 for Cool Pi 4B
      arm64: dts: rockchip: aliase sdmmc as mmc1 for Cool Pi CM5 EVB
      arm64: dts: rockchip: rename vcc5v0_usb30_host regulator for Cool Pi =
CM5 EVB
      arm64: dts: rockchip: Fix the num-lanes of pcie3x4 on Cool Pi CM5 EVB

Chris Morgan (1):
      arm64: dts: rockchip: Correct Indiedroid Nova GPIO Names

Heiko Stuebner (2):
      arm64: dts: rockchip: drop unneeded status from rk3588-jaguar gpio-le=
ds
      arm64: dts: rockchip: set num-cs property for spi on px30

Johan Jonker (1):
      arm64: dts: rockchip: Drop interrupts property from rk3328 pwm-rockch=
ip node

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: minor rk3588 whitespace cleanup

Sebastian Reichel (1):
      arm64: dts: rockchip: mark system power controller on rk3588-evb1

Uwe Kleine-K=F6nig (1):
      ARM: dts: rockchip: Drop interrupts property from pwm-rockchip nodes

 arch/arm/boot/dts/rockchip/rv1108.dtsi                   |  8 --------
 arch/arm64/boot/dts/rockchip/px30.dtsi                   |  2 ++
 arch/arm64/boot/dts/rockchip/rk3328.dtsi                 |  1 -
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts   |  8 +++++---
 arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi      |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts         |  1 +
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts           |  1 -
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dts        |  8 ++++----
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts       |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts | 10 +++++-----
 10 files changed, 21 insertions(+), 26 deletions(-)



