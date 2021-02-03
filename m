Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9257C433DB
	for <soc@archiver.kernel.org>; Wed,  3 Feb 2021 19:38:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 91E9764F7C; Wed,  3 Feb 2021 19:38:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 75E6764E0D;
	Wed,  3 Feb 2021 19:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612381120;
	bh=w99r7UjKBoJx1OyWtsBVn9Ao7mTyOY/7Ix9pos/w/tQ=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=iOGJFzRB8gpEqCiyayllp6NOTtzyM/CmEoMi9lr60FrAEWI15j0ye1dSy3R/WQnYC
	 W/jd5Vwaug/K5xS/qIes7jzVk0NkUgJ/Kfi3ri24vIqpp7k6MS28Avq4b7kqCvkV0j
	 Zn8rQ3ooM0gNAk9EMVtv1la9SLLBAJSDiC/L1Mt9TO6UVjBiS3MzQk8ov6vHlEDbUb
	 V5WbhD4HKUq/ABoXVuScxocXH4dLF8Y/bzW4Y4kwgdemrBcaJr6gNZhRnaml71T11X
	 00zsxGK6LJdVcpqIjF/0X8NW9wdoeanm5ywa2lp98PhnmuolCifvouMn5vjsogumBz
	 7psB6WO042PSA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6FD64609CE;
	Wed,  3 Feb 2021 19:38:40 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.11, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1Ud0DtX+GGnap1r+Yu+KONeqq64q+2y2D3mVPGN4vwuQ@mail.gmail.com>
References: <CAK8P3a1Ud0DtX+GGnap1r+Yu+KONeqq64q+2y2D3mVPGN4vwuQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a1Ud0DtX+GGnap1r+Yu+KONeqq64q+2y2D3mVPGN4vwuQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
X-PR-Tracked-Commit-Id: 459630a3ebb4110c571f103fbc2d8120be001e39
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 54fe3ffef0ebb60b1273d0d7b047ee9b4723cc61
Message-Id: <161238112045.20071.3264479308047100060.pr-tracker-bot@kernel.org>
Date: Wed, 03 Feb 2021 19:38:40 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, Heiko Stuebner <mmind@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Marek Vasut <marex@denx.de>, Alexandre TORGUE <alexandre.torgue@foss.st.com>

The pull request you sent on Wed, 3 Feb 2021 13:41:24 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/54fe3ffef0ebb60b1273d0d7b047ee9b4723cc61

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
