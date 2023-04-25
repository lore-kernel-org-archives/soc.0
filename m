Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9DFC77B78
	for <soc@archiver.kernel.org>; Tue, 25 Apr 2023 19:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F5B2C433A1; Tue, 25 Apr 2023 19:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38EA7C4339E;
	Tue, 25 Apr 2023 19:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682450763;
	bh=k2Q/JvFLk5RjlDUA+rmnpmQgrJh76/Im0DAqC+3lEnM=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=bVSKMJSMLd6RriMJgSddzxcRMrFAAmPxDoVCJ2zOfsmi/heZwaTqbOC5m84NXSAFh
	 zzlzXnwgFAGooJThRrdjMtpnCMbLTctsjWPm3yGNMgiuZ3gvCJm3oz5/r6wlr+oPjA
	 CckCkaAgYjXXq6Bz8cuzsJVaCoxpYhlh9tt91vDrxwa4cDxOXLHImD9QLhWPAzCIUr
	 A/8Lq/Ex3LJ2Hq5NQnKEZZL74XNCbCV3AYebwT816jl5FBreAEQjGbX6hP1eM7/eg6
	 SwdvdAkvgDRai8sG7FTLFX59F+IlbN+Erq4BiVkfuF1Wb9W91r4ld6k+LImOxMLhc2
	 xF9tZBb7gznMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 22928C395D8;
	Tue, 25 Apr 2023 19:26:03 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] ARM: SoC devicetree changes for 6.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <3579080b-db88-493c-a260-7313a81e2aa3@app.fastmail.com>
References: <bbd25997-173e-4c3b-930c-65c6232908e3@app.fastmail.com> <3579080b-db88-493c-a260-7313a81e2aa3@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <3579080b-db88-493c-a260-7313a81e2aa3@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.4
X-PR-Tracked-Commit-Id: b8a4346d25024e00714fb6ceb0709075827f335d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d53c3eaaef6a05fec04e8b5990d97d7216eb5e42
Message-Id: <168245076313.1749.8053927693785957089.pr-tracker-bot@kernel.org>
Date: Tue, 25 Apr 2023 19:26:03 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Mon, 24 Apr 2023 23:06:06 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d53c3eaaef6a05fec04e8b5990d97d7216eb5e42

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
