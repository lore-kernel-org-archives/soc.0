Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B23C433EF
	for <soc@archiver.kernel.org>; Thu,  7 Oct 2021 21:04:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6080D61130; Thu,  7 Oct 2021 21:04:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 436DB61056;
	Thu,  7 Oct 2021 21:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633640659;
	bh=v4oLcjeW1xaih2bFoNyRKXDjpxexseaJaBHiIQXsZEw=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=ENAjR722V5oWQbcgL0D+tFGPXQrvgMP21tx8ZmPvjljCaiwHPHaIE1FcYfe/JfOgO
	 WNsXsBiUFaGLBagvn3FQVJculIh77d6MZC0+BvDOFCM/5bNXj3sWJQJFyU4UKw0BZ4
	 S1wc1U6WunPGdYMIwZWi7aSil6KLTmrLEKphW4Z0TIZaeVYs5bHrtyzF+7lcD281Cp
	 M/z3U5Mlb4N0auirFjbrFQ70psUZLoR3VwP+7gQ5SuPrfHUb3DDRVjMt2XXUSOwNBB
	 roHE+rjSXgHXp6PnjrPGutFTNQ0z9Sb70ZwP/87QiSQ/KJvBfekrFkxPTO5e3Z1Lvf
	 xU7GTlaIeyplg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3065E60971;
	Thu,  7 Oct 2021 21:04:19 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2aqDaL0dh0k+ZXJ2xq5LKa5z2r2r_WUBdC9m8eKxavXA@mail.gmail.com>
References: <CAK8P3a2aqDaL0dh0k+ZXJ2xq5LKa5z2r2r_WUBdC9m8eKxavXA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a2aqDaL0dh0k+ZXJ2xq5LKa5z2r2r_WUBdC9m8eKxavXA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/armsoc-fixes-5.15
X-PR-Tracked-Commit-Id: 897c2e746cc795870361fcf9cbf282524589fa5f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3e899c7209dd8f7afca59518c5ace0f03385dbc3
Message-Id: <163364065912.30969.4669198160716269013.pr-tracker-bot@kernel.org>
Date: Thu, 07 Oct 2021 21:04:19 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Tony Lindgren <tony@atomide.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, SoC Team <soc@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Thu, 7 Oct 2021 22:55:50 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/armsoc-fixes-5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3e899c7209dd8f7afca59518c5ace0f03385dbc3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
