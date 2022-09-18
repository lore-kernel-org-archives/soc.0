Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B37C32771
	for <soc@archiver.kernel.org>; Sun, 18 Sep 2022 09:28:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2A44C43470; Sun, 18 Sep 2022 09:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26451C433D7;
	Sun, 18 Sep 2022 09:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663493313;
	bh=4gcbJ2xbudsPQkJvuQ7/U2uLwfwH3PoVvEIP6xnquko=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eAotXfSoXx2p5qTXsr99sK7o/U6tr2yno1iuEnDRFtfkXSlNBeoUnR8vUPUiYG8ko
	 RsVpda03Yl9kHoFFhPZ74EvH9EnJC//Km7uSAF2zK6vK3wY8CtAXr566309hdu0Nbz
	 hEttrvRYQi9nFExg4DsBIndnDIIZZ4JPikzYJdn/iLVHOaZs4lerw7AB+J7jbMhR3D
	 hm2v1L7uRic1Gi1A1/0NwMQX/d3sbIjZRgQEIY5O46MgiQzyQpVi08n0VffMp6Pj/+
	 BjNAwxUXCvnBGE1PErE0i7auWHYsAH20AKov0lm0XVdxKMjWuHatKvPUKYQs97YTBh
	 iwdla9wV2ojTA==
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
Subject: [GIT PULL 2/4] i.MX drivers change for 6.1
Date: Sun, 18 Sep 2022 17:28:04 +0800
Message-Id: <20220918092806.2152700-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220918092806.2152700-1-shawnguo@kernel.org>
References: <20220918092806.2152700-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is the i.MX drivers changeset for 6.1.  It's built on top of
imx/bindings branch (tag imx-bindings-6.1) to resolve the dependency
on DT bindings header.  Please consider to pull, thanks!

Shawn


The following changes since commit 64e61a940d96184d294f431848a28765f44525fa:

  dt-bindings: arm: imx: update fsl.yaml for imx8dxl (2022-09-17 16:25:50 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.1

for you to fetch changes up to e9aa77d413c903ba4cf7da3fe0b419cae5b97a81:

  soc: imx: add i.MX93 media blk ctrl driver (2022-09-17 16:31:06 +0800)

----------------------------------------------------------------
i.MX drivers change for 6.1:

- Update i.MX8MP blk-ctrl driver to handle PCIe PHY reset bit.
- Add interconnect support into i.MX8MP blk-ctrl driver, so that i.MX8MP
  NoC can be set up properly after related power domain is up.
- Add blk-ctrl support for i.MX8MP HDMI HDCP/HRV and VPU block.
- Add i.MX93 SRC power domain and MEDIA blk-ctrl driver.
- Update imx8m-blk-ctrl driver to use genpd_xlate_onecell.

----------------------------------------------------------------
Lucas Stach (1):
      soc: imx: imx8mp-blk-ctrl: handle PCIe PHY resets

Peng Fan (7):
      soc: imx: add icc paths for i.MX8MP media blk ctrl
      soc: imx: add icc paths for i.MX8MP hsio/hdmi blk ctrl
      soc: imx: add i.MX8MP HDMI blk ctrl HDCP/HRV_MWR
      soc: imx: imx8m-blk-ctrl: add i.MX8MP VPU blk ctrl
      soc: imx: imx8m-blk-ctrl: Use genpd_xlate_onecell
      soc: imx: add i.MX93 SRC power domain driver
      soc: imx: add i.MX93 media blk ctrl driver

 drivers/soc/imx/Kconfig           |   8 +
 drivers/soc/imx/Makefile          |   2 +
 drivers/soc/imx/imx8m-blk-ctrl.c  |  96 +++++++--
 drivers/soc/imx/imx8mp-blk-ctrl.c |  89 ++++++--
 drivers/soc/imx/imx93-blk-ctrl.c  | 436 ++++++++++++++++++++++++++++++++++++++
 drivers/soc/imx/imx93-pd.c        | 164 ++++++++++++++
 drivers/soc/imx/imx93-src.c       |  33 +++
 7 files changed, 800 insertions(+), 28 deletions(-)
 create mode 100644 drivers/soc/imx/imx93-blk-ctrl.c
 create mode 100644 drivers/soc/imx/imx93-pd.c
 create mode 100644 drivers/soc/imx/imx93-src.c
