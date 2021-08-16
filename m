Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C33C4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:34:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D684360FD7; Mon, 16 Aug 2021 21:34:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC27F60F5C;
	Mon, 16 Aug 2021 21:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629149643;
	bh=irFg21km5G6NjoALA2TXJaOOVa6FN620B3pXiw89jSc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bRO6ymDV+m5C5OEQ80YaEW/rrroPEGmdS5yxIfEEy3Jc8Z8PdvS/nIrACiW25IbPr
	 H5NkczuL6SKUhYFzfMVoiIKj9ZxCfOk5Ho4/wM4NuyOWZuXTCLT1wUjDsB/0o7uEA4
	 NCHrQMds5iW/G5Yuuwp97/rtqu9UCknaccytu4xJdKKv2pEM+ITU0qLIZRd6eLwQ6p
	 GadWx1Rn8ScVJVMDy3jKwnKk7J+Zpy4YHrMp9XG+R/PGcWo1Z132AvClx0Xv2JaS3S
	 fIqZiVP2zjRyFO058TqqgcFNu0E2oBjEa+o/d+4gswRPKVxNwvkc+gigJji0eBZOoA
	 1NJWRSN/VG3rQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Li Yang <leoyang.li@nxp.com>,
	Stefan Agner <stefan@agner.ch>,
	linux-imx@nxp.com,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [GIT PULL 4/4] i.MX defconfig update for 5.15
Date: Mon, 16 Aug 2021 23:33:55 +0200
Message-Id: <162914958924.240013.14798086285090389269.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210814133853.9981-4-shawnguo@kernel.org>
References: <20210814133853.9981-1-shawnguo@kernel.org> <20210814133853.9981-4-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 14 Aug 2021 21:38:53 +0800, Shawn Guo wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.15
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 1f69aabe1ac06cd5005352fb9314e7409b712487

       Arnd
