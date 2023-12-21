Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AECC46CD2
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33B2AC433AB; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D97FC43391;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=xpYndSQACW0UgWfxSLDshDhS5QlzYlLmNcYsdfJZ1Xc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UPuLryndvV/YgFqEMmEMbLsmSwAMh+MyW8vCKtn9HWngA9hySbNv8HlxbzUJdLVkm
	 SuZepyGRAi6+2P+CXeat5HpFBJdO3FXyVTWBqra7FMthHLYQ7fGMJsPKpXGsKICuCN
	 ScfY80h2hIKcNs+A+qqzemZEji9uZZZmPDX5yiCEiobnDpC/KvOrI+kE9qXU/JVM59
	 cUzAGI/FukYacp/hiSDYwPlxluFmzSD9EJU2yWoLaB0k9y3bbgP4uHvg842OyQw4OX
	 XHM9pl9s8eE2zO9k1GFhlz49tXEa+HvaD2fudDOeSb3D7wnFzpHnMy8OHW0GKeBxQc
	 /mgWVla7tnH7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F07AEDD4EF3;
	Thu, 21 Dec 2023 17:41:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046598.3302.6361151969897215764.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:05 +0000
References: <e38724be-c9f0-4916-bfd0-d20b316db2da@linaro.org>
In-Reply-To: <e38724be-c9f0-4916-bfd0-d20b316db2da@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 Dec 2023 11:12:36 +0100 you wrote:
> Hi,
> 
> Here's a set of Amlogic ARM64 DT changes for v6.8, with cleanups
> and a set of new HW support for the S4 and C4 Amlogic SoCs.
> 
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.8
    https://git.kernel.org/soc/soc/c/3654ffdc138a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


