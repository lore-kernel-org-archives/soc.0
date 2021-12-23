Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40293C433EF
	for <soc@archiver.kernel.org>; Thu, 23 Dec 2021 18:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF9E9C36AE5; Thu, 23 Dec 2021 18:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4661C36AE9;
	Thu, 23 Dec 2021 18:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640283190;
	bh=c0OBjsmoH45rdHNuxrv3YlgADfyVRSjgvgZzWKpyMWM=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=FAOaWJJytKuES8PssHVDJIQtO6zpX0rpHxigaZ7BwuMDKD3b7rmGFFKDK3rtONYJp
	 KimnoduUoOc5O6ew4aHga/o8vRvLz+9Aaox6UNXNLIMTWbo2BgSZ3hO84B2GiH1rO7
	 CsJF9YR0G1dD/R0bEj9RtiVfBIR2YzWfPzw0b9uiaII+5Aby9IxbddGZVZTVH9Sm6a
	 abGv9V4cjYHBnXLy9orMeWtaUwQlPe4SjVI7fQFh2ssOxl/OjJcgV4okcSqjV20MeJ
	 1t6RPfAtTIXHo+J1zok0TgiVJ80XmuCFdF3jNF+0Y1JyR+YuzSrl3DBdR0YFjFcGHh
	 Mhv0cbukqwU0w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B34C0EAC060;
	Thu, 23 Dec 2021 18:13:10 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.16, part 4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a34sd5NOxkwZsoE+qeY1MRCS_zO0tmfutmoKGwyvjR7Lw@mail.gmail.com>
References: <CAK8P3a34sd5NOxkwZsoE+qeY1MRCS_zO0tmfutmoKGwyvjR7Lw@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a34sd5NOxkwZsoE+qeY1MRCS_zO0tmfutmoKGwyvjR7Lw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-5.16-4
X-PR-Tracked-Commit-Id: 7ad8b2fcb8509792a1714d937263aeb5bff4f654
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c8cc50a98e4fb58022c64008bf4157f8b7af47f2
Message-Id: <164028319067.29771.5040381557830443084.pr-tracker-bot@kernel.org>
Date: Thu, 23 Dec 2021 18:13:10 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>, Jens Wiklander <jens.wiklander@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Maxime Ripard <maxime@cerno.tech>

The pull request you sent on Thu, 23 Dec 2021 12:30:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-5.16-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c8cc50a98e4fb58022c64008bf4157f8b7af47f2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
