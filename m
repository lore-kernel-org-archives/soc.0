Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97301C4743D
	for <soc@archiver.kernel.org>; Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3625C6140F; Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1A65061408;
	Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1622933885;
	bh=paC59S5Oxf3nysuBQH9aW8LLXBhrocaHK5LKUFPKa+A=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lHpt1pnad7y/4IHGICpIjCV6Eemyuy5P6aryoCWSeDgTnNqWSaaATKlBpo7UOJbOv
	 /o1AhV1KrCXiodmvxiecESDBeZLcATlKROsZv3/z1dNdV9Hkex9zpcQ/p/cTfXe8ck
	 FT4LM/xcGYh9gdmjF8VN/qRisJkh/4U3XUb+P3In4uLPBf3wjc1sjLq5FpoUG0Ajsw
	 xRPxzs9DNJtUiZU0P2hnFz05NHVn9AsYAauS/tDdF72xV3Ez7JSLwEmvarN0hcNrxj
	 gdbGUNQwlgQKDOJEG3bkCM9R5QfxhZcD4/LInBIOHnKcmsFQuBSiU7gTV+o5oEds/S
	 iR8z/m2t3esyg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 11347609EF;
	Sat,  5 Jun 2021 22:58:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] PM and build warning fixes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162293388506.32315.3916354480762426592.git-patchwork-notify@kernel.org>
Date: Sat, 05 Jun 2021 22:58:05 +0000
References: <pull-1622614772-543196@atomide.com>
In-Reply-To: <pull-1622614772-543196@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed,  2 Jun 2021 09:20:17 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
>   Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] PM and build warning fixes for omaps
    https://git.kernel.org/soc/soc/c/2f3e4eb17973

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


