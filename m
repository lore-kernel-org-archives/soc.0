Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE297C77B75
	for <soc@archiver.kernel.org>; Tue, 18 Apr 2023 18:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8CB4BC4339C; Tue, 18 Apr 2023 18:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6844EC433EF;
	Tue, 18 Apr 2023 18:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681841406;
	bh=Xo5GwuJwFzMjSEbxGVeUA58SfrxA2h1UsD3j38JI+LU=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=pcjYZVQy5HuhaSCzwBvRNrfy4XXgTBD/SAqq3GML8JWiYNCmlVGsXEPsRE669aRYY
	 cXcGlWT5uQYP8BlsbXmQ8HsjmUigJXlRSQ63LZ1Z1oKFAZ517CpIHxdTvFq4jClgzn
	 36WD4yRRUtRX/vFG2IPoxvQee9J192CLcRWQj6A/tybDIPByw4LN0EAuAFZx7R7t0e
	 UCa/IhxXb8W8+tNNhtqxcK8EarNcstrWp1NsgYD1waPlm20YG6u9Rn0koTst+fRFQ+
	 H1bDAANWfmoOX0mj8vDE5xBKCk4xSr9Ms9+z3q+c4l0+v2439LG4YU0eINIwIYlM/T
	 3rtYUxK+xfGgg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4321DC40C5E;
	Tue, 18 Apr 2023 18:10:06 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.3, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <bf8a1e1d-c8d0-4082-a262-6e6dc75c47a7@app.fastmail.com>
References: <bf8a1e1d-c8d0-4082-a262-6e6dc75c47a7@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <bf8a1e1d-c8d0-4082-a262-6e6dc75c47a7@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.3-3
X-PR-Tracked-Commit-Id: d75eecc3d170d8963ae554a774b8af1f4e1246da
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bbab25317cdd73b5241145c3c2f188e6cb1e5659
Message-Id: <168184140626.21228.156145444334425999.pr-tracker-bot@kernel.org>
Date: Tue, 18 Apr 2023 18:10:06 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Tue, 18 Apr 2023 17:20:40 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.3-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bbab25317cdd73b5241145c3c2f188e6cb1e5659

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
