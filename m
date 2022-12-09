Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0A6C4332F
	for <soc@archiver.kernel.org>; Fri,  9 Dec 2022 18:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3FB31C433F0; Fri,  9 Dec 2022 18:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FA7CC433D2;
	Fri,  9 Dec 2022 18:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670611172;
	bh=E7IOLYjrgmS5ti4UsFyJE6Bc01pDqkWg5I8W/og5omE=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=AplqI83rA5qU1Fg/kCM/pvQbpZA+JY9e5eFY48hJVPLWiT4PHSflfYQ/lt3kIpL91
	 22qrbnghPT+NdciNVKkdEiIWDGLvJdg2La+rf0KQSpPKupqR4sot8RB4QBw4fGYcmD
	 RvkOmpKQD6D7zkvOzjOJqCbMpjxLnVyxLHmMDPH4Hyy0QeUeYLiQkbEj6wH09rShoK
	 Xz45tjztDS0JzzQ2wzaOe7++l9/iMSEMKRxj7IE60tGHQgxFQSCZdJtlEcFGq62DZZ
	 1eccHrIyK/Yn3Zku9ZJRxEmLmRm+65mo7ZTrOV4Ent7yRtC7GS1M2geGoHe4F/mXNl
	 Ax8DqpwAHzriQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0AF44C41612;
	Fri,  9 Dec 2022 18:39:32 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.1, part 6
From: pr-tracker-bot@kernel.org
In-Reply-To: <c2178eba-0c25-4310-8b87-1dc7708d2a34@app.fastmail.com>
References: <c2178eba-0c25-4310-8b87-1dc7708d2a34@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <c2178eba-0c25-4310-8b87-1dc7708d2a34@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-6
X-PR-Tracked-Commit-Id: ef19964da8a668c683f1d38274f6fb756e047945
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9857feb3f62a04aba3909b6ac43dc062bf84c874
Message-Id: <167061117203.24040.11894918308899224286.pr-tracker-bot@kernel.org>
Date: Fri, 09 Dec 2022 18:39:32 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Francesco Dolcini <francesco.dolcini@toradex.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Marek Vasut <marex@denx.de>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, stable@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Fri, 09 Dec 2022 16:25:17 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9857feb3f62a04aba3909b6ac43dc062bf84c874

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
