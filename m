Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B527C4332F
	for <soc@archiver.kernel.org>; Mon, 10 Jan 2022 18:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3A085C36AF9; Mon, 10 Jan 2022 18:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 239ECC36AEF;
	Mon, 10 Jan 2022 18:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641839283;
	bh=+My0+jkjZvG7lLArwIg+X3eUS1NU/8vffLQHBg/s/+k=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=l+EUACaJkrjfiHJvwHknm5/daALRNEsn2Jj/uvBIMfwFLe3dTnxfjxBdgyEDiirx4
	 QBslGGaviGSoo3L/JwEDyZtvP3rffIBktNPT0xhHofIldMhMnW1eBD8/ZIGNSOR5xG
	 3Ck1kWHWvQs0E2HE4J8ftWy9hNwuPOi/yfuABHVdlLdiXnTkCntieeVTHzzVyLaMY/
	 Otoodw2UgZaGLY3WIdYMK54Tq1WuBe5Qh8xY8OQc9b8gT3Suc/nqaDK0jw8YNQvRRA
	 x3X1d7rfTDld3DXXIKfZItiXyJUl5OX5h4NO++kOr3SgSLSxEdKw2w2Xu1Z7hPD0qN
	 8bY+OsodzPJ7A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 129E0F6078B;
	Mon, 10 Jan 2022 18:28:03 +0000 (UTC)
Subject: Re: [GIT PULL 5/5] SoC: Add support for StarFive JH7100 RISC-V SoC
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1DkNq+SxXdvFnQMkH7BaNQ-=ug_XjAAD8_jw3-eX-wnQ@mail.gmail.com>
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com> <CAK8P3a1DkNq+SxXdvFnQMkH7BaNQ-=ug_XjAAD8_jw3-eX-wnQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a1DkNq+SxXdvFnQMkH7BaNQ-=ug_XjAAD8_jw3-eX-wnQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/newsoc-5.17
X-PR-Tracked-Commit-Id: 299e6f788eab0b0aef97efb29ddc6971e7d0daf3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bb4ed26e7e837ca3034d4105491436d54c430038
Message-Id: <164183928307.9673.8260950414473469873.pr-tracker-bot@kernel.org>
Date: Mon, 10 Jan 2022 18:28:03 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Thu, 23 Dec 2021 22:37:45 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/newsoc-5.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bb4ed26e7e837ca3034d4105491436d54c430038

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
