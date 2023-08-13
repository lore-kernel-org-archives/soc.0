Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50A9FEB64DD
	for <soc@archiver.kernel.org>; Sun, 13 Aug 2023 13:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 394B7C433C9; Sun, 13 Aug 2023 13:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D0DC433C8;
	Sun, 13 Aug 2023 13:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691933659;
	bh=iOZp+wPvPOfsel4QDtsMVjMHjSPIPe3wFsUD/G4m36s=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZRXGMS31fCS/nzkVM0bmGDSL1GKrkwsnho9k8HLDpMOb45z0XCp4etcgkYC0MNzQO
	 OCkMPUwZD6Jw9bkVA563YXrrzpG7SjQNx5onGtMD3WVFBJaUOfSBqSG88RZMKl63zr
	 kqxB88W500+e3Y8qxR43r1wG/ZjyIWSWzAyg9wGt59mBS1V6Y587L/2EhmA8fMpCFz
	 LHY6pJREueBcYsXYa7IwNlshbDD6+OVppbBZfyxHer/ZEAoBeb1hXcID1zeEi1rKDB
	 h58GUFVY3WSQHYeGWPKK1D8Z3TBINE7Y2m+vThLls0Lib3vY4xQhjI/fcEsP/HwguF
	 fsRrmsQnACzSg==
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
Subject: [GIT PULL 2/6] i.MX SoC change for 6.6
Date: Sun, 13 Aug 2023 21:33:50 +0800
Message-Id: <20230813133354.847010-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230813133354.847010-1-shawnguo@kernel.org>
References: <20230813133354.847010-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.6

for you to fetch changes up to 66ba9c05fc51d3357298dccf718ee83469978da8:

  ARM: imx: Drop unused includes (2023-07-19 15:28:44 +0800)

----------------------------------------------------------------
i.MX SoC change for 6.6:

- A change from Rob Herring to drop unused includes from i.MX platform
  code.

----------------------------------------------------------------
Rob Herring (1):
      ARM: imx: Drop unused includes

 arch/arm/mach-imx/mach-imx1.c   | 4 ----
 arch/arm/mach-imx/mach-imx25.c  | 5 -----
 arch/arm/mach-imx/mach-imx27.c  | 6 ------
 arch/arm/mach-imx/mach-imx35.c  | 8 --------
 arch/arm/mach-imx/mach-imx50.c  | 1 -
 arch/arm/mach-imx/mach-imx51.c  | 5 +----
 arch/arm/mach-imx/mach-imx53.c  | 8 --------
 arch/arm/mach-imx/mach-imx6sx.c | 2 --
 arch/arm/mach-imx/mach-imx6ul.c | 4 ----
 arch/arm/mach-imx/mach-imx7d.c  | 2 +-
 arch/arm/mach-imx/pm-imx5.c     | 1 +
 arch/arm/mach-imx/pm-imx6.c     | 1 +
 12 files changed, 4 insertions(+), 43 deletions(-)
