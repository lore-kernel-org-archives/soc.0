Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5248CC433DB
	for <soc@archiver.kernel.org>; Fri, 26 Mar 2021 18:48:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0EF8761A2A; Fri, 26 Mar 2021 18:48:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EC6A361A26;
	Fri, 26 Mar 2021 18:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616784505;
	bh=8auveAHTI0hptiEIDh5p9n46G+ek7E3F9Vv49Po7mDs=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=s3phOLWRWO3E7rDRMJ2XmNtWA0iFyC75t1DYTX4ERlJn6fvUF4MdpVwZ/LlDfMCE4
	 Zxpc1Ai1LBPiL0r98NRgAQj3J1b2Z/4RtzbMmJG0sMbIWLu5cJDGSK2s6EGaMCdf/Z
	 s/98hYU/Zj4wZ+wkwvSwcZprAklzZ8rFlQvO+wza84f0Py1+l+04rq8F8bXWXi+oDP
	 GizOySXi8J2h+2BRGeyMckSC3TmPB47xbyuK0tK9qBEw3qekSb8FRHddCsgx0tEOcz
	 ImXFzd7VhbVw3FRvSJtbqj6c9qs4OAtfMxOv+PhWAGJpj2smjH9jsx4Jltfs9b1LE0
	 rx83+yi505x3w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D04A56096E;
	Fri, 26 Mar 2021 18:48:24 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2BTOzDfmH3dHmwm6LYPefFAnGCMPdQOpUbXOukiT0rVw@mail.gmail.com>
References: <CAK8P3a2BTOzDfmH3dHmwm6LYPefFAnGCMPdQOpUbXOukiT0rVw@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2BTOzDfmH3dHmwm6LYPefFAnGCMPdQOpUbXOukiT0rVw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.12
X-PR-Tracked-Commit-Id: 67335b8d28cd2ee279d6ab3c72856b76411ba48a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eb3991ef2c0ebb7dc49c260e12ae1575d1e153b2
Message-Id: <161678450484.8437.9581033383916056038.pr-tracker-bot@kernel.org>
Date: Fri, 26 Mar 2021 18:48:24 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, SoC Team <soc@kernel.org>

The pull request you sent on Fri, 26 Mar 2021 17:02:57 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eb3991ef2c0ebb7dc49c260e12ae1575d1e153b2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
