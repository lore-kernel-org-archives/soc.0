Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87258C4743D
	for <soc@archiver.kernel.org>; Sun,  6 Jun 2021 20:14:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 665C8613C8; Sun,  6 Jun 2021 20:14:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4D522613AF;
	Sun,  6 Jun 2021 20:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623010445;
	bh=qFIWkfsL3N/CxGgEuHQ+owwXxgek2OswTYnZmFjD04g=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=KF7mcRp+jpHStZpKk5bnFTKE4iJWSRahuxf1XroxfUWayvPTu3JqzKZMZ07546c54
	 4LO7sxNK8W8cwNcFYNF2rST244VtQiG5yIDGlbSR6K+6Wwxmz+R5aZL/5xIlBHPeJt
	 eXcRcfPMnD+wptYVsTOKbmSF5/N+ab/UYxXyXxD2JyLz3Idz6Ae979VuN1rWtR0rq2
	 SSUn9oZl3BKCHqOIx2ZEqTmZlnzLcCHBifDNUsmlY69Yvv2kZRN65DlrzIYYr1tjHs
	 ZlsbzNGmkl2UZzuo0E8BTPomIgPuO5neWxmZSQc4SKEc0S+OGDa+dZl2X89e3K0/8M
	 rNu0HRXNw4s4A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 373C0609D2;
	Sun,  6 Jun 2021 20:14:05 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210606192724.GA7363@lx2k>
References: <20210606192724.GA7363@lx2k>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <20210606192724.GA7363@lx2k>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-v5.13-2
X-PR-Tracked-Commit-Id: b9c112f2c223ce50ef6579c9825a62813b205de4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: decad3e1d1ed150588dd9d44beacf82295b9d5a5
Message-Id: <162301044516.15135.10381507080461852412.pr-tracker-bot@kernel.org>
Date: Sun, 06 Jun 2021 20:14:05 +0000
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: torvalds@linux-foundation.org, olof@lixom.net, soc@kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Sun, 6 Jun 2021 12:27:24 -0700:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-fixes-v5.13-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/decad3e1d1ed150588dd9d44beacf82295b9d5a5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
