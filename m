Return-Path: <SRS0=c/st=N6=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18B4C2BD09
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 14:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79B99C32781; Fri, 28 Jun 2024 14:03:42 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6809EC116B1;
	Fri, 28 Jun 2024 14:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6809EC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b6a.versanet.de ([83.135.91.106] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sNCCR-0007eC-IE; Fri, 28 Jun 2024 16:03:39 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.11 #1
Date: Fri, 28 Jun 2024 16:03:38 +0200
Message-ID: <2187283.irdbgypaU6@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.11-rockchip-dts32-1

for you to fetch changes up to 313da6f69fa41d044b03f2ea37e56fe49f1e8a42:

  ARM: dts: rockchip: add #sound-dai-cells to hdmi node on rk3128 (2024-06-27 20:57:05 +0200)

----------------------------------------------------------------
More attention for the rk3128 soc (dsi, i2c, spdif, sfc), hdmi-sound
for a rk3066a board and some minor cleanups.

----------------------------------------------------------------
Alex Bee (6):
      dt-bindings: clock: rk3128: Add PCLK_MIPIPHY
      ARM: dts: rockchip: Add D-PHY for RK3128
      ARM: dts: rockchip: Add DSI for RK3128
      ARM: dts: rockchip: Add i2s nodes for RK3128
      ARM: dts: rockchip: Add spdif node for RK3128
      ARM: dts: rockchip: Add SFC for RK3128

Heiko Stuebner (1):
      Merge branch 'v6.11-shared/clkids' into v6.11-armsoc/dts32

Johan Jonker (4):
      ARM: dts: rockchip: add hdmi-sound node to rk3066a
      ARM: dts: rockchip: enable hdmi_sound and i2s0 for mk808 hdmi
      ARM: dts: rockchip: add #sound-dai-cells to hdmi node no rk3036
      ARM: dts: rockchip: add #sound-dai-cells to hdmi node on rk3128

 arch/arm/boot/dts/rockchip/rk3036.dtsi       |   1 +
 arch/arm/boot/dts/rockchip/rk3066a-mk808.dts |   8 ++
 arch/arm/boot/dts/rockchip/rk3066a.dtsi      |  16 ++++
 arch/arm/boot/dts/rockchip/rk3128.dtsi       | 128 +++++++++++++++++++++++++++
 include/dt-bindings/clock/rk3128-cru.h       |   1 +
 5 files changed, 154 insertions(+)



