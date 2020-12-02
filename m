Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72868C64E7C
	for <soc@archiver.kernel.org>; Wed,  2 Dec 2020 14:27:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1F68E221FC; Wed,  2 Dec 2020 14:27:43 +0000 (UTC)
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
Subject: [GIT PULL 1/6] i.MX drivers change for 5.11
Date: Wed,  2 Dec 2020 22:27:12 +0800
Message-ID: <20201202142717.9262-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
List-Id: <soc.lore.kernel.org>
Message-ID: <20201202142712.Mh1mBU2BRDB3azSEbjTA2yieFIwnZztup_dPcuo2kVE@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.11

for you to fetch changes up to e00e70a4dae4cae026d43f2f05ba46a19c4ef22d:

  firmware: imx: scu-pd: Add some power domains support for i.MX8qxp MIPI1 subsystem (2020-11-30 17:47:18 +0800)

----------------------------------------------------------------
i.MX drivers change for 5.11:

- A series from Daniel Baluta to update imx-dsp driver and export
  functions for on demand channel request/free.
- A number of patches to add power domains for i.MX8qxp DC0, LVDS1,
  MIPI1 and JPEG subsystems.
- Add dummy functions for i.MX firmware drivers to avoid build failure
  seen with COMPILE_TEST.

----------------------------------------------------------------
Daniel Baluta (3):
      firmware: imx: Introduce imx_dsp_setup_channels
      firmware: imx: Save channel name for further use
      firmware: imx-dsp: Export functions to request/free channels

Liu Ying (3):
      firmware: imx: scu-pd: Add video0/1 power domains support for i.MX8qxp DC0 subsystem
      firmware: imx: scu-pd: Add main power domain support for i.MX8qxp LVDS1 subsystem
      firmware: imx: scu-pd: Add some power domains support for i.MX8qxp MIPI1 subsystem

Mirela Rabulea (1):
      firmware: imx: scu-pd: Add power domains for imx-jpeg

Peng Fan (1):
      firmware: imx: add dummy functions

 drivers/firmware/imx/imx-dsp.c        | 72 ++++++++++++++++++++++++++---------
 drivers/firmware/imx/scu-pd.c         | 12 ++++++
 include/linux/firmware/imx/dsp.h      | 10 +++++
 include/linux/firmware/imx/ipc.h      | 13 +++++++
 include/linux/firmware/imx/sci.h      | 27 +++++++++++++
 include/linux/firmware/imx/svc/misc.h | 19 +++++++++
 6 files changed, 135 insertions(+), 18 deletions(-)
