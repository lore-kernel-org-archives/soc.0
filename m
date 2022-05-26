Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F65DC433F5
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 18:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9F57C36AE5; Thu, 26 May 2022 18:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1A36C36AE7;
	Thu, 26 May 2022 18:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653589209;
	bh=AX+KCWyHTmqmReF0Dg+5XVQKa+k6s/mT8JXprrB5JgQ=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=H1E0BIYfLgFwLo/6ppeLEd+d5ltWifiCXWlgrR1t9OdmPdcCczMmAB4pB2rftsYqm
	 GLWDWlPVOR3eaEinlSgaibQmvWgOYFHBydKB1w+bvNxiESAacaN/3iUQi6EVxukE9t
	 a8ACduWCyrAyJQAYM8E+TUxya1PJzSh2uJp/ajJRukTrXR23fAwgtARebFiKg55w/8
	 KqSwvYjJi8mO00ssdH/Ge/gUaRmfBoGtoJ3NPKkQdjoYKgoLV4k3l0+8zXTArfnHtA
	 LfCWZKdoa4vOA7u4LYxAPMlzDVpGyAsTxre1hJSTmTH+njB1Uu6d67wzSydFSRcXvS
	 WDryMAOWP9zJg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A4E99F03942;
	Thu, 26 May 2022 18:20:09 +0000 (UTC)
Subject: Re: [GIT PULL 1/5] ARM: updates for 32-bit SoCs
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a2s3mAOqp40PZ2W7V5R=R5yare6Eq3fNbZq5kLEYYAmzQ@mail.gmail.com>
References: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com> <CAK8P3a2s3mAOqp40PZ2W7V5R=R5yare6Eq3fNbZq5kLEYYAmzQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a2s3mAOqp40PZ2W7V5R=R5yare6Eq3fNbZq5kLEYYAmzQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.19
X-PR-Tracked-Commit-Id: 426ecc5851021519374542b0a954b2a9a3942d04
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c011dd537ffe47462051930413fed07dbdc80313
Message-Id: <165358920964.17369.8719021917545553930.pr-tracker-bot@kernel.org>
Date: Thu, 26 May 2022 18:20:09 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Thu, 26 May 2022 16:45:22 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-5.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c011dd537ffe47462051930413fed07dbdc80313

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
