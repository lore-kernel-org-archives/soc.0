Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583D7C43461
	for <soc@archiver.kernel.org>; Wed,  7 Apr 2021 18:28:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3A9BE61382; Wed,  7 Apr 2021 18:28:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 218666124C;
	Wed,  7 Apr 2021 18:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617820093;
	bh=CmFuQbnPJo4nr0FyADMBeregTf8AK1kXRyCUqkVrNro=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=H1uhmuVxgpazrgz2qeTwfKCbN2vmqbw88LGkyWo+iX/SPq1u2qMrfUh5sZ5woJnTz
	 9+yNtdWSk9kLpR9NO9ws31xzfKdaxejdqBo4+5AyA24dZSO1Yt6K3bja2xVuBOEI6R
	 vGYVw836H5MiJp6w3QajGgHShg4ZjCcFziaHWDDVH9Gt3aUGXQxLDFsanT2XL3xLC3
	 ecAj9xX8DPou+89EnLxfQQxLGA+WboNpeuIENB5VnfINrRZtGLjAvdG3+lZFVz5b7r
	 fQ9IskM9atgQ5xA7m2GqnzZSnEYHIRR6z8hJw312iTMIdfx8tpj86kQ2phVJKG6R9m
	 PnEHbywB+pMMw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1C74A609D8;
	Wed,  7 Apr 2021 18:28:13 +0000 (UTC)
Subject: Re: [GIT PULL] ARM SoC fixes for v5.12, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1QBvqNyReGC9UhYx-GOm3hYB1_xD22E0tmY7k_XqVUSg@mail.gmail.com>
References: <CAK8P3a1QBvqNyReGC9UhYx-GOm3hYB1_xD22E0tmY7k_XqVUSg@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a1QBvqNyReGC9UhYx-GOm3hYB1_xD22E0tmY7k_XqVUSg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-5.11-2
X-PR-Tracked-Commit-Id: 1180042dc6030c6e26530d4cfe0338fe8e447ca4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3a22981230f997846d1cfeb8eadcda8bcc0f7ea8
Message-Id: <161782009311.7121.7085895249015339168.pr-tracker-bot@kernel.org>
Date: Wed, 07 Apr 2021 18:28:13 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Tony Lindgren <tony@atomide.com>, Maxime Ripard <mripard@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Shawn Guo <shawnguo@kernel.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Wed, 7 Apr 2021 13:37:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-fixes-5.11-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3a22981230f997846d1cfeb8eadcda8bcc0f7ea8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
