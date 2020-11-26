Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5EE0C64E75
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 21:20:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 38734221FA; Thu, 26 Nov 2020 21:20:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606425639;
	bh=5IODnuDwI2R3bvsCssWAQ0xNHy0nrlDwo2xqW91q/Yc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Stxg0ezqC+TGDACR6cOTC8tE1m30nN2PgvpQeW3EfPn6m9ztlz57458b9B2fo/uW+
	 iQ2YYf36/UfVaROAHXIlkIxBIMM4TkMf/JxAuhuzHgglu++2CrSnhMbHbJjjrQ2lCL
	 9sw3gnZolu9+l0ddwgBxqr6Uw++zNq1alxyjvv+A=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: tegra: Device tree fixes for v5.10-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160642563906.13931.16161448778020636675.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2020 21:20:39 +0000
References: <20201125170306.1095734-1-thierry.reding@gmail.com>
In-Reply-To: <20201125170306.1095734-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 25 Nov 2020 18:03:06 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: tegra: Device tree fixes for v5.10-rc6
    https://git.kernel.org/soc/soc/c/06ceddef30a5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


