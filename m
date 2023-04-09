Return-Path: <SRS0=L7NY=AA=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7916CC77B70
	for <soc@archiver.kernel.org>; Sun,  9 Apr 2023 10:33:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5EC12C4339B; Sun,  9 Apr 2023 10:33:17 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A17B1C433D2;
	Sun,  9 Apr 2023 10:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A17B1C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from p57b77242.dip0.t-ipconnect.de ([87.183.114.66] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1plSMD-0001Kj-Pf; Sun, 09 Apr 2023 12:33:13 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.4 #1
Date: Sun, 09 Apr 2023 12:33:12 +0200
Message-ID: <9713202.NyiUUSuA9g@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.4-rockchip-dts32-1

for you to fetch changes up to 95e2ac6ae9f2330557a6aef70bf15173e1dd9714:

  ARM: dts: rockchip: fix rk3288 dp node (2023-03-23 00:38:11 +0100)

----------------------------------------------------------------
MMC-aliases for rk3288-veyron devices and some dts node adaptions
for yaml conversions recently merged into the drm tree.

----------------------------------------------------------------
Heiko Stuebner (1):
      ARM: dts: rockchip: Add mmc aliases for rk3288-veyron devices

Johan Jonker (3):
      ARM: dts: rockchip: fix rk3288 dsi node
      ARM: dts: rockchip: fix rk3288 lvds node
      ARM: dts: rockchip: fix rk3288 dp node

 arch/arm/boot/dts/rk3288-veyron-sdmmc.dtsi |  6 ++++++
 arch/arm/boot/dts/rk3288-veyron.dtsi       |  4 ++++
 arch/arm/boot/dts/rk3288.dtsi              | 27 ++++++++++++++++++++++++---
 3 files changed, 34 insertions(+), 3 deletions(-)



