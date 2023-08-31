Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3EDC83F16
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 00:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CAB57C433C7; Thu, 31 Aug 2023 00:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEE18C433CA;
	Thu, 31 Aug 2023 00:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693440617;
	bh=BGA2qfb1LlZXSNhVAeq0UOX/RKUXhTX/73fn2OI5S8g=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=ebp61aCwTGO6HC7wqHwVfiUhvmrCF4SKj0Nh0boY1AbwQIyL6ZV6OkwJaQJ9PCota
	 ETilOCzwYn4k1gDZk7/03jytk4FZlY5xbL+noyKmYiH55+RVDj8z2HrVWex9SnPgkE
	 KMkRYH/WCClONbQiMZvZ5bU8cXvn4mvcIzRoGUMMm39oHz03tr+K0caxYTVW/pfHJ/
	 Ar2mfhu3d4osbCuBZTxrgtoq9UaA0HxAEupneZ9Q8EMg05uAUmu123AYAGB/h+ZwLp
	 Hc5vQ3ulFwlvRIEfnxA2wsBzsWQarIR5pGZkiZ6jl3fuNu2JjhBxd/G2+0yDYG68co
	 nHfZ/R70G+lRQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 97193E26D49;
	Thu, 31 Aug 2023 00:10:17 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] ARM: SoC cleanups for 6.6
From: pr-tracker-bot@kernel.org
In-Reply-To: <de2a0d53-a35f-490d-82a7-864493af6687@app.fastmail.com>
References: <4f60d13e-f060-491a-88c7-6f25323a48f8@app.fastmail.com> <de2a0d53-a35f-490d-82a7-864493af6687@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <de2a0d53-a35f-490d-82a7-864493af6687@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.6
X-PR-Tracked-Commit-Id: 6e73bd23a1cdcf1416ebd57ff673b5f601963ed2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a1c19328a160c80251868dbd80066dce23d07995
Message-Id: <169344061761.21437.8791905247837147155.pr-tracker-bot@kernel.org>
Date: Thu, 31 Aug 2023 00:10:17 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, soc@kernel.org

The pull request you sent on Tue, 29 Aug 2023 17:53:21 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-arm-6.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a1c19328a160c80251868dbd80066dce23d07995

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
