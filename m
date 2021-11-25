Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50B4C433EF
	for <soc@archiver.kernel.org>; Thu, 25 Nov 2021 18:44:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5D919610E8; Thu, 25 Nov 2021 18:44:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4302C60FC1;
	Thu, 25 Nov 2021 18:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637865840;
	bh=fLCzHZBTRumAA9QiUFVMTb0cUYO35CvUqY6qJ+OtIUs=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=LOvAZfxO1ciV4NADfl0dhbAjRlksGvFwfR7cyayyb2SAF93Urv8wJ5Zsoe/lBwImc
	 VOHm8J0JgFgNkKeB2aNjHjW88cv0Wyin8B1NaJLFC66wDRYdZTRy9ff5JM5sYi9NFg
	 pb1/sdPppiRIYuOad9M++Li5hxFVNyLkLKVqUme7Qoyi4Q7ap/01o+tQEuCVcSaeEM
	 rcUbBtDmsS32YMGAnhWbBs1nA1zLOlcxnS57JCmP24BqgIxkZueTln2rw9/J5PB70R
	 GfEKJqsSw4ObAoobxRe1JbLHkIyyVer2CBcvA3PR8T0k5W7yhZgzuZzMKh4m59YrPd
	 dgcFmuo0JRieg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3CBB060A0A;
	Thu, 25 Nov 2021 18:44:00 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.16, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1D1tX-hNX-drT4j8a1BBtjiLKhaqMrgueMdQ83CFXtpA@mail.gmail.com>
References: <CAK8P3a1D1tX-hNX-drT4j8a1BBtjiLKhaqMrgueMdQ83CFXtpA@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a1D1tX-hNX-drT4j8a1BBtjiLKhaqMrgueMdQ83CFXtpA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-5.16-2
X-PR-Tracked-Commit-Id: 383a44aec91c327ef4a9d03cfa65d1eaf3746c06
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6ef9d23121d0a7ed80488e546cea69ec48299d96
Message-Id: <163786584024.16379.18046246721369673753.pr-tracker-bot@kernel.org>
Date: Thu, 25 Nov 2021 18:44:00 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>

The pull request you sent on Thu, 25 Nov 2021 16:48:00 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-5.16-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6ef9d23121d0a7ed80488e546cea69ec48299d96

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
