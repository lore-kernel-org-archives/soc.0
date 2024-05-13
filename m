Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3BAC25B78
	for <soc@archiver.kernel.org>; Mon, 13 May 2024 16:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE8BBC113CC; Mon, 13 May 2024 16:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7907C4AF09;
	Mon, 13 May 2024 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715616907;
	bh=hbob51UY2zWUXra/06zfmP48WvK9EY0+ipOUTGHzS/Y=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=ork59cum2TqIq9Sf8vWr8b7w4g3zL6c/zAy14yrVgvhYW0PKueUbW0mcZE4+rG5bB
	 2PrwAI4QZX2tol/mxf4vSgGGjuYwdeQQ2ueHAkQdvWCx3hjeXqjGQHFe7aL8buJkL5
	 o7T1RG0cQh3ABIIKxPX8ydxDbiwXmv00en1VBBrjMoj0r+LEf7xzkkT5Qp+VDIyLiJ
	 VYAp/aHtVtvz39F3B2zlIpYczvqnpd2F+yI9Gyk4H6V3YqW+3xpt8f0ytLHPenCe9s
	 C5F0mmeGqFs5SM7+093pI4YgDwjsmJ7VtvGhrAZ4QEOu9NNMq9suqxjXK4BSyZTd9A
	 1SilcpB3w412Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CFA2BC433E9;
	Mon, 13 May 2024 16:15:07 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] soc: arm code changes for 6.10
From: pr-tracker-bot@kernel.org
In-Reply-To: <0d70e9ef-5291-4134-b41f-183b1233b39b@app.fastmail.com>
References: <fa20b5a4-a131-49b4-9597-15886435a288@app.fastmail.com> <0d70e9ef-5291-4134-b41f-183b1233b39b@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <0d70e9ef-5291-4134-b41f-183b1233b39b@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.10
X-PR-Tracked-Commit-Id: 428ae88ef519f2009fac37563de76ffa6f93046f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0c2212926dc2ead410031977839af9157a895013
Message-Id: <171561690784.7727.13723429178491017701.pr-tracker-bot@kernel.org>
Date: Mon, 13 May 2024 16:15:07 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Fri, 10 May 2024 23:12:36 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0c2212926dc2ead410031977839af9157a895013

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
