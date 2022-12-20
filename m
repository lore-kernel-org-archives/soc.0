Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CF1C4332F
	for <soc@archiver.kernel.org>; Tue, 20 Dec 2022 14:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0BB81C433EF; Tue, 20 Dec 2022 14:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0C43C433D2;
	Tue, 20 Dec 2022 14:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671547685;
	bh=+QMRIO9LjTmXgLx8w8RIS8viD2Wk0qejuVEb5uJiDZc=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=Dh8i2NRWHB7I61ydRH8vXyFOXRtCvKbaduLfb5q+6B5CBFleXCdzVRdByDD9RXY61
	 Kv8dKgvZwl2T1oRNoSHqjaiFCMwOkaLSJm1OGBWerCW8vLbQaZTkgcsBCITLLZPbUU
	 Olzo6q6Ml8KaQxqm+EKiyMCLzX8hOuWcVX0y8X4nIkZW/Xt7qk7TUkBRXwK7vAczjs
	 cjNsIkW/lbZxlEixv8WY76x62Ne7KV4a7JuCVzOab2iHI96RhHYp0cXWNLIGkn0YRb
	 F+Q5VnzNMCM/kXGsVgoDm8ny6/0jPm0IG5Q0BPOW3nPtP6HeE9aEptV/xNZcK6Y5jv
	 V+CcCGfn6ig6g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CC01CC43159;
	Tue, 20 Dec 2022 14:48:04 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <2e5e43ed-ad33-45f7-b270-5b4ae46a78fe@app.fastmail.com>
References: <2e5e43ed-ad33-45f7-b270-5b4ae46a78fe@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <2e5e43ed-ad33-45f7-b270-5b4ae46a78fe@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.2-1
X-PR-Tracked-Commit-Id: 6f85602d5fdea936077060ca6853587f01716a45
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 850f7a5cab3314fb26547d636893eb55b4c5527a
Message-Id: <167154768482.15660.8459219935666728905.pr-tracker-bot@kernel.org>
Date: Tue, 20 Dec 2022 14:48:04 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, inux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Mon, 19 Dec 2022 21:28:11 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.2-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/850f7a5cab3314fb26547d636893eb55b4c5527a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
