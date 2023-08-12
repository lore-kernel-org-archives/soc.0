Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E84C07E8D
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C0BDC433BF; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66424C43391;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=k4GXG/BcCZVj1d8EMlYtunZzykEfiERrF6nTVyn/a2U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hDgN6POwbmWKWspkfp6PWAznixg7lfvgKeN9m64ephIV+kYn5oLbfgob4HurjBdBz
	 50B63DvaQxSaThWkDU0/YPpua8dmWqyTyv+6VtrQgnxUYUOvwlfFtJU2xNSxgLpMdP
	 Tm0bY3JZsU8Z5ZMcv6Sm/A7ygmauzIuJlQG2omSPapNtJn8EJV48MKC5CkjwULxxaM
	 tnXP4kwmpy3ORKSmRjr96/1OEx2ruP7zqmsYzhthGACPaPu7owMPnnVoGVul9nhQM0
	 A1kiH9J8VSTegLEg/fOkIQlD4yQvuYalHNdH3vmekVh17js1Fsvm415rLMLcb38PLR
	 r3UqvID0PxEqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 55841E3308D;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] arm: dts: hisilicon dts updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168934.30475.7367316414595453883.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <64CC9B21.70907@hisilicon.com>
In-Reply-To: <64CC9B21.70907@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 4 Aug 2023 14:30:57 +0800 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm: dts: hisilicon dts updates for v6.6
    https://git.kernel.org/soc/soc/c/bda81ccce5e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


