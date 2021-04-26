Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 294A1C433ED
	for <soc@archiver.kernel.org>; Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DFA8A6135A; Mon, 26 Apr 2021 19:42:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C6267610A2;
	Mon, 26 Apr 2021 19:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619466151;
	bh=W77jfaIuXlxHG2GipRst8hYgJAPLCmcaDycK53d+bFA=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=g/HpiSGpEKFCCoYm0bDWO0pb+TiiBzqRkJQjAWAdwOXkGqJuJXekn9crBLXg5Rf1F
	 wrdTLkuB5yOpIyOTfW8YddBXn2aCxHudWEl6RH9H71kst+mhB5ZtINo84vFiXSDr9F
	 kcxZuK+lOiddd0NYTHEOtMaQB0u/4Lr2MV4GDtj6MhSN0X+C2wYKOKGTZpqO0Mx65S
	 edHBPdQarFd7BhUFetjwRGUA1wnMQB/mJ3xzj4aVuUkP4xqd5/GzleaoYYVy+ChM3Y
	 uroJnqZ1sQOZ6ImNkttNKpG16ntldlyA82IksYh4N/R0dUpZXCKA8Wt7MSqDYTflXj
	 ewazcXZI9r+gA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B9434609AE;
	Mon, 26 Apr 2021 19:42:31 +0000 (UTC)
Subject: Re: [GIT PULL 1/6] ARM: SoC changes for v5.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a08ONpuYxcNOOr1Yr04SYosAPKH+i=PPp9h0hvhknn+Mg@mail.gmail.com>
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com> <CAK8P3a08ONpuYxcNOOr1Yr04SYosAPKH+i=PPp9h0hvhknn+Mg@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a08ONpuYxcNOOr1Yr04SYosAPKH+i=PPp9h0hvhknn+Mg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.13
X-PR-Tracked-Commit-Id: d92e5e32fb4fce7ae939ad322aad77955dd5dcda
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 01d7136894410a71932096e0fb9f1d301b6ccf07
Message-Id: <161946615169.4821.6059481784147393808.pr-tracker-bot@kernel.org>
Date: Mon, 26 Apr 2021 19:42:31 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Mon, 26 Apr 2021 17:53:31 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/01d7136894410a71932096e0fb9f1d301b6ccf07

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
