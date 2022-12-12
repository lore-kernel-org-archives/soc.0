Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41DAC4332F
	for <soc@archiver.kernel.org>; Mon, 12 Dec 2022 18:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BF72C433D2; Mon, 12 Dec 2022 18:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E6C1C433F1;
	Mon, 12 Dec 2022 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670869811;
	bh=72x1jEvbRG+6KWtMB/i37F9SzRHlNHter603JpZY3Io=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=Whz8SSTuq0tI8y49hOgHonqXhwKuXdAxDLdgTqibKtW6g0QkBvON+QKdIxLR144Lh
	 a63pewYQMkqpXIrY3m32rFTk7tz4fQ/G8SZSTm5xYoPaCPrlGWeAV+BgiiZOeA4X/i
	 vJwyeX5MtypNbZXaWyPY+cfQTlAfIG4Pbgd4NQJ5bTL9EJe8rcm7IQ3VVySOu2aYia
	 7qPjvwuzkd0OnkEkc5PIiILO7A3oyqNhd9Y2cjIiVaz1o4Xlz4ItwLbqcBdHLoWQy1
	 oRcA0NO5EuTcQ+vMXKTbomkYgI7MzKiVBA08rp/4cM/le+l7p3i/WjqkNAiUp08prp
	 SYShdwgJaSOpg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6B916C197B4;
	Mon, 12 Dec 2022 18:30:11 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] SoC: arm defconfig updates for 6.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <4a5121a4-9b3a-45d3-934b-f24ec3a222f5@app.fastmail.com>
References: <257c9d3c-5bfa-4c5a-8ba3-11982a00b1d3@app.fastmail.com> <4a5121a4-9b3a-45d3-934b-f24ec3a222f5@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <4a5121a4-9b3a-45d3-934b-f24ec3a222f5@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.2
X-PR-Tracked-Commit-Id: 93b8c91e4cdb520b67ffc4513a7d6232f1037d9b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5910b842c489ec40866182d1b2acf7d20c2bc83f
Message-Id: <167086981141.1778.11711869965905945426.pr-tracker-bot@kernel.org>
Date: Mon, 12 Dec 2022 18:30:11 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Fri, 09 Dec 2022 18:19:18 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5910b842c489ec40866182d1b2acf7d20c2bc83f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
