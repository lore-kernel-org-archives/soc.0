Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D2A8C433E9
	for <soc@archiver.kernel.org>; Sun, 21 Feb 2021 02:57:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7747564EFE; Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4F5A464EF7;
	Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613876251;
	bh=V7/dZ099Tb6lH58YI/2FfDyYBPeoPepzyijvFSKFXtI=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=MrBmFllGAfj8gzeDEGs/KSHpB4pvEUKqPlH/79xIzmsE8NWrOkdiORHyQ5yMUU8yT
	 KkxFCr6oeFumFixSq99EUxP5OxZUH913IcroMyw2bfMV4gUTgyDveZUztxpdPfQLMK
	 s05tC2Qxsl9rokVJhyBVg6XBDixk0U+BMS3djxC/fgJ9YBope8NVV4fjDcSzaDUvTq
	 eKDoHIome1ZPPUj4w8teDqJH/IOAaJQ3AbV4PLiP3Rzqib+U5ZR7F+J01m6SeBVvxA
	 C90P7da85e/P5PcLAGJfVL0N7C/HeQba/HWqkAx8KwCdljt7B18r1xJlqcU9ehzicG
	 KDwrkkSutruDw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2144860965;
	Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
Subject: Re: [GIT PULL 3/6] ARM SoC changes for v5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0kOOOR4RP_A9v9R4_PeGsa9z3=TqcvH-Cs9oRq4mNDhQ@mail.gmail.com>
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com> <CAK8P3a0kOOOR4RP_A9v9R4_PeGsa9z3=TqcvH-Cs9oRq4mNDhQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0kOOOR4RP_A9v9R4_PeGsa9z3=TqcvH-Cs9oRq4mNDhQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-v5.12
X-PR-Tracked-Commit-Id: c2bd78de41fc3bdeb183bc24bbb2c4c0f3cfdb9a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5011bb9fbb194834dd04ae6c986d439032ecc717
Message-Id: <161387625113.20427.15408784927818520135.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 02:57:31 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Sun, 14 Feb 2021 23:43:28 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5011bb9fbb194834dd04ae6c986d439032ecc717

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
