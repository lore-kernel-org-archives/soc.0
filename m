Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D385C6FD18
	for <soc@archiver.kernel.org>; Tue, 25 Apr 2023 19:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E081FC433D2; Tue, 25 Apr 2023 19:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE7CAC433EF;
	Tue, 25 Apr 2023 19:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682450762;
	bh=ilty1F4Eaj3edJRWABRto6LvIKM845D25nExOFDA6tI=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=QnusxCXMgJMK8xP74H1+bWlL3CPn633fJxmS9HzdXHj8YgDV67zTKsSFSmGPdwQjE
	 JmECzrRXJdqf1Y1VaMiVcg9GaiGOlFvNY+wee0za5M5N+BxW7F0qrbSsVVMWVeSfdZ
	 hrqKOIjBopLHB65RBZjgYu4v5hqgtUVNE5D5leZ7O9wKsgDl7y3Y6qUUpcs2chGjgJ
	 tDZsyoiBQVEjuUIXd+kl4wPmJn7TlQWy0GEWb8uDC18JfziRpa8A+SIrmLw0zB2mWK
	 /8Us390+23FisPNNR1S3Y5FFg6h7btiQ/G0FTFZN5AfjkQmmOj8LWFBF+wGSopTmpw
	 WTzOUtHho4R3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AD170E5FFC5;
	Tue, 25 Apr 2023 19:26:02 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] ARM: SoC changes for 6.4
From: pr-tracker-bot@kernel.org
In-Reply-To: <c7193321-21ff-4ac8-9aa2-27e18ef24236@app.fastmail.com>
References: <bbd25997-173e-4c3b-930c-65c6232908e3@app.fastmail.com> <c7193321-21ff-4ac8-9aa2-27e18ef24236@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <c7193321-21ff-4ac8-9aa2-27e18ef24236@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.4
X-PR-Tracked-Commit-Id: bd2c0c4452eea00e22c4008d8e64e58fa73857e5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 18032df5ef5c0eec2adf120142bd95a3a8807866
Message-Id: <168245076269.1749.6053043092303904467.pr-tracker-bot@kernel.org>
Date: Tue, 25 Apr 2023 19:26:02 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Mon, 24 Apr 2023 22:59:28 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/18032df5ef5c0eec2adf120142bd95a3a8807866

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
