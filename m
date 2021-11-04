Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBB5C4332F
	for <soc@archiver.kernel.org>; Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9400561205; Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7D1D6611EE;
	Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635984767;
	bh=z+N47r+LBFBJXvKtn9imcJQr8bFCHHZu94SoTLgODSk=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=FabuyV49sRotAQxDtF5uSj9jT8M/5qQP/K/CMKIwhneCql5yJYm3A5Vb2T4F5322Z
	 EV1maXKN3uFkRdsDfY9C+hyG0HwwUWFM7L4gIOu6XnCLI5I/ZwXOswyHYnNgqm4vj3
	 SIuYr2tuZUD7YRGjS+rvSWaCHL9pPZaqk9VlVEDhJVqZC8+FJjvkTpFvmwpZjgbw37
	 x2fQvjNGo90uIrdwtfV9Ym7sUe6dd4ENWQycAoBTxwlnTaArbQxKbiqfzvm5bBtjSi
	 ZEJZB4ThCAjXWB5J/0ptbRuqc1TRsv3wGqYdj6BUpxXnDmN6kqHVLaGsvfTiG5DfaR
	 SfokVxP6lHOfg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 76B30609BA;
	Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] ARM: defconfig updates for 5.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0Y3t+79z1CvdPUBA04M84Fw6ErFKA0oUc74F-MFEDa9Q@mail.gmail.com>
References: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com> <CAK8P3a0Y3t+79z1CvdPUBA04M84Fw6ErFKA0oUc74F-MFEDa9Q@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0Y3t+79z1CvdPUBA04M84Fw6ErFKA0oUc74F-MFEDa9Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/defconfig-5.16
X-PR-Tracked-Commit-Id: fa348938dbfccc1df1dc902f6bcb76d4f05029e7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ce840177930f591a181f55515fc6ac9e1f56b84a
Message-Id: <163598476748.32364.6098473002148821789.pr-tracker-bot@kernel.org>
Date: Thu, 04 Nov 2021 00:12:47 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>

The pull request you sent on Wed, 3 Nov 2021 23:56:24 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/defconfig-5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ce840177930f591a181f55515fc6ac9e1f56b84a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
