Return-Path: <SRS0=CPDx=GG=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C73C00A8F
	for <soc@archiver.kernel.org>; Tue, 24 Oct 2023 19:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C00E4C433CA; Tue, 24 Oct 2023 19:43:18 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5700CC433C8;
	Tue, 24 Oct 2023 19:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5700CC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qvNJ3-0007KN-8B; Tue, 24 Oct 2023 21:43:13 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.7 #2
Date: Tue, 24 Oct 2023 21:43:12 +0200
Message-ID: <2777623.BEx9A2HvPv@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

after the first pull request there were some stragglers left.
One new SoM was submitted and the DFI driver changes were merged
into the relevant driver tree.

This pull request adds the relevant changes for those.
The commits should be in linux-next since the 19th or 20th of
october, so did get exposure and the changes go on top of the
previous v6.7-rockchip-dts64-1 tag.


So if there is still time please pull!
If not, it's also no problem, I'll move them to 6.8 then.


Thanks a lot
Heiko


The following changes since commit 1e9ac3e8a6a9d4da9efbad2d8e95cc1140e0e23f:

  arm64: dts: rockchip: add support for Powkiddy RGB30 (2023-10-16 22:58:45 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.7-rockchip-dts64-2

for you to fetch changes up to 2806a69f3fef61d7353ea8206add8ffb15064b51:

  arm64: dts: rockchip: Add Turing RK1 SoM support (2023-10-19 20:23:58 +0200)

----------------------------------------------------------------
One new board the Turing RK1 system on module.
Support for DFI (DDR performance monitoring) for rk3588, rk3568 and an
enable-fix for rk3399 as well as some small fixups for the RGB30 handheld
(non-existent uart and better vpll frequency).

----------------------------------------------------------------
Chris Morgan (2):
      arm64: dts: rockchip: Update VPLL Frequency for RGB30
      arm64: dts: rockchip: Remove UART2 from RGB30

Sam Edwards (3):
      dt-bindings: vendor-prefixes: add turing
      dt-bindings: arm: rockchip: Add Turing RK1
      arm64: dts: rockchip: Add Turing RK1 SoM support

Sascha Hauer (3):
      arm64: dts: rockchip: Always enable DFI on rk3399
      arm64: dts: rockchip: Add DFI to rk356x
      arm64: dts: rockchip: Add DFI to rk3588s

 .../devicetree/bindings/arm/rockchip.yaml          |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi           |   1 -
 .../boot/dts/rockchip/rk3566-powkiddy-rgb30.dts    |  11 +-
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |   7 +
 arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dts |  21 +
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi | 614 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi          |  16 +
 9 files changed, 676 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi



