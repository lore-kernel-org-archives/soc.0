Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51C6C433B4
	for <soc@archiver.kernel.org>; Fri, 21 May 2021 00:48:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7ECA5613AD; Fri, 21 May 2021 00:48:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 673C8613AC;
	Fri, 21 May 2021 00:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621558129;
	bh=S74FQGlGcpbKGa+miqThw2gK80sNQmuw9ASTQf1gwxY=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=hbWduevogV0b77tj6jOKtllRe+vdXp1yQUJkFiUNAYfTZ8MAwGF4IvJ1F4BG5kaV5
	 vgGW7vs/iEntQr4foWU7NPGWmK6pR3xE4n0tUBIIed6ltAdhQj3YKDzhWAKAWM9Cat
	 Bt4I+8jpc+O38SJiP3yOqxihVzfGTYtqpbNycz/UQtMKMQ21kOMKrSnq7w8RIdYfXK
	 yNLtcBbC+BVxL2/mHKuHSDI3adEbqolh9ICE2j0ll8W1TOCBbc7CIvlUqnkcxP7kwF
	 kSVjd6aWhdy73m7SqaGWxKD01907iQZuLl/3lqc6q1QhB2n6TD32Sp2Ei9UydvrqOx
	 gaqLTyphnsMaA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5F7D460A2A;
	Fri, 21 May 2021 00:48:49 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0QqwkGDabWzD+oDp7jsfkuLEaFxmCaHBuu_HVd4TxLXg@mail.gmail.com>
References: <CAK8P3a0QqwkGDabWzD+oDp7jsfkuLEaFxmCaHBuu_HVd4TxLXg@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0QqwkGDabWzD+oDp7jsfkuLEaFxmCaHBuu_HVd4TxLXg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-5.13-1
X-PR-Tracked-Commit-Id: d37316b72e8bf95a52d1c3e93c823d128c09b521
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ba816d3c265cfe9ed0ee8347eab63cf5ac3cf5dc
Message-Id: <162155812938.12405.10426812957569408184.pr-tracker-bot@kernel.org>
Date: Fri, 21 May 2021 00:48:49 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>

The pull request you sent on Thu, 20 May 2021 23:04:12 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-5.13-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ba816d3c265cfe9ed0ee8347eab63cf5ac3cf5dc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
