Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B2BC433EF
	for <soc@archiver.kernel.org>; Mon,  4 Apr 2022 13:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9020EC2BBE4; Mon,  4 Apr 2022 13:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A69EC340F2;
	Mon,  4 Apr 2022 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649077547;
	bh=Y9T7QXFDFeNpXAPn4qXQx3lvQSnzZqoUYpAwtky/kq4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=SVLHO2vbkns/24ijBXYMzBgNivGVz4c/sXjVNAIUhIiSbQd10lqXPapvrV6kdKfwI
	 bfGs78EiCvLEI3KSPfGpqAccUgVbAF8SOStT80993dhTlupX94FtLShfEvKORYRzwE
	 O9UosoO4EzWuBMrIcyhwbNOYQv+XWjR2Q3yk/bQ0CvpwS/Q6FMlAFtX9ydSZITEpb7
	 gPA1zIrvwfbnj1/EcmyY8zIDGRXvmy2jO31+SCmLdnWtCeEvJsUUD8Yc/HPLey6I+w
	 Y1JV/osQz2RHf3exSH9mJAA5o0rf6yoNDTxbH1BUFWAxYBJgCNEBkc11iNpu0GNTk0
	 ViAdfpJDhb/xg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5AA98E85D15;
	Mon,  4 Apr 2022 13:05:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/4] ARM: SoC tree changes for 5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164907754736.14449.6819635642624250498.git-patchwork-notify@kernel.org>
Date: Mon, 04 Apr 2022 13:05:47 +0000
References: <CAK8P3a29JCfCNWrJ-x7S+kewcSBpeguyo8fmUTt_V4gfrW3=HA@mail.gmail.com>
In-Reply-To: <CAK8P3a29JCfCNWrJ-x7S+kewcSBpeguyo8fmUTt_V4gfrW3=HA@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Thu, 24 Mar 2022 00:05:17 +0100 you wrote:
> These are the usual four branches for 5.18, no late branch or other
> changes are pending this time. The contents are fairly typical, but
> there are nine new SoCs that are now supported in DT files, plus
> another one that only made it in partially.
> 
> The code changes in arch/arm/ are mainly cleanups, removing old
> board files and broken support for MMU-less kernels on systems
> that have an MMU.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] ARM: defconfig updates for 5.18
    https://git.kernel.org/soc/soc/c/8ffa5709e577
  - [GIT,PULL,2/4] ARM: SoC updates for 5.18
    https://git.kernel.org/soc/soc/c/baaa68a9796e
  - [GIT,PULL,3/4] ARM: driver updates for 5.18
    https://git.kernel.org/soc/soc/c/b4bc93bd76d4
  - [GIT,PULL,4/4] ARM: DT updates for 5.18
    https://git.kernel.org/soc/soc/c/ed4643521e6a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


