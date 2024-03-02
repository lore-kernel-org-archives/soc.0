Return-Path: <SRS0=pj2G=KI=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D915DC5478C
	for <soc@archiver.kernel.org>; Sat,  2 Mar 2024 12:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF63FC43394; Sat,  2 Mar 2024 12:18:00 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F29E9C433F1;
	Sat,  2 Mar 2024 12:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F29E9C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rgOJR-0005JE-2M; Sat, 02 Mar 2024 13:17:57 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip arm64 defconfig changes for 6.9 #1
Date: Sat, 02 Mar 2024 13:17:56 +0100
Message-ID: <14841602.uLZWGnKmhe@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.9-rockchip-config64-1

for you to fetch changes up to 23ed255e74317b10b41b396d4af5b79b47b28c22:

  arm64: defconfig: Enable Rockchip HDMI/eDP Combo PHY (2024-02-27 23:35:45 +0100)

----------------------------------------------------------------
Enablement of the hdmi phy-driver used on rk3588.

----------------------------------------------------------------
Cristian Ciocaltea (1):
      arm64: defconfig: Enable Rockchip HDMI/eDP Combo PHY

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)



