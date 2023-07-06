Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF80EB64D9
	for <soc@archiver.kernel.org>; Thu,  6 Jul 2023 17:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 834E1C433C9; Thu,  6 Jul 2023 17:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65279C433C7;
	Thu,  6 Jul 2023 17:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688664539;
	bh=RfdwamQy61wnbcTeSptT1YPgIJaKc686TQUTyqMGFAQ=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=MW3cgjyim4ib5DxFj9hbMg+pytRRqb2U+aZHemG+x93omLpE1K2Pyis8Zs5aUA2En
	 0lJnFrCmGdf+yfHVzYyIjudZ9H/sBdZ6nS2sWh67pUE7wW3A6sxq8xVvw2Re93RKDr
	 BZk8fKEzanrUCCM6bAtHorWNBf7zkBdFClkipsDvjEgTqoYsiq66ewNLcfgPM2Wgj8
	 peehYdCp2jTACnToOLw7N4FMApZccsJsgmz6GOiCAOvFP/sFwof6G78mWwY9H00eOJ
	 zG7DCLknqfEt+jkcdIQVovkJOBZEymM5RNuWBVdT0caPABIS78AvPlor3ymXrMk0mC
	 DNru7q9Kj2L3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 53E17E53801;
	Thu,  6 Jul 2023 17:28:59 +0000 (UTC)
Subject: Re: [GIT PULL] SoC fixes for 6.5, part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <a89a22e2-df89-4341-ba61-c42149e21c8e@app.fastmail.com>
References: <a89a22e2-df89-4341-ba61-c42149e21c8e@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <a89a22e2-df89-4341-ba61-c42149e21c8e@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.5-1
X-PR-Tracked-Commit-Id: 6722e46513e0af8e2fff4698f7cb78bc50a9f13f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9f57c13f7ed70a94ecc135645bc764efdd378acd
Message-Id: <168866453933.8259.4329177821271290121.pr-tracker-bot@kernel.org>
Date: Thu, 06 Jul 2023 17:28:59 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Thu, 06 Jul 2023 10:20:17 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.5-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9f57c13f7ed70a94ecc135645bc764efdd378acd

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
