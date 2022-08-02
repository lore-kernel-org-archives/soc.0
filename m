Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3327FC00140
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F39B7C433D6; Tue,  2 Aug 2022 16:39:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD1FEC433C1;
	Tue,  2 Aug 2022 16:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659458346;
	bh=2yhCxRbSzrVk0Zy3PhOKBxM46OBIbnWltLVLU147uwo=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=ecSpuPa/1PKL70yBZXIixMAVQD7iADi/UhI63XGtiR6ZWd3Pr6WG1gkaLNTy++SAA
	 ZwUDNgLh3Ju7azztJWt6bPkw8LVn1w1QEoj3cr2DrUFCRRWX0wyeWkoukjguEXrKSL
	 5HSORN5B3fuvLpguzC984IOGXIDfNV4egs8Q8MUkVamJkL/KjWJyx8+XgGqh8VQG5p
	 A0hiF1pHQIlj3KbsAUxUYJ2N2C9WnG9nCyVBgFwypsSXwUktPgsL++Z5WbgYlEn9qM
	 8dSOKg0z8E2Rez3kfiTB4y1Fu47vuH283ocV9auk971yggKhdSnQn/GEaXjRwxRWar
	 gZA0Ael9ZUYbQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C5312C43142;
	Tue,  2 Aug 2022 16:39:06 +0000 (UTC)
Subject: Re: [GIT PULL 1/6] ARM: SoC updates for 5.20
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a01piA9bvuUpEPQ6dE4EL4AM8ui4CJGCdnOHPSOBG2Wrw@mail.gmail.com>
References: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com> <CAK8P3a01piA9bvuUpEPQ6dE4EL4AM8ui4CJGCdnOHPSOBG2Wrw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a01piA9bvuUpEPQ6dE4EL4AM8ui4CJGCdnOHPSOBG2Wrw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm-soc-5.20
X-PR-Tracked-Commit-Id: 755d0ebc03f872c33b108534f23d82d2778c2793
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e233cc59d08f9bd389d4e8eaf71063150110b9b9
Message-Id: <165945834679.26510.7232629276276295683.pr-tracker-bot@kernel.org>
Date: Tue, 02 Aug 2022 16:39:06 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Fri, 29 Jul 2022 00:29:47 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm-soc-5.20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e233cc59d08f9bd389d4e8eaf71063150110b9b9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
