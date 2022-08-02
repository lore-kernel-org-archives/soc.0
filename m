Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0CBC19F2C
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E83CC43148; Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88A45C43142;
	Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659458347;
	bh=HGZKSlHWndcLP3s2glKAxP6ZCzMZPPhaZyuf/6g4wGA=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=MNVcGpUvjNhsg9i4SkFe2uVsxAuWY+3NeVKfJz3NvhypvABRxbJ4SUnjJdEOvrz86
	 2uo9PMgaEB1FDq7e/Wt3bXzw+gY48doewDwElLhSPGpV9tu3lXj2rTp7I130t7fb2E
	 P/dic8WIYxdJ8ZXplOustnD2g9lJF+cVA+xNSniDo7pBuetWJg/ej+MPMgTtJ2Y1vL
	 V8eO8nxwvQ12mQF006M/bO4OoRkchXdwyKWeEmVTc4DWvtu724Qw4LpWdWSwNk9KZa
	 Dvs7GR5l01EwE+8ujQnaCxszWcZtB+im+02GV8iu2cj3tOwallSnrFv+YyimSupVjt
	 I4RLMHUcYwCtA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 77E7BC43142;
	Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
Subject: Re: [GIT PULL 2/6, resend] ARM: DT changes for 5.20
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a08G19mZbp7ANn8T-7O1kX3KPP++Gd6PxmpktXirgxGeQ@mail.gmail.com>
References: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com> <CAK8P3a08G19mZbp7ANn8T-7O1kX3KPP++Gd6PxmpktXirgxGeQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a08G19mZbp7ANn8T-7O1kX3KPP++Gd6PxmpktXirgxGeQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.20
X-PR-Tracked-Commit-Id: 47d8f8b78b9b42e9817feeb75bbf758f2a3cbff8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3976d758e045ed0485e0e665fb3b6692572576d7
Message-Id: <165945834748.26510.2058003160214261217.pr-tracker-bot@kernel.org>
Date: Tue, 02 Aug 2022 16:39:07 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Fri, 29 Jul 2022 09:13:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3976d758e045ed0485e0e665fb3b6692572576d7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
