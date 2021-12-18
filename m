Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1AFC433EF
	for <soc@archiver.kernel.org>; Sat, 18 Dec 2021 05:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A47A4C36AE9; Sat, 18 Dec 2021 05:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F6EC36AE1;
	Sat, 18 Dec 2021 05:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639804810;
	bh=4zeFdEp6rDolz8D8qkefK0QRT0Fq6WeSSAEdSIeV6T4=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=Hs98sEK5iMDGtC3nJxGsmfEqgsEHIf7Squ++gagGdyvrKSeWOni5kMnGTMwmNtWuu
	 ZMRNhHdQgT6h5IE16JLhhN7sb1hJbvM+eN29aVL6t4UezLyzeXMsjV5l46crlmmln6
	 v+J4yB/E7eOWlGrvSjp39C9cXqNtrxgUVNpBN51Dnp/VuoIu3MUVCMju4im8bRHjDa
	 NHfxn+VuMZcPHOVlW2iyBIzbZ/Bazdtd455Hhm4iOFDPE3jSqhB/YwRZl0NgaDJLuX
	 5lvErvSdzuJ95zuZWtwvlQR1rnMh8xWCV3mKnAdBjy6Ui9Hko/ed0YS/uN/igSKwaI
	 DZiA/MlmmQv8Q==
Date: Sat, 18 Dec 2021 13:20:04 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.16, round 3
Message-ID: <20211218052003.GA25102@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit 4ebd29f91629e69da7d57390cdc953772eee03ab:

  soc: imx: Register SoC device only on i.MX boards (2021-12-08 20:30:00 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.16-3

for you to fetch changes up to 849e087ba68ac6956c11016ce34f9f10a09a4186:

  arm64: dts: lx2160a: fix scl-gpios property name (2021-12-16 17:24:41 +0800)

----------------------------------------------------------------
i.MX fixes for 5.16, round 3:

- Fix imx6qdl-wandboard Ethernet support by adding 'qca,clk-out-frequency'
  property.
- Fix scl-gpios property typo in LX2160A device tree.

----------------------------------------------------------------
Martin Haaﬂ (1):
      ARM: dts: imx6qdl-wandboard: Fix Ethernet support

Zhang Ying-22455 (1):
      arm64: dts: lx2160a: fix scl-gpios property name

 arch/arm/boot/dts/imx6qdl-wandboard.dtsi       | 1 +
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)
