Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F6AC433E6
	for <soc@archiver.kernel.org>; Sun, 21 Feb 2021 02:57:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8BD6C64F02; Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 627A264EF9;
	Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613876251;
	bh=LCK0VHBAKoWSQjOxwjyyLU88OlNKxcypa4CM+z3N2dM=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=EfuCmyFZniP3N63Q+t8i9te0/sddFbwAM9ufv273mXaSRWlAymxTI+IjgOZbubSKI
	 1ShovOwBUGHsU8sxWfHx/9e2HCVqFStPbt7tWqva+jE/opLHr+PuUcgXxUD/cLoFXP
	 Z4Xd3Xh6cQjI+NP8C6+EqiEg/OifsIwMFQIC36ev9Hb62JFqHxXEVFZQbzi2zoRfIe
	 kHX9zEHh4Zc3ITyhB8fuqr+JH1ojS3I/LijJdb+ribgMcADn+AnzhyMkFJfIwDFmi2
	 3URe2TaAAUi9EhjWVJ/nFtME1unqvbduwxUfIW+cdnyNjKrYA0IYJYq2hXrEUhqfIp
	 hRwSvDDl0nDhg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3D71460A56;
	Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
Subject: Re: [GIT PULL 4/6] ARM SoC defconfigs for v5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0rK+By11RG+A5NxJ5kWQCWzB3Qs7BFiJfL8sqRtMt2ww@mail.gmail.com>
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com> <CAK8P3a0rK+By11RG+A5NxJ5kWQCWzB3Qs7BFiJfL8sqRtMt2ww@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0rK+By11RG+A5NxJ5kWQCWzB3Qs7BFiJfL8sqRtMt2ww@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-v5.12
X-PR-Tracked-Commit-Id: 21e4675d9305f6ccd20b95d943882d607c8ae288
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 56bf6fc266ca14d2b9276c8a62e4ff6783bfe68b
Message-Id: <161387625124.20427.12672981125117094900.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 02:57:31 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Sun, 14 Feb 2021 23:44:16 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/56bf6fc266ca14d2b9276c8a62e4ff6783bfe68b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
