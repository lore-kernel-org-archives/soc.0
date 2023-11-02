Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903ABC41535
	for <soc@archiver.kernel.org>; Thu,  2 Nov 2023 01:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78057C433CB; Thu,  2 Nov 2023 01:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C4F0C43397;
	Thu,  2 Nov 2023 01:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698887412;
	bh=O1rtx26+WrqAYM6mKG+GNvV9rHRUa05V29A1Dvvj5sk=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=kvJyfMcBWKWR02owmSAMshqvHePEpby6BCzEAEVApsbvBjaLn0UUOG5039kmiRZQA
	 EOqL6dYWpQCdfqRtwncGnqf7iN8KwJfGgAvrnle4F6i70PxCHXTYHvkiGT7g+BVQhY
	 +n7/ph7i2vut7iYLUEwCYrxGCnOAC/MiCr6oG1slP/zAH3DB7A9HXV8f+47jpBbN4m
	 zw6t3cviIdN2YDRt0dHPyZpuVOPzL9HvmYe28iSSJS0bmtZzM9v7bC4+7P03+g5F6S
	 AhFC/0liuEIhEZMtBMmFhdfZLgjC0ybK6JpBUzYsRSYBHwc0sRPKJ+c/u4GuNXgrvR
	 n9L45zvgJPdRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4A457C4316B;
	Thu,  2 Nov 2023 01:10:12 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] ARM defconfig updates for 6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <b2114f58-083c-43d0-a73e-660c030a0241@app.fastmail.com>
References: <263c2cf0-c35a-4d3c-85b3-fcb692cbfd40@app.fastmail.com> <b2114f58-083c-43d0-a73e-660c030a0241@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <b2114f58-083c-43d0-a73e-660c030a0241@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.7
X-PR-Tracked-Commit-Id: 216da5ebb83a13caece8032ee443acfd6a6083b6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a39ba9b429a4671913e79da9d6a20476f10796b1
Message-Id: <169888741229.4705.8353686977186683832.pr-tracker-bot@kernel.org>
Date: Thu, 02 Nov 2023 01:10:12 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Thu, 02 Nov 2023 00:38:38 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a39ba9b429a4671913e79da9d6a20476f10796b1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
