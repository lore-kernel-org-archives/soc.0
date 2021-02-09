Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABFDC433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:06:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BAF1D64E53; Tue,  9 Feb 2021 23:06:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDEB764E5B;
	Tue,  9 Feb 2021 23:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612912005;
	bh=Lm9mD4TDfrKP1FuvKDuBqUCGzT+XEF3aP3SSUIiU0KY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VDKRJ2sY8nWqMnz2TQkom7CPgr6y2frh/3ZScMz2zjEvDUPtfM99P+O/wF3CdKHzs
	 rITHFTxCLbnBo8utWwyj8fP0DQfOXWZLR8HptxMllYjp3AB9VKneoIxxNHm4u9HnQ7
	 4oubjlff2/NbGfae3JggSBT6xDnKAWaUvF/7FTC7t1nF6chCsHxKLDSqAcQrddSAU4
	 1sZuuYBJj/O01fXEN8rzDsMq3FIfzp6rXm+5rkZLpJkCRyPx15dO+bXhBou+m1lz8A
	 ceo7vK69do19cHlltuBA9LEcyOWitZyP5qUv2wWB2lJeXkpeQn7+jdp/WxI/XtYnic
	 hKPxfyK80N8PQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stefan Agner <stefan@agner.ch>,
	linux-imx@nxp.com,
	Li Yang <leoyang.li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 4/6] i.MX device tree change for 5.12
Date: Wed, 10 Feb 2021 00:06:13 +0100
Message-Id: <161291108085.974605.6481239956002704956.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204120150.26186-4-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org> <20210204120150.26186-4-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 4 Feb 2021 20:01:48 +0800, Shawn Guo wrote:
> Tag imx-fixes-5.11-2 is merged into the branch to resolve some
> dependency around imx6-sr-som board support.
> 
> Shawn
> 
> 
> The following changes since commit 82c082784e03a9a9c043345f9bc04bc8254cf6da:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 48a60549d207c0e5691b88cd91305a7c0521cef5

       Arnd
