Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6126CC48BC2
	for <soc@archiver.kernel.org>; Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 21C5861408; Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 09EE66141C;
	Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622934026;
	bh=XMND57Wyn39eZZ4LgtVP3REJo1vYvNLzQmiKt3HbNho=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ML55+AqU+TZ0IXJx4jb0lgpkhKJI322nqAXhJwgTuPS1A6aslQ1BGEDB1QlyjOr7M
	 +x8fVwJMPRhDbhEn+g9xE6u+htu5AS2RUdlwGxoFairrxxS9dcVrdw3O+GOipuUydt
	 Mq7TZ4fEXuOcOv/PvbkbEsU7rz8y0J6a+XcqEC2KGfjMGNadfRHuNQ7Y0YiLE/lRNQ
	 hRym9bGAozEI+K2t7ykte8yWhEsrkZ2ynvnQOVGXG+qVcH1Re5m+apr2lkhHNcbNJR
	 /+sf4faS9HDwORHgB1P7dY1vgtRCAP5WVrJJosFd3b6cqPaVZhJuAMTGbhxj2ac0bZ
	 kTEg4NrV6XEfw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0224A60A6C;
	Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162293402600.32315.6718398151915673307.git-patchwork-notify@kernel.org>
Date: Sat, 05 Jun 2021 23:00:26 +0000
References: <20210527011758.GD8194@dragon>
In-Reply-To: <20210527011758.GD8194@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Thu, 27 May 2021 09:17:59 +0800 you wrote:
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.13
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.13
    https://git.kernel.org/soc/soc/c/3a2d3ae06787

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


