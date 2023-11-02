Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5D1C4167D
	for <soc@archiver.kernel.org>; Thu,  2 Nov 2023 01:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54BE0C433C9; Thu,  2 Nov 2023 01:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 398A9C43395;
	Thu,  2 Nov 2023 01:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698887412;
	bh=0T3X9NI+EQKOVLQJZW7TIOME13+IvrFq0Ykp74ZVg7Q=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=GjSaIaefCwxn5S6NmfXmHe4d4mAUDGcSZ/hV4rF4jdEtyY+/8OnS6nn81z63VPejX
	 8dOwCHR48itFLSuCnyvj+ILrIhBDV5xOQNSbYvCoUcrjp/wjmJZ8fywBwIoT/TxRYM
	 mAEIuslS1LexWixC7GZa08nATC1YNvlJNSa5DkVyOuZJcpbiMsxtv5LhhfjSVODdMw
	 geAUb5qbsHVVROrziZbp89dBHgV8Fs/sp6ngQJa+1mW5uUr6MRc9nMX9Y22HdRPQSy
	 xeSn0hEZUzsmOUFnvQrO7ky9x03xeGLb6ZxzrxHJ75EfOhkuH37hdYfLPHL4VUX9Y1
	 HLKlmNMSrZd3Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 26533C4166F;
	Thu,  2 Nov 2023 01:10:12 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] SoC driver updates for 6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <6a235abf-d3c0-4d05-8cbd-e6be739ec59c@app.fastmail.com>
References: <263c2cf0-c35a-4d3c-85b3-fcb692cbfd40@app.fastmail.com> <6a235abf-d3c0-4d05-8cbd-e6be739ec59c@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <6a235abf-d3c0-4d05-8cbd-e6be739ec59c@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.7
X-PR-Tracked-Commit-Id: dfae947836d867e127e2b64f981ebb299c28f0dc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 385903a7ec75bb400f4bf0f07d8d5ad61390270d
Message-Id: <169888741215.4705.3669229446408607693.pr-tracker-bot@kernel.org>
Date: Thu, 02 Nov 2023 01:10:12 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Thu, 02 Nov 2023 00:37:37 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/385903a7ec75bb400f4bf0f07d8d5ad61390270d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
