Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A489C77B61
	for <soc@archiver.kernel.org>; Tue, 25 Apr 2023 19:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10758C4339B; Tue, 25 Apr 2023 19:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDBC2C4339C;
	Tue, 25 Apr 2023 19:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682450763;
	bh=+wxnqy2/jcZc9534KTWeTFKrNfxRH3VcWIqu/1KCja8=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=o1GC4fA5BHimCQcGuO7xDZdsOFpemtud3iDa9C+b8WcBUGsyIT7dV4uP7TlTasHZ+
	 LIU6AEmiY9g6hmFdDcRMUFBdCVGivhDAXS7GV+jUKVWCiD1Pl5ey8yoxs0YyBq8IWv
	 SPMsoyXL1XqaW1yljArPzREzz6rhJUG9rEu5onivWU5KfBcpcIUgbUnjavrM6V28FJ
	 NiZnHXTCgcc5g1ctphn3z3tBjxOat/U75qwn7RYBXQN9DsJfmHc+5ESdZjhc0fXNR5
	 P9upRWepyvTeeWtpuc23uXduXVC8Ews85elq/MPUveYrGi35JyN53FUbc7Tq8lMVYQ
	 vqnPK80y0sQcQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D0997E5FFC6;
	Tue, 25 Apr 2023 19:26:02 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] ARM: SoC drivers for v6.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <4871b5e5-c1ef-484e-990c-b585d4446ff8@app.fastmail.com>
References: <bbd25997-173e-4c3b-930c-65c6232908e3@app.fastmail.com> <4871b5e5-c1ef-484e-990c-b585d4446ff8@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <4871b5e5-c1ef-484e-990c-b585d4446ff8@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.4
X-PR-Tracked-Commit-Id: 4c87f3ff78b20da0dd118762fd66b67a98e36249
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a907047732470f75f3b7c9a8ee09b16765b8364c
Message-Id: <168245076284.1749.12910544993818499695.pr-tracker-bot@kernel.org>
Date: Tue, 25 Apr 2023 19:26:02 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Mon, 24 Apr 2023 23:00:23 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a907047732470f75f3b7c9a8ee09b16765b8364c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
