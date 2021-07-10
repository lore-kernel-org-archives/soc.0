Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578ADC07E95
	for <soc@archiver.kernel.org>; Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EA05061362; Sat, 10 Jul 2021 17:35:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D35036135F;
	Sat, 10 Jul 2021 17:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625938539;
	bh=ZVHVD50NwCgTgYhQ6RmVzcCCJ0xk/pCWrqeM6XJE8Zw=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=KpTvuqVimB+V4c3dqN4FBxN0koeTpQvsCRB8CaXobQiXov/OJ71RXinUtBEZPMuyU
	 FONjxvz2nvHRcijgWfUJYiywJtVHeQnpG3EZmHiOrHGu7l3MnBvsE16QOiNYWdknh3
	 /6S4jSxolbpoFaHb1Uhgl6q0ODvnXDzKUmraM4kSBDHJUZ7Ji0dZj2p6b6vOQifJ2U
	 714Wogu97F2tifC25t7nYQyhwcFimlTq5VqdtDjCA20Ag5rOyeLyOdRnYyoJ/5HnDI
	 PJW7lrCjRXIFpngH7pp9y87r+sj1Z4FnKQgSJ2dUk7iI7sqEF4/tb+rvI7ke/9vbVt
	 HlN40kMx9RY2g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CCFAE60A08;
	Sat, 10 Jul 2021 17:35:39 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] ARM: SoC changes for 5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210709234054.10288-1-olof@lixom.net>
References: <20210709234054.10288-1-olof@lixom.net>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <20210709234054.10288-1-olof@lixom.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.14
X-PR-Tracked-Commit-Id: 42accadb3265f4569620cde217ff448b568b2822
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6e207b882159ed3e35a4cd4ff0fc155cce5e3cbc
Message-Id: <162593853983.16773.7411502781117228695.pr-tracker-bot@kernel.org>
Date: Sat, 10 Jul 2021 17:35:39 +0000
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: torvalds@linux-foundation.org, arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>

The pull request you sent on Fri,  9 Jul 2021 16:40:51 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6e207b882159ed3e35a4cd4ff0fc155cce5e3cbc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
