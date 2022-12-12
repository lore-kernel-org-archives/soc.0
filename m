Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F9DC4167B
	for <soc@archiver.kernel.org>; Mon, 12 Dec 2022 18:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E0B2C433D2; Mon, 12 Dec 2022 18:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 374BAC433F2;
	Mon, 12 Dec 2022 18:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670869812;
	bh=8w8TR9dP/5krR/vGB1baM/1sVBeaAmGXe73nD+iSX2I=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=U1Qx9JuXQX5nrKPZRgPdWTuFojz7u4AmIQBJ6EmubRx03T3ZSwCTQUbPn2RBV+/aZ
	 brIz+NmnrG7541E84rMEopF1sXRsHnHs41Kl/yOIq1Ys1DWnrPijBMwncoq96NjyP5
	 VyWeNhXfbe1E4kxdSqo2yHFWJbyuWukYQryHa+jmMxuDrnmDYmRTpDYOl0+DeI2P7F
	 3YhyrXrwAviEssygEq3iy6zfyJT6n+CgK2h7Tm7JhIeHlweSF58+Fi1A8MD0SV1m0p
	 Pf0/xD7samXYDgbGaWo9Kzg0lxoucZIU4SXy/S7UIllD9zBbzHqBDodsADq8ABEvfM
	 PF+m/1bkDYagQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 21F89C197B4;
	Mon, 12 Dec 2022 18:30:12 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] SoC driver updates for 6.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <07ecf411-70a8-4c15-b3ba-378072c14a02@app.fastmail.com>
References: <257c9d3c-5bfa-4c5a-8ba3-11982a00b1d3@app.fastmail.com> <07ecf411-70a8-4c15-b3ba-378072c14a02@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <07ecf411-70a8-4c15-b3ba-378072c14a02@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.2
X-PR-Tracked-Commit-Id: 9379885d07c466a9207e88c0fd0c8b3541536fe3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8e17b16a2c13406c56a4d292df3ca083f8729666
Message-Id: <167086981213.1778.11073104905952934171.pr-tracker-bot@kernel.org>
Date: Mon, 12 Dec 2022 18:30:12 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Fri, 09 Dec 2022 18:21:15 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8e17b16a2c13406c56a4d292df3ca083f8729666

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
