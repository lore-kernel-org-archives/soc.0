Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDBBC433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:15:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6CBF1610E5; Thu,  1 Apr 2021 20:15:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 738A2610FA;
	Thu,  1 Apr 2021 20:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308157;
	bh=ufg/cRdcxShOJD1Q0EVorYKURcUE0VRxI6kHw442nSM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IcBY6Erk+ZN8sNvkx+d1OUGDKLCR5yoSyQnmA4e9UN4qKT6aA1W2YtsXFklccJvsX
	 tKIFk9bgxz5reNedswsX4SZ2MXlXkMniT7oFU4d9oPZhWWjiCAeQK9DdXeFwUMTVUd
	 OUbdoIle5gqwjoYxwa2G15o0NFlFE9YFBqyI4rzD71IYbKGxyu96K3M67BPQSR8nct
	 EKlUDEimkOruUWP4XB9Q9jZuDwAfl9WbLwLpYuZCWGq/kGAKPR+Fqa2i7vdhvP7BSA
	 b6xHSEpsjrHRDzNAv0aBaOb+41nX1m6SR6o3vmokrxFSqEJ5mcCcifZxNc1/KBclk3
	 Yym5gvj6OGfsA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Li Yang <leoyang.li@nxp.com>,
	linux-imx@nxp.com,
	Stefan Agner <stefan@agner.ch>
Subject: Re: [GIT PULL 5/6] i.MX arm64 device tree update for 5.13
Date: Thu,  1 Apr 2021 22:15:25 +0200
Message-Id: <161730808640.655497.12938908556780243539.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331041019.31345-5-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org> <20210331041019.31345-5-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 12:10:18 +0800, Shawn Guo wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.13
> 
> [...]

Merged into arm/dt, thanks!

merge commit: d2adc561c9bfc72468cb50d15080459757ff5f2e

       Arnd
