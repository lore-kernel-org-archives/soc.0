Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5806BC25B75
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4AF38C4AF63; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34D6BC4AF5F;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424447;
	bh=SvPXmEShGMgBDgSvJoGp2Y9EBfNHixEsttpfDtSM5nM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Eo5K8iLqDJMlr20lnsAwSfHd3DCh3znm3VjS50JasdbpLT9E1xW2jXCxKniFgttv5
	 zdRHg2SXdFzyCsDoJl0Wzt+/KztAPd0vd0EHOUklA9aFsjnHLdbzbhWcA7evuhNB5P
	 P3xf0pWIho0EuEDS/AkU7wpKSol3LaA2fczd9Z7r7HfHxlhO7IDSL7L2Wugz30WB75
	 n2Caiuf/WIRxSj1OJ/JpDOz6e1UNc7LB6tjSo9i1jg0AT4eXSe+DF+nUJUtcfW3kf7
	 VIL/1KgiUuE25gI1zcJkZDyMyng+vgNBr6yuLYUvoHErnlcKryLsK3toLZ99D6wIQa
	 BbXVl/GHBmz1A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2797EC54BAF;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] soc/tegra: Changes for v6.10-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444715.17402.4724849469504349688.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:47 +0000
References: <20240426180519.3972626-1-thierry.reding@gmail.com>
In-Reply-To: <20240426180519.3972626-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 26 Apr 2024 20:05:14 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] soc/tegra: Changes for v6.10-rc1
    https://git.kernel.org/soc/soc/c/cc0739fe2e55
  - [GIT,PULL,2/5] dt-bindings: Changes for v6.10-rc1
    (no matching commit)
  - [GIT,PULL,3/5] ARM: tegra: Changes for v6.10-rc1
    (no matching commit)
  - [GIT,PULL,4/5] arm64: tegra: Changes for v6.10-rc1
    (no matching commit)
  - [GIT,PULL,5/5] arm64: tegra: Default configuration updates for v6.10-rc1
    https://git.kernel.org/soc/soc/c/ee00d5ceb291

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


