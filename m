Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF8AC433E0
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 12:02:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B860264F53; Thu,  4 Feb 2021 12:02:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA13464F4D;
	Thu,  4 Feb 2021 12:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612440123;
	bh=BjGpwOm/oSJcyhdaM5HDrSC979lO7T2fcJGMIbGp2Fc=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=SQSmzow2lE8Yf1AfVwrXFv3oVo6WoaG2WLbLKRPV/hZZmRplbCH/ziQQ+sjAjqQXd
	 SKJWHj811dOwlYoup3bRiA95rD36oFLdE2rk/noSgph9WdPdP0k9/ZuKOKO4MzsaUZ
	 7mGAFZ7fGuRVoCSOS79vyBvuMYs91+2zSuG2pncA8izEo3WKsA4C5M2GPaoOaKBqXW
	 JQz3C+gdY6h0mlr4unHR+t03bBbjBHo05sCjjD3r4yAofyWZfJsadALimg4h4u9pqF
	 PRVLaawTfIWxDVpPgYCCVC9e1//j0USLeAt1BisSRWobyqzxar1CWCcUAzMR3hYZKM
	 xfDLm4X1/uHLQ==
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
Subject: [GIT PULL 1/6] i.MX drivers change for 5.12
Date: Thu,  4 Feb 2021 20:01:45 +0800
Message-Id: <20210204120150.26186-1-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.12

for you to fetch changes up to 7d981405d0fd3cfc0de052e4791f516235d8b858:

  soc: imx8m: change to use platform driver (2021-01-11 10:46:09 +0800)

----------------------------------------------------------------
i.MX drivers change for 5.12:

- Change soc-imx8m to use platform driver, so that defer probe can be
  used to resolve dependency on OCOTP clock.

----------------------------------------------------------------
Alice Guo (1):
      soc: imx8m: change to use platform driver

 drivers/soc/imx/soc-imx8m.c | 84 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 72 insertions(+), 12 deletions(-)
