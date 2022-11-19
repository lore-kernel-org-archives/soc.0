Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C15C4332F
	for <soc@archiver.kernel.org>; Sat, 19 Nov 2022 12:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D77BC43470; Sat, 19 Nov 2022 12:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2CFC433C1;
	Sat, 19 Nov 2022 12:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668862683;
	bh=5xfEOtaoSz4tR3KLNZ21u66j+gAxZ7dWCGljDVjR1HM=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=QOzUgailh521TOwiBnf28/fH8nlFWdBD7V0jOKqCk0ML8xQE2et9y2wnRuVXzNn/a
	 n+AtsI9mbHvncW0NiagO9DXEEBe5PUN/peBTzrOOFykiKYakRp1j+rDcc80xkk5fkl
	 FYHkYYFMgEVBh/FVkWeYEvbAj8U8FJrRSu1xYrnx8GJ/uSvgvMT2eY2MZseAWXEhIq
	 2c3G2NDYf3TFS2XXr2l8Qa3QG0Gu1yJyQmMuA0UPGEslGMXdz1aRS7Ew8j2sDwENJx
	 FalAusBxP/TzcGJ8sW1frE9s+J8DizDifUD4qzXoBw3f7qEWb7jI3wSQ9maXzjYN7B
	 rInrXB7v9YF7w==
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
Subject: [GIT PULL 1/6] i.MX drivers change for 6.2
Date: Sat, 19 Nov 2022 20:57:28 +0800
Message-Id: <20221119125733.32719-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.2

for you to fetch changes up to 98572487e5c615ac9edfb105aca9b3f3bd1b4b7c:

  soc: imx: gpcv2: add GENPD_FLAG_ACTIVE_WAKEUP flag for usb of imx8mm/n (2022-10-29 16:20:49 +0800)

----------------------------------------------------------------
i.MX drivers change for 6.2:

- Improve imx8m-blk-ctrl driver to allow deferred probe in case that
  'bus' genpd is not yet ready.
- Add missing USB_1_PHY PD for i.MX scu-pd firmware driver.
- Add GENPD_FLAG_ACTIVE_WAKEUP flag for i.MX8MM/N in GPCv2 driver, so
  that the power domain remains on if USB remote wakeup is enabled.

----------------------------------------------------------------
Benjamin Gaignard (1):
      soc: imx: imx8m-blk-ctrl: Defer probe if 'bus' genpd is not yet ready

Frank Li (1):
      firmware: imx: scu-pd: add missed USB_1_PHY pd

Li Jun (1):
      soc: imx: gpcv2: add GENPD_FLAG_ACTIVE_WAKEUP flag for usb of imx8mm/n

 drivers/firmware/imx/scu-pd.c    |  1 +
 drivers/soc/imx/gpcv2.c          |  3 +++
 drivers/soc/imx/imx8m-blk-ctrl.c | 11 ++++++++---
 3 files changed, 12 insertions(+), 3 deletions(-)
