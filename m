Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 395E3C433DB
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 17:22:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0D43423976; Fri, 15 Jan 2021 17:22:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3011238EF;
	Fri, 15 Jan 2021 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610731341;
	bh=LQUALLwkBoNXuhpX3P0C6NQaVxjVhzCX44EHH7FgXVg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sWGUsul4n+NYYQXTDOBB9BZpHnSU7nBJWEYe3aIO9x5DYWmsTE2Uqqf7ywAqKftlQ
	 3jB0GbsUAg7+baP2enHjDNlwEjEpuImnJxgkSwq/2KqtO1oWd/JHMo0o60it6yguvp
	 dsZ6E6cUl189+VrVusKxe0IUB7PG/gpltYpUCq5cSqaxf4Tjh8nsmH8CMZ2NTOAz8b
	 Clx/RTOpx2sNhpneOBfBpUkU2+07hSoXct5Kgj8IBcgIqEkFuLoMiA9CzquVvsuzPJ
	 sh5sJAZbmC8yFG8YBJ3MgQIkZhnReEWoJ2imjWi3d6i9j/JmwEhixBrc+efuLLkCNl
	 mo8f3mNBwTKdg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	linux-arm-kernel@lists.infradead.org,
	Li Yang <leoyang.li@nxp.com>
Subject: Re: [GIT PULL] i.MX fixes for 5.11
Date: Fri, 15 Jan 2021 18:22:09 +0100
Message-Id: <161073123833.625238.16853380161036943595.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112131224.GI28365@dragon>
References: <20210112131224.GI28365@dragon>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 12 Jan 2021 21:12:25 +0800, Shawn Guo wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.11
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 8880bf6de400346600cb334f236cce924558690f

       Arnd
