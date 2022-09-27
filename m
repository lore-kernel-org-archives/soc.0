Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4966C07E9D
	for <soc@archiver.kernel.org>; Tue, 27 Sep 2022 23:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81C60C433D6; Tue, 27 Sep 2022 23:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F24BC433C1;
	Tue, 27 Sep 2022 23:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664322994;
	bh=4HxdrtZ+XAn2KnjPOD1QLFm4ld1k7wdS1QmKr5wTXYE=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=GYC+/z1NPYTe3SBrWaKmJUjD3GIBqxOPP8ouQ0vpsUjsTTGxohFlXqNuDbpo9jpXr
	 2cxcpVMDIKWhld3Lq1qhVmqGQkUFENtq3elegKjzFSvN9QuoCdJEArgVtGLoB81Dul
	 dCCXka3CHqIB7xRuQwgIv6fUbLR9rvVXOmCN/JBdhlG1XjrOINRr0p20+4SViHlO4o
	 IgW9Vgz7A5Z+QCh/YVaFCIZYjlVq0OHSm0W0W0gGnUY/HC5Pt9vCf4YgMuwFJM5EBB
	 JdzHLqxrEa0LXw76j+q9Cd9s1XSCq/9ffk4Rk+GBO9nUYjuvJBMrhfEUL2XzLxdX/7
	 vYPePmu+0P9LA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B39AE21EC5;
	Tue, 27 Sep 2022 23:56:34 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.0-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <74c1ce25-e6c9-430a-bc03-e1acab0cb818@www.fastmail.com>
References: <74c1ce25-e6c9-430a-bc03-e1acab0cb818@www.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <74c1ce25-e6c9-430a-bc03-e1acab0cb818@www.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-6.0-rc7
X-PR-Tracked-Commit-Id: 7bea67a994300c7dff827d1eb2344c180d1ffd93
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 49c13ed0316d55d73f1c81c66a7e2abd743f9ae6
Message-Id: <166432299430.1677.5874266995351987429.pr-tracker-bot@kernel.org>
Date: Tue, 27 Sep 2022 23:56:34 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Tue, 27 Sep 2022 23:37:31 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git soc-fixes-6.0-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/49c13ed0316d55d73f1c81c66a7e2abd743f9ae6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
