Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD69AC77B62
	for <soc@archiver.kernel.org>; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7E187C4339E; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61C5FC433A4;
	Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679680822;
	bh=57ha95c773snBGmvLx7ufPTB7za9dnazHg9fR35OzFw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nIZbKFowW/LhpN076cTLUk5zLPUTzK9hdXU7pEfxkaEvkSGW1vETlNaqZFMyUEswd
	 f2393+MlRePN1qol3qzCUc4vzj06Pdbwaf4sRDFMeSPJXOnwFtlbTNGI+YfiwJP/OK
	 AFMX4NOSFdNpfNTo7j5AWIXbNxFG/j1J5EnR9XSaNfvRghAdD+K0DQcFNMyHKeA/gq
	 N78j+IOa19a13WYuDm593BXw85LRnNLQyFRgvvDI0qNGx0zyAtiYDgqARRhQgLHLyB
	 uuFpaq6rGVZTiJkou8W/uqqYhklJzHWJooABJExOHHe1XvNwR3WBSL1QiqWwy7bLB7
	 lgh5nvoiOaLjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3170AE55B3F;
	Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver fixes for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167968082219.24696.16961979535948058586.git-patchwork-notify@kernel.org>
Date: Fri, 24 Mar 2023 18:00:22 +0000
References: <20230323142505.1086072-1-andersson@kernel.org>
In-Reply-To: <20230323142505.1086072-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 23 Mar 2023 07:25:05 -0700 you wrote:
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git qcom-driver-fixes-for-6.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver fixes for v6.3
    https://git.kernel.org/soc/soc/c/ec7d8bd7d40f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


