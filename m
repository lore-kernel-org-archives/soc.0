Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C82C433EF
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 18:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 150AAC36AE3; Thu, 26 May 2022 18:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2FBAC36AEB;
	Thu, 26 May 2022 18:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653589210;
	bh=qayRqt00LdAFIl9y9DSFGaoLOqqEv/p+MktSgJ+r3xw=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=HBpWwIrUxVUedGaqYyjV7SloQ6hyE0vyQtsXY4vD7FgT8U3xUMbGaOuWaOIL5b60O
	 hBgKxhp61mkJtzxgGV2qQ15q/ylO9fe/OL3SGJ2Er6ORHTaDavHN9AmPQk9SXYBtwG
	 Snq4hLAIrJCMT/zLMiLwg+cLDcTRyEbrOBch1M+hGWsSR0ifqZ3kkNi64C5Lo+Hi2u
	 nW7SPTu5kO6nJb/Jz4xq0zVTCjcQncaMwggIW+/nsHNfch8zsZal5Rvo0jmo5F8J5v
	 sDbIG3yxIbCXXzZNlcr+Jxn6qGjUgAgkvtWsUkT4QZSt71uNCuITUnoQHLA4sMA4q+
	 /5syaNpr+wJyA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D31AEF03938;
	Thu, 26 May 2022 18:20:09 +0000 (UTC)
Subject: Re: [GIT PULL 2/5] ARM: DT changes for 5.19, part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a02DSq819Hk82h5gNF+KfBPqsW1prGFKUosgSd+kHG09w@mail.gmail.com>
References: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com> <CAK8P3a02DSq819Hk82h5gNF+KfBPqsW1prGFKUosgSd+kHG09w@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a02DSq819Hk82h5gNF+KfBPqsW1prGFKUosgSd+kHG09w@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.19
X-PR-Tracked-Commit-Id: 82706d6fb19d0b845146f7108fce3926502c5f52
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ae862183285cbb2ef9032770d98ffa9becffe9d5
Message-Id: <165358920985.17369.4272858774057930886.pr-tracker-bot@kernel.org>
Date: Thu, 26 May 2022 18:20:09 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Thu, 26 May 2022 16:48:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-dt-5.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ae862183285cbb2ef9032770d98ffa9becffe9d5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
