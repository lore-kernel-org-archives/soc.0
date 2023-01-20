Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1042AC05027
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 20:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA495C4339B; Fri, 20 Jan 2023 20:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D8BDC433D2;
	Fri, 20 Jan 2023 20:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674245200;
	bh=wvB4WwzGKSJVO6q/Gj7hl3Xvjcb7eqz0iGNMeX0dzmE=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=myQlQa1qOdwKbnZ2LADgZgJqqDkVxz651cbvvjeNJVDR3um8AznL7nFiFtL6abjzS
	 VgXT9i4Z2dyiddx5E+UoVUYw+PfQCZe1/p0i/oB3LYmfIiwCJsNhxxGMfMJ/bssoN0
	 uM47soJg6cA3Lcoudyhdx7xI3o1gVz0WekoZ769XdYaaL9wa3GdXaAOh6XgMKAzta+
	 26bTHqT0k7VwbEme4Ph1/S/urSxFpcwmVlnNFxpwYdjeon7sA0TJhefKeONha+WRF/
	 YnU76ub+MNZF9J5rBMSg3ZhJARTgJdnJpFSfvEXMnd2FxXoz21rSDvOvsexhyK0kZ+
	 t4Ep6ovwluvUA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B85DC04E31;
	Fri, 20 Jan 2023 20:06:40 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC DT and driver fixes 6.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <bcb75322-43e6-4e17-b0f4-59d9a5fb844f@app.fastmail.com>
References: <bcb75322-43e6-4e17-b0f4-59d9a5fb844f@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <bcb75322-43e6-4e17-b0f4-59d9a5fb844f@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.2
X-PR-Tracked-Commit-Id: d2c865553adb7ad9abf3894cbb209cf1bc95484a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1ed46384f85bcf05fc9b6605f9fd54e1f81a331d
Message-Id: <167424520056.30775.18422833290890232.pr-tracker-bot@kernel.org>
Date: Fri, 20 Jan 2023 20:06:40 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Fri, 20 Jan 2023 11:19:19 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1ed46384f85bcf05fc9b6605f9fd54e1f81a331d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
