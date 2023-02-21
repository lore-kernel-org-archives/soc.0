Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE81FC636D6
	for <soc@archiver.kernel.org>; Tue, 21 Feb 2023 00:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB1E8C433EF; Tue, 21 Feb 2023 00:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A45CC433D2;
	Tue, 21 Feb 2023 00:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676937932;
	bh=P+UajAEctqqVfcAzuUzxZo+gYv51dX3oLzTm9h5KpXA=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=WpM3k0dFD4qcJ3Z7GU2FXeNeqUvI656yqB0ICsNTQWsRf7PewnM4TN8/6hfcMQRHN
	 c+qqyUYhUlUR7dZUddXG1YkUi3g8nLZCuEN8dWFZJ7RBQkoboau0EldwHi8B7GGm+Q
	 VhHSE86rTIaSLLOdlVxmXbfLbjX4e/YS3E+QsNqQz/bfqJ06oyb+Rm/x+1AWDp5pdP
	 wYYzY5CgW3nuIxbm2d9OoTn6OyqN8Y/BEJUVS9Cf8/Gfr+6qLK+CTtIBZCQSMNYKdT
	 qp7IGTUB5m3crGOnznBX5Nl0E08ydLWqPoK2eiJCljJk+SrGj12KzN4SHJuqBM/iJB
	 iSh6QcOKbTRGA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 79B78C43161;
	Tue, 21 Feb 2023 00:05:32 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] ARM: unused boardfile removal for 6.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <93b43729-1d89-42d0-82f3-658a9d6a3c9c@app.fastmail.com>
References: <99179367-0d59-4938-b44c-ca9408ad784e@app.fastmail.com> <93b43729-1d89-42d0-82f3-658a9d6a3c9c@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <93b43729-1d89-42d0-82f3-658a9d6a3c9c@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-boardfile-remove-6.3
X-PR-Tracked-Commit-Id: a1f925bc4fa899b3c0f2dcbc432d572c36e74e71
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ff0c7e18629b8bd64681313a88ce55e182c9fee6
Message-Id: <167693793248.20221.15456299643288440986.pr-tracker-bot@kernel.org>
Date: Tue, 21 Feb 2023 00:05:32 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Fri, 17 Feb 2023 18:24:34 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-boardfile-remove-6.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ff0c7e18629b8bd64681313a88ce55e182c9fee6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
