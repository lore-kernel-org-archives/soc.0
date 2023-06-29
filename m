Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BD8C001B3
	for <soc@archiver.kernel.org>; Thu, 29 Jun 2023 22:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C13EC433C8; Thu, 29 Jun 2023 22:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45C36C433C0;
	Thu, 29 Jun 2023 22:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688078361;
	bh=8WYZOi/aDgId4eGpgDDN+lQ7ySkeBWvBbJx4ZvQXLCs=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=q2diZgyoEYVnnu8hTDWtD8EEZq/JHhhlzNg4jzNs0cWp7XIrIRrxHK/LyFzFRWrY4
	 fSAjaZ7tgWq0i4h/wx3gIXqKrkTQ/oUcL13wRVQ27iPv0107jltW1Bk6m/oYRxiF+x
	 hO4+xH/sHBMVBciJV+YaNfo+eQIzfuh1lI/ngrkNb73M+5zX+/uLhfVPtO55XbIjLF
	 JzsFrfQSv+cMcTgRocYiBaHhg8RA0/whRNGno3Q0Aq5zcmCHiDsOx3gsvFTbBxIf6j
	 5kF2dDlsQWj7g4t6lzs3S1JiBTTGIjrXRPSuFn5IBHOLfByBK0HFFBEnIBspbAaCVf
	 jjStEszpQBl6g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30F70C40C5E;
	Thu, 29 Jun 2023 22:39:21 +0000 (UTC)
Subject: Re: [GIT PULL 4/5] ARM: SoC defconfig changes for 6.5
From: pr-tracker-bot@kernel.org
In-Reply-To: <850b11a6-4f23-41dd-ac14-d8663683d1f6@app.fastmail.com>
References: <80fba92e-3836-4d27-8be6-1e5f7b5b2f53@app.fastmail.com> <850b11a6-4f23-41dd-ac14-d8663683d1f6@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <850b11a6-4f23-41dd-ac14-d8663683d1f6@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.5
X-PR-Tracked-Commit-Id: 2b24391767ae6897dff6eeb521f01d495bc27b55
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0873694a339821277d9f2cae7ef981a1283b44f5
Message-Id: <168807836119.26000.6447730228997347802.pr-tracker-bot@kernel.org>
Date: Thu, 29 Jun 2023 22:39:21 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Thu, 29 Jun 2023 17:22:41 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0873694a339821277d9f2cae7ef981a1283b44f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
