Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8548DC7EE2F
	for <soc@archiver.kernel.org>; Thu, 25 May 2023 15:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49D6BC433A4; Thu, 25 May 2023 15:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D78FC4339E;
	Thu, 25 May 2023 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685030320;
	bh=gyvlPwsYDDQOx0bwNpipjrkrXzl4zenG1Gq7Sf7G03U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Q3qqsvs+9wZaoOe9ITkmazz8M0Pg4BgLaEi5W+bJTmOHrJIRsKkzCN4jrlmW9zCVS
	 Pnry84ui9yiAbFsD0YQibhyuD/cZft02vSFaSXzZb095pDSI3Sd5KWRpqvzUA9KpFM
	 0/Oyw8QN8Zd8m/Y1xRqHLIgHoOR3OaP7aOghB8mRbXBu7LoMem5Bz2uzUc3pBHJ6k7
	 GJV2j5F1yflQjwJAAgQRpXgl8oyr3litHlEvQFc1RwZSd6jZPvmrTiucWtd9R6FfAT
	 YiUBhpVK0T0Y92Hh9glMTUW2TQR+LNNcA/7/C8+6lGf1IvaoBAQaQPMoWXdDj5x2y0
	 dUyzwrl2At53Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 16E8FE4F133;
	Thu, 25 May 2023 15:58:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fix for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168503032009.27102.16491061276257313151.git-patchwork-notify@kernel.org>
Date: Thu, 25 May 2023 15:58:40 +0000
References: <20230509143529.1188812-1-sudeep.holla@arm.com>
In-Reply-To: <20230509143529.1188812-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  9 May 2023 15:35:29 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fix for v6.4
    https://git.kernel.org/soc/soc/c/0bfa36f9bc66

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


