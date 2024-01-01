Return-Path: <SRS0=ajTL=IL=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE39CC4706F
	for <soc@archiver.kernel.org>; Mon,  1 Jan 2024 22:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9634FC433CA; Mon,  1 Jan 2024 22:55:16 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51549C433C7;
	Mon,  1 Jan 2024 22:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51549C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875a56.versanet.de ([83.135.90.86] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rKRBh-0007Xj-3q; Mon, 01 Jan 2024 23:55:13 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.8 #2
Date: Mon, 01 Jan 2024 23:55:12 +0100
Message-ID: <15502825.JCcGWNJJiE@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 569b26af7919c15a8ce231b4fae29cfbd811f144:

  ARM: dts: rockchip: add hdmi-connector node to rk3036-kylin (2023-12-12 20:38:36 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.8-rockchip-dts32-2

for you to fetch changes up to bb0b255fb6f14b1620566d7d32c43adaca09c5e5:

  ARM: dts: rockchip: Remove rockchip,default-sample-phase from rk3036.dtsi (2023-12-24 19:49:38 +0100)

----------------------------------------------------------------
RK3036 fix for emmc init issue and stdout-path for the console
on rk3036 kylin.

----------------------------------------------------------------
Andy Yan (2):
      ARM: dts: rockchip: Add stdout-path for rk3036 kylin
      ARM: dts: rockchip: Remove rockchip,default-sample-phase from rk3036.dtsi

 arch/arm/boot/dts/rockchip/rk3036-kylin.dts | 4 ++++
 arch/arm/boot/dts/rockchip/rk3036.dtsi      | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)



