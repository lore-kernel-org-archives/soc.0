Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0A6C83F14
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 00:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70569C433CC; Thu, 31 Aug 2023 00:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F173C433C8;
	Thu, 31 Aug 2023 00:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693440617;
	bh=+BEJJh0cUutSZhbjQKhq5ZLUX9z4rl0b/KnzuWrUKaU=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=ZKqw5Hjq+3AiWcn2M3YXGgpOWUWShVMUko12JCUVCU0ValFKdW2O/mL/lpslyGZhI
	 grotY3X9bw78ZJopzQIfMcAgNqjF65f7d2HhSVMHk42nyKoOyGF1qVQD5mWu8h2mn0
	 HkLl89P5ePiSz9oemFRw5SQdSyXz7ar4wnwy5gMxN++HWVhGUJ6v3QU5MPm17v7PaW
	 j9onsNF/OScDhHj77rMsbzPsojOCrUlMdi7wmoueNTqO0LfzJG/fC1KwDx9IVVzOk+
	 kJe12RdbN6vz3YMoLrCcAQsCfighxFfFvtXHRMzHRK2lo79TsvlmpJGhwtyqw/DMLv
	 r6+zAcXRJPg+Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3BDDBE29F34;
	Thu, 31 Aug 2023 00:10:17 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] ARM: defconfig updates for 6.6
From: pr-tracker-bot@kernel.org
In-Reply-To: <48c2b819-153a-495c-8f36-2d6bc1a74793@app.fastmail.com>
References: <4f60d13e-f060-491a-88c7-6f25323a48f8@app.fastmail.com> <48c2b819-153a-495c-8f36-2d6bc1a74793@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <48c2b819-153a-495c-8f36-2d6bc1a74793@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.6
X-PR-Tracked-Commit-Id: d2dff8d84df22b8f5e88d86d9f412ae0c01ad796
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 47ca50600efcf994adb62a9a4e75c77d91bd0781
Message-Id: <169344061723.21437.6760948162765799113.pr-tracker-bot@kernel.org>
Date: Thu, 31 Aug 2023 00:10:17 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, soc@kernel.org

The pull request you sent on Tue, 29 Aug 2023 17:52:18 -0400:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/47ca50600efcf994adb62a9a4e75c77d91bd0781

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
