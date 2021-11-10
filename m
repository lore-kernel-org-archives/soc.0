Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D0EC433F5
	for <soc@archiver.kernel.org>; Wed, 10 Nov 2021 20:09:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4C2B561241; Wed, 10 Nov 2021 20:09:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 34E1A6109F;
	Wed, 10 Nov 2021 20:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636574991;
	bh=HzQryat/nU6Ul3b5vA4Vbi1qCwWjWbaPsS9BBfi97WY=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=t4iNoGXl7I/mjiRufs7kt/GpLLC/JdKDj0yGawEtMySPUs/ER2VQ7t77FURXyGkIH
	 Xsn1aomyPGuVOU9kNppQDBUDOubRU0K/NZkyI/xn0x8JWgJdHIKbO0tySxgSN5WYaj
	 HndYBbQKGbEzcnxtKI7jl/DMOL1nU+MOINqY0ua92WttBEw4SWRiwVrVHb/30GkEmb
	 XBjc0xjaN38Dj8+HpqejvEcqLwe7bisS0XtX9yqch1I9fJIGLDuS41L1FuWLHGYdpw
	 3MIO9LjFJhdbABfXPbQVXJeV+7078fGeTdZbLwxSTVAxOXA3COGNFVhHgXNgyntiC3
	 H5gxDwXq9GLeg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 20CD460A6B;
	Wed, 10 Nov 2021 20:09:51 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a29J4j=PDZfdgKO6bJ05ZCTcqbVJx+8c=RmrU4dXmS8QA@mail.gmail.com>
References: <CAK8P3a29J4j=PDZfdgKO6bJ05ZCTcqbVJx+8c=RmrU4dXmS8QA@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a29J4j=PDZfdgKO6bJ05ZCTcqbVJx+8c=RmrU4dXmS8QA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-5.16
X-PR-Tracked-Commit-Id: 76f79231666a7a3c9a1db82c002e083125de5861
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3f55f177edb88293bad08ebe217d3ce20cda427b
Message-Id: <163657499107.19350.16919065852604641580.pr-tracker-bot@kernel.org>
Date: Wed, 10 Nov 2021 20:09:51 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Li Yang <leoyang.li@nxp.com>

The pull request you sent on Tue, 9 Nov 2021 23:49:23 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3f55f177edb88293bad08ebe217d3ce20cda427b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
