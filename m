Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE4A1C64ED8
	for <soc@archiver.kernel.org>; Mon, 27 Feb 2023 18:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9962BC4339E; Mon, 27 Feb 2023 18:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 833F1C4339C;
	Mon, 27 Feb 2023 18:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677521897;
	bh=8zMii7RdJkzaXme2aJKy3sywyO6fuoikqIRHHe+qg7Y=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=RkWCDLIBBzUKFcMkAwZBVK4EkaHHSJ+nuiveqal5H3SCELfaLCE7WHVO9WmmBktNC
	 cO5JUJD4++qVTmTRXv17YyzxKJEJTywp7rgkjOwZVF00r5ja4HMR4fLuEMrH65aiYT
	 4/JJmI5AQ+tgmzE3U76HnUDxfVl406l4bkj1qVPLnaPHzhLBhEM6CWW/NsIgCgSfQZ
	 5xRR+43E/lG/4/DALTpy+4xFHuPG5uWRXQHqLEDwg3GLyBsWdykbG0Eu0p7lROnudn
	 Tp+j0WaSoZEWqsNuowLiv2ch7yQZLW0JWi0px+lS5oYjbhTh4wENLg9ptbTIpVTFF3
	 s5P0JNabbA4dQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7325BE1CF31;
	Mon, 27 Feb 2023 18:18:17 +0000 (UTC)
Subject: Re: [GIT PULL 2/2] ARM: SoC fixes for 6.3, part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <413dd8bd-32d3-40a3-93b3-a3c9e3d8e621@app.fastmail.com>
References: <99657e61-81b7-4f03-b81d-fd2a49e67eef@app.fastmail.com> <413dd8bd-32d3-40a3-93b3-a3c9e3d8e621@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <413dd8bd-32d3-40a3-93b3-a3c9e3d8e621@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.3-1
X-PR-Tracked-Commit-Id: 9f79762ef8d90a6fab85e4ac0d153bdd8b4868ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 982818426a0ffaf93b0621826ed39a84be3d7d62
Message-Id: <167752189746.27343.18254730459480644662.pr-tracker-bot@kernel.org>
Date: Mon, 27 Feb 2023 18:18:17 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Mon, 27 Feb 2023 17:56:57 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.3-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/982818426a0ffaf93b0621826ed39a84be3d7d62

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
