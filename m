Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ABCFC433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:19:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 31ED464E70; Tue,  9 Feb 2021 23:19:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FE4C64E30;
	Tue,  9 Feb 2021 23:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612912782;
	bh=EsCYx4e6aSbp9Bwrp1F5WRMx2a9KgKO5uK+Y66H2i5M=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pTy6uzqVoHFIPTwej+ov1lLD1lZty8/RSR+zwK4RY5w7j6KjtDYJkbXl6uxzSYBWr
	 u9Tyf0AOZB3J1LAWBebKEf2JlSubQPRetba5krpyYVSl9GExIVKKtkCcl6Rl/GiwwS
	 NsO5N0sID4t/7PaNSQbo/BBFwNRPqgZqf3gF3OAjKtYtmHBThsbd1Yv9p5rVF+dDvW
	 KvOP+3t/i/R90dgi8++1Qfap6AfLa5FPztor5PzkA9jvabtOkuI/dkfVcL9SeCHAC3
	 x+Ec0Z956OrqvrYj3avYt62GRjuSy623gBXTwr92jYKbh238hZgk7KCS/PpH8bSj0B
	 DU/fmW0eUnA5A==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-imx@nxp.com,
	Stefan Agner <stefan@agner.ch>,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	Li Yang <leoyang.li@nxp.com>
Subject: Re: [GIT PULL 1/6] i.MX drivers change for 5.12
Date: Wed, 10 Feb 2021 00:19:10 +0100
Message-Id: <161291272322.978640.8692820949134074215.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204120150.26186-1-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 4 Feb 2021 20:01:45 +0800, Shawn Guo wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.12
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 168b322e36c5f8903f31d89f34355004920b5e00

       Arnd
