Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50565C2BBCD
	for <soc@archiver.kernel.org>; Thu, 17 Dec 2020 00:57:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 287CA238A1; Thu, 17 Dec 2020 00:57:18 +0000 (UTC)
Subject: Re: [GIT PULL 4/5] ARM: SoC updates for OMAP GenPD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608166638;
	bh=pxmP3C9gdN/9bJHndXB2idVk+QRerKKiQZKKuU5d/SY=;
	h=From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=lvHhpgJNjZ5vgxZajTCMD/kLIPTAknDNDJCUsgqmHTM+gLt6du1DP1STCnF4zqr7F
	 dpWHBBwMVJDzSiWnlt3jTOKzJhiKOeDuMEvZP0nLfYncgzBrmLbqNr1LKEy3GJk/ie
	 /GuHIHtJ5nnbp9JbOWoGQhQ5obkWZyqBDeFrujbntS6vgghpAaweZpLUPmAKUrs1X1
	 oHU/f2jEAGHUqAUsBwBM0hyrksvWDIY4CNm9RCLryf7VIYu8zvPo0mqvV13Az+jz7T
	 P2yYzF0F96/fixALLmPyOGakGzmDAG5kPZEAP02qDpOGkhzHM+gcPkCtAq3hRYtJ+H
	 J9HhRMYiPwfpw==
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0MxuA4BMsHnEkcfmH3TfJnQxV_DQ-S858VM2fPA2-AuA@mail.gmail.com>
References: <CAK8P3a009=T3WorioFWX8d=tEK78_o6ZHM6TGSmWmd37-_izug@mail.gmail.com> <CAK8P3a0MxuA4BMsHnEkcfmH3TfJnQxV_DQ-S858VM2fPA2-AuA@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a0MxuA4BMsHnEkcfmH3TfJnQxV_DQ-S858VM2fPA2-AuA@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-omap-genpd-5.11
X-PR-Tracked-Commit-Id: 7fbee7e3386cb51e5ebc60c4d7cea13ffeab31d6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: accefff5b547a9a1d959c7e76ad539bf2480e78b
Message-Id: <160816663803.8160.1676370483633044090.pr-tracker-bot@kernel.org>
Date: Thu, 17 Dec 2020 00:57:18 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Thu, 17 Dec 2020 00:28:19 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-omap-genpd-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/accefff5b547a9a1d959c7e76ad539bf2480e78b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
