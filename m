Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BD7C64ED9
	for <soc@archiver.kernel.org>; Tue, 21 Feb 2023 00:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 525E1C433EF; Tue, 21 Feb 2023 00:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35FCFC4339E;
	Tue, 21 Feb 2023 00:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676937933;
	bh=Y/HfvOw3dLcZwhSrkAyHJghsyaMgXVyWdhGTiY2MEwQ=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=OLRxnOE6fnery8P2T77qUtgkNC2EF8k22C3a6FkDL7OpiZu7B0FIotao4xacawvoz
	 twSr5/06DZC4NZPpzLN12hVIVWXttjgQImg6jAIsNjM0RrD7xahpYMElpaSYajy+UK
	 9eHf+FRxO5bHOiMG8JkEZO2Pu9pQ+t76GjpZx+FHVXCD/DttlK9WJIErfxzZrQ5aD3
	 vsTnb9LVlOF3wrgpknXKo0AS+JDz2k1+6a/fyCyEH/zSsRFwc++jxrTK9sxCTiwLj+
	 0d65ZxSejInaU9E36GJsVjOO8C33AIOUtAtluXzxIdIGrjBCcuhAyIJFb3EWh8r3ON
	 gvruHe5T1pCjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 25E7AC43161;
	Tue, 21 Feb 2023 00:05:33 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] SoC: DT changes for 6.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <4f42519a-d087-416a-b7d6-aa9f63d2c395@app.fastmail.com>
References: <99179367-0d59-4938-b44c-ca9408ad784e@app.fastmail.com> <4f42519a-d087-416a-b7d6-aa9f63d2c395@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <4f42519a-d087-416a-b7d6-aa9f63d2c395@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.3
X-PR-Tracked-Commit-Id: e43efb6d713bca3855909a2f9caec280a2b0a503
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 950b6662e26e381cf8834b9b78b08261890ee697
Message-Id: <167693793315.20221.2479672107266446107.pr-tracker-bot@kernel.org>
Date: Tue, 21 Feb 2023 00:05:33 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Fri, 17 Feb 2023 18:28:19 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/950b6662e26e381cf8834b9b78b08261890ee697

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
