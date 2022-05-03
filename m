Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8369C433F5
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 12:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E63CC385B2; Tue,  3 May 2022 12:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77C02C385AE;
	Tue,  3 May 2022 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651581046;
	bh=//bHivZn50W7ZuxUzIP5ZHB+BymGDm75pKsYNZJYUw4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fUnk//OIi+Q6Ws590S+X8Dkr+GjJ9vYSVy6b7jgXKNRLAwGRwzlIQwtDvO1EnDJ3u
	 zdtoLT1xWZNNs83sLjcmPwUHwEAS3LDfk3bd+w/kgKIhtMKWc+ceoTEKm0XrSXNy9/
	 0hJCKd6Yqd3etJExv/h+FPiyQQwCN2Nurv27G86yHyEQM8o8S9I9RYEunoXTTOl3UZ
	 UFbPq4OxJaEniw4oHjuxIA+u+a7gTJR/Zo2cTGW9PA68urye3eliLTncPAby/hNdD8
	 hmuUSo/pUIBKPu85smcSzwHbjI6uj3m6B2yIf8fXUbmgrKSXa2EeWkVzMJX9im1jYi
	 SQPui+W1bvJWw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 57F2BE6D402;
	Tue,  3 May 2022 12:30:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.18, part 3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165158104635.10934.12437176524012649029.git-patchwork-notify@kernel.org>
Date: Tue, 03 May 2022 12:30:46 +0000
References: <CAK8P3a2fFzrMJJZqiN7B1HnwKcCgPzbobvBZzs2_L19pkM+tYw@mail.gmail.com>
In-Reply-To: <CAK8P3a2fFzrMJJZqiN7B1HnwKcCgPzbobvBZzs2_L19pkM+tYw@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 29 Apr 2022 23:19:54 +0200 you wrote:
> The following changes since commit 24a4351e1c04de8e580bf06cae7f3a79094fe7f0:
> 
>   ARM: config: Update Gemini defconfig (2022-04-14 22:59:24 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> tags/soc-fixes-5.18-3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: SoC fixes for 5.18, part 3
    https://git.kernel.org/soc/soc/c/8013d1d3d2e3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


