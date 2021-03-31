Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5796C433DB
	for <soc@archiver.kernel.org>; Wed, 31 Mar 2021 04:10:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9FE36619E3; Wed, 31 Mar 2021 04:10:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDA8B619DF;
	Wed, 31 Mar 2021 04:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617163849;
	bh=I6fiXWkSVtLjfpjswEHIHaRV8x3+xRah91+v4N25RvU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZAWRYg2q6RLHolas/fEpDJP3jWp4LniKXXHCZaldvoECi2h5sVic5D+iO98WM8SWx
	 pXY4nhLcnzOxam08J5NLI6Rj9cb88EAsEESKJqORhqqSvxXGPUeyu7D0lA/ELI6inV
	 XLTTsI4uM+DshdufYLUF40PTSp6RpZ5dPB1/cHRodMcshEIJOKAFfXb7N61SVZIyMK
	 s50sXkjYskYQUDe9wZgE0ocr1Q+SEJwE4/DcIpIJNwQ/s0v8aqwrGVpECrii5raOvQ
	 YJIUtBQpDd43X58jD0sLntDI30FBQt3EFe2S1riwiVaDXAOTC5pJNOpXqe/HlJOUHA
	 EW6EbwU+Zah7A==
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
Subject: [GIT PULL 6/6] i.MX defconfig change for 5.13
Date: Wed, 31 Mar 2021 12:10:19 +0800
Message-Id: <20210331041019.31345-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331041019.31345-1-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.13

for you to fetch changes up to 94c586e5941a472fd114815f0eed2f2bb6b83a11:

  arm64: configs: enable FlexTimer alarm timer (2021-03-29 09:36:16 +0800)

----------------------------------------------------------------
i.MX defconfig change for 5.13:

It includes a number of arm64 defconfig update for i.MX8 devices
support.  The following ones might deserve some notes.

- Although Hantro decoder driver are sitting in staging, people already
  find it's quite useful on i.MX8M devices.
- i.MX PCIe driver has no option for module build.
- REALTEK_PHY becomes a built-in driver, because it's used on quite some
  i.MX8 reference boards where people want to boot via NFS.

----------------------------------------------------------------
Adrien Grassein (1):
      arm64: defconfig: Enable wm8960 audio driver.

Dong Aisheng (1):
      arm64: defconfig: add imx8qm pinctrl support

Fabio Estevam (2):
      arm64: defconfig: Enable the Hantro decoder
      arm64: configs: Select REALTEK_PHY as built-in

Guido Günther (2):
      arm64: defconfig: Enable devfreq support for i.MX8MQ
      arm64: defconfig: Enable asoc simple mux

Heiko Thiery (1):
      arm64: configs: Enable PCIe support for imx8mq boards

Michael Walle (1):
      arm64: configs: enable FlexTimer alarm timer

 arch/arm64/configs/defconfig | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)
