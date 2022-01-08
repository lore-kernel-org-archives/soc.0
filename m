Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BFAC433EF
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 21:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83BAEC36AE5; Sat,  8 Jan 2022 21:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B165C36AE3;
	Sat,  8 Jan 2022 21:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641676315;
	bh=9uuh/EOE/UmsdzdI68PmJCU6XAwciP9+qtJjyvFE6Qo=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=ebyO2gSZM+PlCnsqKJSeCdFddq1+4u+uC28G2PeUC6Epyl+tvcsg+VS8XU1aA8zXc
	 8+GHBBVkgAXFd4CRANdigm+/05nHP1hrkLuv3Xs2EADW09kkbVXXjEw0Fgz6RL6Gd3
	 xzNXMxOGcaMLHsvx0ge5cB0K4xgjpd5gsZSwr1cCkpQONon9fjYPEGRPzULTeALfqU
	 75srmFkQxGk8XYhODij7jLypNKf3PXgw0pdGoOeiW1Ji72jRpjoYx21w/VFql9gZAP
	 /TlNC+qmhChmrKRCzPvUBxWSiDA9Lgh6L0UD70BoamPkJMxjJHHVqiPjiqE9gaKWuq
	 cV+0Yv22JsSIQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 56FADF79403;
	Sat,  8 Jan 2022 21:11:55 +0000 (UTC)
Subject: Re: [GIT PULL] SoC: Fixes for 5.16, part 4
From: pr-tracker-bot@kernel.org
In-Reply-To: <20220108202011.GA1760@lx2k>
References: <20220108202011.GA1760@lx2k>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <20220108202011.GA1760@lx2k>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.16-4
X-PR-Tracked-Commit-Id: 8922bb6526ac4b20bd8de7f47d6e77808670f6c4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4634129ad9fdc89d10b597fc6f8f4336fb61e105
Message-Id: <164167631534.4399.1770958189507443875.pr-tracker-bot@kernel.org>
Date: Sat, 08 Jan 2022 21:11:55 +0000
To: Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: torvalds@linux-foundation.org, olof@lixom.net, linux-arm-kernel@lists.infradead.org, soc@kernel.org, linux-kernel@vger.kernel.org

The pull request you sent on Sat, 8 Jan 2022 12:20:11 -0800:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.16-4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4634129ad9fdc89d10b597fc6f8f4336fb61e105

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
