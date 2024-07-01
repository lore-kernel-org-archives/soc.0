Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09862C3065A
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 16:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6ABDC2BD10; Mon,  1 Jul 2024 16:49:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A27B5C32781;
	Mon,  1 Jul 2024 16:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719852583;
	bh=aIy8w2x4i39X1sEGi7Yo4OKtvRgd6sbGVj+X1IPp9hc=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=nETWEwBkViETCOMRbr/aNo7rsET1W64vQHQtv+ftwAyUJBEZHiWsuOqlpLZGEnqUs
	 Ftjr3NrZwGFrRVU4A7kftk7Eg3i6C/ZTjWhIbadpx1/r+RwzBJLbPCiEPKrwTvtQJJ
	 3nBag6NIkXcqxrPb7SrJ++lv2Q6aTFnrzY9FmMEeJXtUp3t8T/hy2DZw1YzFPIuG2d
	 QqBcq5Gb3EKG9gerEY0cLHwtNyaQCxdBrj2pLCcAkYg+CIXdMhe7kUF7v/xWbqxYAg
	 Ny9MxINsXsZoOKsu5gYOgCWySey/ZWbp7X83HdsW7T6UTSIf3ejBmup/ksHSkrmz3x
	 +h3qdvlYk4/gA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 95DC0C43446;
	Mon,  1 Jul 2024 16:49:43 +0000 (UTC)
Subject: Re: [GIT PULL] SoC fixes for 6.10, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <3040c98f-940b-4380-9a90-dfcae18a47b6@app.fastmail.com>
References: <3040c98f-940b-4380-9a90-dfcae18a47b6@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <3040c98f-940b-4380-9a90-dfcae18a47b6@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.10-2
X-PR-Tracked-Commit-Id: 07917ee08723e6c46074a2655a380126acee3898
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 651ab78190e2e4817eb6c21bbc5b4119c2fb34f7
Message-Id: <171985258360.24381.15874330138736099680.pr-tracker-bot@kernel.org>
Date: Mon, 01 Jul 2024 16:49:43 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Mon, 01 Jul 2024 18:00:20 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.10-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/651ab78190e2e4817eb6c21bbc5b4119c2fb34f7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
