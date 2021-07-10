Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900CCC07E9C
	for <soc@archiver.kernel.org>; Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 38C4461370; Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 209EE61289;
	Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625938540;
	bh=Zh2Uu+h8sRtkqtXtrSHA7KNBefDfnjMlHARaFIBxUHo=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=UzXHdRRIaKPd/6FbfRbwRV35NBKe60OvqDT/uF7VstquOdTs+AMFtJlKVV8GlvxoW
	 vr4AtxAbwmSASjYAwz81ct7rnXNnewGuadeFXxrjtYgm2/qualRJQdI2LAsnoJeRcD
	 nkED26lbiKsyiwZcywoMCQvuKPspow77q1LawL8VAZ7nTQCv5XRd2XpHUk1jpMssvM
	 sQIAXAOreNwBC77vIF4XAwkknZZk2Hbk/046YB1vLAgAmaCTcysI5zxKifaHNivaTS
	 4NN4eM9DUNUayGWWWpxNl4APjZx7uFc5NqCEeETlfTsCvxB28wvI7We2f7laHGwij2
	 J83/H/3SeY9VQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 177C860A08;
	Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] ARM: Drivers for 5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210709234054.10288-3-olof@lixom.net>
References: <20210709234054.10288-1-olof@lixom.net> <20210709234054.10288-3-olof@lixom.net>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <20210709234054.10288-3-olof@lixom.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-5.14
X-PR-Tracked-Commit-Id: 2afd1c20e7547887f37f638d6b7953138d8c948e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 071e5aceebebf1d33b5c29ccfd2688ed39c60007
Message-Id: <162593854009.16773.6811500673684434420.pr-tracker-bot@kernel.org>
Date: Sat, 10 Jul 2021 17:35:40 +0000
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: torvalds@linux-foundation.org, arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>

The pull request you sent on Fri,  9 Jul 2021 16:40:53 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/071e5aceebebf1d33b5c29ccfd2688ed39c60007

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
