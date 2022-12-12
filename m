Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C322EC10F1D
	for <soc@archiver.kernel.org>; Mon, 12 Dec 2022 18:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3C80C43396; Mon, 12 Dec 2022 18:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D74FC4339C;
	Mon, 12 Dec 2022 18:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670869812;
	bh=Kq7fJSv2FDIkk0z2Y86zU2omI8sisyuBfhua2L4+3Ds=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=e1RajRaC/7RPipOtdRuGM3GgUoQ9zyP9jTpuzrCF530aiJ7iolD8o41Q4erVkK27S
	 nP3BJ/tFlvuUncZ7MrSrR2w/byq+qgHbS1sFITTgxNRqVJdfQ1KkdCWFIJVoY2yBCh
	 n0gcddWlUOtZFNkQ+L+chp7fyWaIx2qqZM6C+kOHJL2x6xt6pyqmw9pGIJs4Sfe0dH
	 f/jf0pRkKbz2PaZXj5DIiDZSSX0OZNZoi9q86+CAj54Lwa/NZAVsLms153TQojt9FB
	 HEPs8RcwmIwRDRegodyK6i81fKRBTZmcE4rc1TfFmvpqYvQogJ2hx4WVjWeIf7sf74
	 8bTQjPQJRq9Ww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 77EE1C00448;
	Mon, 12 Dec 2022 18:30:12 +0000 (UTC)
Subject: Re: [GIT PULL 4/4] SoC: DT changes for 6.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <02be69ef-cfae-4455-a428-f95517d374cb@app.fastmail.com>
References: <257c9d3c-5bfa-4c5a-8ba3-11982a00b1d3@app.fastmail.com> <02be69ef-cfae-4455-a428-f95517d374cb@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <02be69ef-cfae-4455-a428-f95517d374cb@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.2
X-PR-Tracked-Commit-Id: c83ce312081cf024b00a8a7fe785a90ba94b69fb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 01f3cbb296a9ad378167c01758c99557b5bc3208
Message-Id: <167086981248.1778.540076168028507557.pr-tracker-bot@kernel.org>
Date: Mon, 12 Dec 2022 18:30:12 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Fri, 09 Dec 2022 18:22:56 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/01f3cbb296a9ad378167c01758c99557b5bc3208

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
