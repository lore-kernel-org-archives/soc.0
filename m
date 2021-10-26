Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51AE4C433EF
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 22:28:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2FBB560D07; Tue, 26 Oct 2021 22:28:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1883E60F56;
	Tue, 26 Oct 2021 22:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635287298;
	bh=YiqjPuCL7P/Yk9OoncglK79wUyifM1/49dvwin6NJF8=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=ar0WLGwCZDpByWqo1PZ/RZt/6c3mtYlHwR7DLmrhaiKhXVMVwD2lKI5+65WtyNi/u
	 rZ0/KZciivoUSDWejrPEio0PgXF6Il12PSuIoU7tyxu7cnaby8OTFcdg5PXJggMuff
	 qhAeNNlIAqxVsBNzVWZOOiWUAK9ag+ITtf+tp6xveqN9cyjq/FxHHq+Xhx35pjvJ58
	 QXoTi76LmdVZ0vyj6NkLPCXOCQaXQ+z6t8uk39D6OysGG3U4bHEX+qXlXJ+BTmWsZI
	 BcrE2YknA+QF0c6KvtTH0pQwMgpd0j1cyD2V7oR1XgqMcmpOojJRUZ5hq4FK2dtKmT
	 Rjk4gyvtbKHPw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0315A6096F;
	Tue, 26 Oct 2021 22:28:17 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.15, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1VnXSFeb5EVAG4MYP7P3bTE=Tyn6uKk_2OcJ0C69suSQ@mail.gmail.com>
References: <CAK8P3a1VnXSFeb5EVAG4MYP7P3bTE=Tyn6uKk_2OcJ0C69suSQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a1VnXSFeb5EVAG4MYP7P3bTE=Tyn6uKk_2OcJ0C69suSQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-5.15-3
X-PR-Tracked-Commit-Id: 05d5da3cb11c91c39e607066d3313a6ce621796a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d25f27432f80a800a3592db128254c8140bd71bf
Message-Id: <163528729795.22811.3423318567980476285.pr-tracker-bot@kernel.org>
Date: Tue, 26 Oct 2021 22:28:17 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Tue, 26 Oct 2021 22:51:25 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-5.15-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d25f27432f80a800a3592db128254c8140bd71bf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
