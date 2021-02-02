Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F5A2C433E0
	for <soc@archiver.kernel.org>; Tue,  2 Feb 2021 07:14:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 015BC64EE5; Tue,  2 Feb 2021 07:14:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 476B364D79;
	Tue,  2 Feb 2021 07:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612250089;
	bh=NFNhDtlb8eZNwzo/6X/YBxeINQzVN1WTGm3v6pwchb4=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=ihJrMNcF7P6nw6EJrd945sLSh3prkSTDMYVDFVZBz5PiXJOCcrkKKCoB4p+WBfOm4
	 /ZSHy8SLNhGzh9dWmxXKOTEYyudmyPF6yZNJjvN3z6HVozasHvzORosOh6vbpfahCz
	 4LwDdgynT6FjxNaaqg25cWtsDEvGo8mTNLRORe6ujwYm/3p3lj1156QB+mj6YIQ68p
	 1I6P8IvtdBHXPlP1DltjEMpzuIrfstQ/s8RlJdFrNtrNST+y+fTp9nh5jDGp4C828E
	 Q3T4S7BgA9T8fipEONPwtA456d1F0IG+y36EU+H5iR3MRi5nXCBfTKuNofGR7pTpPA
	 8HV0KQay0IYxQ==
Date: Tue, 2 Feb 2021 15:14:42 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
	Li Yang <leoyang.li@nxp.com>, kernel@pengutronix.de,
	linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX fixes for 5.11, round 3
Message-ID: <20210202071441.GP907@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)

The following changes since commit 82c082784e03a9a9c043345f9bc04bc8254cf6da:

  firmware: imx: select SOC_BUS to fix firmware build (2021-01-18 15:49:07 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.11-3

for you to fetch changes up to aa880c6f3ee6dbd0d5ab02026a514ff8ea0a3328:

  arm64: dts: ls1046a: fix dcfg address range (2021-01-30 21:28:23 +0800)

----------------------------------------------------------------
i.MX fixes for 5.11, round 3:

- Fix DCFG address range on LS1046A SoC.

----------------------------------------------------------------
Zyta Szpak (1):
      arm64: dts: ls1046a: fix dcfg address range

 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
