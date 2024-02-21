Return-Path: <SRS0=9ssg=J6=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C628C48BF6
	for <soc@archiver.kernel.org>; Wed, 21 Feb 2024 22:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43BE2C433C7; Wed, 21 Feb 2024 22:58:26 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1416C433F1;
	Wed, 21 Feb 2024 22:58:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1416C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e861914.versanet.de ([94.134.25.20] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rcvXh-0000pG-TV; Wed, 21 Feb 2024 23:58:21 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.9 #1
Date: Wed, 21 Feb 2024 23:58:21 +0100
Message-ID: <37970455.XM6RcZxFsP@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.9-rockchip-dts32-1

for you to fetch changes up to 15a5ed03000cf61daf87d14628085cb1bc8ae72c:

  ARM: dts: rockchip: fix rk322x hdmi ports node (2024-02-13 20:22:34 +0100)

----------------------------------------------------------------
Display output for rk3128 and some adaptions to binding clarifications
for hdmi nodes on some older socs.

----------------------------------------------------------------
Alex Bee (3):
      ARM: dts: rockchip: Add display subsystem for RK3128
      ARM: dts: rockchip: Add HDMI node for RK3128
      ARM: dts: rockchip: Enable HDMI output for XPI-3128

Johan Jonker (2):
      ARM: dts: rockchip: fix rk3288 hdmi ports node
      ARM: dts: rockchip: fix rk322x hdmi ports node

 arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts | 29 +++++++++++++
 arch/arm/boot/dts/rockchip/rk3128.dtsi         | 60 ++++++++++++++++++++++++++
 arch/arm/boot/dts/rockchip/rk322x.dtsi         | 16 ++++---
 arch/arm/boot/dts/rockchip/rk3288.dtsi         | 16 +++++--
 4 files changed, 113 insertions(+), 8 deletions(-)



