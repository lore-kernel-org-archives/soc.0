Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 960A4C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 21:07:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 714BD6112D; Thu,  1 Apr 2021 21:07:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7644E61108;
	Thu,  1 Apr 2021 21:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617311235;
	bh=6453ln+PWqcrJ98JQvBIu9jIGZoVpnsbf/f/L7AgyMM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KG1htfkrBDEI4My2o/ecc0MN65re5loVpfzcXgfqozMgUe1SdyLwI01PkdVaYr96J
	 bNskXkJ+GNkVHbRsCNqZ7BBXQzYVhiEcLh35W3spLwx4WLz9ukHBzWR5mTSt5SBF1m
	 Ah/QE+JHdRvrcwhTNXdpJGSyGfhH+ZLVgtaa9l/csRimc/kLL67/pycDC0nbJyb1Kd
	 VlHhyr7mE52SHWAWANnGtFYRATldjhLqUxT5Nnpvq+3IEhqMg0z4rfDDKDM6djseu3
	 q2jdwnIN+0fat0Y9zi4YjtoJtUUIv/l3llDyuFQ0XoXiB0D2AuIw0V0bxMee/VPn+Y
	 Ohq1mr/GHDwQg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Stefan Agner <stefan@agner.ch>,
	kernel@pengutronix.de,
	Li Yang <leoyang.li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [GIT PULL 2/6] i.MX SoC update for 5.13
Date: Thu,  1 Apr 2021 23:07:05 +0200
Message-Id: <161731121864.663132.16506818644518053696.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331041019.31345-2-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org> <20210331041019.31345-2-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 12:10:15 +0800, Shawn Guo wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-5.13
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 4f9c62d1f79c42674e8ba0c4592a438c21fcbf23

       Arnd
