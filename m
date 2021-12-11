Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD1FC433EF
	for <soc@archiver.kernel.org>; Sat, 11 Dec 2021 02:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2448BC341CA; Sat, 11 Dec 2021 02:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854ACC00446;
	Sat, 11 Dec 2021 02:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639188120;
	bh=NuajzHJsObJv6H+yBDuKKifvecLR8KNLkTVfQUhJ1Lc=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=SxMBG2v8mpHPgMa2YCCs3TAKp6vtJ5/5v6JzAiRkhVhGiSPK03obKAyK6iMSQOlGh
	 U5u78m72dL682lzu5AxrUL0dKoctM4b3E8bjDcfxP/Ue96Bpg5CoptlwbHlCZyX7cS
	 jdLm9Wsmc63ykaK5uEuYCIdGtlGuF9uy3Zmbgt2hAb4rNNcY93tmg0Rw5lLDKOqwtX
	 27DJZRbYJVgZ8FyF6bEgJBC8naHAwamPPjY5aX6wXFYTAuVfggJ4AFWjr2hnI7eYV7
	 x47p2NtN/8UK7WPf7INhSKJlN/RVHv9MkrVY65fDQxcjS1/q+90tQQRr0IQbYcNm4Z
	 YMhrM7L7zfPTg==
Date: Sat, 11 Dec 2021 10:01:54 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.16, round 2
Message-ID: <20211211015625.GK4216@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit c88c5e461939a06ae769a01649d5c6b5a156f883:

  arm64: dts: ten64: remove redundant interrupt declaration for gpio-keys (2021-11-23 20:25:34 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.16-2

for you to fetch changes up to 4ebd29f91629e69da7d57390cdc953772eee03ab:

  soc: imx: Register SoC device only on i.MX boards (2021-12-08 20:30:00 +0800)

----------------------------------------------------------------
i.MX fixes for 5.16, round 2:

- One fix on imx8m-blk-ctrl driver to get i.MX8MM MIPI reset work
  properly
- Fix CSI_DATA07__ESAI_TX0 pad name in i.MX7ULL pin function header
- Remove interconnect property from i.MX8MQ LCDIF device to fix the
  regression that LCDIF driver stops probe, because interconnect
  provider driver (imx-bus) hasn't been fully working.
- Fix soc-imx driver to register SoC device only on i.MX platform.

----------------------------------------------------------------
Adam Ford (1):
      soc: imx: imx8m-blk-ctrl: Fix imx8mm mipi reset

Fabio Estevam (1):
      ARM: dts: imx6ull-pinfunc: Fix CSI_DATA07__ESAI_TX0 pad name

Martin Kepplinger (1):
      arm64: dts: imx8mq: remove interconnect property from lcdif

Stephan Gerhold (1):
      soc: imx: Register SoC device only on i.MX boards

 arch/arm/boot/dts/imx6ull-pinfunc.h       |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi |  2 --
 drivers/soc/imx/imx8m-blk-ctrl.c          | 19 +++++++++++++++++++
 drivers/soc/imx/soc-imx.c                 |  4 ++++
 4 files changed, 24 insertions(+), 3 deletions(-)
