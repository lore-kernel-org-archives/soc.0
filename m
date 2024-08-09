Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97B5C52D7F
	for <soc@archiver.kernel.org>; Fri,  9 Aug 2024 17:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98D38C4AF0D; Fri,  9 Aug 2024 17:31:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4E8C4AF0F;
	Fri,  9 Aug 2024 17:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723224678;
	bh=O1EoVfN0axuc6J7bqQ8A5iRsV/1aBKZQ25lmTlLhPjI=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=M7RXTHfDefGY4xfPxaph/2OvPXIInYs+NjfU50AJAD09Qy25+YAsbN4kDYA33eZ4T
	 rOczrxr6Htz2qLJ7BoweHWlW8gASXkZzYBDtbahEslg5RKQ15gdvGeNnLcMBkHv7Fe
	 PK95ssCmmQVEFWSHgDR8BjmA05A3PRXVi4u7h0B9ekw5PybM/lC20AL5YBz40Dmk1M
	 as4/Nu/4lLhcNjdcJ8ItARqpn9JWU5gUMxftJcFEx8TYTUq0yA4CARw9kAsE1RaEHa
	 jlKMSZqPR5biOTbqPmBceOAAodiAZG/HmK5T3S41PusbTiHLXbOs9wpvf0AJlqbXNp
	 cFzQEPxcgo0Cg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF8E382333D;
	Fri,  9 Aug 2024 17:31:18 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: soc fixes for 6.11, part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <3e7ea374-c321-4f80-b22b-96ce34cfaa3e@app.fastmail.com>
References: <3e7ea374-c321-4f80-b22b-96ce34cfaa3e@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <3e7ea374-c321-4f80-b22b-96ce34cfaa3e@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.11-1
X-PR-Tracked-Commit-Id: 6b1124c4526fb1648a3921a441515ea8a98b92e4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0f135d3e30c43be2034299c560272e18c6166d04
Message-Id: <172322467742.3855220.5657620502052364057.pr-tracker-bot@kernel.org>
Date: Fri, 09 Aug 2024 17:31:17 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Fri, 09 Aug 2024 18:00:11 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.11-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0f135d3e30c43be2034299c560272e18c6166d04

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
