Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B251C433FE
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 18:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 733BDC36AED; Thu, 26 May 2022 18:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D1A5C36AF5;
	Thu, 26 May 2022 18:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653589210;
	bh=7rAMa2CpjHKdJZFG0JCbSXtaavwcLEIz4YM4IRza2uc=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=T1u6baH+ZAVeNZJMDBAWEEA0wtcOzuZBOMdWfKgwRqseHn0nQ8v5CRCGt9MeBWD2q
	 hXJcjuMf01DqODMKoN3A56btAz7zv5L5mQoM1RMqvKzt6Dyh6qS4bbp6aFEA+eig0G
	 UnsiFEaHFswz56G1AhNkK2uHK+gxlW8GF9u3jBhDRV+yWi8MyrxyFQSD20MPt1kzkD
	 v7RlFKXfsleXdK/pRoWc6PsKkYw+Fc/GjqRytg5N0sHtUeCNt2GkDAYorama8zkihZ
	 7BKrEagJrQokivgP0mw/dpDWm0/VjQ0YwHgosuU/CFzyJOdOGYHjsc2De8uk0vH7Ag
	 zvtlx0aBewilw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 38BD5F03938;
	Thu, 26 May 2022 18:20:10 +0000 (UTC)
Subject: Re: [GIT PULL 4/5] ARM: defconfig updates for 5.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0KQDRP0XJKQAPU6GUL1kTREAWc89skCf3qcS6utoo07w@mail.gmail.com>
References: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com> <CAK8P3a0KQDRP0XJKQAPU6GUL1kTREAWc89skCf3qcS6utoo07w@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0KQDRP0XJKQAPU6GUL1kTREAWc89skCf3qcS6utoo07w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-5.19
X-PR-Tracked-Commit-Id: 2cc1cd26e913848738f31fbb07663f0fe2d98fa4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a0439cf4eca05fe562f19ece4b6761852d911adb
Message-Id: <165358921022.17369.814776430891144641.pr-tracker-bot@kernel.org>
Date: Thu, 26 May 2022 18:20:10 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Thu, 26 May 2022 16:50:37 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-5.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a0439cf4eca05fe562f19ece4b6761852d911adb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
