Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9BB6C64E7C
	for <soc@archiver.kernel.org>; Wed,  2 Dec 2020 14:27:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 712FA221FA; Wed,  2 Dec 2020 14:27:58 +0000 (UTC)
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
Subject: [GIT PULL 6/6] i.MX defconfig update for 5.11
Date: Wed,  2 Dec 2020 22:27:17 +0800
Message-ID: <20201202142717.9262-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201202142717.9262-1-shawnguo@kernel.org>
References: <20201202142717.9262-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <soc.lore.kernel.org>
Message-ID: <20201202142717._zfdYBy37Kri8m_yvEnm-lkLL7-qrbajZHCWTIdGKJo@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.11

for you to fetch changes up to eecc662ff38b498e1fcd971caec3ce448e711d0e:

  arm64: defconfig: Enable more Librem 5 hardware (2020-12-01 09:13:39 +0800)

----------------------------------------------------------------
i.MX defconfig update for 5.11:

- A couple of patches that enable various i.MX audio drivers for i.MX8M.
- Enable more drivers that are useful on Librem 5 hardware.

----------------------------------------------------------------
Adam Ford (2):
      arm64: defconfig: Enable additional sound drivers on i.MX8M Mini
      arm64: defconfig: Enable ASRC and EASRC

Guido Günther (1):
      arm64: defconfig: Enable more Librem 5 hardware

 arch/arm64/configs/defconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
