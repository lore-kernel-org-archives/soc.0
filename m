Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99770C54E5D
	for <soc@archiver.kernel.org>; Tue, 12 Mar 2024 18:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64262C433B1; Tue, 12 Mar 2024 18:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47A45C43399;
	Tue, 12 Mar 2024 18:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710267609;
	bh=hwqoQLazlRp03OTGfEBfvs32LIr3/WgkmSbbMuv7IKY=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=rbk3L/e09jpQxtD10E7TbtFiBV1KomN6fCG98d/S3zP+kSH5cyq501n0JETIIJJ5e
	 GAaeQgkRNnk3eV9O96k29S7A7GS9H56pR5d5p0RXa4IEr123GG+0NU4SR6/XMIFK3k
	 10m4ykBrbccxB0/2rZOwJ+U3bOjV76OWUni/7VIWDRR5+srGAmhViaODYYb5pzt0G0
	 M1JaDoD3N+ylXaQ3i71JftHyIVGcxWCx4eOuzZGyOBSt2qyjhCUAy72E4EWXxv8HuK
	 SMhbKqatzFKnp41HzOk9acfYtUedQMJDMRBAUEq+hwX8WVXD+77xDsUti/LhO7qVFw
	 pFoeMFV33EVTw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2D7C2D95061;
	Tue, 12 Mar 2024 18:20:09 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] ARM: SoC drivers for 6.9
From: pr-tracker-bot@kernel.org
In-Reply-To: <2bb4979a-508f-4791-82ac-ce31065f6da1@app.fastmail.com>
References: <89d0bb77-a608-4ae0-b9d9-e17fdf5f12da@app.fastmail.com> <2bb4979a-508f-4791-82ac-ce31065f6da1@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <2bb4979a-508f-4791-82ac-ce31065f6da1@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.9
X-PR-Tracked-Commit-Id: 049238d24467e3d2121e8ef2abef1149be6722e9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2184dbcde47aefd5358b14463a0d993013f5609e
Message-Id: <171026760917.25732.10991309858732518614.pr-tracker-bot@kernel.org>
Date: Tue, 12 Mar 2024 18:20:09 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Tue, 12 Mar 2024 17:45:29 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2184dbcde47aefd5358b14463a0d993013f5609e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
