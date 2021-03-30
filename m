Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8D3C433DB
	for <soc@archiver.kernel.org>; Tue, 30 Mar 2021 09:02:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9D26E61989; Tue, 30 Mar 2021 09:02:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F105061959;
	Tue, 30 Mar 2021 09:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617094962;
	bh=hFfoYeoBQFX/shr1P1K4yAz0eDeOmXZxekXBwhAUJAQ=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=FQYzKZ4xnQagchQoOtkKUM1617vJK8SUXVaaM/nVeCnCe03QRW0R3TMgdMQ53n0Kb
	 hKooO04IczNIR/mOgWB/fcvYuyC0/fduGn7g2JFUa3XV/N18CRpn5RUbki3CFwszpe
	 gP0MOyHTlg4kCKn0j9CdNnjoN+fMqv2xZkgS0P2gXqp+EdHKoy4fRwFJSL+9ODlPvF
	 M1OSSyt4mCW1n7DnzXi+mhrWiwMvhq2slHXNwHfxLscTnHlKB8zdXTwznQR2UIbu6m
	 MI5XWwJWIInScpWt5s0u86KKDYQ/amPR5ytX7gk5sTG6N7YN5uvBW71a35XRGJaPw7
	 VFyn00BEfUWwg==
Date: Tue, 30 Mar 2021 17:02:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.12, round 2
Message-ID: <20210330090236.GQ22955@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit e4817a1b6b77db538bc0141c3b138f2df803ce87:

  ARM: dts: imx6ull: fix ubi filesystem mount failed (2021-03-18 12:06:28 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.12-2

for you to fetch changes up to f57011e72f5fe0421ec7a812beb1b57bdf4bb47f:

  ARM: dts: imx6: pbab01: Set vmmc supply for both SD interfaces (2021-03-30 16:35:28 +0800)

----------------------------------------------------------------
i.MX fixes for 5.12, round 2:

- Fix a system failure on imx6qdl-phytec-pfla02 board when booting from
  SD, by adding missing vmmc supply for SD interfaces.
- Fix address typo in i.MX8MM/Q IOMUXC_SD1_DATA0_GPIO2_IO2 definition.

----------------------------------------------------------------
Oliver Stäbler (1):
      arm64: dts: imx8mm/q: Fix pad control of SD1_DATA0

Stefan Riedmueller (1):
      ARM: dts: imx6: pbab01: Set vmmc supply for both SD interfaces

 arch/arm/boot/dts/imx6qdl-phytec-pfla02.dtsi   | 2 ++
 arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-pinfunc.h | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)
