Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4B6C43470
	for <soc@archiver.kernel.org>; Mon, 26 Apr 2021 19:42:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 18DA2613BD; Mon, 26 Apr 2021 19:42:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 01B4E613BC;
	Mon, 26 Apr 2021 19:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619466153;
	bh=+xDYKxjo8HuIJ3rW/JHd3u8zWOnBd6QuleFjnSXjOJI=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=h4FYR7zRJCJowH/mzDfcFdmLrzQW6LSiyi/XZM1xQ5ETY9iB5yYW7bw1r1cINPBgZ
	 MYAuqxop2wwbsUTpzh4jb73bi8EP42wlR6NcnBCYcsqZgEa6xmbjDDsDpZYEAY5fWw
	 0U8k1viq4YADkvAYzMa86KNgrwC4dz4AnH0aWW8jmEDVYPrDgpTJ/xS4tetIU0XMMr
	 zWFCkM5AN60d9G6WWBbYDqw4RdyAJoEljQjJNYuuyI0RSEDuAyX9StwABgy7XcOH64
	 UQeZTePxA95E7MWpnh2s2A+83+xbdWyFw96ngUFNrJDaD7Y5A8WpLt3h+m2Xh3woJU
	 CXnBYU340IDaA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EF0AC609AE;
	Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
Subject: Re: [GIT PULL 6/6, look out for dependencies ] ARM: platform support for
 Apple M1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a388f9iSncTW-sAdbeg3-=vc=6r0X9392puGE=FsWy=Yw@mail.gmail.com>
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com> <CAK8P3a388f9iSncTW-sAdbeg3-=vc=6r0X9392puGE=FsWy=Yw@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a388f9iSncTW-sAdbeg3-=vc=6r0X9392puGE=FsWy=Yw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-apple-m1-5.13
X-PR-Tracked-Commit-Id: ea96292838397682530ac77a429974f8ff5f2df3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0c855563182001c829065faa17f8e29e9ceffe13
Message-Id: <161946615297.4821.6463208046152364085.pr-tracker-bot@kernel.org>
Date: Mon, 26 Apr 2021 19:42:32 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Hector Martin <marcan@marcan.st>

The pull request you sent on Mon, 26 Apr 2021 18:05:42 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-apple-m1-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0c855563182001c829065faa17f8e29e9ceffe13

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
