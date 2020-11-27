Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76777C3E8C5
	for <soc@archiver.kernel.org>; Fri, 27 Nov 2020 23:29:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 21DDE22244; Fri, 27 Nov 2020 23:29:59 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606519799;
	bh=odBZsXzhtmwpQwNUqeWXKjwv0rU3WQpAR6B8J4GXyyw=;
	h=From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=HWX4qv9Q2bO0OxEKwa8/vS2/IVJTLHSfQwHUM865iPy6Coirz3xNsvKLkSCvhQa1a
	 /dZhuGiqo6MyF2Watw9YLarI41GusxA/hx4mp0o3dtcvCLMQ3RvY1P6ydA32aY3VGz
	 frj44h+cOjksY3V4qa/WSRUow8FYCqR7yAgrTtvA=
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
References: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2Habmz95y+J+-4NiT5SGYhO_Fia-SHhapX-3NYRbEMmw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-v5.10-3
X-PR-Tracked-Commit-Id: ae597565d13febc73b9066c05935c1003a57a03e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 303bc934722b53163bfb1c25da7db5d35c0e51b6
Message-Id: <160651979900.32137.11200973603883765915.pr-tracker-bot@kernel.org>
Date: Fri, 27 Nov 2020 23:29:59 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Fri, 27 Nov 2020 21:51:05 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-v5.10-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/303bc934722b53163bfb1c25da7db5d35c0e51b6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
