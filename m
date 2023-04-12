Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C25FC77B70
	for <soc@archiver.kernel.org>; Wed, 12 Apr 2023 01:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D360AC4339B; Wed, 12 Apr 2023 01:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72436C433EF;
	Wed, 12 Apr 2023 01:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681263978;
	bh=xmbGKQh1VgudkbRC0ysWkE4tRNo6S8GXdt5Y3+dZi/U=;
	h=Date:From:List-Id:To:Cc:Subject:References:In-Reply-To:From;
	b=qdo70GXYqs5A+ZEeOf5MsWaRPcjYerGPed0wTnB2J+19Hq9m8ABpXABbOmFmxelfu
	 xFfsQgeiQvE4bZmgkE00KKkhWuwkUjJpKPY12MseVhPE8MC8bX8ecP4PLvrXodrpVr
	 1AwcB4Ws2L8UQz9fYCZ2d32HQj1qUN1XL2HzjQ6K1Axnz9tSyjs97E1eYHUvuouieZ
	 kodeH3VVc3dMn0OZTtAB5qMUsuHfHdXZWuXtldazEzjbcTwFbrqw9CJ8TFNWPp+6Ae
	 WpccjuvuGtSEgXziMzPtqTD3DN8LE9dIgXCLwUL6lSROi/B5njiwUGK9j6NSshN60V
	 hbNGE5UqTPAcQ==
Date: Wed, 12 Apr 2023 09:46:07 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 3/6] i.MX dt-bindings update for 6.4
Message-ID: <20230412014607.GC129227@dragon>
References: <20230408101928.280271-1-shawnguo@kernel.org>
 <20230408101928.280271-3-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230408101928.280271-3-shawnguo@kernel.org>

On Sat, Apr 08, 2023 at 06:19:25PM +0800, Shawn Guo wrote:
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.4
> 
> for you to fetch changes up to 1c2eb76b9456130c377372727744e9a109abf5e1:
> 
>   dt-bindings: arm: Add Data Modul i.MX8M Plus eDM SBC (2023-04-08 15:25:41 +0800)

It gets updated to add missing SoB to one commit.  Nothing else changed.

Shawn


The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-6.4

for you to fetch changes up to e7a985d50841e43ea1794b3597fd7f646ed95a32:

  dt-bindings: arm: Add Data Modul i.MX8M Plus eDM SBC (2023-04-12 09:32:39 +0800)

----------------------------------------------------------------
i.MX dt-bindings update for 6.4:

- Add vendor prefix for chargebyte.
- A bunch of new board compatibles: Tolino Vision, Toradex Apalis,
  chargebyte Tarragon, i.MX8M Plus based boards from DH electronics
  and Data Modul, etc.
- A series from Marek Vasut to improve blk-ctrl bindings.

----------------------------------------------------------------
Andreas Kemnade (1):
      dt-bindings: arm: fsl: add compatible string for Tolino Vision

Marcel Ziswiler (1):
      dt-bindings: arm: fsl: add toradex,apalis-imx8 et al.

Marek Vasut (6):
      dt-bindings: soc: imx8mp-media-blk-ctrl: Align block controller example name
      dt-bindings: soc: imx8mp-media-blk-ctrl: Add LDB subnode into schema and example
      dt-bindings: arm: Add DH electronics i.MX8M Plus DHCOM on PDK3
      dt-bindings: soc: imx8m-blk-ctrl: Rename blk_ctrl to blk-ctrl in examples
      dt-bindings: soc: imx-blk-ctrl: Drop leading label in blk-ctrl in examples
      dt-bindings: arm: Add Data Modul i.MX8M Plus eDM SBC

Michal Vokáč (2):
      dt-bindings: arm: fsl: Fix copy-paste error in comment
      dt-bindings: arm: fsl: Add Y Soft IOTA Phoenix, Lynx, Pegasus and Pegasus+

Philippe Schenker (1):
      dt-bindings: arm: fsl: Add colibri-imx8x carrier boards

Stefan Wahren (2):
      dt-bindings: vendor-prefixes: add chargebyte
      dt-bindings: arm: fsl: Add chargebyte Tarragon

 Documentation/devicetree/bindings/arm/fsl.yaml     | 45 ++++++++++++++++--
 .../bindings/soc/imx/fsl,imx8mm-disp-blk-ctrl.yaml |  2 +-
 .../bindings/soc/imx/fsl,imx8mm-vpu-blk-ctrl.yaml  |  2 +-
 .../bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml |  2 +-
 .../bindings/soc/imx/fsl,imx8mp-hsio-blk-ctrl.yaml |  2 +-
 .../soc/imx/fsl,imx8mp-media-blk-ctrl.yaml         | 53 +++++++++++++++++++++-
 .../bindings/soc/imx/fsl,imx8mq-vpu-blk-ctrl.yaml  |  2 +-
 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml |  2 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 9 files changed, 102 insertions(+), 10 deletions(-)
