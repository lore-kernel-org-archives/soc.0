Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F4BC43462
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 09:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1C64F610CB; Thu,  1 Apr 2021 09:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0504861057;
	Thu,  1 Apr 2021 09:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617270061;
	bh=hq6UCux43/s9pSE8G9U7KezwOiOvtK+euw81jKV+79o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZTnuhbV4U8oED6VzSs7lo9Acnu+SCI67PJ1zJ1T9V/iBQ3z53Dnag/8jTmPyIOPdv
	 vqNxndF1Nace5tIb0HbfYB1us/Q2H2lEWKwGrNwdfkaHUPSchzE+HcYvNVX5Rha3ty
	 bR1tNiiRfTqTS2QcOtZy9gnDXEcCtu4AOFU3tGmaiurLvOQogQNJi2+8I3uS99Fxo3
	 6W/l8QEeRJ75+2ZSTEIKASnEb1zRlE7QI5N7eunx5hZVqqLe+qstfZj0zKXNdceg4y
	 RXEwv/vBUFQqoq6Z8QMlzk2ANOKiyCFVZzRlcGTXhtTY8nSOF75z5WfDYYTJ1MgrIO
	 pC9zakP/V4JNw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E9971608FE;
	Thu,  1 Apr 2021 09:41:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.12, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161727006095.25375.1217797436694826928.git-patchwork-notify@kernel.org>
Date: Thu, 01 Apr 2021 09:41:00 +0000
References: <20210330090236.GQ22955@dragon>
In-Reply-To: <20210330090236.GQ22955@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Tue, 30 Mar 2021 17:02:37 +0800 you wrote:
> The following changes since commit e4817a1b6b77db538bc0141c3b138f2df803ce87:
> 
>   ARM: dts: imx6ull: fix ubi filesystem mount failed (2021-03-18 12:06:28 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.12-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.12, round 2
    https://git.kernel.org/soc/soc/c/89e21e1ad923

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


