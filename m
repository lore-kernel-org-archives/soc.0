Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B2DC6379F
	for <soc@archiver.kernel.org>; Tue, 21 Feb 2023 00:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D232C433A1; Tue, 21 Feb 2023 00:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01E6AC433A0;
	Tue, 21 Feb 2023 00:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676937933;
	bh=0BknEinYUY92zZyXH0Ap7BIDWPn8b1jhFLFcJlEXZpU=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=bxbcOez1eMwsk7815dgVKxYxj6OjKILWrU40rIKoLrIqhy8x1vSZVgEzsxpEb3qC6
	 6cThxITYtGYL2uwNBzIE2gkHmFCDNH/6UQHZ1Qq7Fz/W88Dwscn3Y/vq/+5mo2+Z/B
	 l9FRqecj5TlH0WGUtxNXVKqEXS80aNGqPooS5sICZFSIIZSNSvM33e5KHKCatQ2fLh
	 kRJMq+poOm3WJm4p4FTWHBlnMJj+eo281LqbF+3wURz44dgq7Ixw27X7xMfVuNZEN+
	 ZLKvODXLJzuF63JqQ6KPuia5qxG+Z4iPpSznf+m0Kfx8Zp3xwVG2dR1iVw95CbvfB3
	 dpAhXNK3QtZzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E6282C59A4C;
	Tue, 21 Feb 2023 00:05:32 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] ARM: defconfigs for 6.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <f2e84e19-e8ab-4b50-befa-6560512500a2@app.fastmail.com>
References: <99179367-0d59-4938-b44c-ca9408ad784e@app.fastmail.com> <f2e84e19-e8ab-4b50-befa-6560512500a2@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <f2e84e19-e8ab-4b50-befa-6560512500a2@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.3
X-PR-Tracked-Commit-Id: af16544d4abe283e4a1ead6563ae883b9bb35429
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c72e04c26faefc6650709066a8f019a7fb4cbb84
Message-Id: <167693793293.20221.7830546468652977503.pr-tracker-bot@kernel.org>
Date: Tue, 21 Feb 2023 00:05:32 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Fri, 17 Feb 2023 18:26:17 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c72e04c26faefc6650709066a8f019a7fb4cbb84

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
