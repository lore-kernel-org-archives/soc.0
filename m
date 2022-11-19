Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6DDC433FE
	for <soc@archiver.kernel.org>; Sat, 19 Nov 2022 07:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F3B18C433C1; Sat, 19 Nov 2022 07:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F96C433D6;
	Sat, 19 Nov 2022 07:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668843504;
	bh=Arfs4nC8EQwl3s77HwqUmhC6Z1/J+/ce/20w3m9zmGc=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=lzZJ5nap7T4O+LZf3a2TeOvE0JrcuprdX/kbxpJtZ493cfKYjcC2Fdy+82ATkNJZz
	 ABK70LEzIvc1KnfPr+E9B8OLEqWHw2SAxy0kIPcO4ehGlkxfEvhjwbjjFXd5KPvU0M
	 99h5bwDOC7oxn4Ork8GE5Jk+mg06+nGRt2zIR8jMttRUeeB78gyEqiLy77ho/XKxTj
	 s+at1yOarUBNRrslcJihU2LtItXxAFdnwrHgHRPpblzaDz5Lc8P4tZSCRMfeKEj7YZ
	 YAeWYdP5KHE5f2umaDDKiTnbr9MPxLAkUQYC0sDEG54+iz66sYHZUVJN+beqwF+qyl
	 r7ilv3ZVDxzfA==
Date: Sat, 19 Nov 2022 15:38:13 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 6.1, part 3
Message-ID: <20221119073812.GQ16229@T480>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit 836fb30949d9edf91d7de696a884ceeae7e426d2:

  soc: imx8m: Enable OCOTP clock before reading the register (2022-11-14 15:52:53 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.1-3

for you to fetch changes up to e68be7b39f21d8a9291a5a3019787cd3ca999dd7:

  ARM: dts: imx6q-prti6q: Fix ref/tcxo-clock-frequency properties (2022-11-19 11:20:15 +0800)

----------------------------------------------------------------
i.MX fixes for 6.1, part 3:

- Fix a small memory leak in mach-mxs code.
- Correct PCIe pad configuration for imx8mp-evk board.
- Fix ref/tcxo clock frequency property for imx6q-prti6q board.

----------------------------------------------------------------
Fabio Estevam (1):
      ARM: dts: imx6q-prti6q: Fix ref/tcxo-clock-frequency properties

Peng Fan (1):
      arm64: dts: imx8mp-evk: correct pcie pad settings

Zheng Yongjun (1):
      ARM: mxs: fix memory leak in mxs_machine_init()

 arch/arm/boot/dts/imx6q-prti6q.dts           | 4 ++--
 arch/arm/mach-mxs/mach-mxs.c                 | 4 +++-
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 6 +++---
 3 files changed, 8 insertions(+), 6 deletions(-)
