Return-Path: <SRS0=IYNj=LY=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625A6C4345F
	for <soc@archiver.kernel.org>; Fri, 19 Apr 2024 11:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E28BC3277B; Fri, 19 Apr 2024 11:34:36 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35192C072AA;
	Fri, 19 Apr 2024 11:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35192C072AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [213.70.33.226] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rxmVk-0000YD-5A; Fri, 19 Apr 2024 13:34:32 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.9
Date: Fri, 19 Apr 2024 13:34:30 +0200
Message-ID: <3413596.CbtlEUcBR6@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Hi Arnd, Kevin, Olof,

please find a below a collection of fixes for the current release 6.9
cycle.

Please pull

Thanks
Heiko


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6=
=2E9-armsoc/dtsfixes

for you to fetch changes up to 93b36e1d3748c352a70c69aa378715e6572e51d1:

  arm64: dts: rockchip: Fix USB interface compatible string on kobol-helios=
64 (2024-04-17 23:14:44 +0200)

=2D---------------------------------------------------------------
Andy Yan (1):
      arm64: dts: rockchip: Fix the i2c address of es8316 on Cool Pi CM5

Ar=C4=B1n=C3=A7 =C3=9CNAL (1):
      arm64: dts: rockchip: set PHY address of MT7531 switch to 0x1f

Dragan Simic (2):
      arm64: dts: rockchip: Remove unsupported node from the Pinebook Pro d=
ts
      arm64: dts: rockchip: Designate the system power controller on Quartz=
Pro64

Iskander Amara (2):
      arm64: dts: rockchip: enable internal pull-up for Q7_THRM# on RK3399 =
Puma
      arm64: dts: rockchip: fix alphabetical ordering RK3399 puma

Jose Ignacio Tornos Martinez (1):
      arm64: dts: rockchip: regulator for sd needs to be always on for BPI-=
R2Pro

Krzysztof Kozlowski (4):
      arm64: dts: rockchip: drop panel port unit address in GRU Scarlet
      arm64: dts: rockchip: drop redundant pcie-reset-suspend in Scarlet Du=
mo
      arm64: dts: rockchip: drop redundant disable-gpios in Lubancat 1
      arm64: dts: rockchip: drop redundant disable-gpios in Lubancat 2

Muhammed Efe Cetin (1):
      arm64: dts: rockchip: mark system power controller and fix typo on or=
angepi-5-plus

Quentin Schulz (3):
      arm64: dts: rockchip: enable internal pull-up on Q7_USB_ID for RK3399=
 Puma
      arm64: dts: rockchip: enable internal pull-up on PCIE_WAKE# for RK339=
9 Puma
      arm64: dts: rockchip: add regulators for PCIe on RK3399 Puma Haikou

Rob Herring (2):
      dt-bindings: rockchip: grf: Add missing type to 'pcie-phy' node
      arm64: dts: rockchip: Fix USB interface compatible string on kobol-he=
lios64

 .../devicetree/bindings/soc/rockchip/grf.yaml      |  1 +
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |  3 +-
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    |  2 +-
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |  1 -
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |  2 +
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      | 53 ++++++++++++++++++=
+---
 arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts |  1 -
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts |  6 ++-
 arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts |  1 -
 .../arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi |  4 +-
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |  3 +-
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |  1 +
 12 files changed, 61 insertions(+), 17 deletions(-)



