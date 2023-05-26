Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9FFC77B7C
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 23:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DBC15C433EF; Fri, 26 May 2023 23:51:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE26AC433D2;
	Fri, 26 May 2023 23:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685145097;
	bh=nQqKjxId9gdgd7mGGqbxENm4k8meXNmM+boA8tYqkh4=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=k5MvBULJ1BklN+MAPMxAoWTIXNi+B6cybDvlT7N9EcocYHpiyvBukT3WyoWXoFZ+U
	 DkEd+hLI9oGTMAOMRf6WgwOZEqmpDpBzW0cFCj+kgjANqEyWkfeQ7i6XPXHlO339ti
	 2o1yP3IeG6zqFql78D6yNjUs3/FvP6JR89Vhgfru4bYOULYR04IKUY1J6vmdMriDAd
	 G3BItM22T4Lm4Zi3c6DkprzqIPAtMDHvWCOgySnbycuE2S+GwnKwkELjTtdeYkkqHJ
	 R6TkHoMNRtZWgTj9z2c8l6IuOJv5t7ZA7CUBA11kXaLLzQOXk9exmV7oqzrP38uGKA
	 xpEONkYJihYMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ABDF5C4166F;
	Fri, 26 May 2023 23:51:37 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <f2765dec-e4e0-4b56-b3a5-2f7fc9114b87@app.fastmail.com>
References: <f2765dec-e4e0-4b56-b3a5-2f7fc9114b87@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <f2765dec-e4e0-4b56-b3a5-2f7fc9114b87@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.4-1
X-PR-Tracked-Commit-Id: abf5422e821f0f321e95cb728f013f143ca4655c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 18713e8a689377386f639d9317f958244825bd7b
Message-Id: <168514509769.17241.15583030300475838898.pr-tracker-bot@kernel.org>
Date: Fri, 26 May 2023 23:51:37 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@kernel.org

The pull request you sent on Fri, 26 May 2023 23:07:34 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.4-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/18713e8a689377386f639d9317f958244825bd7b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
