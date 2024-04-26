Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972F0C04FFE
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A334C113CD; Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72827C2BD10;
	Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714148531;
	bh=TEKKk2Ip1iwPEp14WcG/4ZSGzK3/uRKFHrl9UFWmReY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mj5K+t3dJZUiN1peSNarhHCXaezPgtNIjopWKqUrlCaizl0NRH7gATQsOfztkO4FZ
	 H0KWsSEgitY7VIaWR7qfp3qAdCo6SKI3rhTpmUgLabdy5Xfd5asZ7ZFOFtTqPngvG3
	 HHmrJiGjofw6hAIMY9GGPnqlkDMM1VrWWXQyn10PjAKRl4TujRVVUGGN6D95cHJZlS
	 EEOJKQjGYWRwmZOB/kpSvdK9vgenihb/c2R3ABfJoG9PT23GmGy7TUteMLG0+brWIs
	 sLQUb/uloqKsxUDXXA79g5oXWRK0zzBhw6gAydoo/jHE/1s6V7m70/q/ZuGO6WhsQs
	 KAvPBv4a++uQA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67BF7DF3C9B;
	Fri, 26 Apr 2024 16:22:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree fixes for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171414853142.5338.18137194961097443696.git-patchwork-notify@kernel.org>
Date: Fri, 26 Apr 2024 16:22:11 +0000
References: <20240420161002.1132240-1-andersson@kernel.org>
In-Reply-To: <20240420161002.1132240-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 20 Apr 2024 11:10:01 -0500 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for v6.9
    https://git.kernel.org/soc/soc/c/14e9d449e979

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


