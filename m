Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A8DC433F5
	for <soc@archiver.kernel.org>; Fri,  1 Apr 2022 21:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9B19C3410F; Fri,  1 Apr 2022 21:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A90A1C2BBE4;
	Fri,  1 Apr 2022 21:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648849508;
	bh=rUp9JSv4cjkhMmZVQqTgdPhTLx9lSnLHnkDkOacaFpY=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=jhft6UCLC9VJbT9TCzltl7wiWPG7nEvkfBoQaDrQFCGaKiuJfM0phFfh5Pd5NY08C
	 ku9fkiC05HpffTc4vgfU3fLkuNMoFtuyV651MSaCTRDqtHNqrm2fVsQjTbsH2EN3Z7
	 jOgxXD6ONzpj8qfwlvHyKm1gwbB37KIlNb1cA1XcbXkoVE/SefT9AGSVe3RpyaDWQS
	 LueGL+I3k0Jl00ys9U6rE2tmlLJdXYIGwR5ljrP6SdmYlm2RTf664h1oWZx08//f1Q
	 a6IkVyTlD+9UuzosADolTMbtaL/UQ559mjM8PO949tQQ19jI2uqNkeuuS+tiRXGr30
	 vx5CkQjpeesEQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 93C0AEAC09C;
	Fri,  1 Apr 2022 21:45:08 +0000 (UTC)
Subject: Re: [GIT PULL] SoC: fixes for 5.18, part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a22UV+zTMjSVdWxbVK+G1styc6KqR4o1B9FE=oByYzRwQ@mail.gmail.com>
References: <CAK8P3a22UV+zTMjSVdWxbVK+G1styc6KqR4o1B9FE=oByYzRwQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a22UV+zTMjSVdWxbVK+G1styc6KqR4o1B9FE=oByYzRwQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.18-1
X-PR-Tracked-Commit-Id: eeeb4f1075d71d67083c75f69247206e9b3d9f4a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ba2d6201a9bfb1c5d5bfbc58a2db73d051b8337a
Message-Id: <164884950860.9554.17189338294062062360.pr-tracker-bot@kernel.org>
Date: Fri, 01 Apr 2022 21:45:08 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Lindgren <tony@atomide.com>, Ard Biesheuvel <ardb@kernel.org>, Kuldeep Singh <singh.kuldeep87k@gmail.com>

The pull request you sent on Fri, 1 Apr 2022 11:49:07 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.18-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ba2d6201a9bfb1c5d5bfbc58a2db73d051b8337a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
