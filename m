Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1564C64E7C
	for <soc@archiver.kernel.org>; Wed,  2 Dec 2020 14:27:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6FC8522203; Wed,  2 Dec 2020 14:27:46 +0000 (UTC)
From: Shawn Guo <shawnguo@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] i.MX SoC update for 5.11
Date: Wed,  2 Dec 2020 22:27:13 +0800
Message-ID: <20201202142717.9262-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202142717.9262-1-shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
References: <20201202142717.9262-1-shawnguo@kernel.org>
Message-ID: <20201202142713.hQAOmsq6uAwr_VUmoYoc85PxrptbYDgxMFs6-MFkHIg@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-5.11

for you to fetch changes up to 4ba79e25d7f1a7394021ba4c215a7ecdcc270fb6:

  ARM: mxs: Add serial number support for i.MX23, i.MX28 SoCs (2020-11-30 17:31:29 +0800)

----------------------------------------------------------------
i.MX SoC update for 5.11:

- Add revision detection support for i.MX7ULP revision 2.2.
- Add a little document for i.MX7ULP B2 silicon version.
- Add serial number support for i.MX23, i.MX28 SoCs through soc_device.
- Improve the identifying of i.MX6QP SoCs.

----------------------------------------------------------------
Anson Huang (1):
      ARM: imx: Add revision support for i.MX7ULP revision 2.2

Fabio Estevam (1):
      ARM: imx: imx7ulp: Add a comment explaining the B2 silicon version

Ivan Zaentsev (1):
      ARM: mxs: Add serial number support for i.MX23, i.MX28 SoCs

Sven Van Asbroeck (1):
      ARM: imx: mach-imx6q: correctly identify i.MX6QP SoCs

 arch/arm/mach-imx/mach-imx6q.c   |  9 +++++++--
 arch/arm/mach-imx/mach-imx7ulp.c |  4 ++++
 arch/arm/mach-mxs/mach-mxs.c     | 19 +++++++++++++++++++
 3 files changed, 30 insertions(+), 2 deletions(-)
