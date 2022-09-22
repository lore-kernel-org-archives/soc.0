Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204D2ECAAD8
	for <soc@archiver.kernel.org>; Thu, 22 Sep 2022 18:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DBF4DC433C1; Thu, 22 Sep 2022 18:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3F19C433D7;
	Thu, 22 Sep 2022 18:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663870509;
	bh=JtUXOg+AgdI/IwU/50fd9DuLRPcP3LISon0mPU1RQ90=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=igPI1Y7x+UT38XZ24UpngOABSgWpN4aW/q62GgrsLbIzXVmQ/m1DlFtEpUGW857Dp
	 HHvh3k/Ru7z5hZVyQPtiFLbApr3VXBz8jg/r2gYoBwcEkn1ZuGGmHmyut5hIblt+GI
	 x00IyDd95hmIVq+ARVvZJwrzZIgWP5Os04wkUKVY6wuT8PSCVmWGcd2ZzSjQuc9vpl
	 juCUeb3S4wBo4RgvQeA6C7hq26MEESG1CDFTgj60Yin4MAwd/FVGVxgxpQ5pF6Niqa
	 DZ9pGS4MzyCXpImIV44wnAlF0sxnDfkbXnIW0zfFatr+YhyeLEoxAcFz9y9/vufiXy
	 49mCtGPHz38Zw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AEAC2E4D03C;
	Thu, 22 Sep 2022 18:15:09 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.0-rc6
From: pr-tracker-bot@kernel.org
In-Reply-To: <acdecda4-b11a-4e15-9ac9-6d2696218012@www.fastmail.com>
References: <acdecda4-b11a-4e15-9ac9-6d2696218012@www.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <acdecda4-b11a-4e15-9ac9-6d2696218012@www.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.0-rc6
X-PR-Tracked-Commit-Id: aaa58141a5d7647b14d812dde92b8d680e0985db
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c69cf88cda5faca0e411babb67ac0d8bfd8b4646
Message-Id: <166387050969.24554.9552921730692713809.pr-tracker-bot@kernel.org>
Date: Thu, 22 Sep 2022 18:15:09 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Thu, 22 Sep 2022 17:32:32 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.0-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c69cf88cda5faca0e411babb67ac0d8bfd8b4646

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
