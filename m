Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B3DC4828D
	for <soc@archiver.kernel.org>; Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 655C1C43609; Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EC8EC433A6;
	Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706205098;
	bh=sSHpcW3lNjIsIIxNipPD3z7mRCUXXsbosrZMA0ho2u8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=aRm66N62QiYKK7GKvtekm8J/SE9E2XVArA5TrVecQbQeVGT9zRt6lpgTxMJ+H4Iuu
	 Fqzgvl41Yr4ssyB3kuXWr3sasw5li0jNy7AjICG7TDTnqJTK+4tqKHQOi1oooOFbvA
	 JzHeoqhQXT2AHTEd4a9P/mixINfQMM6BUwClKDvHEW4vBSnEMsGA0G8kYEL7o/YvTf
	 kWCP1e5sAZdKbKZEtUo09a7R/uxAsDbqxDg9S/qFo8GwToKkHhlF396haF3q5JnOXy
	 egr4fn+sSV8t1zN9uVqNGeRW9m4tqTJg9cxZdsVuH8JqKpjPgKznZD5kNsysSF2MG0
	 tDBRLVXCplBVA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 329CFDC9A06;
	Thu, 25 Jan 2024 17:51:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170620509820.10279.11568689527751729221.git-patchwork-notify@kernel.org>
Date: Thu, 25 Jan 2024 17:51:38 +0000
References: <20240122161640.3551085-1-sudeep.holla@arm.com>
In-Reply-To: <20240122161640.3551085-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 22 Jan 2024 16:16:39 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v6.8
    https://git.kernel.org/soc/soc/c/d77b016bc917

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


