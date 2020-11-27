Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8F1C63798
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 17:10:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CFAF422228; Fri, 27 Nov 2020 17:10:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606497020;
	bh=rlN9gSUp7Gylc6V4lAPTcPzt3djbxGUfDNukjBQssWQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=s+LGaN5h7pmaG6vvhQf6RK3fnbvzbm6WYfqy3dKcSyHlMOl+UFr2W+2R6Ldb8tmTC
	 X4ESb0mlFM1omGsGBG+YndP7Eo9qIWfDdb1mhzBMOhAm7hDEJp9MDm0hqkVXQbybk4
	 SDioyMt+R4YjjLxKpaLQfoGyoA2jV0u/ZFDX7Fjg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fixes for omaps for v5.10-rc cycle
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160649702069.7685.18122315251310373602.git-patchwork-notify@kernel.org>
Date: Fri, 27 Nov 2020 17:10:20 +0000
References: <pull-1606460270-864284@atomide.com>
In-Reply-To: <pull-1606460270-864284@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Fri, 27 Nov 2020 08:58:21 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fixes for omaps for v5.10-rc cycle
    https://git.kernel.org/soc/soc/c/454a079b381a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


