Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD1BCC636C9
	for <soc@archiver.kernel.org>; Sat, 17 Jul 2021 23:01:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7443061151; Sat, 17 Jul 2021 23:01:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 545D661106;
	Sat, 17 Jul 2021 23:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626562889;
	bh=9n60S5U9muDmLfRbjIvlsdR3weLp1v3QJ5ywJI/VDbA=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=HekEl7H/CtLUv/Z4DkT3KDboPbOpJ//8mCfZn8IdCsE2Si+z1l1iGOJINNcgrjFZ+
	 Nsz/n9jES9OfRYF7nmx09t827BMGcQL2G4Z3/JMGDoiG1xd/mljniQAM4azKclfFIb
	 GgdV5MyLgSUQXHP0VspZcYi5Mpv4eHZhaLq4gPDv9kqsXxi66Oixp47wm8qcDJ44pn
	 9I1qGyNghG15C+C+mpvidClGl0nwEfudrvgvytbbiP/TQyz+DIVBTVN/Gn8a67+8Xi
	 747341KzVUJKO6zlARUF0oIEULrpkwF0ta94vh+Z6C6RmY7CnYURm4RgdjojA95krI
	 v1jyG0+aTrKfA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 410BA60A2A;
	Sat, 17 Jul 2021 23:01:29 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2ZaPZ7y6-GKTuZ1QseNNmNOQP=kS8y8rEnF5LCvOF56Q@mail.gmail.com>
References: <CAK8P3a2ZaPZ7y6-GKTuZ1QseNNmNOQP=kS8y8rEnF5LCvOF56Q@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2ZaPZ7y6-GKTuZ1QseNNmNOQP=kS8y8rEnF5LCvOF56Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.14-1
X-PR-Tracked-Commit-Id: 82a1c67554dff610d6be4e1982c425717b3c6a23
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1d67c8d993baf8ab6be8a2154b1a94ec1311c869
Message-Id: <162656288920.8190.7314898413582638751.pr-tracker-bot@kernel.org>
Date: Sat, 17 Jul 2021 23:01:29 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Thierry Reding <thierry.reding@gmail.com>

The pull request you sent on Sun, 18 Jul 2021 00:22:13 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.14-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1d67c8d993baf8ab6be8a2154b1a94ec1311c869

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
