Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F4AC433F5
	for <soc@archiver.kernel.org>; Sat, 18 Dec 2021 07:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3967BC36AEA; Sat, 18 Dec 2021 07:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60EE8C36AE0;
	Sat, 18 Dec 2021 07:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639811701;
	bh=EKtcayWTBp7wc65WZ5IaYesM4boha/I5po/b1IHr/P8=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=NI9AiReVSvw7+aVYoBnyQJZB9Q5qpN5UWpBeNsb5AvBeKtIarUybwxpXzvqWneeJF
	 TBZrJr+xsgXSkWzkfwG0r2iSYHBxaWhuViFsjOmx1E7j6BlUMvyPfoyr4vfWyLvp62
	 g78mKrTSgDTklF/PkBb7bdLMbd/vyw++txFZObnQyvDhisy6cmbKF3AiM3qeSvT7x2
	 fxkyRqNHhaaoZ9z5YEI9Lcsp0KMrr1ddU5cvu6P1OZ4T4OjPQsIro1Uy0Uokl+1JzF
	 DeQY1mxxzInPUx/nrcK0S1mZogUWFG0lFhmkrl7NPIlFJe2H8WSJn26SJpQjCv17rO
	 gHvJpBVsNPNJw==
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] i.MX drivers update for 5.17
Date: Sat, 18 Dec 2021 15:14:22 +0800
Message-Id: <20211218071427.26745-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.17

for you to fetch changes up to 7f511d514e8c34b6dd0c17b5496e48b2a6a2626c:

  soc: imx: imx8m-blk-ctrl: add i.MX8MN DISP blk-ctrl (2021-12-17 10:53:20 +0800)

----------------------------------------------------------------
i.MX drivers update for 5.17:

- A number of patches from Adam Ford to update gpcv2 and blk-ctrl driver
  to keep i.MX8MM VPU-H1 and i.MX8MN GPUMIX bus clocks active, and add
  i.MX8MN display related domain support.
- Add optional continuous burst clock support for imx-weim bus driver.
- Call pm_runtime_put_sync_suspend() instead of pm_runtime_put() in
  gpcv2 driver to prevent a sequence issue seen with i.MX8MM GPU and
  MIX domain.

----------------------------------------------------------------
Adam Ford (5):
      soc: imx: gpcv2: keep i.MX8MM VPU-H1 bus clock active
      soc: imx: gpcv2: keep i.MX8MN gpumix bus clock enabled
      soc: imx: gpcv2: Add dispmix and mipi domains to imx8mn
      dt-bindings: power: imx8mn: add defines for DISP blk-ctrl domains
      soc: imx: imx8m-blk-ctrl: add i.MX8MN DISP blk-ctrl

Ivan Bornyakov (1):
      bus: imx-weim: optionally enable continuous burst clock

Marek Vasut (1):
      soc: imx: gpcv2: Synchronously suspend MIX domains

 drivers/bus/imx-weim.c                   | 18 +++++++-
 drivers/soc/imx/gpcv2.c                  | 29 +++++++++++-
 drivers/soc/imx/imx8m-blk-ctrl.c         | 77 +++++++++++++++++++++++++++++++-
 include/dt-bindings/power/imx8mn-power.h |  5 +++
 4 files changed, 125 insertions(+), 4 deletions(-)
