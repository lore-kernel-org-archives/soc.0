Return-Path: <SRS0=7/pu=EB=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF227C27C41
	for <soc@archiver.kernel.org>; Wed, 16 Aug 2023 22:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5218C433CA; Wed, 16 Aug 2023 22:03:35 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 84F94C433C7;
	Wed, 16 Aug 2023 22:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 84F94C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875bbf.versanet.de ([83.135.91.191] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qWObx-0007bH-Js; Thu, 17 Aug 2023 00:03:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.6 #1
Date: Thu, 17 Aug 2023 00:03:28 +0200
Message-ID: <6299163.hdfAi7Kttb@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.6-rockchip-dts32-1

for you to fetch changes up to 1bf0dcb1e2a987a9281ae91f94e10c0de52c4952:

  ARM: dts: rockchip: Add rv1126 VOP_LITE support (2023-08-12 14:59:15 +0200)

----------------------------------------------------------------
Basic graphics support for rv1126, some more new peripherals for it as well
and some improvements for the edgeble-neu2 board based on this soc.

----------------------------------------------------------------
Jagan Teki (8):
      ARM: dts: rockchip: Add SFC node to rv1126
      ARM: dts: rockchip: Add rv1126 FSPI pins
      ARM: dts: rockchip: Add rv1126 uart5m2_xfer pins
      ARM: dts: rockchip: Drop EMMC_RSTN for edgeble-neu2
      ARM: dts: rockchip: Add 3V3_SYS regulator for edgeble-neu2
      ARM: dts: rockchip: Add 12V main supply for edgeble-neu2
      ARM: dts: rockchip: Add rv1126 PD_VO entry
      ARM: dts: rockchip: Add rv1126 VOP_LITE support

Stephen Chen (1):
      ARM: dts: rockchip: Enable SFC for edgeble-neu2

 .../boot/dts/rockchip/rv1126-edgeble-neu2-io.dts   | 29 +++++++
 .../arm/boot/dts/rockchip/rv1126-edgeble-neu2.dtsi | 27 ++++---
 arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi     | 26 ++++++
 arch/arm/boot/dts/rockchip/rv1126.dtsi             | 93 ++++++++++++++++++++++
 4 files changed, 165 insertions(+), 10 deletions(-)



