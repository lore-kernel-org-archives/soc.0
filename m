Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B2AC25B6B
	for <soc@archiver.kernel.org>; Thu, 26 Oct 2023 18:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73064C433C9; Thu, 26 Oct 2023 18:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51141C433C8;
	Thu, 26 Oct 2023 18:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698346749;
	bh=gcvK09doBlqnVy7TADvpkd4a+0dZS9+1jLK83mxYn20=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=fGEzdP5TMBT1Y7rolR1J2dJmwSenhLIMUpBzUlSODTvqgDGLTsnFKQxUe8p1TeTFu
	 AjNJHpN0Nw8N8qyRy9ou8gsljKvIg6a3ZUZirqZmoTUMDcA95KC4u3pu8fGJ1IfsWM
	 Sl+11yDhDSxj+d2yN0iem4MZ07Temsm7Ybkz+RPLu+YLZqvBg1n9Qy9+PPUAu4r0/k
	 E1GCyyETC9TSYlwWBfXH/NrCBrRR3Ytg8Nk4lkfuVTckC686o7qIKOuCKd8zYKqqYc
	 mVE2LY1boSvvvickyIn/4wpb13ij43TcnNGKygUDR7q4IACRQiIJNaTp9HirAQWQRZ
	 gYkFU6z7DjzWQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 38B7FC691EF;
	Thu, 26 Oct 2023 18:59:09 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.7, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <ecd2fc55-8135-4b70-be85-24dbc773fb70@app.fastmail.com>
References: <ecd2fc55-8135-4b70-be85-24dbc773fb70@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ecd2fc55-8135-4b70-be85-24dbc773fb70@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.7-3
X-PR-Tracked-Commit-Id: 736a4aad8a9fdcf577ffa33b33df240c67557af8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3a568e3a961ba330091cd031647e4c303fa0badb
Message-Id: <169834674922.28071.11218269544692299460.pr-tracker-bot@kernel.org>
Date: Thu, 26 Oct 2023 18:59:09 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, soc@kernel.org, linux-kernel@vger.kernel.org

The pull request you sent on Thu, 26 Oct 2023 17:23:30 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.7-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3a568e3a961ba330091cd031647e4c303fa0badb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
