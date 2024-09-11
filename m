Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E9BEE499C
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 18:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 762C8C4CECC; Wed, 11 Sep 2024 18:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE63C4CEC0;
	Wed, 11 Sep 2024 18:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726079460;
	bh=PJu19hHRtBZxiY71l+HTEvh4vWY6Vbzn9N0RtMa9Em8=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=EZ0vavJ4S+kyuOk4960uPV7NkQH3zQ5QtMD7xoAFxITYoBQKHLRW0w13gzg+3twW3
	 tbM+bmS6/khiUVIQCFMg+P5STS9QCAFkPqFnX0VKPZIOqdrJhirgqryR9l8GfkBUFl
	 Os+QZmmAgbNMl6f5uuZ6QBSFMMIskEysEkKeZHYpMH07H6JASxqpAitJaOAOktkBML
	 er5V85NJcwlKj1M5LPxv+qIzCulgaPmnNT7ZUeTGPON8ju0F/aD7vtLG6rkvI+giQX
	 jlVuKFuAjcveaAxr+p9xQhGiWpKC/bAbUItawr3NesIL8DtDSzR43rQF2rabPUzKGl
	 vDud/VQY+Y7uQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE3233806656;
	Wed, 11 Sep 2024 18:31:02 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.11, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <58c9776e-0e3a-4b00-bea8-47a7bcf2af37@app.fastmail.com>
References: <58c9776e-0e3a-4b00-bea8-47a7bcf2af37@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <58c9776e-0e3a-4b00-bea8-47a7bcf2af37@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.11-3
X-PR-Tracked-Commit-Id: 0e7af99aef5f58b4bae00e45fd1c2626a987f7bb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 77f587896757708780a7e8792efe62939f25a5ab
Message-Id: <172607946129.1012158.17735590154685557004.pr-tracker-bot@kernel.org>
Date: Wed, 11 Sep 2024 18:31:01 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Wed, 11 Sep 2024 15:08:02 +0000:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-6.11-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/77f587896757708780a7e8792efe62939f25a5ab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
