Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCEFC41513
	for <soc@archiver.kernel.org>; Tue, 16 Jul 2024 19:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E236C4AF11; Tue, 16 Jul 2024 19:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85F9DC4AF10;
	Tue, 16 Jul 2024 19:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721157945;
	bh=PFockgK6LED3OxYKEWejo70KiPY5/dREDV0K2aRfOew=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=Htk/vrQ2UXJOoBtWg/kOyJFz7EcQnYJsTQeDlOzs84lm287lEcCT6YcxZpSvgfFs0
	 L7s8d/w5aUOwuKsd5zHmTzyZwI8KRHXGwRYOB9ybYfRTovFcs9nJ3yFS+EIUR0IOVN
	 t/C/XTQK00rBsf+vSmO0KUbGkfCIPLioj8G50TJA08Zi28L9jKPIb1V+6qZEupvI5s
	 Gcsj5Q5UuCI7ojrSkJBfzhzLnpnIURt2bGbpNN9fCA8f7DO1RAEOx9LC9Vvohp4D0+
	 89IkC0fIO4XjI0plstKBph0VrS2TCk5QIFx/13j77/T1dt5b9VQfIvOlpFBcTkrTzz
	 3aYgPq/0FG/Ow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6BA16C43445;
	Tue, 16 Jul 2024 19:25:45 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] soc: dt updates for 6.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <b55b7bb8-97b6-4d25-9592-8213ecfe7b6c@app.fastmail.com>
References: <fe3126a0-7c32-426a-9997-77d76ade5179@app.fastmail.com> <b55b7bb8-97b6-4d25-9592-8213ecfe7b6c@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <b55b7bb8-97b6-4d25-9592-8213ecfe7b6c@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.11
X-PR-Tracked-Commit-Id: 48d2245586452b8279a854970ce82f43477669d3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e3950967f6e6b74a3606739ec50ed19f3398c7d8
Message-Id: <172115794543.10577.16476440873208181519.pr-tracker-bot@kernel.org>
Date: Tue, 16 Jul 2024 19:25:45 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@kernel.org

The pull request you sent on Mon, 15 Jul 2024 23:10:48 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e3950967f6e6b74a3606739ec50ed19f3398c7d8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
