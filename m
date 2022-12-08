Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0E0C4332F
	for <soc@archiver.kernel.org>; Thu,  8 Dec 2022 19:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89FB7C433F0; Thu,  8 Dec 2022 19:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 211D6C433D2;
	Thu,  8 Dec 2022 19:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670527593;
	bh=NMG6ALVDlfsNvt3OA8+V9P2aBVlQPOg+9d6T7dyYOdE=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=ToB8gQdCEGbtXgRkgsg0pI4k0CHjhxusLcurdSKtmPu4FRDrma4DCzr1gJvos788H
	 s6dw47V8U1Tg4kYUgQrgCJkZPe/fp+7lprRNdDiGdxzEB72zH1EiwVC0mGds9633h2
	 vkk/nKnR1qys8R27Nv8GqlSyiIMek3VsopjiIamfAP5ygEtGOmodTFumUhSUj9XDQv
	 +jX45dx8ygs4GXz5keoBmEd11EL/Mcl2USBTH/k07DuHOCD5S5HnGfA4MOmQxi4uVD
	 /RL646JG5Y5AZQhDD/jDkj+hJQcX7/Pe0fpzug8FzNW7DsIE2KyzZqEr8p+fpWGfGq
	 MdTxOCs/Qo+zw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0D786C433D7;
	Thu,  8 Dec 2022 19:26:33 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.1, part 5
From: pr-tracker-bot@kernel.org
In-Reply-To: <c6664af4-7a91-401e-a079-e700e9ff5bbf@app.fastmail.com>
References: <c6664af4-7a91-401e-a079-e700e9ff5bbf@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <c6664af4-7a91-401e-a079-e700e9ff5bbf@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-5
X-PR-Tracked-Commit-Id: da0cbf9307a227f52a38a0a580a4642ad9d7325c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f3e8416619ced89abd5b1254f29d0c3904297298
Message-Id: <167052759305.15249.2823069431065327000.pr-tracker-bot@kernel.org>
Date: Thu, 08 Dec 2022 19:26:33 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Thu, 08 Dec 2022 14:22:09 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f3e8416619ced89abd5b1254f29d0c3904297298

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
