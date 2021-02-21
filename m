Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490D9C4332B
	for <soc@archiver.kernel.org>; Sun, 21 Feb 2021 02:57:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id ACE4264F03; Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 87A6564EFF;
	Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613876251;
	bh=43oKlJakbkmj+bTx5N6/ULvVZabZ4m+4gl0YkAliklc=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=EFVPt1yoSe5ZuJagUcKd0MFZuhrBbGV3sBo6ng9ozqPWADujC4ZkhO5y4gfwD38W/
	 LPgOe0qCfukGk32/L56yPdxv3gnixg1RBWpspY1gs6wAKtN7997DkCZCX5lIgNqR1L
	 gSdCF4Ntzv9vVsLoETnnuwrd6N7s/mNy5sART/6pBzXy3H1+Li/9kq+4LGu8hUt9L9
	 iSgzMYx8ahZr6LfvcStLgaYspSOSWLwoh0HitMxTiepSJvGi6wmp0hqLaz/TdKhrTb
	 oj5wi3IujW/OqW97O4ByzAFSMZYnn8JXAuRH3/BKW0x6HYvQPL22No267MzDNupBnc
	 jh9lNRD47xhXg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7653060965;
	Sun, 21 Feb 2021 02:57:31 +0000 (UTC)
Subject: Re: [GIT PULL 6/6] ARM SoC changes for v5.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a24DeEegVmydqduEFDuiTy6cyOb9Qng9X+33rUuMqMw1Q@mail.gmail.com>
References: <CAK8P3a0w-vPNBF=4ieg3YUyNHzy+qiZ5iK-9M1cRxA+TakScYw@mail.gmail.com> <CAK8P3a24DeEegVmydqduEFDuiTy6cyOb9Qng9X+33rUuMqMw1Q@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a24DeEegVmydqduEFDuiTy6cyOb9Qng9X+33rUuMqMw1Q@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-v5.12
X-PR-Tracked-Commit-Id: 4f79a8b06fccec3dd68935db5a4662435c472abf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e767b3530acbf651593e3d357fe1168a024d8061
Message-Id: <161387625147.20427.12654426496687737014.pr-tracker-bot@kernel.org>
Date: Sun, 21 Feb 2021 02:57:31 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Sun, 14 Feb 2021 23:49:07 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-v5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e767b3530acbf651593e3d357fe1168a024d8061

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
