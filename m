Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270CAC61DA7
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D252BC433D2; Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5B3EC4339E;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674595889;
	bh=MTPZaHwRUdoPQ02Ng+aVevlDzU9VSOiw086evRwTj74=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rDam/CvSA44KMTQym0LZzAD3SzdIHfO3w5FnZ5bB0eyJna8KsJQzaOfKl0sYMSvAh
	 u++v2G6CPsDN2k8YJJ0WJyikh7acMcJPV0E9Mvi0TW36UQc7ZS46DsGLRDr3qbwPRy
	 8bOVbacu6I/Y4TxdnWpMiLJAsXmivf6iVCe628fNZELDz0aMqdXnkI33kqan7M1ufR
	 Gvi6O87Kr4SKOcV0tyazlCeLT4jCbYtl/acUoVfcUnndR4wX+H+XxkoyO+ZTfnSyo0
	 DhIfoYmxgzT1has8MYKr9/mZxsqSo8icb55rqY6EctQq/+evuDtsA+1LHjxUWcdHC2
	 TB9qIY4heRGow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 97AEAE5250F;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] One clean-up for omap1 for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167459588961.12731.9412864655763770592.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 21:31:29 +0000
References: <pull-1674566532-427457@atomide.com>
In-Reply-To: <pull-1674566532-427457@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 24 Jan 2023 15:22:39 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] One clean-up for omap1 for v6.3
    https://git.kernel.org/soc/soc/c/e62f40452d1f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


