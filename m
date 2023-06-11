Return-Path: <SRS0=EKYy=B7=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33E8AC77B7A
	for <soc@archiver.kernel.org>; Sun, 11 Jun 2023 21:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B451C4339C; Sun, 11 Jun 2023 21:12:16 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E9054C433EF;
	Sun, 11 Jun 2023 21:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E9054C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b22.versanet.de ([83.135.91.34] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1q8SM9-0005sw-3A; Sun, 11 Jun 2023 23:12:13 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 6.5 #1
Date: Sun, 11 Jun 2023 23:12:12 +0200
Message-ID: <10286366.nUPlyArG6x@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.5-rockchip-drivers1

for you to fetch changes up to a10b3841f901714dbe16a8f9b0f2bbe1034e6454:

  soc: rockchip: dtpm: use C99 array init syntax (2023-06-11 22:38:04 +0200)

----------------------------------------------------------------
An addition to the rk3588 power-domains, some new syscon compatibles for
rk3588-based "General-register-files" register areas and a move to
C99 array inits for the dtpm driver to fix sparse warnings.

----------------------------------------------------------------
Boris Brezillon (1):
      soc: rockchip: power-domain: add rk3588 mem module support

Randy Dunlap (1):
      soc: rockchip: dtpm: use C99 array init syntax

Sebastian Reichel (2):
      dt-bindings: soc: rockchip: add rk3588 usb2phy syscon
      dt-bindings: soc: rockchip: add rk3588 pipe-phy syscon

 .../devicetree/bindings/soc/rockchip/grf.yaml      |   3 +
 drivers/soc/rockchip/dtpm.c                        |  54 +++----
 drivers/soc/rockchip/pm_domains.c                  | 160 ++++++++++++++++-----
 3 files changed, 155 insertions(+), 62 deletions(-)



