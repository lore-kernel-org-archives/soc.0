Return-Path: <SRS0=7/pu=EB=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7205C27C41
	for <soc@archiver.kernel.org>; Wed, 16 Aug 2023 22:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D22FC433CA; Wed, 16 Aug 2023 22:04:51 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83235C433C9;
	Wed, 16 Aug 2023 22:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83235C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875bbf.versanet.de ([83.135.91.191] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qWOdE-0007bt-Hw; Thu, 17 Aug 2023 00:04:48 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip arm64 defconfig changes for 6.6 #1
Date: Thu, 17 Aug 2023 00:04:47 +0200
Message-ID: <5353918.Isy0gbHreE@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.6-rockchip-defconfig64-1

for you to fetch changes up to 5eaeb85ccae878e5800a207da7baeb5d9d1dd2fd:

  arm64: defconfig: Enable drivers for the Odroid-M1 board (2023-07-28 21:40:15 +0200)

----------------------------------------------------------------
Enable some options needed for Rockchip boards in the main defconfig.

----------------------------------------------------------------
Cristian Ciocaltea (1):
      arm64: defconfig: Enable Rockchip OTP memory driver

Jagan Teki (2):
      arm64: defconfig: Enable PHY_ROCKCHIP_NANENG_COMBO_PHY
      arm64: defconfig: Enable GPIO_SYSCON

Marek Szyprowski (1):
      arm64: defconfig: Enable drivers for the Odroid-M1 board

 arch/arm64/configs/defconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)



