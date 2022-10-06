Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F60C4332F
	for <soc@archiver.kernel.org>; Thu,  6 Oct 2022 19:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08104C433B5; Thu,  6 Oct 2022 19:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCFA5C433D7;
	Thu,  6 Oct 2022 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665082822;
	bh=/WfiCmKjdxyZcl1pJaiQrFyrMqaTchtOayn6tD43En0=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=rSfFViqR0J1ruaVZ5oBbbIzU6nRkPPRVY6UbNvqXw7IJnjjUszkzntvfSDdNZ8wrS
	 SOWr8mWIMZfvB9DV0nM2ZWeswtn5/Cs0YEv5CUYYQlFCLv2D8qN7cyniETuYvfq1TM
	 PLtQJB1m5sM8+yYIuLnrK8bV4ISyFfDbFbpFpCC0r2+GQAB4iCdJs/dAU1Xh8Qw4nH
	 pbBk/zx0gTmaeRWgdeV67/eCsFksQlct8KCrQ8PPSE6LQsdkvBUu8p6OWr4akXPDvs
	 vs0/HjcH3NpEV0O+xwHwQN5xzyecbDEi1nurAg/sskQ/xpOGW9LMGUlR8yX7Bl59d2
	 BxCIAVGXuhanQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C7ED5E2A05E;
	Thu,  6 Oct 2022 19:00:22 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] ARM SoC devicetree updates for 6.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20370a5f-b433-4511-9764-c8a2b3ecd972@app.fastmail.com>
References: <70d8e5d8-6fa4-496d-88d6-2604d0c3e982@app.fastmail.com> <20370a5f-b433-4511-9764-c8a2b3ecd972@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20370a5f-b433-4511-9764-c8a2b3ecd972@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-6.1
X-PR-Tracked-Commit-Id: 114b9da7ebd964697a7ca5f85f68f61503e91f3a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7171a8da00035e7913c3013ca5fb5beb5b8b22f0
Message-Id: <166508282281.16472.14915208523763810402.pr-tracker-bot@kernel.org>
Date: Thu, 06 Oct 2022 19:00:22 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Thu, 06 Oct 2022 11:26:19 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-6.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7171a8da00035e7913c3013ca5fb5beb5b8b22f0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
