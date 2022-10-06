Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3B8C43219
	for <soc@archiver.kernel.org>; Thu,  6 Oct 2022 19:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F202C433C1; Thu,  6 Oct 2022 19:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1584CC433D6;
	Thu,  6 Oct 2022 19:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665082823;
	bh=r28KpCKtFHRMOz7pn5o0ksDTQg4O5FSBA9V13k2W/t4=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=if1H4jAT2gJmcqBI/HW/7+Jop94u6LZqIIzPaWR9Z7yiV+iQIWN62TiHm5b2WVsXw
	 3ZHbH+IitCUvDOadYw99cwbbLvNYBOLr9UlJgLsWNvpCT23kNwhcp+cDkuqnwn9xt3
	 OSyRURTDvljE4KRcoX0gbVHQ4zg7ooPN3VYiA4aH29HISdzA8nXQvejsqXK7C9SMhY
	 Lkr0CZ28dSvC8PJ0Cu4fzEu3PkDHUiltvzVYhP23bkvMim368Y6trzIWVBdIwBkoCP
	 vXKdt7I9tHY0vx43TB5YV90eC1R6OTNS9Psk/AADmFPd9/piJLpeeslvPgMW0QwD3O
	 WV8zhoyMxVnUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 01D99E2A05F;
	Thu,  6 Oct 2022 19:00:23 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] ARM: SoC code changes for 6.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <6b71d4f8-cf80-460b-9b33-7366f5290b78@app.fastmail.com>
References: <70d8e5d8-6fa4-496d-88d6-2604d0c3e982@app.fastmail.com> <6b71d4f8-cf80-460b-9b33-7366f5290b78@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <6b71d4f8-cf80-460b-9b33-7366f5290b78@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-6.1
X-PR-Tracked-Commit-Id: ef2fb84c130b08ce2a05359c35bc4e9541712375
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 41fc64a0550b86f4428e8d3fa23ab97678a65ae8
Message-Id: <166508282300.16472.3575951364286173421.pr-tracker-bot@kernel.org>
Date: Thu, 06 Oct 2022 19:00:23 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Thu, 06 Oct 2022 11:28:29 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-6.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/41fc64a0550b86f4428e8d3fa23ab97678a65ae8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
