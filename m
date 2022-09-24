Return-Path: <SRS0=Tvk5=Z3=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D2E9C32771
	for <soc@archiver.kernel.org>; Sat, 24 Sep 2022 19:01:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 544E7C433D6; Sat, 24 Sep 2022 19:01:14 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8640AC433C1;
	Sat, 24 Sep 2022 19:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8640AC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from p57b775e6.dip0.t-ipconnect.de ([87.183.117.230] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ocAOl-0001iv-H4; Sat, 24 Sep 2022 21:01:11 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip defconfig64 changes for 6.1 #1
Date: Sat, 24 Sep 2022 21:01:09 +0200
Message-ID: <1989419.QkHrqEjB74@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 1c23f9e627a7b412978b4e852793c5e3c3efc555:

  Linux 6.0-rc2 (2022-08-21 17:32:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.1-rockchip-defconfig64-1

for you to fetch changes up to 489dd8611b64efbd84c12c6c9db470dadc34470f:

  arm64: defconfig: Enable Synopsys DWC MSHC driver (2022-09-23 11:23:38 +0200)

----------------------------------------------------------------
Enable Synopsys DWC MSHC (sdhci) driver in the defconfig.

----------------------------------------------------------------
Anand Moon (1):
      arm64: defconfig: Enable Synopsys DWC MSHC driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)



