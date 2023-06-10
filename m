Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26E8C77B7A
	for <soc@archiver.kernel.org>; Sat, 10 Jun 2023 20:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3B0EC433EF; Sat, 10 Jun 2023 20:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 890FFC433D2;
	Sat, 10 Jun 2023 20:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686430486;
	bh=NQJsPOG3kOUtOnYf7wqq+TDCR8gcnzRoO2NZnRSBgqc=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=aIA+hs+29gQnfKPUMWBTwZXkhw6WoHTVeXC0VztdWqPN6K2NuDbeXHkpiAx7CYb9o
	 aSC33QWPOfQeE1OLdcYMAN4f5xfyh0ClUbAyP1Fb9itpf7P1QZi1+8nKP6nFArl2xS
	 ENqMq399YD6AthAC6z054cp5IWZCP70vz+j55RuFfJlLwZ9qa3M4JohZIj62PcA0T3
	 y60BeQjIgHHNFJwj3RogHWYut3SdAcajBrS1ufCGnPyY5fJWC7n+1movcdWh0i5tuB
	 TxzvP6XUjDMLqw4CHWlLy4+oMfCmzWibhMG5LSp2nV4r2rEWjdCz/XuoJZ1/UinY5u
	 JIaDHIv2xIrGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6AFADC43143;
	Sat, 10 Jun 2023 20:54:46 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.4, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <ea181a04-d093-4c1b-bd87-01036d301567@app.fastmail.com>
References: <ea181a04-d093-4c1b-bd87-01036d301567@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <ea181a04-d093-4c1b-bd87-01036d301567@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.4-2
X-PR-Tracked-Commit-Id: 5cdd5ec176544a3f5b18591577cfab2fcdc13c79
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 859c74595156f894c4e8edd523c6d1c4a1899127
Message-Id: <168643048629.9094.3941160630305987651.pr-tracker-bot@kernel.org>
Date: Sat, 10 Jun 2023 20:54:46 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Sat, 10 Jun 2023 09:00:44 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.4-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/859c74595156f894c4e8edd523c6d1c4a1899127

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
