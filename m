Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99744C433DB
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:11:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 565CA64E66; Tue,  9 Feb 2021 23:11:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5BA6064E57;
	Tue,  9 Feb 2021 23:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612912270;
	bh=gLU2jNlNcUYMN4jGfWiNdv5YcwiMg6/2TKOQ+C43uyg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n1GwKzpGMiNJrXAKyzLG1nyFeowX53youFYYCD81yvrr2o3ZNLo4Qena8/zgsDqGX
	 qzOnBCPpAQaM5dHmj+nyw2uEoGUKS1eVxi6owXQdLB6J8gOYKUY56+ipTVLfMlhdyt
	 WQ8GIrnlXer8jyWTSt4tBsolt9Csn7uNUSPhXuPdmqCQtjau4frtmE1AXnlvxK1Kjj
	 xEdBKR3QIAwmTZsaY3CTyPTM0uCC42SR+XLOi6nMBEqaRm7/Gs7kE7s+i//mX5rBdN
	 lA6tjk4Edf3/n8mlxm0YEaPWkswUMgcfR8Q2fPJZIb/1Hpe+cUDfNb4iTqZk9wNQ16
	 mSj8j3PZESzhA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Li Yang <leoyang.li@nxp.com>,
	Stefan Agner <stefan@agner.ch>,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	linux-imx@nxp.com
Subject: Re: [GIT PULL 2/6] i.MX SoC update for 5.12
Date: Wed, 10 Feb 2021 00:10:57 +0100
Message-Id: <161291223664.977272.11882603697435649662.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204120150.26186-2-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org> <20210204120150.26186-2-shawnguo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 4 Feb 2021 20:01:46 +0800, Shawn Guo wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-5.12
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 82e754b1ba6502bc627c2fdf04c3bc6383aefbec

       Arnd
