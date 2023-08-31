Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6B0C83F19
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 00:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2AB52C433CD; Thu, 31 Aug 2023 00:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1417CC433CC;
	Thu, 31 Aug 2023 00:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693440618;
	bh=c4Oa4RbHL0ZPey6PGZwmvbz1aAa5raryOPRCc8YpeDA=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=JebXN3DJE0NK9byZAG6aGIhAX1e7aboPntdR/Sd++aGiEzNNRtFYMB9+7z3B1HFZg
	 NjuAjMQ2MVPRVUGI+VyDLKF9IZaZ+YndsyS4oPvzvAHpHBF5Jd7aU8a1zaDw4RqqwV
	 SnCptNNO33l7xKVRq59ML4lGOtR18M+Ifh+gHpu9SsGw+rnniskupGBXf+fUfEuE6L
	 mGKpUoKB7Y6V0BMs6P8SqEyUVIAVzLx8tdy+cj3Qrs/QBAY43z+JlBb4oEnQ3CjvjJ
	 F080t+vEc+GgN339gEBs9jgSSevwDSI1nA7h2cYD627FOoMHIyy9nIc40mrro3hjKL
	 lZi5EDkdmWa7g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 000EDE29F34;
	Thu, 31 Aug 2023 00:10:17 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] ARM: devicetree updates for 6.6
From: pr-tracker-bot@kernel.org
In-Reply-To: <d9c11cf5-24df-4c01-9f41-5ddc39830aca@app.fastmail.com>
References: <4f60d13e-f060-491a-88c7-6f25323a48f8@app.fastmail.com> <d9c11cf5-24df-4c01-9f41-5ddc39830aca@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <d9c11cf5-24df-4c01-9f41-5ddc39830aca@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.6
X-PR-Tracked-Commit-Id: 05c618f39089d977b0c3dc1105cb6cd5fc53cd01
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0e72db77672ff4758a31fb5259c754a7bb229751
Message-Id: <169344061799.21437.16871867035418731914.pr-tracker-bot@kernel.org>
Date: Thu, 31 Aug 2023 00:10:17 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, soc@kernel.org

The pull request you sent on Tue, 29 Aug 2023 17:58:01 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0e72db77672ff4758a31fb5259c754a7bb229751

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
