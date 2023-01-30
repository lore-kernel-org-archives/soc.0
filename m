Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F412EC54EED
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 02:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB8BEC4339B; Mon, 30 Jan 2023 02:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C170C4339C;
	Mon, 30 Jan 2023 02:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675046415;
	bh=XEWhy9UHPiXwaGEtx0YMIzKjHj52+QubZbcNnufEiD8=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tLan0wwWr/uP9XbjSAoyktv99zf+fwCQyFR5wVrcgJ2NwS0tZ+imw+LwJrasQbxmz
	 1Ub1qmQCr5+wImvdpsXVEAEda0p34EpY3wtbC1eTeCJToBrdMjoHkhQpBQ80w4gDUK
	 L2VuJyVi3hQ16BYaBRGb2ebxSC4OfpT+QDG/1JQXaSV9/QFd8wfm/4V7ZtgQHjBhII
	 iKgHD42MJq5e5r14GLVYAZdfBoErwTTjtvKjr4+CPU9PaMJwF3v6HUiJPhGPjv8NOY
	 OlNM1noZLStYDxbjPbF9L6obglL83yzjUnTxgrYrpHePSzqGcW78sRQiKuuXKXhVxL
	 i7lpUApiBwPmg==
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
Subject: [GIT PULL 2/6] i.MX SoC update for 6.3
Date: Mon, 30 Jan 2023 10:39:43 +0800
Message-Id: <20230130023947.11780-2-shawnguo@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230130023947.11780-1-shawnguo@kernel.org>
References: <20230130023947.11780-1-shawnguo@kernel.org>

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-6.3

for you to fetch changes up to 7c355b572ecdc17a426cf90511aaa143b293fa8b:

  ARM: imx: mach-imx6ul: add imx6ulz support (2023-01-26 19:25:34 +0800)

----------------------------------------------------------------
i.MX SoC update for 6.3:

- Call ida_simple_remove() to free up ID allocated by ida_simple_get()
  for MMDC driver.
- Add i.MX6ULZ compatible string to match table.

----------------------------------------------------------------
Angus Chen (1):
      ARM: imx: Call ida_simple_remove() for ida_simple_get

Pierluigi Passaro (1):
      ARM: imx: mach-imx6ul: add imx6ulz support

 arch/arm/mach-imx/mach-imx6ul.c |  1 +
 arch/arm/mach-imx/mmdc.c        | 24 ++++++++++++------------
 2 files changed, 13 insertions(+), 12 deletions(-)
