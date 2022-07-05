Return-Path: <SRS0=tHfl=XK=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE0AC43334
	for <soc@archiver.kernel.org>; Tue,  5 Jul 2022 11:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C415C341CF; Tue,  5 Jul 2022 11:09:07 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CAC60C341C7;
	Tue,  5 Jul 2022 11:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CAC60C341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o8gQQ-0000BQ-6p; Tue, 05 Jul 2022 13:09:02 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 5.19
Date: Tue, 05 Jul 2022 13:08:59 +0200
Message-ID: <7723415.29KlJPOoH8@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-dtsfixes1

for you to fetch changes up to 2d56af33d4df94d2b76446ffc3e3654c42232f4b:

  arm64: dts: rockchip: Assign RK3399 VDU clock rate (2022-06-11 17:17:57 +0200)

----------------------------------------------------------------
rk3399 vdu clock-rate fix, otg port fix on Quartz64-A and ethernet
fix on Quartz64-B (actual production model)

----------------------------------------------------------------
Brian Norris (1):
      arm64: dts: rockchip: Assign RK3399 VDU clock rate

Peter Geis (2):
      arm64: dts: rockchip: Fix ethernet on production Quartz64-B
      arm64: dts: rockchip: Fix Quartz64-A dwc3 otg port behavior

 arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet.dtsi | 4 +++-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi             | 6 ++++--
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts   | 1 +
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts   | 2 +-
 4 files changed, 9 insertions(+), 4 deletions(-)



