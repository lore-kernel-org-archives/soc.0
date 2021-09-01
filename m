Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E27C432BE
	for <soc@archiver.kernel.org>; Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F41D4610A4; Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DD0BB6108E;
	Wed,  1 Sep 2021 22:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630536248;
	bh=3UrfkiDJhUDQYaI3hsoR73dEX5znLBzKGMjRp0zqRMM=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=Jyzi34YaXEMCzsG9tGU6z2QoV1bcShjz0x/qJmUidT+FyWy2YAKNQDJ2IPU4m3+Hz
	 1LEt3d1ujVfkHo7RiKAJnh6kfik8ZWCaXb6gyNyC9AGAw8xjnFVutalM/cOHc9REPP
	 uF6A/CRQUb9GYkzGOjmrOmbPAgaHY8rIN8QYOxspUTn2JmLyDnVMFux5WArX6PWm/p
	 KTP1SYh972lyJilYzn3Ewgxnu2PV4yaENPN55HQOkvNSSVcAGQpW73QiCO1hsJY2sP
	 iu9f3nDFkRE3/q9kaa9O6zLf3OGorQmXf1YJiyhPiX72vmg3x+O/q+GMs5HxCeS8PU
	 NLYBWOj80Tf0Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D6B6060173;
	Wed,  1 Sep 2021 22:44:08 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] ARM: SoC updates for 5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3jec5z=V8ZMTbqDp4pqZ-P0-dJ81qTdwCWa1rP9nieeQ@mail.gmail.com>
References: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com> <CAK8P3a3jec5z=V8ZMTbqDp4pqZ-P0-dJ81qTdwCWa1rP9nieeQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a3jec5z=V8ZMTbqDp4pqZ-P0-dJ81qTdwCWa1rP9nieeQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-5.15
X-PR-Tracked-Commit-Id: 51e321fed0ff8d64eff809a4ee0547254cdcc4a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 634135a07b887a8ad8904da8c147407650747a38
Message-Id: <163053624887.31944.18225380267706333661.pr-tracker-bot@kernel.org>
Date: Wed, 01 Sep 2021 22:44:08 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Wed, 1 Sep 2021 19:56:35 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/634135a07b887a8ad8904da8c147407650747a38

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
