Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FCEC83F15
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 00:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F4A5C433CB; Thu, 31 Aug 2023 00:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03A78C433C9;
	Thu, 31 Aug 2023 00:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693440617;
	bh=tDuHhvU8y7hKfu9wD3s87e3W/7cxrrkavAGudJu1fi4=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=Umt3USP95yYRF0EhwDny7V6cUaIDB8EUkWt5g+PAGmR7fkxhB41ep37E8wN5seqYd
	 eKmdDgp20uPzjwBr/+USVs4EVLZYefLR7nCxVbcYDoG9Mv5LINSx2VaGWBaNwXVIlp
	 TQKZIy7/eusxEnUP23cXX21ts3tJJuIm92O27dK/anma5MPekBdre/KcTbLlpx1s2w
	 LK65RX6SVb7R869+e2NizjgDK3OVwUgV9UwitWc2xAJwEVtgPOuGQTAQi2oewIxz9p
	 HtHxDyoU1TMUIKayvAZLRDWi9qU3a5sa9Fa4JwpYj32nXH+2E85fNtYLb329ncazgY
	 jDW5HGrSlD9nA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DC0E5E29F34;
	Thu, 31 Aug 2023 00:10:16 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] ARM: SoC drivers for 6.6
From: pr-tracker-bot@kernel.org
In-Reply-To: <a5236f8b-4a4f-422b-97c2-7691e2aa1468@app.fastmail.com>
References: <4f60d13e-f060-491a-88c7-6f25323a48f8@app.fastmail.com> <a5236f8b-4a4f-422b-97c2-7691e2aa1468@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <a5236f8b-4a4f-422b-97c2-7691e2aa1468@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.6
X-PR-Tracked-Commit-Id: 09959520d2b0853a16962d245acfdc995d1b0da9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1544df9ab4003f9f6b9894d48a235cd1859e7db3
Message-Id: <169344061689.21437.18142125971131936678.pr-tracker-bot@kernel.org>
Date: Thu, 31 Aug 2023 00:10:16 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, soc@kernel.org

The pull request you sent on Tue, 29 Aug 2023 17:49:32 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1544df9ab4003f9f6b9894d48a235cd1859e7db3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
