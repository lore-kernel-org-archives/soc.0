Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24949C2BB48
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 23:50:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9387023B42; Tue,  8 Dec 2020 23:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607471429;
	bh=/YIXqqzwgevgJpoEJdpPI0gt94cYuO3587aNJH4UYNE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=A2KSpfUO8NtY1h9iFC26Uq5QUX/0/uuqGIFWLrEgI3zww/++053A6h/hwaPQL8qIn
	 LIddTvAmGfWOuftI14/1sGW2fRB+wm32ozfmx8RbbuE8VkN5mgzxkCr1jUfGVvX0F3
	 z/6ovBn6SkuLxr2GkDhL0gqszx/Uajg2MbqL5gHCe7ns2VwvEFTV8mGggOWajc/iAy
	 wqoTs4zBL1BB+ydzKKUYZutwNX54i4RX+WA9LUnEIy7C9u2iFbyGlXgw/6WBB+JGzZ
	 m18vvwQII0o00+kDOCAi8cK2A5HmFSKy0l5aKOU0CpiE2CtfkXy5bdosilWBcpAdiO
	 P8CxeL7/Kc24g==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 5.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160747142946.19687.15826947790389697879.git-patchwork-notify@kernel.org>
Date: Tue, 08 Dec 2020 23:50:29 +0000
References: <4582475.GXAFRqVoOG@phil>
In-Reply-To: <4582475.GXAFRqVoOG@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Sun, 06 Dec 2020 19:31:42 +0100 you wrote:
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.11-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 5.11
    https://git.kernel.org/soc/soc/c/456983022454

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


