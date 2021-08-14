Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AB8DC4338F
	for <soc@archiver.kernel.org>; Sat, 14 Aug 2021 13:39:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2DA7861042; Sat, 14 Aug 2021 13:39:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7EB7A6103A;
	Sat, 14 Aug 2021 13:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628948357;
	bh=zHbtbeKUJqo0sHvc4hxV+jhPtYhWxMhgdp6htMvVLyU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nOfRLEL3QXmmmS31BMkeHfC+Wkd9tWI4QntwWjnAieO/JKmZel87RU3gf9Une3O3G
	 GVPJBKfIJb3P9BRPy0FDROXdnsDo3l61yy9nR2/h4neUHS48YJ/OP0LQnj/7aKCwFb
	 1f+2rHnD3qMk1vhAVFnkneJUhaC66oy8kM4PrMnIiR5bQA+07hR0CJL/DK42Vnl6yX
	 X9Gsn2wYSlZ/hRKAXdyqLS+C6ivcVh/gt9s9vXSDNWRlr8cKeekyfsGBRM3rTjVaIY
	 L4bBY+5Q/FQEht/VBX01ikxSB9sx20dJr+Gk6T7Sho881M3Q1NF6ypR+B7p4hADuxh
	 WYFe2486zq0/Q==
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
Subject: [GIT PULL 4/4] i.MX defconfig update for 5.15
Date: Sat, 14 Aug 2021 21:38:53 +0800
Message-Id: <20210814133853.9981-4-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210814133853.9981-1-shawnguo@kernel.org>
References: <20210814133853.9981-1-shawnguo@kernel.org>

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.15

for you to fetch changes up to 7fd19c58e48fb774de9190f27f2b06a6526f2d3c:

  ARM: imx_v6_v7_defconfig: enable driver of the LTC3676 PMIC (2021-08-14 13:38:42 +0800)

----------------------------------------------------------------
i.MX defconfig update for 5.15:

- Enable LTC3676 PMIC, SCSI_LOWLEVEL and KPROBES support in
  imx_v6_v7_defconfig.

----------------------------------------------------------------
Fabio Estevam (2):
      ARM: imx_v6_v7_defconfig: Select CONFIG_KPROBES
      ARM: imx_v6_v7_defconfig: Let CONFIG_SCSI_LOWLEVEL be selected

Pascal Zimmermann (1):
      ARM: imx_v6_v7_defconfig: enable driver of the LTC3676 PMIC

 arch/arm/configs/imx_v6_v7_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
