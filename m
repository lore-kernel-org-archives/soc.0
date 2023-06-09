Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE96DC83003
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B5750C433A8; Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9ECFDC433A4;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686316227;
	bh=ZR2Uz/memgLhQv/sF2M8UCHdPrQIZqTsVBIZUPfV+40=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BRJzrbC8Yv2HDgwCiEN537Zii4Z75hhkMnI0BykXH58430eslfT3d3KMqN+qhVNYr
	 MvlWx97NszAv8uqOV9BSsUzcDYHuXTMv6SC+nVvhLNJhvY4IqhwBPsDoyMSkIcRsMa
	 BVSrlF+xHaaS/tmslJz94/fUG6O50Jemh/eb58OEPCjrgTK7WQEpaWr10v2L1OATEu
	 XfJAD7DqEDVQyO4QiHqWtcRAMcsJpQRh5t8/hJLMnLKiM9sVwWVwKAlpbs+799tS1r
	 QdFxy/Ha+BUxos35r/QfVmXg9WtoamslscVkoH1RBwH6vELsmiSRqFa4nZyhUUress
	 w0a7QyyWQOxeQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B5FFC395EC;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM DT updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168631622756.816.758487506389598042.git-patchwork-notify@kernel.org>
Date: Fri, 09 Jun 2023 13:10:27 +0000
References: <21b55df9-3eda-0a0f-cf76-79b1d7735314@linaro.org>
In-Reply-To: <21b55df9-3eda-0a0f-cf76-79b1d7735314@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 9 Jun 2023 10:20:18 +0200 you wrote:
> Hi,
> 
> Here's an Amlogic ARM DT changeset for v6.5, with only simple low priority fixes.
> 
> Neil
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM DT updates for v6.5
    https://git.kernel.org/soc/soc/c/705ebd7768c4

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


