Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93193C433B4
	for <soc@archiver.kernel.org>; Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 231CE61178; Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0BEFD6135B;
	Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1619466152;
	bh=gHCYNiCfzHD8sg8Dbm/7qW03yMeRb+NmlRqfrTSNipk=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=pACCfsUJKP98duPeh358Q8WXaw73UST1h78HQ6o7rxcMqIXrG5bc0n3D6AArN+Y84
	 RRUGHxb2vQf2sQcALRAM1lrzZov2joGEL/S79WBcDKH/ju2eNh4uD5sbKpmr2/ubTY
	 IVgBYch3PJTzg8rF71sy6qUk52cskYeEN3Et3qt0cEDqWUBxpH3l3CIZFAQ8wpJJ1O
	 t1pftBm5sX3JM1JOpLkvIbFgB5IF77O25+SxxS1Q4xyehSB+l2nNQ/dBXb+riOXm1U
	 Yete3M9fqxwXk2P6iqop5CMgQfmrzM/IP1thRMXni3VjvWm7j5y1PNoSXTjMb+b1xP
	 Ngm4sF8V6Rn1A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 05677609AE;
	Mon, 26 Apr 2021 19:42:32 +0000 (UTC)
Subject: Re: [GIT PULL 2/6] ARM: defconfigs for v5.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0WbrYBeR_VMBDfgC9R7aVXna26_LQjdHrd2xnN9e6_Cg@mail.gmail.com>
References: <CAK8P3a2RjRSjTcmwVf3VHy2CUB2HBj5AaJTx=1NSYuA_Qy4E-w@mail.gmail.com> <CAK8P3a0WbrYBeR_VMBDfgC9R7aVXna26_LQjdHrd2xnN9e6_Cg@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0WbrYBeR_VMBDfgC9R7aVXna26_LQjdHrd2xnN9e6_Cg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-5.13
X-PR-Tracked-Commit-Id: 028a1e968435383c9555fc9386d116688f31dfce
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2b90506a8186df5f7c81ad1ebd250103d8469e27
Message-Id: <161946615201.4821.6020771080190512041.pr-tracker-bot@kernel.org>
Date: Mon, 26 Apr 2021 19:42:32 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Mon, 26 Apr 2021 17:54:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-defconfig-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2b90506a8186df5f7c81ad1ebd250103d8469e27

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
