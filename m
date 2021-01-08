Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36079C433DB
	for <soc@archiver.kernel.org>; Fri,  8 Jan 2021 22:16:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EBB0523AC0; Fri,  8 Jan 2021 22:16:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D36AE23AAC;
	Fri,  8 Jan 2021 22:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610144165;
	bh=kG7h/49J8CyEdV5W63JubMtwsWREcD/4kg04Gptndt4=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=jHZMb8vexShuhvdmrRFcVkB+4ggs/up9onsOINorirPIlwkczfWWAk/BD3h8OJe3C
	 p671++IxOvl00uG0g7BilT6ogX7MaJdX2Ei6JxJH6ofLP9u2YOXMDE5A0RuhgYXSaj
	 AsiB6ufInNzeolSWYk/i1Uk/3twxTjwAf2K7lCjrFcL87wyny0BqaEilsDKkjhotbd
	 B0vDYZPi8KXAODo0DzNjbFyMSP6lkJuefWSCXQs1ASEvA86BTmDilAuDBCuTvXaw65
	 8G6VNfGeQAFzcgt9czy3vrzhwMyRHoyKUK2EMxNr/wmjqcYnmSwhK2zecLiqnEtDky
	 /hRJeq0ffrEFg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id CF46E60157;
	Fri,  8 Jan 2021 22:16:05 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3aQwtP9kpujNeErTVHDOxALMtEpg5QQgKJMfQ+ZaFn4w@mail.gmail.com>
References: <CAK8P3a3aQwtP9kpujNeErTVHDOxALMtEpg5QQgKJMfQ+ZaFn4w@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a3aQwtP9kpujNeErTVHDOxALMtEpg5QQgKJMfQ+ZaFn4w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-5.11-1
X-PR-Tracked-Commit-Id: bac717171971176b78c72d15a8b6961764ab197f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 95f05058b2bbe3b85c8617b961879e52f692caa5
Message-Id: <161014416584.31342.17090341049735137699.pr-tracker-bot@kernel.org>
Date: Fri, 08 Jan 2021 22:16:05 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Tony Lindgren <tony@atomide.com>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Fri, 8 Jan 2021 18:10:47 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-5.11-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/95f05058b2bbe3b85c8617b961879e52f692caa5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
