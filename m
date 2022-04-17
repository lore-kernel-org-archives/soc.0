Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745A0C433EF
	for <soc@archiver.kernel.org>; Sun, 17 Apr 2022 00:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3380BC385AA; Sun, 17 Apr 2022 00:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19200C385A1;
	Sun, 17 Apr 2022 00:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650154321;
	bh=FGfty+7elYJS/p6XUITgRJKqx2Nw2hqXpumpY+nV9kM=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=djULBQ8FVcGmRKjK8J2pdiGD33cEWJuSZUWeQ2G4qtZr5dGF/0fUorKN2ZACj6hau
	 dSlCXRNnYUn2H5MMSlyAAzE+ko66XMkRfCCdLhRWUbrSHIKqETEyHNXyW31+WkB19F
	 upJymBbSMh6xUAbICli6ac0tV5+M/T5zKIrF3sxyXPo+Sw0Gme/LE06/U5pW/PzLKN
	 rHPHahuL86iVh8rWENs+tkWPwclSNueTtZqScVgH+G8NkOpMm0koCrnlA9Jg0DKwkP
	 /3ufCNsR40Mn484kGp/vkc6Eud9qBTnRgAk+1KBb/0E8BG/ULPLnoEDA7wBYXY6lns
	 ehCl6N+C/0Rxw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EF451E8DD67;
	Sun, 17 Apr 2022 00:12:00 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 5.18, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1ZGJJCrEzg_68XJmPA_Ajk0TmfayBn2Li2J8Zau0hPNg@mail.gmail.com>
References: <CAK8P3a1ZGJJCrEzg_68XJmPA_Ajk0TmfayBn2Li2J8Zau0hPNg@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a1ZGJJCrEzg_68XJmPA_Ajk0TmfayBn2Li2J8Zau0hPNg@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.18-2
X-PR-Tracked-Commit-Id: 24a4351e1c04de8e580bf06cae7f3a79094fe7f0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 70a0cec8186bff968384f5ad4fe5cb551f04bfd7
Message-Id: <165015432097.20129.8835495788489782508.pr-tracker-bot@kernel.org>
Date: Sun, 17 Apr 2022 00:12:00 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

The pull request you sent on Sat, 16 Apr 2022 23:36:32 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-5.18-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/70a0cec8186bff968384f5ad4fe5cb551f04bfd7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
