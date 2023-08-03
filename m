Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECE7C001DE
	for <soc@archiver.kernel.org>; Thu,  3 Aug 2023 01:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3D93C433C7; Thu,  3 Aug 2023 01:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3766C433C8;
	Thu,  3 Aug 2023 01:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691026657;
	bh=5mI36UUnIoZG+8J0xxGREo6gFFGKpijTTL/s2BopTu4=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=DOFBrh4juzx+KzBhsQZr+28LgnTckuAKEqr3V+CXVZ98VQS8F4DLrLtX94y86iBGR
	 KuhLluqZcKaiajrHAQpfikWEfQhGcAxu+3EanIpPfo8ctaQ4xUaXodvaj7I/z1aD0T
	 kUOj1shj6/G1/m6aILEzjVZYMCu1DlHU8TxJkRalc2GNpAzgPJTd4fYlfwUpIbrO3I
	 ZMXyuoKNfATivSzDpe2kfY7laqXzCus3obppAplq7NKqspGjP3xWVo3t43mTAxBIbc
	 /oSDKG68BNe5o0uj4Tvgns7oehW7iUr6H8BsxOErGEufcF2QBDjGzA32FF6VJWrNaj
	 /ZmII+XNFI28g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A0B89C6445B;
	Thu,  3 Aug 2023 01:37:37 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.5, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <b547178f-fe00-4270-bcc8-98131fc5e0b6@app.fastmail.com>
References: <b547178f-fe00-4270-bcc8-98131fc5e0b6@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <b547178f-fe00-4270-bcc8-98131fc5e0b6@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.5-2
X-PR-Tracked-Commit-Id: d21afb098c510739a2f5dd27aed5d3198816d8dc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ec351c8f2e6211054e51e661589cddd1fe856425
Message-Id: <169102665765.28352.16747903850188275180.pr-tracker-bot@kernel.org>
Date: Thu, 03 Aug 2023 01:37:37 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Wed, 02 Aug 2023 23:44:58 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.5-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ec351c8f2e6211054e51e661589cddd1fe856425

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
