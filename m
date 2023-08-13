Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C2BBEB64DD
	for <soc@archiver.kernel.org>; Sun, 13 Aug 2023 13:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 464F7C433CA; Sun, 13 Aug 2023 13:34:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4A7C433C7;
	Sun, 13 Aug 2023 13:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691933664;
	bh=BQLC4kPX36ATbvRpkYf1IjQsYk9pRa3yWYsFF7CBqMU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gx0ftSWR4xpTzjwl6MGO9zwpU6xgM/DimRsqxTujyT8GzJzdFKsr/VLbZoUk6iTWU
	 wdqHgiLNa5Ni5cWkZ7KtQIv8M9fLeYu/tFUV3j1+9jToZJbBJ5tmjed8PlNaf1497o
	 Lt4k9RHuEq7TvJ/dCxtQFehmvFv0UuvM0fn2kFhXiNhy8siSbbnGJG2Rw9bncTFLzl
	 x7OD0ax+rLiWMt80JLzKaYNDw74vmj23NwxHQ3U3yEqKfHqu6cXNtWXPdEMNLMTYLb
	 jtoQJmVUpg8Y0sfpOKnhalsNwkB9GIk0rHki5q6XnAOPQCtZRz52YdE3citGz2QDuy
	 g0FFBK/12GwTw==
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
Subject: [GIT PULL 3/6] i.MX dt-bindings update for 6.6
Date: Sun, 13 Aug 2023 21:33:51 +0800
Message-Id: <20230813133354.847010-3-shawnguo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230813133354.847010-1-shawnguo@kernel.org>
References: <20230813133354.847010-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.6

for you to fetch changes up to 8b7b6038059e87485d03f0c853db99042fcf6e97:

  dt-bindings: arm: Add Polyhex DEBIX SOM A based boards (2023-08-11 22:21:49 +0800)

----------------------------------------------------------------
i.MX dt-bindings update for 6.6:

- Add new compatibles for various i.MX based boards: DEBIX, TQMa93xxLA,
  Gateworks i.MX8M, etc.

----------------------------------------------------------------
Marco Felsch (2):
      dt-bindings: arm: fsl: fix DEBIX binding
      dt-bindings: arm: Add Polyhex DEBIX SOM A based boards

Markus Niebel (1):
      dt-bindings: arm: add TQMa93xxLA SOM

Matthias Schiffer (1):
      dt-bindings: arm: fsl: add TQ-Systems LS1021A board

Tim Harvey (4):
      dt-bindings: arm: Add Gateworks i.MX8M Mini GW7905-0x board
      dt-bindings: arm: Add Gateworks i.MX8M Plus gw71xx-2x board
      dt-bindings: arm: Add Gateworks i.MX8M Plus gw72xx-2x board
      dt-bindings: arm: Add Gateworks i.MX8M Plus gw73xx-2x board

 Documentation/devicetree/bindings/arm/fsl.yaml | 49 ++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)
