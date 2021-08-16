Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BB7C432BE
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 21:21:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B802460F58; Mon, 16 Aug 2021 21:21:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B887C60E97;
	Mon, 16 Aug 2021 21:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629148864;
	bh=Vf5zjb4Z1qIlo36eCK7cNzo8Q3QPU2Z5sOLdOAQnjsI=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QtyknsGc1Rl4r8+b6N2pzG33gCMLu+kw+Q/A3fBCJ3shyo5dMZHiU2UqO1Q+WBVVw
	 FOO7YTsxQm7qWSsakM9AUin18GkNQb79k3HSrNXaCYhAE3D0dz+m6d89b3UuJj2OvX
	 9zT/Bmo1nUZec98Fw5GVK4LJtfAbwdTswIfl1lZt8HiVVxqO2raJbZ3U0iCGNb0AXB
	 DAJVUBZgLegueN0rhq1leHT8ULyhv5u5S9MbBTvyImJ7QdB9kj6rN3NlkZ4TsqrWA4
	 4dull0L/VjQYH7B4PKUEXbAtCCQgA3qLGQEuDqOnDAOs/9FHeYBiR7WCfM4EYD33ZS
	 9OMNY9sOMbBFw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Stefan Agner <stefan@agner.ch>,
	kernel@pengutronix.de,
	Li Yang <leoyang.li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	linux-imx@nxp.com
Subject: Re: [GIT PULL 3/4] i.MX arm64 device tree changes for 5.15
Date: Mon, 16 Aug 2021 23:20:51 +0200
Message-Id: <162914852275.237905.12467380733542319999.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210814133853.9981-3-shawnguo@kernel.org>
References: <20210814133853.9981-1-shawnguo@kernel.org> <20210814133853.9981-3-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 14 Aug 2021 21:38:52 +0800, Shawn Guo wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.15
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 6d640913126db109f2e3389173f0fe42413a8183

       Arnd
