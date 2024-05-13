Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F7CC25B10
	for <soc@archiver.kernel.org>; Mon, 13 May 2024 16:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8169C2BD11; Mon, 13 May 2024 16:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AADF1C4AF0A;
	Mon, 13 May 2024 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715616907;
	bh=MgG0xvf71xpcp1gKtNXNJwbKp5uyl8H2joqH7EL11XE=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=p89TrQwzmo8nW3SMkHhfAzcAsYpulWg6W7QH0tG+Jm79mXtv3yucV8zPtuGUbjzkw
	 5i4fs4m0naor3crHoRWW/uujk98oO/kw+l7x2So9umtn6W/glrmrw4bExnhFaVqlSg
	 Mirk8mw6QY7ghY7d2XPGg7gXIuz9361O+vvimCdY6Nw2y76axHvcDJta1y6Za9V4d4
	 u/5U2bU8eY8r8gBW/5dkc4z0USk7hszMUDtrV4olq6+2mqA4jlbYFL1jKPJwvOV7I2
	 X7QwOMR18lGSIxaQ8gwUOwbsCW8GzKAxhP6Gsy+a1GHuwSA8tF+RI20BgURgqg1d9B
	 5QJN4mHnLkG8g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A0761C433F2;
	Mon, 13 May 2024 16:15:07 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] soc: drivers for 6.10
From: pr-tracker-bot@kernel.org
In-Reply-To: <1cba2868-92f1-45af-be93-2ad6cb59e86a@app.fastmail.com>
References: <fa20b5a4-a131-49b4-9597-15886435a288@app.fastmail.com> <1cba2868-92f1-45af-be93-2ad6cb59e86a@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <1cba2868-92f1-45af-be93-2ad6cb59e86a@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.10
X-PR-Tracked-Commit-Id: 1c97fe39fbac69b2e1070ace7f625a8224116ffd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 14a60290edf6d947b9e2210f7a223bcc6af1716a
Message-Id: <171561690763.7727.5783087295060611560.pr-tracker-bot@kernel.org>
Date: Mon, 13 May 2024 16:15:07 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Fri, 10 May 2024 23:12:05 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/14a60290edf6d947b9e2210f7a223bcc6af1716a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
