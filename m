Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C67C43214
	for <soc@archiver.kernel.org>; Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 789EA610C8; Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 61ECD61075;
	Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630536249;
	bh=oM4yT3F4zEKFbmYDOGZtKhNIXw2H5+GYedhR1IagYlM=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=GvqRrezzirNKa4JVPD6tmTwe1RcZj1NbiWC/EeG1j6DmHUnDIMArxnWOLOiRvc4jJ
	 00lfpyU1LWts4KSqvJnw67JSScQ6GwzYdU+xvG/CctAnvICaqrwKNf1JfmY1Vy8V8q
	 G3lKB0FURDHLCJj5iBP8O7NCAOGpKP5TpwFC/YNSR14nh6CszZVvwBqMAH/hf/SR9F
	 fjVM4nnBBjFUts2MHEc0DoTQyJzt1KuvysZ4Q8++xc+dkRWSF2cuAhFbLqJ46ThUxF
	 FDKvlpZIM6Dn+Lnnuh8fA0Zbhkx7md2xuDBJHI/JmfQ/foOxZuwfUVxkbZtvebVTDV
	 yaIKKjcTehuRQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5BCF9600AB;
	Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] ARM: defconfigs for v5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a382k=ALTzRc=d_XyyM186tgjGRKux-r36xk-F_BsAzXg@mail.gmail.com>
References: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com> <CAK8P3a382k=ALTzRc=d_XyyM186tgjGRKux-r36xk-F_BsAzXg@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a382k=ALTzRc=d_XyyM186tgjGRKux-r36xk-F_BsAzXg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/defconfig-5.15
X-PR-Tracked-Commit-Id: 79cd0bb66e359f5f9398de9d2e86eac776947691
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 32b47072f319bb65e9afad59e78153d83496f1f5
Message-Id: <163053624937.31944.8567283950832234252.pr-tracker-bot@kernel.org>
Date: Wed, 01 Sep 2021 22:44:09 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Wed, 1 Sep 2021 19:59:18 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/defconfig-5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/32b47072f319bb65e9afad59e78153d83496f1f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
