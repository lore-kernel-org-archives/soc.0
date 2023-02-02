Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F45C61DA4
	for <soc@archiver.kernel.org>; Thu,  2 Feb 2023 21:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7AA0CC4339B; Thu,  2 Feb 2023 21:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EED2C433EF;
	Thu,  2 Feb 2023 21:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675371887;
	bh=k68USTMhC1GzSMsLtIKDm5R99bEZknorPTTLNm/5frw=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=fjiQ2E2OpPglxr26B8/7cveGZSw3yO1nCZ4gE+3gD46+n/Es4BnwGNcrHnQFrNikw
	 hfF69BKucp3wgLNYFVT8nYre8XlaPvwkv07KjNHsJoabhxFe3PL7L1fxeu42iwnTBU
	 Jo/dA5GcGN0OmRtXPUqeLdIiU39e3PukqbXJOwHIT6th6lhR2pSpRYB+5Tk13wOXvR
	 OF0fCdqJFG8dmP8eir/KpRjD5qdr7scaNhBfEf8aDELXSqCDxOcUPVPZVBlTtQZEfO
	 2PmDXdpG2L5k60Ix7FbkPMivxws4OvGNRSnHTh9L9I3dXL54/Iprs1wFmw4/nlv+8M
	 XcpUu5V9Jf2pA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3ECB7E21EEC;
	Thu,  2 Feb 2023 21:04:47 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.2, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <98b46fed-4b4d-46f0-8975-d07df36534be@app.fastmail.com>
References: <98b46fed-4b4d-46f0-8975-d07df36534be@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <98b46fed-4b4d-46f0-8975-d07df36534be@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.2-3
X-PR-Tracked-Commit-Id: 5efb648042a1c3d1734e69ebbae2fe9477f4fc4d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 42c78a5b29c47ad913993bcf845bfc39e2ed8c8b
Message-Id: <167537188725.3773.14554508240108748616.pr-tracker-bot@kernel.org>
Date: Thu, 02 Feb 2023 21:04:47 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Thu, 02 Feb 2023 21:53:40 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.2-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/42c78a5b29c47ad913993bcf845bfc39e2ed8c8b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
