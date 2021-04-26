Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AF7C43462
	for <soc@archiver.kernel.org>; Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9E94C613B2; Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 86C9B613AE;
	Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619466152;
	bh=aXOP3JIomXu1pAVOHaJs3BXugpMdL8yTf7vN7vdgK3A=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=Ta7M2YumvURciw2Z4iPqgDNF5vt879waee6DM9/diRLe+248b1mpKgQG1//r6gu++
	 H0xkmfcjKHtUXxzAxQgWlKJcdQXndkD8+kYScQKCjr7jtd9gdSKvu97CO/TvrU4IJl
	 clD+vBm3cTtkebYFztBGcQWMiGjFuqjeZOAb6b8u49u2uoraQwP0rpvSBKYXeLT9S3
	 Vgkcx0gPnW26hBluV/QvBkLfYzy6LDGarch49JRtylMoYp3qiBUPCdu4TJPnpvWn/o
	 +wCI3AWDwgmqP+0oxMdSKe1O00TBYz3c8PgqSg+JiEyEKOo+h8fqeXOcL1wJ6DIzay
	 GvQF/x3WAQo8w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 80111609AE;
	Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
Subject: Re: [GIT PULL 4/6] ARM: devicetree changes for 5.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0=urEEHzcQt0u2fbb7SLDO6NGs8aeYvNpj=jP+YWd2Hw@mail.gmail.com>
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com> <CAK8P3a0=urEEHzcQt0u2fbb7SLDO6NGs8aeYvNpj=jP+YWd2Hw@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0=urEEHzcQt0u2fbb7SLDO6NGs8aeYvNpj=jP+YWd2Hw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.13
X-PR-Tracked-Commit-Id: 3f9a3345a3a116af806064826d42cf5211dd611d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f7857bf3745e9ede6367a8ff89c1c4f308bfd914
Message-Id: <161946615251.4821.10515143179081060713.pr-tracker-bot@kernel.org>
Date: Mon, 26 Apr 2021 19:42:32 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Mon, 26 Apr 2021 17:57:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f7857bf3745e9ede6367a8ff89c1c4f308bfd914

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
