Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6C0EB64D9
	for <soc@archiver.kernel.org>; Thu, 29 Jun 2023 22:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8A60C433C8; Thu, 29 Jun 2023 22:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 873E1C433C0;
	Thu, 29 Jun 2023 22:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688078360;
	bh=AJxy1dMSWG68XF5+HnFr703bGh4lnbXX8xUvtrFm8Vk=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=o7w2CJNvfXepsBDXQi6Q4UOfz3ohdZ0mz/0u5ad40rIsc2S67HaK9OYHqalIqoFRN
	 QkSZnIn4J8cJ70nZq+yM+XqNjEDoF4JGamuMhxFlAo0xa3mfoxlB6j/2h2XfPiqA8H
	 NXdmXZRpJWEHu3aMkbJLGbMERacmLe9SKfZv071VhicV3lcb+Q8W6qCOy6CvarWFEw
	 HzP3v8yjovEGIy90RmJwZGLyWULqYZS23crcbIKnjMpCNqeZVhaAbYi4Cw+lX7Qm3z
	 wxLOTXiJZbFZUY7OjaD4Rc9fehyxx26eL5blp5wBjedtbn8RsdTxLoiuXwjuLT8LtN
	 isdrBCAhWRsZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 73183E5381B;
	Thu, 29 Jun 2023 22:39:20 +0000 (UTC)
Subject: Re: [GIT PULL 1/5] ARM: SoC devicetree updates for 6.5
From: pr-tracker-bot@kernel.org
In-Reply-To: <4915b230-2555-4085-8c39-e4bcad5b3949@app.fastmail.com>
References: <80fba92e-3836-4d27-8be6-1e5f7b5b2f53@app.fastmail.com> <4915b230-2555-4085-8c39-e4bcad5b3949@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <4915b230-2555-4085-8c39-e4bcad5b3949@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.5
X-PR-Tracked-Commit-Id: 46448b36ff8c807194d5884a6efce00891e4bd02
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6c1561fb900524c5bceb924071b3e9b8a67ff3da
Message-Id: <168807836043.26000.2313597642906739060.pr-tracker-bot@kernel.org>
Date: Thu, 29 Jun 2023 22:39:20 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Thu, 29 Jun 2023 17:16:13 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6c1561fb900524c5bceb924071b3e9b8a67ff3da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
