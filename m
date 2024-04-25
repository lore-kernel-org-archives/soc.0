Return-Path: <SRS0=rQSY=L6=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD30C19F4F
	for <soc@archiver.kernel.org>; Thu, 25 Apr 2024 21:46:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8EBC9C2BD10; Thu, 25 Apr 2024 21:46:24 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74C9DC113CC;
	Thu, 25 Apr 2024 21:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74C9DC113CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b01.versanet.de ([83.135.91.1] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1s06v7-0007Jr-JA; Thu, 25 Apr 2024 23:46:21 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip arm64 defconfig changes for 6.10 #1
Date: Thu, 25 Apr 2024 23:46:20 +0200
Message-ID: <8976550.lOV4Wx5bFT@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.10-rockchip-defconfig64

for you to fetch changes up to 7cdf7efefc02189cf9a228d4c5c4253d273e9b1a:

  arm64: defconfig: enable Rockchip Samsung USBDP PHY (2024-04-12 16:22:53 +0200)

----------------------------------------------------------------
Enablement of rk3308 audio codec, panthor driver for Valhall GPUs
and USBDP phy driver for rk3588.

----------------------------------------------------------------
Luca Ceresoli (1):
      arm64: defconfig: enable Rockchip RK3308 internal audio codec driver

Sebastian Reichel (2):
      arm64: defconfig: support Mali CSF-based GPUs
      arm64: defconfig: enable Rockchip Samsung USBDP PHY

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)



