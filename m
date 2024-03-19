Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267C9C54E71
	for <soc@archiver.kernel.org>; Tue, 19 Mar 2024 19:29:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBA4DC43390; Tue, 19 Mar 2024 19:29:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE156C433C7;
	Tue, 19 Mar 2024 19:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710876577;
	bh=XBwcvceklDhaxQrsFLdGls4TXb9+1SQL1zTg6B54TcE=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=WkMaiN1FI39mKgp0xwz2DH5xzD+tYWm3acfIFWAA1/HuEuDS/4/bu03huT81kI3Gc
	 +0swYRnKa7uwNSbsjr5B27elYBof8IFuDeA6+TqILGarD1sHsiCgQ0EkssmRry6Prb
	 KNme/mL8cnTolwMFAyn/yBZh767ONPVjRJXhuLnBl6b8brVq/BFIquxSkEuRj5bUPH
	 /bviHl46VM6JslIQ8lwpnyYvmgUOV5R3i/w8U/Dpk0g+vqA3/VOK/hiTu8Vmi1n3P8
	 fFapHHhH+Mfd0bLMAL8VicY6Q+ZpkTgEECSaB+YfRlf2SBDk5CDyh3SfUYwl7sEaQ1
	 3QbpBanMhT5AQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C41E4D84BB3;
	Tue, 19 Mar 2024 19:29:37 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: late SoC changes for 6.9
From: pr-tracker-bot@kernel.org
In-Reply-To: <2227a206-d1b8-40e0-812e-c9b601bc0cc7@app.fastmail.com>
References: <2227a206-d1b8-40e0-812e-c9b601bc0cc7@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <2227a206-d1b8-40e0-812e-c9b601bc0cc7@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-late-6.9
X-PR-Tracked-Commit-Id: 72ebb41b88f9d7c10c5e159e0507074af0a22fe2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 78c3925c048c752334873f56c3a3d1c9d53e0416
Message-Id: <171087657778.21820.7525957113688823111.pr-tracker-bot@kernel.org>
Date: Tue, 19 Mar 2024 19:29:37 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Tue, 19 Mar 2024 17:32:22 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-late-6.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/78c3925c048c752334873f56c3a3d1c9d53e0416

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
