Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF1AC77B61
	for <soc@archiver.kernel.org>; Sat,  8 Apr 2023 10:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48948C4339C; Sat,  8 Apr 2023 10:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A32AC4339B;
	Sat,  8 Apr 2023 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680949200;
	bh=966EwYT0iY9O/9ZMt1yAzJoG/MLUBhLDQ38LmYtNtiY=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=f2vL+Me8Zi5BEpIabM5YikGPg18jBWJxMKloZTkySmYuhTQO7DjG8QjfNf4r5E1f7
	 MuXWDIP2+vjtLW/Ho26k9IEroa11rneHYTiVpSY5t5WoZn0YKVSzB2UJyuSXz3f+ct
	 1e0pWMdlbKCoVAzGynl2WwnrADcpjOqerFx23Gvye2qx+C3sasoXcaeKWxPsS8pEEh
	 vXYTFydztDmw/N/qYuAh9MVawH20W39/k1rwrpBM1BX0Wt+ln6bkhpykyZ/slIit/t
	 00LkYQScug2tOka3XGF5J1mCXX1C9bejCyNPbtN89aDmLkBNztXctXK0To1e8z8ePQ
	 axGs2ZWddxLkw==
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
Subject: [GIT PULL 1/6] i.MX drivers update for 6.4
Date: Sat,  8 Apr 2023 18:19:23 +0800
Message-Id: <20230408101928.280271-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.4

for you to fetch changes up to 816aec03a043af6d0234c3e770bead2c772ef4eb:

  soc: imx: imx8m-blk-ctrl: reordering the fields (2023-03-27 09:52:41 +0800)

----------------------------------------------------------------
i.MX drivers update for 6.4:

- Use dev_err_probe() for imx-scu driver to silences EPROBE_DEFER
  messages.
- Add LVDS LPI2C and PWM power domains for scu-pd driver.
- A series from Jindong Yue to support module build of imx8m soc driver.
- Update imx8m-blk-ctrl driver to scan child nodes for binding drivers.
- Reorder structure members in imx8m-blk-ctrl driver by following
  clang-analyzer suggestion.
- Update imx-weim bus driver to use helper function for "ranges"
  parsing.

----------------------------------------------------------------
Alexander Stein (1):
      firmware: imx: scu: use dev_err_probe

Clark Wang (1):
      firmware: imx: scu-pd: add missed lvds lpi2c and pwm power domains

Jindong Yue (7):
      soc: imx: imx8mp-blk-ctrl: Use dev_pm_domain_attach_by_name
      soc: imx: imx8mp-blk-ctrl: Fix typo of imx8m_blk_ctrl_of_match
      soc: imx: imx8mp-blk-ctrl: Add MODULE_LICENSE
      soc: imx: imx8m-blk-ctrl: Use dev_pm_domain_attach_by_name
      soc: imx: imx8m-blk-ctrl: Add MODULE_LICENSE
      soc: imx8m: Add MODULE_LICENSE
      soc: imx8m: Support building imx8m soc driver as module

Marek Vasut (1):
      soc: imx: imx8m-blk-ctrl: Scan subnodes and bind drivers to them

Peng Fan (1):
      soc: imx: imx8m-blk-ctrl: reordering the fields

Rob Herring (1):
      bus: imx-weim: Remove open coded "ranges" parsing

 drivers/bus/imx-weim.c            | 19 ++++++++++---------
 drivers/firmware/imx/imx-scu.c    |  5 ++---
 drivers/firmware/imx/scu-pd.c     |  4 ++++
 drivers/soc/imx/Kconfig           |  2 +-
 drivers/soc/imx/imx8m-blk-ctrl.c  | 11 ++++++++---
 drivers/soc/imx/imx8mp-blk-ctrl.c |  5 +++--
 drivers/soc/imx/soc-imx8m.c       |  1 +
 7 files changed, 29 insertions(+), 18 deletions(-)
