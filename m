Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5ADC7EE21
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A50D0C43443; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D9FDC433AE;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681489263;
	bh=hLOwcRCZyD+/ayjMQdID7OWZiWjdz8ECqara3nLJPmM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kGMRsQD7nReO6w7uHtNQd3Kr43XY7/LVM3WKfq0G0ITGU1nrgZhzTm4TCARPqz1El
	 485qzPOwhqUpozOWGYS7xtdd9lEzONZvRGJNCorIMa4NiT8Rdyw7+K8+J3mO372PQQ
	 ygF0YtPKY7L8LDSDB1OWWoA1dmgfR/W5ESsuKVCD8YarJkPujMjOzMCnh5LpcpikEV
	 jPABCd36fsnPm85D6a8+WR9P1VbzJHuUeAbXGLEanIr+/V0pyLCNHKJI/KJXdmzVZs
	 Q6ThS3Btw1LV0widM2X+8LT21Fn4RVHU1SQaYU5oJSkGAF5FQ2C4p3Rrr74APOVoD6
	 X3Z3sTQODce+Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6F47AE52446;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 6.4 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168148926345.30442.120018986895305919.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 16:21:03 +0000
References: <9713202.NyiUUSuA9g@phil>
In-Reply-To: <9713202.NyiUUSuA9g@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 09 Apr 2023 12:33:12 +0200 you wrote:
> The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:
> 
>   Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.4-rockchip-dts32-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 6.4 #1
    https://git.kernel.org/soc/soc/c/2925732f0c5c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


