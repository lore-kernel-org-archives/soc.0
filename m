Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1E9C433FE
	for <soc@archiver.kernel.org>; Fri, 14 Oct 2022 20:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A347FC43142; Fri, 14 Oct 2022 20:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8343FC43141;
	Fri, 14 Oct 2022 20:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665780620;
	bh=5DHM3/yCscE0fYMLzbBE2QeMlK43OHDVCGNhDFf7wFg=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=s1tIvNIr6kwH6leaBw1BcBqtdl1I6/AOU97+rVjXLkXQhjoke+6HpoB8q2W09rqDX
	 gnKsd/n7ww/1XMFo40UywpD0SfnPFDhF88sFadd8FEth+JWNvggIdQHbU3e0bznNW6
	 IkIECAn2RPZT3dC/WOwsjhtG0HT+qnt8poWKf+sL1wFhkJFFuMSytyqyqPPUQqEj4e
	 PyPbhAiF8gLfDN+CzthlcJN8J8OCN+XJ+4VzUJS8WFEL4FHaTJR4HHkZj5Ld/0Stfs
	 Da+m20DgWZkb9JzcVei4WNknmcCLPUNi4OnBMY6TyOiSUQYLSYHPw3EoosI+2oB42v
	 hcodJWpb7oDWQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6EF43E270EF;
	Fri, 14 Oct 2022 20:50:20 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <02915464-9faa-46f4-995b-d7c11638d3c1@app.fastmail.com>
References: <02915464-9faa-46f4-995b-d7c11638d3c1@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <02915464-9faa-46f4-995b-d7c11638d3c1@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.1-1
X-PR-Tracked-Commit-Id: bd60aafce5e1943fd395b8bf726e9824fa621eca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ca1aaf993755d21b8a0060c3bf0f77e303a7bf21
Message-Id: <166578062043.24467.16710641103310727289.pr-tracker-bot@kernel.org>
Date: Fri, 14 Oct 2022 20:50:20 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Fri, 14 Oct 2022 22:32:20 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.1-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ca1aaf993755d21b8a0060c3bf0f77e303a7bf21

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
