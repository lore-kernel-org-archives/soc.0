Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93904C48BCF
	for <soc@archiver.kernel.org>; Sun, 13 Jun 2021 08:26:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7A01C61222; Sun, 13 Jun 2021 08:26:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C30AA61248;
	Sun, 13 Jun 2021 08:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623572768;
	bh=u9Jwpx++SXNrZEdO1Oq8f1ITcbNUJUkJdX08YNK19iU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fnqcCvp+9e4U7I+zrSi07JBFuBlvKvZDmE9lL1H61mZCCAklNyH3Iny69islFG3Sn
	 XYQGGYhkdyc+9GyRroPgXv5FCndkBov2+2i6MxwtVCOIi2b6sBcuoUafpz9TFYtspw
	 rOA8OvgXkBZSw/DfB0WtTuA4Q87SdD+PD0EYJU7FIRvDRIVSrWSSEowU4WFbHPuEj/
	 gCzMGsoyJ7G3C1ucCu2CBWkvy6lhlRfMO6eTtNsrNcJq5bLttOzTPUu2aVA+yW8d8A
	 ijdX+CQnB+vlESeXT8RaPz4kSmC7EH0EqBmVAEDkdEgs9Vca3pE9rCC9GoBR2k8XsG
	 Fj1WaQ4+eoKnQ==
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
Subject: [GIT PULL 6/6] i.MX defconfig update for 5.14
Date: Sun, 13 Jun 2021 16:25:44 +0800
Message-Id: <20210613082544.16067-6-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210613082544.16067-1-shawnguo@kernel.org>
References: <20210613082544.16067-1-shawnguo@kernel.org>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.14

for you to fetch changes up to 6252a42b0fd70b03aa17c58d218dcabd863cc02a:

  ARM: imx_v6_v7_defconfig: Select the Wifi ath10k sdio driver (2021-06-12 15:42:40 +0800)

----------------------------------------------------------------
i.MX defconfig update for 5.14:

- Enable LT8912B DRM bridge and Layerscape EDAC driver support in arm64
  defconfig.
- Enable WiFi ath10k SDIO driver in imx_v6_v7_defconfig.

----------------------------------------------------------------
Adrien Grassein (1):
      arm64: defconfig: Enable LT8912B DRM bridge driver

Fabio Estevam (1):
      ARM: imx_v6_v7_defconfig: Select the Wifi ath10k sdio driver

Michael Walle (1):
      arm64: defconfig: enable Layerscape EDAC driver

 arch/arm/configs/imx_v6_v7_defconfig | 2 ++
 arch/arm64/configs/defconfig         | 2 ++
 2 files changed, 4 insertions(+)
