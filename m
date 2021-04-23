Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04381C43460
	for <soc@archiver.kernel.org>; Fri, 23 Apr 2021 09:30:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B26EC61350; Fri, 23 Apr 2021 09:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9ABB1611CD;
	Fri, 23 Apr 2021 09:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619170208;
	bh=UuiGMYmOsp9Dhck/rPopLDegNtfXkzu8hJ07QEhk8S0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=od0+xUs1EIVFl5Dvpz1eTb+1m/7AJBw6wQbQ7ffAVm4gllqTMgLB1V0OYa5YQS8cQ
	 Cdn4CysXvJgXq9sYfZLpZo5VIQeRI4GgxrXLjJlUDcV55mK+Zy9+fUs/wv9glkqh3z
	 iuZmABrIaZczTLiOFofADNp+v8/BYYSc6aZuCeDJKsbnTK2bljDpqE7Yws0gpzHG+L
	 /kooYnZp8PTaso2IdxyzIeFMykr3gDE/jKZPtSmip72l/ccbeWdvU6n7s59K75h++1
	 C0hBjQB4BWDWsxmXjrvkTa5CoUemg7yleyU0bIdSsL36fEkzaOmColaXg+HahgGAIZ
	 Y1H83qlbt6T7w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9311A60A53;
	Fri, 23 Apr 2021 09:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: aspeed: fix a ternary sign expansion bug
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161917020859.11881.1649913001330046634.git-patchwork-notify@kernel.org>
Date: Fri, 23 Apr 2021 09:30:08 +0000
References: <20210423000919.1249474-1-joel@jms.id.au>
In-Reply-To: <20210423000919.1249474-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Fri, 23 Apr 2021 09:39:19 +0930 you wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
> 
> The intent here was to return negative error codes but it actually
> returns positive values.  The problem is that type promotion with
> ternary operations is quite complicated.
> 
> "ret" is an int.  "copied" is a u32.  And the snoop_file_read() function
> returns long.  What happens is that "ret" is cast to u32 and becomes
> positive then it's cast to long and it's still positive.
> 
> [...]

Here is the summary with links:
  - soc: aspeed: fix a ternary sign expansion bug
    https://git.kernel.org/soc/soc/c/d42805807be7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


