Return-Path: <SRS0=5SgQ=VT=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00B4C433EF
	for <soc@archiver.kernel.org>; Wed, 11 May 2022 23:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C4693C34116; Wed, 11 May 2022 23:42:52 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2570C340EE;
	Wed, 11 May 2022 23:42:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2570C340EE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1novyj-0006U5-Oe; Thu, 12 May 2022 01:42:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 5.19 #1
Date: Thu, 12 May 2022 01:42:48 +0200
Message-ID: <3998951.tdWV9SEqCh@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-drivers1

for you to fetch changes up to add9f6f30e54b5c07e7a0260cda459ef1d9646b7:

  soc: rockchip: Fix compile-testing SoC drivers (2022-04-30 15:06:14 +0200)

----------------------------------------------------------------
Powerdomain fixes and improvements, some GRF compatible properties
and a rk3566 GRF clocksource default setup.

----------------------------------------------------------------
Brian Norris (3):
      soc: rockchip: Clean up Kconfig whitespace
      soc: rockchip: power-domain: Replace dsb() with smb()
      soc: rockchip: Fix compile-testing SoC drivers

Johan Jonker (1):
      dt-bindings: soc: rockchip: add naneng combo phy register compatible

Peter Geis (2):
      dt-bindings: soc: rockchip: add rk3566-pipe-grf compatible
      soc: rockchip: set dwc3 clock for rk3566

Sebastian Fricke (1):
      soc: rockchip: pm_domains: Fix typo in comment

 .../devicetree/bindings/soc/rockchip/grf.yaml      |  3 +++
 drivers/soc/Makefile                               |  2 +-
 drivers/soc/rockchip/Kconfig                       | 24 +++++++++++-----------
 drivers/soc/rockchip/grf.c                         | 17 +++++++++++++++
 drivers/soc/rockchip/pm_domains.c                  | 10 ++++-----
 5 files changed, 38 insertions(+), 18 deletions(-)



