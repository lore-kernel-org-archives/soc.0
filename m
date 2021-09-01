Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C4EC4320A
	for <soc@archiver.kernel.org>; Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B4070610A1; Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9D7EA610CB;
	Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630536249;
	bh=PxLliJ2+T1nIQxDhsacMjysnZpLAapFYy4+Kd0jv4Xk=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=GGZlOX5GQUGZZ/bfdty7lmK4RfpI8A1trBV/+TrofMXwyD3ifstw5L2TN7ElyzjPK
	 67Ib8bZT/tTgd71JKFssCYir+bp87VrMlSHonwMpP4BQ71/Cr0EMsVgZ5GE7XBhpET
	 iWG1cJ7ZsaU31eL7d4o9b23qZ3UsvOzsKEPjTQviOq1u/WoTjH5jRadV9zPVAMw2T/
	 3waYjjwmEz6Ow/ZXQ5SI9xSNqHzHoMBbZqX9BME8Fud59MchbvphMPh55tYd5LkQ2I
	 Mu+qIDl8cqCHXC6JzOlGaAtte8Uc1hseTJI1CrzZZBcW59vuZjRp/YAtT4rgdbpKeY
	 3yx3tuVT8fCbw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 956C360173;
	Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] ARM: SoC DT changes for 5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2OTMQFQ6CWWQTcSS9wx0_iOukHt7pzMZjxOQHs3fXb5Q@mail.gmail.com>
References: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com> <CAK8P3a2OTMQFQ6CWWQTcSS9wx0_iOukHt7pzMZjxOQHs3fXb5Q@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2OTMQFQ6CWWQTcSS9wx0_iOukHt7pzMZjxOQHs3fXb5Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/dt-5.15
X-PR-Tracked-Commit-Id: 9e62ec0e661ca7161e5830bdbf8e69831b41e866
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7c636d4d20f8c5acfbfbc60f326fddb0e1cf5daa
Message-Id: <163053624960.31944.11984624584076510998.pr-tracker-bot@kernel.org>
Date: Wed, 01 Sep 2021 22:44:09 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Wed, 1 Sep 2021 20:00:09 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/dt-5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7c636d4d20f8c5acfbfbc60f326fddb0e1cf5daa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
