Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDECFEB64D7
	for <soc@archiver.kernel.org>; Fri, 23 Jun 2023 23:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A43A8C433CC; Fri, 23 Jun 2023 23:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CBE3C433CB;
	Fri, 23 Jun 2023 23:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687564400;
	bh=X/TZ4mnGYcfxVlEuHhkVc4I9PGFeVrYqpxSX2dFapHY=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=rHOMTwA5HzWY2Wr3vMSfr9pjLzM6+ZNPgxGgxh567q6ZPaYISli5tm6+suSrIuirg
	 43v5u+w6HS/bDtLiQelrHer4Yy/fUo/l7HI84UgbnowqeGTMw/7MyYcI1V/4H1XFIB
	 U9OAxRuCI0FImww3sVjoXZKSYY214CrGsD2gBf0LZrL6aBjJGsQ9gN1thV7GIqRDrs
	 OaZYdbA56z7kbYRCW4T98sfb3gm4DzG541vMZyHkroZal3FoXHLcIzdie4YkThNVE/
	 0xCoIHWJva7qys+zGGuUGej5EVtqsFRR/wHNUn/p4mTVUL21r9GF92vyb+4Urpw1UM
	 GcYDmrAp7WOEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 79BEEC43143;
	Fri, 23 Jun 2023 23:53:20 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.4, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <fac1e7b7-4ba6-4334-a550-9d8a78037bf6@app.fastmail.com>
References: <fac1e7b7-4ba6-4334-a550-9d8a78037bf6@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <fac1e7b7-4ba6-4334-a550-9d8a78037bf6@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.4-3
X-PR-Tracked-Commit-Id: ed8ff046eddd916627e1e9a549eacd9c043fde7d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0f56e657488fe35e543fc17bc192fb7c7ac07ac6
Message-Id: <168756440049.22934.17858212604181868493.pr-tracker-bot@kernel.org>
Date: Fri, 23 Jun 2023 23:53:20 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, Doug Anderson <dianders@chromium.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>

The pull request you sent on Fri, 23 Jun 2023 22:57:31 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.4-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0f56e657488fe35e543fc17bc192fb7c7ac07ac6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
