Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D37CC432BE
	for <soc@archiver.kernel.org>; Fri, 27 Aug 2021 23:26:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2563960F14; Fri, 27 Aug 2021 23:26:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0AC5160EE4;
	Fri, 27 Aug 2021 23:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630106818;
	bh=NeH8OAy+WhE7UlUcuHY0/tAELduYYmdkIOV+B3ED5tk=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=BHSspsLL1a6dgO8H19tlhLRu/RBdkQNVRnGgqSAK4c6lAVECIK3o9gqaEvmyIfyEJ
	 UthTH6CQgtvZIwUME1xGtpLWOvutCMCysxOf3MgqWSZimY4G3ygEBd9HUv94GVSeYG
	 kuoUKtGSJn7p8GI5g19I2aVfjgkHIuPzJLtIMcRHNJmbt6ukcS3aHMc4liQ0OYaDpB
	 Y7S1QL/NyOqf2JpGWXuBP0Q9Bmwb1xxukiItbnCR2oIWHPXMVM/Kp0mZcZ5PSbW2Zd
	 /AeBDIAMnW7iVFjNx+A8aveKMg4OHPCTXuUTR1Mz+/dAumqP9m3QkjS7XDsxnrwH25
	 H6oPPdyVfhiPw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EA58B60972;
	Fri, 27 Aug 2021 23:26:57 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.14, part 4
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3wuNeoxDucwTPQvganekRSt4H708AX5pUfj=aYzo_Yog@mail.gmail.com>
References: <CAK8P3a3wuNeoxDucwTPQvganekRSt4H708AX5pUfj=aYzo_Yog@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a3wuNeoxDucwTPQvganekRSt4H708AX5pUfj=aYzo_Yog@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.14-4
X-PR-Tracked-Commit-Id: 6c35ca06974105d929f25f487c6ae7a47fffa128
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6f18b82b41147ee15b0b5bf7c9ae0464dda287f9
Message-Id: <163010681790.22639.14568450580407515339.pr-tracker-bot@kernel.org>
Date: Fri, 27 Aug 2021 23:26:57 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Philipp Zabel <p.zabel@pengutronix.de>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Sat, 28 Aug 2021 00:11:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.14-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6f18b82b41147ee15b0b5bf7c9ae0464dda287f9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
