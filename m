Return-Path: <SRS0=3auM=MI=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B26DC04FFE
	for <soc@archiver.kernel.org>; Sun,  5 May 2024 21:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4013DC4AF66; Sun,  5 May 2024 21:04:57 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04B5DC113CC;
	Sun,  5 May 2024 21:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04B5DC113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b5d.versanet.de ([83.135.91.93] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1s3j2S-0008I3-Sb; Sun, 05 May 2024 23:04:52 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.10 #2
Date: Sun, 05 May 2024 23:04:52 +0200
Message-ID: <13810480.dW097sEU6C@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below some more Rockchip changes for for 6.10 .

One new board and more enablement for the newly available gpu- and
usb3-support


Please pull!

Thanks
Heiko


The following changes since commit d7b83921d098bd76623381f75f5cd2296f1315cc:

  arm64: dts: rockchip: add dual-role usb3 hosts to rk3588 Tiger-Haikou (2024-04-23 17:37:41 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.10-rockchip-dts64-2

for you to fetch changes up to cd81d3a0695cc54ad6ac0ef4bbb67a7c8f55d592:

  arm64: dts: rockchip: add rk3588 pcie and php IOMMUs (2024-05-03 13:32:42 +0200)

----------------------------------------------------------------
Radxa Rock 3C board. More gpu+usb enablement on rk3588 boards as well
as two new iommus on rk3588.

----------------------------------------------------------------
Anand Moon (2):
      arm64: dts: rockchip: Support poweroff on Edgeble Neural Compute Module
      arm64: dts: rockchip: Add USB3 on Edgeble NCM6A-IO board

Chukun Pan (3):
      dt-bindings: arm: rockchip: add Radxa ROCK 3C
      arm64: dts: rockchip: Add Radxa ROCK 3C
      arm64: dts: rockchip: enable onboard spi flash for rock-3a

Jimmy Hon (2):
      arm64: dts: rockchip: Enable GPU on Orange Pi 5
      arm64: dts: rockchip: add USB-C support to rk3588s-orangepi-5

Muhammed Efe Cetin (1):
      arm64: dts: rockchip: enable GPU on khadas-edge2

Niklas Cassel (1):
      arm64: dts: rockchip: add rk3588 pcie and php IOMMUs

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts    | 726 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    |  14 +
 .../dts/rockchip/rk3588-edgeble-neu6a-common.dtsi  |   2 +
 .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi |   8 +
 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts     |   5 +
 .../arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts |  99 +++
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi          |  24 +
 9 files changed, 884 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts



