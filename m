Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421D1C433FE
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10C98C385B6; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4520C385B1;
	Thu,  5 May 2022 19:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651779108;
	bh=h09PtWoFRxF3jX1dvQf07JbFGoLGEYHCuvlvgatrqe8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=sS20/aGuPjgmzHBLctZ7XcPfdqOfQAPm9y6EI7vncSaEGRLGn1SLMSqazKM9A5voS
	 2kz/kwdXlRkJ0QxjvKMSMtFmZji8UIdcvj9p1uSjrLIikMfGC3L46zVjm5IP96BMYf
	 eIHFVfrGcPwDjVZdRgiJHF6v70pTTqfjIy34+JRiKENuA6QtEthSAd86upVtj0w6xE
	 Xr8a8MPoPup3mBB1cj52UVGUZCsu0k4FQiumO5EY/q4kNjWWdMwI59ZQ5wz/UKDFD3
	 iv/huhR5vltieHlSS9335WIW4k8cynjEhFXUCJXJMP3Q8ha0bPlhpbbZWeMl4ga3NC
	 y4cvlFg6lhz8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C99E3F03877;
	Thu,  5 May 2022 19:31:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: juno: Updates for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165177910782.9627.3342877602429245308.git-patchwork-notify@kernel.org>
Date: Thu, 05 May 2022 19:31:47 +0000
References: <20220504112917.3492009-1-sudeep.holla@arm.com>
In-Reply-To: <20220504112917.3492009-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  4 May 2022 12:29:17 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: juno: Updates for v5.19
    https://git.kernel.org/soc/soc/c/e8bcacdaf138

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


