Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45ECBC48BDF
	for <soc@archiver.kernel.org>; Sun, 13 Jun 2021 08:26:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1A3D561279; Sun, 13 Jun 2021 08:26:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5FE706124B;
	Sun, 13 Jun 2021 08:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623572762;
	bh=jJ0NwJa/BMrRk20HsOC+mQpr9w+f7M7WNwTEQd0hEek=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ge4XTfj7FV3Xj7+KnWfY1lOqI+LdNBZwdDdH9bRtUBxR35CECfolhCK0GQm/yq9IO
	 bbUtFUutObOfez7wvNUWw2FvnAkCMOTSGXWOaxP+/EJ1WlXy+YixmCz5g/Sc8PhqdO
	 ZbQi17HOOdeR30IG7tv9VWl/QwkKqFpy68kY6Kou8Soqj0924riIXpVhZ0eDGrD9GT
	 z/v6iG9vWDuemoKUWAGUQiSLP7HrF4QE6D+XaLQ16fAufGlsBp37X9OdyvZeTuH1Qg
	 1MQ7vGFMKeYcjsJGwKmJ2Lx11hZ2N4G66h6zbDAeBtL6dsXI2aybDZ6/BnsqTJb9KS
	 XGb5nF4p4knlQ==
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
Subject: [GIT PULL 3/6] i.MX dt-bindings update for 5.14
Date: Sun, 13 Jun 2021 16:25:41 +0800
Message-Id: <20210613082544.16067-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210613082544.16067-1-shawnguo@kernel.org>
References: <20210613082544.16067-1-shawnguo@kernel.org>

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.14

for you to fetch changes up to cd044eafd7105275220f6b7140a8a8fb64e0e5af:

  dt-bindings: arm: fsl: add GE B1x5pv2 boards (2021-06-12 17:57:52 +0800)

----------------------------------------------------------------
i.MX dt-bindings update for 5.14:

- Add vendor prefixes for congatec GmbH and DaSheng, Inc.
- Add compatibles for i.MX6Q DaSheng COM-9XX SBC, GE B1x5pv2 and
  i.MX8MM GW7901 boards.
- Add an optional 'resets' property for i.MX GPCv2 bindings.

----------------------------------------------------------------
Dillon Min (2):
      dt-bindings: add dasheng vendor prefix
      dt-bindings: arm: imx: Add i.mx6q DaSheng COM-9XX SBC

Lucas Stach (1):
      dt-bindings: imx: gpcv2: add support for optional resets

Sebastian Reichel (2):
      dt-bindings: vendor-prefixes: add congatec
      dt-bindings: arm: fsl: add GE B1x5pv2 boards

Tim Harvey (1):
      dt-bindings: arm: imx: add imx8mm gw7901 support

 Documentation/devicetree/bindings/arm/fsl.yaml             | 13 +++++++++++++
 Documentation/devicetree/bindings/power/fsl,imx-gpcv2.yaml | 10 ++++++++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml     |  4 ++++
 3 files changed, 27 insertions(+)
