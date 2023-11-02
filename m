Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AE6C4167B
	for <soc@archiver.kernel.org>; Thu,  2 Nov 2023 01:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A9F0FC433CC; Thu,  2 Nov 2023 01:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AC52C433C7;
	Thu,  2 Nov 2023 01:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698887412;
	bh=TnUvgKOEOFyV70TCDy5ZdwaB7TKMsdpHaSqx5kLTKMc=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=uhtsPRWi5V+o5mk1+zBzB/m2tw5LOTf6ogLq1JZwQGLHsV8dCAYF/DOSyxR97MjeM
	 Ahb4TwxnYShldnvog3m8ATNnqm5VMzUBI0LVgxIc3/VCibDvjujvodRtzPTwj/ojvx
	 bzPPHf3Xit2iJWmPj5B3xCM+d6Ece49DS8Uh2u8sd18JhDJfiColqnaNwnM8t1IG46
	 UqrhNTrk22nVJ69B2DnVwCvndPjGe0m/sXnUqvY205sDqVq7KChQvE+90ibDt+9xUS
	 6e494J8ToMNtaQv7glCCca7z02kOyuCnrMbvTBYvjEyWVkGehyphD3CuUOYGZt98/b
	 CuuCra7jj8/Zg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 760E6C4166F;
	Thu,  2 Nov 2023 01:10:12 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] ARM: SoC code changes for 6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <2ba2a5c9-0e92-4ab6-88dd-8410956ffa78@app.fastmail.com>
References: <263c2cf0-c35a-4d3c-85b3-fcb692cbfd40@app.fastmail.com> <2ba2a5c9-0e92-4ab6-88dd-8410956ffa78@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <2ba2a5c9-0e92-4ab6-88dd-8410956ffa78@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.7
X-PR-Tracked-Commit-Id: a9838799e2fa9fedd77867942e661b657d5591a0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4684e928dbee00d625b5102ea23c216cc2d85f46
Message-Id: <169888741247.4705.15206782061155503915.pr-tracker-bot@kernel.org>
Date: Thu, 02 Nov 2023 01:10:12 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Thu, 02 Nov 2023 00:39:30 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4684e928dbee00d625b5102ea23c216cc2d85f46

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
