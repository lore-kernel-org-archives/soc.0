Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3625C2BB9A
	for <soc@archiver.kernel.org>; Thu, 17 Dec 2020 00:57:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6AAE12388B; Thu, 17 Dec 2020 00:57:17 +0000 (UTC)
Subject: Re: [GIT PULL 3/5] ARM: device tree updates for 5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608166637;
	bh=cLkV5JRR274hP/6WLmIZXUjpdGoQvgcmSiDg4OOi9FA=;
	h=From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=jmrR9c1wO6HNc80ZoTCx0FmojLSn1N2wvE75ka31F9ouYfaF7jQg49YbI9n7Ml/X7
	 pr5rI78JCbNBAJLMONqNcxta+6+rmwMq1BGYq/4WvW1jwjcfgnfpQ2D0NImqwRDdfn
	 Bgnb4lFhMr1JrPxYrVtM6McvJHj18EFkuRp16Pl/oLmlyXgy7ce9Z8NFMGKtkd5VfQ
	 3Ze6kJklcbsmziXnGhly8WGmIQ55me661YDj77wKGgKw03WN+sJT+YLdprpFHu8pYY
	 V/ei5I96+EhTQD8749gnCogLmRWuXFs9FKdlKlidhd25j+hNbfRlQY3DhDkLH/kIw3
	 zq4Z4oNWvOutw==
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0hXcgTioiGi+CGrF6ePbkSSUkNpt7xE4ks=zeMjeyBSw@mail.gmail.com>
References: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com> <CAK8P3a0hXcgTioiGi+CGrF6ePbkSSUkNpt7xE4ks=zeMjeyBSw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a0hXcgTioiGi+CGrF6ePbkSSUkNpt7xE4ks=zeMjeyBSw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-dt-5.11
X-PR-Tracked-Commit-Id: 13719d8d0d67998435c5748998ef686a10eefb4a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9805529ec544ea7a82d891d5239a8ebd3dbb2a3e
Message-Id: <160816663729.8160.5801103938851693563.pr-tracker-bot@kernel.org>
Date: Thu, 17 Dec 2020 00:57:17 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Thu, 17 Dec 2020 00:26:14 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-dt-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9805529ec544ea7a82d891d5239a8ebd3dbb2a3e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
