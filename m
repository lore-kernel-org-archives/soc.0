Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9C5C7EE31
	for <soc@archiver.kernel.org>; Mon, 27 Feb 2023 18:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6FFB0C4339B; Mon, 27 Feb 2023 18:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58BCAC433D2;
	Mon, 27 Feb 2023 18:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677521897;
	bh=KYjFuTLnLZCaTRQkgpyyJGpEttKU3lTKqw0LAl6tvxI=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=hXstnScp2qgc0kduiqpJ1uiaPdY10Q6QSVro19j/NE9e32XR6H3ncQ7oWr7E2hu//
	 n/+mqhepzca/ghYs/UzhKdrqJ9fPXBOKUqZShZNmLg6ucTeGgGT0voVucPbQub6Vml
	 ivIYgjhSDHobjVQPZcw5e4cGo1Pv7GUYsK0G3UtqKjVZPuGQFw6pym8bcdXtDMuCq4
	 s4oNmJkrVrLEZkxYJqLRkFZbHlMG/ogt5lgte3mhrc9kky3/Lz8Qg+ez/d7JpLnxic
	 /U3zvSYl/1yCwmy20qK/pRiwL8XZRfDEgXNcchNXdUvc28+sqYZ0d1ti7+ukd8JdDW
	 4B44spLuIWgKA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4886DE1CF31;
	Mon, 27 Feb 2023 18:18:17 +0000 (UTC)
Subject: Re: [GIT PULL 1/2] ARM: SoC drivers for 6.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <99657e61-81b7-4f03-b81d-fd2a49e67eef@app.fastmail.com>
References: <99657e61-81b7-4f03-b81d-fd2a49e67eef@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <99657e61-81b7-4f03-b81d-fd2a49e67eef@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.3
X-PR-Tracked-Commit-Id: 524af30c931382726b6a46ee4f392fb6e60f8a03
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 11c70529983e8136ea1bd5c32e4f9cd14503c644
Message-Id: <167752189729.27343.10877911239622158294.pr-tracker-bot@kernel.org>
Date: Mon, 27 Feb 2023 18:18:17 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Mon, 27 Feb 2023 17:56:07 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/11c70529983e8136ea1bd5c32e4f9cd14503c644

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
