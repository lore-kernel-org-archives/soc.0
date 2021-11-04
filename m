Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DE2C433F5
	for <soc@archiver.kernel.org>; Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 17C49611C7; Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F229F60E98;
	Thu,  4 Nov 2021 00:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635984767;
	bh=9VnFC1Xi1zLHjhHI9HJcuOMSQC8FIAOxaMKK8yHkZw8=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=D26nkK6OB3FQ05dvctZTotqFjeytLoRgBVTAJAkwROe/Xl6pgkeEYgQc0IlC4Dywy
	 VicXHU47rbo3qVV8bH1IrIj7O4I6KrNgUkN+zubeVohELATaGNotOV6DhotlzDU0dk
	 E3OJtvRfzS09vGZX80wN2IcykC46TwNlLuhRAMw/85T+UOAFzecyRpkXlGV30P6v/X
	 AFABAvz2ar8cro0pzhtDbaRCDXGlx5o8L8gjmCJy9awrS1ABoymUczfs2oR0qGLkHf
	 ZuZF7+8ll6im/ODJVEzGBbw6FkUYeAzVxSDguRxUvk6bDyPBjKGJgu0+z2+GVQTXm9
	 pvFsRuRe6tXdg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D84A4609BA;
	Thu,  4 Nov 2021 00:12:46 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] ARM: SoC updates for 5.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2wxvYiEqCQbF32D-XyQAuthomVOPGkJYCrA13DUbL_4w@mail.gmail.com>
References: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com> <CAK8P3a2wxvYiEqCQbF32D-XyQAuthomVOPGkJYCrA13DUbL_4w@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2wxvYiEqCQbF32D-XyQAuthomVOPGkJYCrA13DUbL_4w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-5.16
X-PR-Tracked-Commit-Id: fc3d4aeb559f2f704b490f8c1dff82f3b5b142ca
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2219b0ceefe835b92a8a74a73fe964aa052742a2
Message-Id: <163598476682.32364.5996070049163105070.pr-tracker-bot@kernel.org>
Date: Thu, 04 Nov 2021 00:12:46 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>

The pull request you sent on Wed, 3 Nov 2021 23:50:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2219b0ceefe835b92a8a74a73fe964aa052742a2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
