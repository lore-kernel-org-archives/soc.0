Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A895C761A6
	for <soc@archiver.kernel.org>; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C4ECC433B3; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23CACC433A7;
	Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679068354;
	bh=ADf9HmoadC0FXDXZtV65xUHqSHjyeyXFSn1X7ANtLf0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OtvozMXWUejdTv31wrQXMeJMxJ6MvZwgIy6gQaPYKJcGQGIbkOHQxbhjLjT9MYBfM
	 41E6xALpLw1hklfblMDuV9e7n0QLSSp2yhA3etlRq6+MNUfL4F2U6uFhYN6BPdOC4H
	 EOAPQKh6+rF1WJfxLnhCciBGd3GPiKPT560Q1pUfuvlzXJygnYvR+yGdAx8M/t2yrb
	 hCRdIp1qUN3v7bDhkwYbLzpOcQzHdC1QxfAzeKKmCKAb588PtGp0ykukV//xVFdf3A
	 HSw/NuLo0sTA9S71H9U8wBREOthsSCgwPsRbLnXd0wF+2AKNJAe5HrhVe8jiLcuEzy
	 ivA2Vv4yQ3TTw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 04BA9E2A03D;
	Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fix race condition in AMDTEE driver
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167906835401.32307.8708300497753705537.git-patchwork-notify@kernel.org>
Date: Fri, 17 Mar 2023 15:52:34 +0000
References: <Y/5ZGX0lSTnZz27E@rayden>
In-Reply-To: <Y/5ZGX0lSTnZz27E@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 28 Feb 2023 20:42:17 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this fix for the AMDTEE driver in the TEE subsystem.
> 
> Note that this isn't a usual Arm driver update. This targets AMD
> instead, but is part of the TEE subsystem.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fix race condition in AMDTEE driver
    https://git.kernel.org/soc/soc/c/98dba5886b88

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


