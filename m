Return-Path: <SRS0=Sopg=OI=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B07C3DA42
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 597C7C4AF0A; Mon,  8 Jul 2024 15:31:32 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6574C4AF0D;
	Mon,  8 Jul 2024 15:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A6574C4AF0D
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e8616d7.versanet.de ([94.134.22.215] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sQqKo-00020I-3P; Mon, 08 Jul 2024 17:31:22 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.11 #2
Date: Mon, 08 Jul 2024 17:31:21 +0200
Message-ID: <1998182.CrzyxZ31qj@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below and in a subsequent pull-request
some more Rockchip changes for for 6.11 .

One new (and exciting) board and some more changes.

If it's not too late yet, please pull!

Thanks
Heiko


The following changes since commit 9417909e253ffa57f014822a79cca9b1f2b25492:

  arm64: dts: rockchip: Delete the SoC variant dtsi for RK3399Pro (2024-06-28 14:02:39 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.11-rockchip-dts64-2

for you to fetch changes up to 31390eb8ffbf2b6be7d789708ec08b635d7a3eb8:

  arm64: dts: rockchip: add ROCK 5 ITX board (2024-07-08 16:25:35 +0200)

----------------------------------------------------------------
One new board, the pretty interesting Rock 5 ITX, some improvements
for the Lunzn Fastrhino R6xS boards, allowing dma on uarts connected
to bluetooth modules and an update for the gpu operating points on
rk356x. As well as some minor fixes for missing power-dmains and
ethernet phy binding adherence.

----------------------------------------------------------------
Chukun Pan (6):
      arm64: dts: rockchip: fix regulator name for Lunzn Fastrhino R6xS
      arm64: dts: rockchip: fix usb regulator for Lunzn Fastrhino R6xS
      arm64: dts: rockchip: fix pmu_io supply for Lunzn Fastrhino R6xS
      arm64: dts: rockchip: remove unused usb2 nodes for Lunzn Fastrhino R6xS
      arm64: dts: rockchip: disable display subsystem for Lunzn Fastrhino R6xS
      arm64: dts: rockchip: fixes PHY reset for Lunzn Fastrhino R68S

Cristian Ciocaltea (1):
      arm64: dts: rockchip: Add missing power-domains for rk356x vop_mmu

Diederik de Haas (3):
      arm64: dts: rockchip: Add dma-names to uart1 on quartz64-b
      arm64: dts: rockchip: Add avdd supplies to hdmi on rock64
      arm64: dts: rockchip: Add dma-names to uart1 on Pine64 rk3566 devices

Dragan Simic (2):
      arm64: dts: rockchip: Add GPU OPP voltage ranges to RK356x SoC dtsi
      arm64: dts: rockchip: Update GPU OPP voltages in RK356x SoC dtsi

Heiko Stuebner (2):
      dt-bindings: arm: rockchip: Add ROCK 5 ITX board
      arm64: dts: rockchip: add ROCK 5 ITX board

Marek Vasut (1):
      arm64: dts: rockchip: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on all RK3588 boards

 .../devicetree/bindings/arm/rockchip.yaml          |    5 +
 arch/arm64/boot/dts/rockchip/Makefile              |    1 +
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |    2 +
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  |    1 +
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |    1 +
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts |    1 +
 arch/arm64/boot/dts/rockchip/rk3566-soquartz.dtsi  |    1 +
 .../boot/dts/rockchip/rk3568-fastrhino-r66s.dts    |    4 +
 .../boot/dts/rockchip/rk3568-fastrhino-r66s.dtsi   |   48 +-
 .../boot/dts/rockchip/rk3568-fastrhino-r68s.dts    |   16 +-
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |   13 +-
 arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dts   |    6 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts | 1177 ++++++++++++++++++++
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |    3 +-
 14 files changed, 1227 insertions(+), 52 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts



