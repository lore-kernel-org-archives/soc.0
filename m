Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12FDC07E9B
	for <soc@archiver.kernel.org>; Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 74F8C61374; Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5B31061363;
	Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625938540;
	bh=jYNV9+faOXMnCz0Xcrwh99/HJ6mt7FGBZp+fczbBGII=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=t+K7nyCPQqfhEfcckIkMyjDfSarXUMJPEszDRQ+fAULiUYDVSYL2m11v68xzCRqyu
	 bMhKaikaBdUn94q/+CW1u0kJrTG+r/CB0mgCeUrjWE6sYSaDWYv2odmPdARLgYpVbb
	 IvBi4t8GHXzsmw5yAltblZtYL7NaCN43pdCUqm9w44e2OUjl3BxlHLw5tmpD3kNXGs
	 VXcMm+ja7JiBRxSwNy9YOYkqHC4pL7FHP8UkRNvtmUI0BfoIrZ0U2FXqZRVsUD1vnQ
	 BXz2K7R/Ws5Dstn3hdY2fkxiO+TB7a0A1v6YcAqrp3aeJD9G6WzxkLIr/a5tUCyGLE
	 df1wi9SPuPICA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 53AED609F6;
	Sat, 10 Jul 2021 17:35:40 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] ARM: Devicetree material for 5.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210709234054.10288-2-olof@lixom.net>
References: <20210709234054.10288-1-olof@lixom.net> <20210709234054.10288-2-olof@lixom.net>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <20210709234054.10288-2-olof@lixom.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.14
X-PR-Tracked-Commit-Id: b62b189f7e2cfd1089b37be57b2e6672d5c3ae14
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e083bbd6040f4efa5c13633fb4e460b919d69dae
Message-Id: <162593854033.16773.7983280203668592224.pr-tracker-bot@kernel.org>
Date: Sat, 10 Jul 2021 17:35:40 +0000
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: torvalds@linux-foundation.org, arm@kernel.org, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Olof Johansson <olof@lixom.net>

The pull request you sent on Fri,  9 Jul 2021 16:40:52 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e083bbd6040f4efa5c13633fb4e460b919d69dae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
