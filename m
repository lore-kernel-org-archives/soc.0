Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9C8C27C53
	for <soc@archiver.kernel.org>; Sat, 22 Jun 2024 15:21:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7F45C4AF09; Sat, 22 Jun 2024 15:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD095C32789;
	Sat, 22 Jun 2024 15:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719069672;
	bh=nibiD355j2Rv9GjiiPBhMmPdjmfkbVlrr/t8CY1tzGQ=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=LhAsBn/JJeGUsaD7Y3YuWk0uHf07bGiO/k8vCrE5FRO2D/hsHQvKVuIY0Nkav6jGx
	 SyhWv0xGT0hX0sZBMsJwSmVOEEzk9HpXu6kaPGD5Ter0QaRuEv6eA8iPkIWnAHX9Mr
	 1rKJYH1iybMtiasluW55Ka2NGpStRUwYuLQIcvgEl3bHUISsEiT3jeqvsGVQFRRvDU
	 RrkAol7HOnvXbn21N3y+TSiYgvI0RiRuvKRP2wWjhB7l1FX5irgKaFLh5j+NTYcvxZ
	 zthqV9dRXrHAsUZqI8xV4sU1WcrMR5RZSAj72/rDF6xgauESL6ED9VPFovys/BljWz
	 ATWcKWHGxllxw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C2A49C43619;
	Sat, 22 Jun 2024 15:21:12 +0000 (UTC)
Subject: Re: [GIT PULL ARM: SoC fixes for 6.10
From: pr-tracker-bot@kernel.org
In-Reply-To: <6f44ef12-ccc0-4a55-bca1-1e8e89b17ac7@app.fastmail.com>
References: <6f44ef12-ccc0-4a55-bca1-1e8e89b17ac7@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <6f44ef12-ccc0-4a55-bca1-1e8e89b17ac7@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.10
X-PR-Tracked-Commit-Id: e7c3696d4692e8046d25f6e63f983e934e12f2c5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 56bf733415b1660afb11e5aaf4a9ba353e45998e
Message-Id: <171906967279.9703.12061188763251967153.pr-tracker-bot@kernel.org>
Date: Sat, 22 Jun 2024 15:21:12 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Sat, 22 Jun 2024 10:03:59 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/56bf733415b1660afb11e5aaf4a9ba353e45998e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
