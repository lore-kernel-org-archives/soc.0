Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7261CC4345F
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 21:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E4E5C2BD11; Fri, 26 Apr 2024 21:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 101F9C113CD;
	Fri, 26 Apr 2024 21:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714167902;
	bh=/qcGTdfr4O698qMwd7hcjvNAVzoZhkDfEMJDy/zuCO0=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=hVWWfcQwKJ5IHJFfoujXgLB9ywzrwiVYWUXRDCBG20EJYC8nkTWOmGdWUP87oBc2m
	 CFKazm8V0EGw1Jdl1t+x1mEFB1F7OM8gnD52qgib8auBxfrHcNsp0uVaXanhfwOMNf
	 G8ph7NSL9Y1QJHEc19vOjEol7QQwkyFTlNks+WJA7FxCxVhprUZLcr9qJgccX4I9qb
	 OxeWndiNjuyj3Y4wguheT8/c/Z5owbENiFW4ctztrdhiJKNq3gubwR9GjKFxVchyal
	 T4IL+WRZRhOkMB/vfiykaa8aC9/Es3nlA3l86QDVtFViaNbvkX0spjQd0+ejORbpti
	 mfXvqUYJu7HbQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 04BEDDF3C9C;
	Fri, 26 Apr 2024 21:45:02 +0000 (UTC)
Subject: Re: [GIT PULL] ARM SoC fixes for 6.9, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <beaae28d-c6c9-4117-adbc-e8ee614c16aa@app.fastmail.com>
References: <beaae28d-c6c9-4117-adbc-e8ee614c16aa@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <beaae28d-c6c9-4117-adbc-e8ee614c16aa@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.9-2
X-PR-Tracked-Commit-Id: 9f26bc71b1fd895e22151e63934588e5ddb11b05
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5eb4573ea63d0c83bf58fb7c243fc2c2b6966c02
Message-Id: <171416790200.29117.17418634709071104918.pr-tracker-bot@kernel.org>
Date: Fri, 26 Apr 2024 21:45:02 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Fri, 26 Apr 2024 23:00:07 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.9-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5eb4573ea63d0c83bf58fb7c243fc2c2b6966c02

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
