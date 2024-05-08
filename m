Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23CEC04FFE
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 17:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F1B0C2BD11; Wed,  8 May 2024 17:24:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73746C113CC;
	Wed,  8 May 2024 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715189045;
	bh=LVflNGpLJaDRSDa+a8HFciyMMmPpKmQmkHnSjlEEsaw=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=AFeUyVBGD61n40gXZjUcqy5zC5tOFAi+f1TWmVm1uVebK4LvIkwoF6wG6bLPdkJ8g
	 ECNi9u8E3aY+KhS1uJcVvGGTDCTvq4cL/QBg+vDnGrzu36tveIcIHyx5z8sb1yWltN
	 PBE8PVuYY4tuieiqvTJ4TwDgz/tTxLhBd1w/XioNhhG3Re8twjZTwSKtvMj+cf2E33
	 ptoYv+RHJ4T8I3/m1N7bS7AGOaAhV3BMx8bnZsCURWiiZ9/26C6X/NbV3KF4uDkYhQ
	 0tFqaBHQ6pkHKxLOP5HK66Sxe7fNEd75IDogTIDslEU/4COjC+WxyitpaeHlbWUdiw
	 yM5XinCIa4DFw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 666E8C43331;
	Wed,  8 May 2024 17:24:05 +0000 (UTC)
Subject: Re: [GIT PULL] ARM SoC fixes for 6.9, part 3
From: pr-tracker-bot@kernel.org
In-Reply-To: <7abb76bb-eb4a-4136-af2f-6b22fbf3d79f@app.fastmail.com>
References: <7abb76bb-eb4a-4136-af2f-6b22fbf3d79f@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <7abb76bb-eb4a-4136-af2f-6b22fbf3d79f@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.9-3
X-PR-Tracked-Commit-Id: 5549d1e39989e2ba86c4775546d0bd8055746cfa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6d7ddd805123e03db0a16c7dbc8509366432a630
Message-Id: <171518904540.5238.12248743909624398844.pr-tracker-bot@kernel.org>
Date: Wed, 08 May 2024 17:24:05 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Wed, 08 May 2024 08:00:08 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.9-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6d7ddd805123e03db0a16c7dbc8509366432a630

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
