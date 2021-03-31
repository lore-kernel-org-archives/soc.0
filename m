Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A494C433C1
	for <soc@archiver.kernel.org>; Wed, 31 Mar 2021 04:10:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D5516619DA; Wed, 31 Mar 2021 04:10:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15FF0619DB;
	Wed, 31 Mar 2021 04:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617163838;
	bh=xVGwmuuaspcOA67NhO43yvUoxEK7fy/AwoBkld2KwUI=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=HZRf5KA5CO3T+jfxWwjCAbeqVMDnQsUytVDbeivzMCaXpSE99PQsHW9AFLdlHeLge
	 RJUh5Vmz4XJ4+hQjG7X0oMeQVRo05EmNLJk42ci1vwv1yBK2D7qG9uJA0graST7TZs
	 jYXWVLbYz2qJctW0uMTeT361YQ3kGNwwvmnUpxv82LMOmJKfvhcPt25Et5wY91VzCP
	 xaUkOj8FPPaOYBmfzI7XhYlFx6N8sqp2zT2LX0p1lFFtqAxKFieR2dYOCvOaJlKzyH
	 9+71KDMwPeUM776rBhgVGYXrP1LrtyNnDqszs4uiX81ps5Cz1IhrDUrZsHWBKXwAjv
	 9yfAP+SQcJ2FA==
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
Subject: [GIT PULL 1/6] i.MX drivers change for 5.13
Date: Wed, 31 Mar 2021 12:10:14 +0800
Message-Id: <20210331041019.31345-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.13

for you to fetch changes up to f63af5f3b8e2cba1b0b19b5cc4aa00d152f84599:

  firmware: imx: scu-pd: add missed ADC1 pd (2021-03-29 09:34:37 +0800)

----------------------------------------------------------------
i.MX drivers change for 5.13:

- Update SCU power domain driver to keep console domain power on.
- Add missing ADC1 power domain to SCU power domain driver.
- Update comments for single global power domain in SCU power domain
  driver.
- Add i.MX51/i.MX53 unique id support to i.MX SoC driver.

----------------------------------------------------------------
Dong Aisheng (1):
      firmware: imx: scu-pd: do not power off console domain

Frank Li (1):
      firmware: imx: scu-pd: add missed ADC1 pd

Sebastian Reichel (1):
      soc: imx: add i.MX51/i.MX53 unique id support

Ulf Hansson (1):
      firmware: imx: scu-pd: Update comments for single global power domain

 drivers/firmware/imx/scu-pd.c | 41 +++++++++++++++++++++++++++++++++++++----
 drivers/soc/imx/soc-imx.c     | 12 ++++++++++++
 2 files changed, 49 insertions(+), 4 deletions(-)
