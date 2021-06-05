Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75A25C48BCD
	for <soc@archiver.kernel.org>; Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 19E8861422; Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 011AC6141E;
	Sat,  5 Jun 2021 23:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622934026;
	bh=WVnFHRJx165zhuGsbn14QJa62wdJux2es2CMRUtLo8M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=D1/A9mIWzrGNB80o6+1liq9ekgZTRFy8+EypouqIbI4FUfTj6voi9GFrbvpPhCYTl
	 Xci7wvnhLVnxUwkg0EC9gf4IyRmj2mJAQwiSFjJHW+l8Plw+/8Md2Uh1TrdCOw7mQV
	 Lb3X6hMbJr3Gj5hHWxqFAaf6baek+B7mfdK+G40zNMYzjnglMVsmZxCKor3EPexkCk
	 d+nIzdL4IdAJpvv6+LqeImck+y22s1257Y/NOSM2z4hW4+gwvvSlNihFg94DACq2lf
	 2LFLODT9nSgY4NgYxkEYtT6UhwLrJ+rAElOY4rs35lcEpk1zyRDAw/3ZXq53qz98K4
	 L7j1xpcDMkWPA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id ED1BE609F7;
	Sat,  5 Jun 2021 23:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SATA regresion fix for TI dra7 for v5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162293402596.32315.16551334366819130046.git-patchwork-notify@kernel.org>
Date: Sat, 05 Jun 2021 23:00:25 +0000
References: <pull-1622613578-121536@atomide.com>
In-Reply-To: <pull-1622613578-121536@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Wed,  2 Jun 2021 09:00:05 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit d995d3d025bbd2d89abf12418f20d19bc0cb0130:
> 
>   bus: ti-sysc: Use kzalloc for allocating only one thing (2021-03-24 13:44:04 +0200)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SATA regresion fix for TI dra7 for v5.13
    https://git.kernel.org/soc/soc/c/94277cb5b4db

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


