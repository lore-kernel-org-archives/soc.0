Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567C1C43381
	for <soc@archiver.kernel.org>; Sun, 21 Feb 2021 02:57:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C2E2D64F06; Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8106564EFD;
	Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613876251;
	bh=82kk6aDXKM6S64ifemPIaPmHHDSokQqiP4WgVgIbeEY=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=OgQXmI64ivIa1fbwSis8uff0Gq2AbG4+2PXq3afsDq+MssQ6NZ7S1ecS/ANb3fXva
	 erZXpe5MezWQvPndpyDXPHx3M6FAmfofinipe4oQs3aQPmI84yVdg1AiK4cx4szaR5
	 FnPdmPl5fliVInxjyfpsM4isbe7Pl+L8EDgEqkJGnS0vpmDG0nCU2aeuz4hPhqfCy2
	 8P90oNS2Fo9e4T5SOGFsqpFeqTA/VqANFUl8JG/8Muo8HGQBcWRX2QWZuDE997zaSH
	 0/aHeIXdPlZTDuVv9ppd/lUGSz5hD3sBF7e1ynhc9e2k78D9CGDjdkEs4IpP0B6unL
	 w2xBVkGIm4WfA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5ABD760A57;
	Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
Subject: Re: [GIT PULL 5/6] ARM SoC devicetree updates for v5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1bF_6yzYn6We3A7sC_nJf+FVO2Pv1pgyu3-qa_YotT_Q@mail.gmail.com>
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com> <CAK8P3a1bF_6yzYn6We3A7sC_nJf+FVO2Pv1pgyu3-qa_YotT_Q@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a1bF_6yzYn6We3A7sC_nJf+FVO2Pv1pgyu3-qa_YotT_Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-v5.12
X-PR-Tracked-Commit-Id: 14bd96946377148cb6e7dd7ce55ecc5128a92d7b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 82851fce6107d5a3e66d95aee2ae68860a732703
Message-Id: <161387625136.20427.7512357495842873965.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 02:57:31 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Sun, 14 Feb 2021 23:45:18 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/82851fce6107d5a3e66d95aee2ae68860a732703

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
