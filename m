Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AC5C46CC5
	for <soc@archiver.kernel.org>; Fri,  8 Dec 2023 09:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20312C433CB; Fri,  8 Dec 2023 09:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A3F5C433C7;
	Fri,  8 Dec 2023 09:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702026026;
	bh=AUEYYg7ga407H1XbIQ15KkyV6WO7o72pxDqqFYy82WU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=sZ32PafHq11eYSvoJesQBCQ2i88z93UnZZfEwPYdz4/Iu9YA6u7lC3MHkP/8eKccl
	 Ws6xeNc4i1hOwd6IVYQb/JbJtXFeZUxnFmt9/yvaJz6/GvvL+hIpewiySVOLU1ldif
	 wJ+ASjssLAI6pnLW28TvKtZqvWPjaMQxCcAt5R75H2+RPvvRm69XP3wC1js6Wc6Np9
	 5IpOwAU64ri7Sk8l5DxvVoDNk3rQ1wWO1I31lJ7+pjFG7hrg4M8Wqhnibho4YcHO+e
	 yMFAAfGDlaF4SM81xGz5paCoIwbd8dhMniHzFeqcWznumoHK47c6worDl7lYNPURHj
	 M2KYtrPMPwuVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DD634DD4F1E;
	Fri,  8 Dec 2023 09:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170202602590.9233.13941561132849082557.git-patchwork-notify@kernel.org>
Date: Fri, 08 Dec 2023 09:00:25 +0000
References: <20231207005202.GF270430@dragon>
In-Reply-To: <20231207005202.GF270430@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 7 Dec 2023 08:52:02 +0800 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.7
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.7
    https://git.kernel.org/soc/soc/c/7c9bb1904583

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


