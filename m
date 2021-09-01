Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E70C4320E
	for <soc@archiver.kernel.org>; Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 40A67610C9; Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 27BDE610C7;
	Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630536249;
	bh=n98B7JjdLPThQoLHZGSUq2Alu0Nexkag0Yp6QBZWFrE=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=t70ILwWFzpEtFojlTb3AdIO6AYEkmsxbELsn/ha3B9USo92BQTeszoOvF8CBbktqU
	 FkKsL2VBtAFQFVx3yBzz2U6ea4McUj+4TzTznoQY/iXJiH11isli0V9qneJeymKsd/
	 SbDkb8N/1XHKwqWzqUcgX1/tXeExDTWTnKyBE3RPm/2Cm6QhGnIMIvjsny7Dtmx6ad
	 U6ZVERezexOn3SEjLvZhVyHOtsKIL61UQZsoDovvmGP3HJs1sCEjEmMd4UdZ4PDoA7
	 lZb4Yd6En3DqLGuHf0pmS2le/VQH09bpsRviMT/61OOrZApEOwassatmvYiGo3d1Zl
	 9pRkTsaF5Bdmw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 21A9960173;
	Wed,  1 Sep 2021 22:44:09 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] ARM: SoC drivers for 5.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a0xs=kVKDMD4fyCh0tt+884=coomhjca72=2pWkG_daWQ@mail.gmail.com>
References: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com> <CAK8P3a0xs=kVKDMD4fyCh0tt+884=coomhjca72=2pWkG_daWQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a0xs=kVKDMD4fyCh0tt+884=coomhjca72=2pWkG_daWQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/drivers-5.15
X-PR-Tracked-Commit-Id: 06779631d18ff2901af604eadea0d7b2193db7a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 866147b8fa59530812fc769027a94468d89401e7
Message-Id: <163053624913.31944.16750928575487447696.pr-tracker-bot@kernel.org>
Date: Wed, 01 Sep 2021 22:44:09 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Wed, 1 Sep 2021 19:57:29 +0000:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/drivers-5.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/866147b8fa59530812fc769027a94468d89401e7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
