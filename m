Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE7EC433EF
	for <soc@archiver.kernel.org>; Sat, 16 Oct 2021 16:23:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 41FA46108B; Sat, 16 Oct 2021 16:23:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 293166101E;
	Sat, 16 Oct 2021 16:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634401400;
	bh=ETay/AaGyhkEC7voDhONiaMq+QUOp5n0iys94ai1+co=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=lS0i7dPN6E24eWpsl0ua4CSH3EkF5mjgUOCfGMQXds/gMu2k1thELAM0l/prId1ZQ
	 rlJUwr1zWDkZXdBSz1iOb/7CfX2TCs7xmhPODi/B/tOp0WtEVTZIpkAeIm5y262peg
	 LskSR/xFD/gy8ib+xzGwjJUAzte20EabIcf/BlzmV5qcRr/BpBUNVmWJcSUeGpfvC2
	 8yal7uQrvboCzzMD3LVZ4t09bGiw0nfYAqoGBlDB9zstc0xOlKENjQy6BdvOAC1azj
	 SqJesOQ1n5vaD2hLFag6ebsWxmv+KwEfzD22W8a+dljuZg6H5kf8XjR7K4takgR1gu
	 0lJlDUfPV0F6g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 16F6B609ED;
	Sat, 16 Oct 2021 16:23:20 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.15, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a17ccHJKteXL6Q+LxVR8m1BbedvNiVsmn_tQh6vj=bHmg@mail.gmail.com>
References: <CAK8P3a17ccHJKteXL6Q+LxVR8m1BbedvNiVsmn_tQh6vj=bHmg@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a17ccHJKteXL6Q+LxVR8m1BbedvNiVsmn_tQh6vj=bHmg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-5.15-2
X-PR-Tracked-Commit-Id: 011ace4a7fadcbe8670b615e0db1e8d7b813ee6c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f04298169d9c522d611a2ce8c54489990c38e72f
Message-Id: <163440140003.26929.13876483742881199148.pr-tracker-bot@kernel.org>
Date: Sat, 16 Oct 2021 16:23:20 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>

The pull request you sent on Fri, 15 Oct 2021 22:48:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-5.15-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f04298169d9c522d611a2ce8c54489990c38e72f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
