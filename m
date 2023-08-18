Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A735CEE4987
	for <soc@archiver.kernel.org>; Fri, 18 Aug 2023 17:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A4BEC433CC; Fri, 18 Aug 2023 17:48:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AF2DC433C7;
	Fri, 18 Aug 2023 17:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692380919;
	bh=mVW2OCvuaOngITexxFPs0obdIfdCVmuh+MdIi096hJY=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=kGvBon/bmjRBOXDOknMENh1jFP6nFQJDNKV31+vJ9uI8m0Wx+uKQwj3OJaQhLOwHG
	 qZ6/ztg0GcFsZmdmnlURJBSHsIktEfBHlQTThEjaziitRYUInev/OEJP9Px55WmioB
	 oQV5IT85WFbBln9xrd1dtISmm4yxRJdZHZBLGGkkNgpcakznvqGfw1VTWs/okfCbec
	 5vjPLXUH54dSlaJ7htupGhPSRzNpHS4FrKVKDRxJ/HfcsK0cEfZtk1sDYoTEpRE1la
	 SVQvM6RVfovEvA9nqxZvjU/vvoTlM3YIvuTkJlEGlUztK+gPyauOGjDkZcRUewapDC
	 NwRey5j5dNctg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 328CCE26D32;
	Fri, 18 Aug 2023 17:48:39 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.5, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <fecdd924-b04a-4f49-8de8-fdfb2dbc6c21@app.fastmail.com>
References: <fecdd924-b04a-4f49-8de8-fdfb2dbc6c21@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <fecdd924-b04a-4f49-8de8-fdfb2dbc6c21@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.5-3
X-PR-Tracked-Commit-Id: 3c78dbf251350fdf3a9dab3b9c3391fb89df208d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 80706f552983ae62ef21f6c50303bad51ab7592c
Message-Id: <169238091920.10816.13296676133458967609.pr-tracker-bot@kernel.org>
Date: Fri, 18 Aug 2023 17:48:39 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@kernel.org, Tony Lindgren <tony@atomide.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawnguo@kernel.org>

The pull request you sent on Fri, 18 Aug 2023 07:00:55 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.5-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/80706f552983ae62ef21f6c50303bad51ab7592c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
