Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9A8C00145
	for <soc@archiver.kernel.org>; Mon, 12 Dec 2022 18:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F13B9C43398; Mon, 12 Dec 2022 18:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9A45C433F0;
	Mon, 12 Dec 2022 18:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670869811;
	bh=geEixCjnMm77wVTfIs8sxAHjdyxIhRsqqegGSuFnfxg=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=OsrBl/r7ajO4H5wFy0Tl7gnTBd5G2x5zijcC2tbuEgdspwALbmVkIyFiwHAgSp3qk
	 Ez1Q67cstDNlXD24uSXXvhr5pQV26fu7i682RQ/dBxr2MvggPQtH4o1DqYJs5YQ3tB
	 QpwdnF2acRELmKsosqUKBIiFoV4wnfuzM8ccOesjG19oOj3ovX3yH4R5UVx4qfoAvC
	 c5QuxGIOJgDyg+8Wkuyfh5iSfJZL/MZwfI5FLMQsi+2an79i3VTSsrNcFJVpxStMaC
	 NEmJatkLzl+jOkQ0iU+IaCc84DjlF7bMrIO6EtXuEoJ0G/dxaj7Xz4aDlf7tQ38Hdf
	 ltQ52zcWB5Ykw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C3077C00448;
	Mon, 12 Dec 2022 18:30:11 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] SoC code updates for 6.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <4f256035-0959-4c00-a263-6720139c6a7d@app.fastmail.com>
References: <257c9d3c-5bfa-4c5a-8ba3-11982a00b1d3@app.fastmail.com> <4f256035-0959-4c00-a263-6720139c6a7d@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <4f256035-0959-4c00-a263-6720139c6a7d@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-6.2
X-PR-Tracked-Commit-Id: 8b7f4dd73879598ac6876753732e158055d8b671
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 69700db4212ac784130f63a350b1ede3b7184494
Message-Id: <167086981178.1778.2038892373622755674.pr-tracker-bot@kernel.org>
Date: Mon, 12 Dec 2022 18:30:11 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Fri, 09 Dec 2022 18:20:05 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-6.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/69700db4212ac784130f63a350b1ede3b7184494

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
