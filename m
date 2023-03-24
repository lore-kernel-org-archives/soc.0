Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8E0C76195
	for <soc@archiver.kernel.org>; Fri, 24 Mar 2023 23:17:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F30BCC4339B; Fri, 24 Mar 2023 23:17:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5539C4339C;
	Fri, 24 Mar 2023 23:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679699876;
	bh=cpmrIxMdnJCrJh6T9tLxLAcws15WxJKDk9LeCZC8pmQ=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=nMYPNJYT2tFTLPOm2cDcR1ehpKfrg6hLHRPwRs6QBLoCgQ+je+hWoIBtVFZAKL6EF
	 82rXV44s13ypHPHuVQ+k6FgV6YMrldlEug39xM1LinQYubrRZ6hSfjv+UZ6C05IeMY
	 bUsPyo0DkzdwKxfx/3wHVTH2xVxBbrwsbNnKu1Qa02zbtND30WLTl028972d1QiaxZ
	 lMTy4d3tuGCg1UEv/8YVeAtyNQPMlK+o3w5M6vl4zD2LISaUVMlV9FzILRKE2lQXi0
	 L6/qi8HVJ/7JG2/49L4wns+dWL/ODhfIoNbXKhSlPCGdkVEj2OfgeCCLkWmouwnFjR
	 7TKd5nh1+7izg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C34A5E2A039;
	Fri, 24 Mar 2023 23:17:56 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.3, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <e6a9ec59-7227-48e1-8636-e020f3489788@app.fastmail.com>
References: <e6a9ec59-7227-48e1-8636-e020f3489788@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <e6a9ec59-7227-48e1-8636-e020f3489788@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.3-2
X-PR-Tracked-Commit-Id: ec7d8bd7d40f14b03da2d9cc3c6c8c845d62fb0f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e76db6e50c85cce9e68c47076f8eab06189fe4db
Message-Id: <167969987679.13977.1925576316932019474.pr-tracker-bot@kernel.org>
Date: Fri, 24 Mar 2023 23:17:56 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Fri, 24 Mar 2023 22:40:06 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.3-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e76db6e50c85cce9e68c47076f8eab06189fe4db

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
