Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9C1C4332F
	for <soc@archiver.kernel.org>; Thu, 17 Nov 2022 22:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 430E5C4347C; Thu, 17 Nov 2022 22:20:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22B2AC433C1;
	Thu, 17 Nov 2022 22:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668723640;
	bh=rrKtlNK7P46kKtCfzbSBnIol3PtJWk2C8X6rYNdLo2I=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=rcvr2TmUvHiymQZ9f+986gUTT3XAygbaiERa1dbCNb81NYw/I/iNg1BsvDjzhJmyN
	 6ztKxjxb9RjuTPNa4gs0+tk2cnhyrble5C6hCSNS7lZh6RHbV1Y93KwMAkjt/1qgVH
	 jIL25Fy14eOkfH1o9yDU5gFkCnfI8F4/LIsFAU0sbK4yOxYpxTwcU1oeyanbLF9vxB
	 inMaVJ9d7UaFf4OIGVI/mfgH/AhCa6YMviQFjvhYaA/TgzDN5aywrUqv8elCuAWUvl
	 J/EUZhetfxAwwCWaiAkJcAO3gyURdjvjXHv+GttAuCz2LMjot3swGpxcNflBs/bmLv
	 XMpGYsDquNl1Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0D113E21EFA;
	Thu, 17 Nov 2022 22:20:40 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.1, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <f376fae3-fb50-4a79-9a90-1ee19cafe1ad@app.fastmail.com>
References: <f376fae3-fb50-4a79-9a90-1ee19cafe1ad@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <f376fae3-fb50-4a79-9a90-1ee19cafe1ad@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-3
X-PR-Tracked-Commit-Id: 0d6a10dc2b971cc3a192b47721ee8270afc2d104
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 84368d882b9688bfac77ce48d33b1e20a4e4a787
Message-Id: <166872364003.24282.15521017055224742067.pr-tracker-bot@kernel.org>
Date: Thu, 17 Nov 2022 22:20:40 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org

The pull request you sent on Thu, 17 Nov 2022 22:48:26 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/84368d882b9688bfac77ce48d33b1e20a4e4a787

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
