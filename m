Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75AA5C43470
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 09:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 297776108B; Thu,  1 Apr 2021 09:41:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1291B610CA;
	Thu,  1 Apr 2021 09:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617270061;
	bh=fzow2zU5CePp8QoPtcU8SvZCHyrIK2/WzhGJD3hOq28=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TdBep4tjfBy1DHDx6yRXkhwZpVYTWxzlwZUtVMhRE3M/lQrbKcuatE1l1Pj6pfD3m
	 pA3kM5Xg7llFpq0X7K9cERG0yT7Hfy4wnPQK4sZy4JRuazdc/NaXNxGt51s9vOldjk
	 tDnMdTavPj2GMIsMMijPq6YZjIC+f6GOyHRjEgtt5ylAFQJsItFs4wSSW1Cs09C9Yy
	 fAwIry3kGKZsAvzTnfSGDdcOEVGxZ3YYQESry1VGsLQccd76It5HNtg+BVco8aB36C
	 4UDFF++xCm5rphQNzqT3RL3bO6cJD0DbOfn/gLtwV9KQ4xRGr8f7JWXWFQyqh4XwhV
	 KF2tzSgbhZWlw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 09A17609D3;
	Thu,  1 Apr 2021 09:41:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161727006103.25375.14303946264661065759.git-patchwork-notify@kernel.org>
Date: Thu, 01 Apr 2021 09:41:01 +0000
References: <CAK8P3a2BTOzDfmH3dHmwm6LYPefFAnGCMPdQOpUbXOukiT0rVw@mail.gmail.com>
In-Reply-To: <CAK8P3a2BTOzDfmH3dHmwm6LYPefFAnGCMPdQOpUbXOukiT0rVw@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Fri, 26 Mar 2021 17:02:57 +0100 you wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: SoC fixes for v5.12
    https://git.kernel.org/soc/soc/c/eb3991ef2c0e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


