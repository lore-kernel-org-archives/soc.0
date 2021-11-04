Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC18C433FE
	for <soc@archiver.kernel.org>; Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 63647611EF; Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4C3BD611CB;
	Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635984767;
	bh=+ML6VCFgUSy1tcIMNjAJ3CyRpbIIhRo9orQztRd9JD0=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=uWKQ39mdxcja6Phmt/dYkZzjy5eV0KpeW7nrHjLiINfoXWNCW98b/FQq2rKf2CI0C
	 oqXbWywwKFpCp9IC1kVpJzxbpj5XdPQE5BvELetgIz0yhNfK79cVY8L1wAl5NQRa7t
	 ylqT6BC/SCCfA/fDgiFqYxzC6hedd9ZRR0OngdSKYCX/Tk4AasM0UbS6Xr2DqBwV69
	 gIDR5zeeUQK1Kp/Nf3nElppME7jHWmQeNkTp/ZFg0LlMd2FWFfv2lZmICctISs/Tjt
	 n5Acp6gQ6+Gvq84gc6RSopFgobBypUVt2WYpyehCMRjuvtIVZJp+vG5bwJKxL+yTF4
	 MxKrweV19M3vQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4556460979;
	Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] ARM: SoC drivers for 5.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2gzowTrpNtuMN6RH2J2BbrSBihJG5hh2EOSpxwZ=jYog@mail.gmail.com>
References: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com> <CAK8P3a2gzowTrpNtuMN6RH2J2BbrSBihJG5hh2EOSpxwZ=jYog@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2gzowTrpNtuMN6RH2J2BbrSBihJG5hh2EOSpxwZ=jYog@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/drivers-5.16
X-PR-Tracked-Commit-Id: 6a03568932b2711c91e1572f08867690b52a18df
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d461e96cd22b5aeb1df448536b92e8d8e88c4a05
Message-Id: <163598476727.32364.11194691650067602463.pr-tracker-bot@kernel.org>
Date: Thu, 04 Nov 2021 00:12:47 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>

The pull request you sent on Wed, 3 Nov 2021 23:55:15 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/drivers-5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d461e96cd22b5aeb1df448536b92e8d8e88c4a05

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
