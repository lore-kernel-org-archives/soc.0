Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D28EB64DD
	for <soc@archiver.kernel.org>; Thu, 29 Jun 2023 22:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1DC9CC433CB; Thu, 29 Jun 2023 22:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07884C433CC;
	Thu, 29 Jun 2023 22:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688078361;
	bh=ZmQHopEKzrmwKQ8uZtM/ClUXfi/vDhTx8JCATu4Z0Rw=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=T50H1+UBA1GAEdqyjXfDH+DxyKjmvctoPRhbiwCrRFjobc5Bl4jqTAbauRG/pgG76
	 VUa3FM2UxlstqgCUaeJvOvaaGdQkDGsyGsPPmDGjRaihTNQLeTDEz6tLVlYmBi/hwn
	 0dFck8+YHzQp8c/9j3Lob7j5gk5ijNbAEVNN2n2B03AKgBlEFSdijSHzO0qGuBc2q7
	 BxMrFS1n8F28vp7i7Eb+xKoxbINlwTd2F1jjOrsabjkUI8TBhS2atA7Tsol1RJmRYR
	 NMNFvKh+lSyqB9GKyzyz37cZOLSWKYn3L4ia5RdQmulYn4XoF3wd2XmelkalVadaaV
	 J/zOu3J5w1JUg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E7F73E5381B;
	Thu, 29 Jun 2023 22:39:20 +0000 (UTC)
Subject: Re: [GIT PULL 3/5] ARM: SoC drivers for 6.5
From: pr-tracker-bot@kernel.org
In-Reply-To: <8b646c94-72b3-44c6-81fb-13d069284217@app.fastmail.com>
References: <80fba92e-3836-4d27-8be6-1e5f7b5b2f53@app.fastmail.com> <8b646c94-72b3-44c6-81fb-13d069284217@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <8b646c94-72b3-44c6-81fb-13d069284217@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.5
X-PR-Tracked-Commit-Id: 356fa4975950d48d12b6ee9f9050ad429db25852
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e4c8d01865118ab148f77bdb54ec9c0c181d90a3
Message-Id: <168807836094.26000.17898918241868925375.pr-tracker-bot@kernel.org>
Date: Thu, 29 Jun 2023 22:39:20 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Thu, 29 Jun 2023 17:22:02 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-drivers-6.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e4c8d01865118ab148f77bdb54ec9c0c181d90a3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
