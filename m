Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8064C433F5
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 00:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88AE1C36AE2; Fri, 17 Dec 2021 00:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72B45C36AE7;
	Fri, 17 Dec 2021 00:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639699396;
	bh=9Gt+y49hAPdH4+4TStXoIEbfiTDOAvLssaP2MYZ/Xwc=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=hl5Lz0HA05YT2xqu70F7hJNYFlmgDfrPae+Oc2ohe7UujCA9Bj62q3u5BjsqACyCL
	 fFMnWHbZLum4IXac2/n0cAXkIfIXvlkCowWNNDRkm1v5jyyIkQknXpzF8OnT9p53dB
	 3oE1mfPRfo9Ik2AP+2d+ZncJLBWuaWkP3YRfKvVc7LjIOowPIDz2jHkDtqqED4aATQ
	 RIsFAPpHN5V7p0XcQ6PeVPTGH7/JrVA1D4Mr0pCQEYQeRCRnbp/jQGEixicrQTKh99
	 QmJ+J0xohhlijqnEZxD+Zm6Zq0opUpu6hBrz6ghTxpsGbhxawF0gf2Jk0q14i5Dho2
	 ZMOhlgY3k/fxg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5FC1B6095D;
	Fri, 17 Dec 2021 00:03:16 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.16, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0L+x_rxG+xO5KFG53VtxDb_ycB5+4axWR6yRpG_YLzqA@mail.gmail.com>
References: <CAK8P3a0L+x_rxG+xO5KFG53VtxDb_ycB5+4axWR6yRpG_YLzqA@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0L+x_rxG+xO5KFG53VtxDb_ycB5+4axWR6yRpG_YLzqA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.16-3
X-PR-Tracked-Commit-Id: 4bc73b7d4880a304e1ef1f2a82415292d31b70de
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 93db8300f6870ecc523919ec20c397f12c289975
Message-Id: <163969939638.17683.3197271506428255536.pr-tracker-bot@kernel.org>
Date: Fri, 17 Dec 2021 00:03:16 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Thu, 16 Dec 2021 22:23:22 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.16-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/93db8300f6870ecc523919ec20c397f12c289975

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
