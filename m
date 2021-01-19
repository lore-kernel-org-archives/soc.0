Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4245C433DB
	for <soc@archiver.kernel.org>; Tue, 19 Jan 2021 09:19:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7210C20867; Tue, 19 Jan 2021 09:19:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B18EE221E5;
	Tue, 19 Jan 2021 09:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611047995;
	bh=O/5kQqcq4qRB+UaQtUNJmlRDcDNK+ncxctN2+NVYmok=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=k3LSqnp2BpKV3TF/m+aUdnRfQPj9w8PXBjVejBP2FNKKBHV6MjLmIeBLssmC9EXlk
	 1Q8BWgVr+oIOqrbDw30dtvAUa//YXabyO2MlErxjPNcKPsJlNOe42D92KOppq5cXgZ
	 t38HnPle91IryaqRoBsHb1f+a8Pu/dGV/UuEa+rGRuw3M9Vygx+1C3/ZoqJHvQaQ7t
	 M1Io0ukPd26XuLhgHIJ0G83Jh6tuflDeOkta+atih6+zbUHVjFZUDUWxESeNNzn6VI
	 NU2ajPJMx5UzQiuPPpfBHIrsPy3iBTwSs+558wE9dkOe756WKhrtRP3aaBYfXEuDh+
	 qV83Dlrl8QiNg==
Date: Tue, 19 Jan 2021 17:19:49 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.11, round 2
Message-ID: <20210119091949.GD4356@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit 5a22747b76ca2384057d8e783265404439d31d7f:

  ARM: dts: imx6qdl-gw52xx: fix duplicate regulator naming (2021-01-11 11:41:17 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.11-2

for you to fetch changes up to 82c082784e03a9a9c043345f9bc04bc8254cf6da:

  firmware: imx: select SOC_BUS to fix firmware build (2021-01-18 15:49:07 +0800)

----------------------------------------------------------------
i.MX fixes for 5.11, round 2:

- Fix pcf2127 reset for imx7d-flex-concentrator board.
- Fix i.MX6 suspend with Thumb-2 kernel.
- Fix ethernet-phy address issue on imx6qdl-sr-som board.
- Fix GPIO3 `gpio-ranges` on i.MX8MP.
- Select SOC_BUS for IMX_SCU driver to fix build issue.

----------------------------------------------------------------
Bruno Thomsen (1):
      ARM: dts: imx7d-flex-concentrator: fix pcf2127 reset

Jacky Bai (1):
      arm64: dts: imx8mp: Correct the gpio ranges of gpio3

Max Krummenacher (1):
      ARM: imx: build suspend-imx6.S with arm instruction set

Randy Dunlap (1):
      firmware: imx: select SOC_BUS to fix firmware build

Russell King (1):
      ARM: dts: imx6qdl-sr-som: fix some cubox-i platforms

 arch/arm/boot/dts/imx6qdl-sr-som.dtsi         | 12 ++++++++++--
 arch/arm/boot/dts/imx7d-flex-concentrator.dts |  1 +
 arch/arm/mach-imx/suspend-imx6.S              |  1 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  2 +-
 drivers/firmware/imx/Kconfig                  |  1 +
 5 files changed, 14 insertions(+), 3 deletions(-)
