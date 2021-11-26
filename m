Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A966AC433F5
	for <soc@archiver.kernel.org>; Fri, 26 Nov 2021 10:07:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2334B6112F; Fri, 26 Nov 2021 10:07:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E94561038;
	Fri, 26 Nov 2021 10:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637921243;
	bh=aBHSrc6VI6fN7BqZSrw4K4LCEMOZOryNdI2hnjkMiik=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=inT+1HeRevMxZoEEPZ+RvnKJsl7+uXDtKgmJ2h+zA3b1XsZ8RfJnoYbtl+eZiR6Pe
	 RFezUgkRZ9fJpl/TYCaImPKEgxCQY2l8QnqbyjyrOgQCovEFuOdp4i9VPiKlJ75t8G
	 1sMFvroe2IL4aBNDzvJ8Pubmy/rMri7U27jvpQnwiMM7qc9yepf51z0DIem5+5ih8t
	 zfbkiIXw/OTbW4kGA7HXFUpzdQRxkJbShCesQ9I0LX6uCI8K07G5e9qPZk+O0csn6E
	 1gdrEHSdqtFkLenjixmtpb3P9rxAUyeQGNnwaj0Bu3fqheE9Y9O155LJVZQZisNoLn
	 /DKJVI/QU3P2w==
Date: Fri, 26 Nov 2021 18:07:17 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.16
Message-ID: <20211126100716.GF4216@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.16

for you to fetch changes up to c88c5e461939a06ae769a01649d5c6b5a156f883:

  arm64: dts: ten64: remove redundant interrupt declaration for gpio-keys (2021-11-23 20:25:34 +0800)

----------------------------------------------------------------
i.MX fixes for 5.16:

- A series from Vladimir Oltean to update SJA1105 switch RGMII delay for
  a few boards, so that kernel doesn't warn on the legacy bindings.
- Remove redundant interrupt declaration for gpio-keys on board
  ls1088a-ten64, as this causes an IRQ reclaiming error on kernel v5.15
  and later.

----------------------------------------------------------------
Mathew McBride (1):
      arm64: dts: ten64: remove redundant interrupt declaration for gpio-keys

Vladimir Oltean (3):
      ARM: dts: imx6qp-prtwd3: update RGMII delays for sja1105 switch
      ARM: dts: ls1021a-tsn: update RGMII delays for sja1105 switch
      arm64: dts: lx2160abluebox3: update RGMII delays for sja1105 switch

 arch/arm/boot/dts/imx6qp-prtwd3.dts                    | 2 ++
 arch/arm/boot/dts/ls1021a-tsn.dts                      | 2 ++
 arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts    | 2 --
 arch/arm64/boot/dts/freescale/fsl-lx2160a-bluebox3.dts | 4 ++++
 4 files changed, 8 insertions(+), 2 deletions(-)
