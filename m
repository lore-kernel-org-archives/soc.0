Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68012C433EF
	for <soc@archiver.kernel.org>; Mon, 10 Jan 2022 18:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1FFFEC36AFB; Mon, 10 Jan 2022 18:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08895C36AE3;
	Mon, 10 Jan 2022 18:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641839283;
	bh=SmWEfuyvlOVMiDtTJNqN8Db33HF2ULj66JGynE1zRu0=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=m3qX3LEcqYfpQMMpioqxvZdQ0PK8Z7MCxmoHc2YDi/G54KHLhO/ojp+X33aIpjNBs
	 BTnXpD+uH48esvLvZiAuKMlN+c2H7fPnJ+2elacEwlp7oTfxX1gWmGYRkoMFv/kyS2
	 F6RIjZNzZ4/zPpLS7ViU3/iJ6HkyQ76Y7+Jjbk7MevyykIIRPPl1kBREERIFp+/NIA
	 CTfC5XGXpznjr0y2uZ/idZSWVQZcpCRL4GoPy+0LtFFLqkyQ8KJeNwG8jlGLJEg/yf
	 5M9x0iqwnDS2PJjThCBi95Xo9f9eBjLNeyaomM98j00U1MnorcsQ3bcj8U+t+OKjbh
	 P/TcRcCky8L4w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ECB40F6078F;
	Mon, 10 Jan 2022 18:28:02 +0000 (UTC)
Subject: Re: [GIT PULL 4/5] ARM: SoC devicetree changes for v5.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a23RO3B4be2x_gZV5sYy2JiAgPMFMO5QE8wQ9gLEa8ZVw@mail.gmail.com>
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com> <CAK8P3a23RO3B4be2x_gZV5sYy2JiAgPMFMO5QE8wQ9gLEa8ZVw@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a23RO3B4be2x_gZV5sYy2JiAgPMFMO5QE8wQ9gLEa8ZVw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/dt-5.17
X-PR-Tracked-Commit-Id: 8b0c59c622dc4dab970ec63264fb5b152944ac80
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: aca48b2dd1e70bb1be23bf5eb2fa50da9f6c2579
Message-Id: <164183928295.9673.11763370272529520512.pr-tracker-bot@kernel.org>
Date: Mon, 10 Jan 2022 18:28:02 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Thu, 23 Dec 2021 22:35:11 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/dt-5.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/aca48b2dd1e70bb1be23bf5eb2fa50da9f6c2579

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
