Return-Path: <SRS0=LCQ7=VZ=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B4F2C433F5
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 19:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21A29C34118; Tue, 17 May 2022 19:36:13 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A5FCC385B8;
	Tue, 17 May 2022 19:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A5FCC385B8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from wf0416.dip.tu-dresden.de ([141.76.181.160] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1nr2zK-0004Ds-OZ; Tue, 17 May 2022 21:36:10 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 5.19 #2
Date: Tue, 17 May 2022 21:36:09 +0200
Message-ID: <4288609.taCxCBeP46@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit bc405bb3eeee4b711830ab569e7f3811b92196ab:

  arm64: dts: rockchip: enable otg/drd operation of usb_host0_xhci in rk356x (2022-05-11 06:09:55 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-dts64-2

for you to fetch changes up to 17c0c5b67353b26a46611cffffd80aadd7215cfa:

  arm64: rockchip: add clocks property to cru node rk3368 (2022-05-17 21:08:49 +0200)

----------------------------------------------------------------
General PCIe2x1 support for rk3568 and some more improvements for the
Pine64-Quartz-A (fan, bluetooth, sdr104 sdmmc, flash-controller, pcie)
as well as some fixes to conform to clock dt-bindings.

----------------------------------------------------------------
Johan Jonker (2):
      arm64: rockchip: add clocks property to cru node rk3308
      arm64: rockchip: add clocks property to cru node rk3368

Peter Geis (7):
      arm64: dts: rockchip: add clocks to rk356x cru
      arm64: dts: rockchip: rename Quartz64-A bluetooth gpios
      arm64: dts: rockchip: add Quartz64-A fan pinctrl
      arm64: dts: rockchip: enable sdr-104 for sdmmc on Quartz A
      arm64: dts: rockchip: enable sfc controller on Quartz64 Model A
      arm64: dts: rockchip: Add rk3568 PCIe2x1 controller
      arm64: dts: rockchip: Enable PCIe controller on quartz64-a

 arch/arm64/boot/dts/rockchip/rk3308.dtsi           |  5 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |  2 +
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts | 63 +++++++++++++++++++++-
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           | 52 ++++++++++++++++++
 4 files changed, 118 insertions(+), 4 deletions(-)



