Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A35AC432BE
	for <soc@archiver.kernel.org>; Fri,  6 Aug 2021 18:48:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DEB64611B0; Fri,  6 Aug 2021 18:48:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C54B761167;
	Fri,  6 Aug 2021 18:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628275690;
	bh=k+L6rBPh3HvvOPvgzwY0kCL3EBhyVF10Nk5JHB4zwVY=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=QW5zxP0751pJDQZdrJGzhoej0CCrIr/SbKX7CZyf4aKLOC1B8A5SO9IByYUrW62Gy
	 pjGqobeCduO/TQdyhsMg4Urk2U+SZGs6W4RTZIfaLiR0PwBXvjf/WDNut41yY7luS5
	 2UDG288+9XDIlLXva6DwXNh0xG9x8ot6909ruD9Wc84dJfm9/iq86exHGuX/6tZ0xA
	 /LgteHHNvw+lqbTJj5HBwacRW0d33VzTOLxdKqNkpBa2G2Rz90ZI+rzLt9VBf5XVWI
	 8YfGG4bC78LOOd/DkqqRJXV/xbfUry6KhBGOJLmLw0iefmoFk091wtIkoZb12Cwc4V
	 1UR0+rVgZEtrA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BFAE2609F1;
	Fri,  6 Aug 2021 18:48:10 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.14, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1u+0tJUqnSOWmC5ixdeGGoBb+mVv30rc65Bjy7a1Wo7w@mail.gmail.com>
References: <CAK8P3a1u+0tJUqnSOWmC5ixdeGGoBb+mVv30rc65Bjy7a1Wo7w@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a1u+0tJUqnSOWmC5ixdeGGoBb+mVv30rc65Bjy7a1Wo7w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.14-2
X-PR-Tracked-Commit-Id: 19c1eb3605a1bcd784726380f520925948b2962e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3dc064d29dfbaee66a08ff1cfbb2dff4439302fe
Message-Id: <162827569077.18689.14862501008139983565.pr-tracker-bot@kernel.org>
Date: Fri, 06 Aug 2021 18:48:10 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, Jens Wiklander <jens.wiklander@linaro.org>

The pull request you sent on Fri, 6 Aug 2021 16:26:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.14-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3dc064d29dfbaee66a08ff1cfbb2dff4439302fe

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
