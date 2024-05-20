Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59AB1C25B77
	for <soc@archiver.kernel.org>; Mon, 20 May 2024 22:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F1DAC4AF07; Mon, 20 May 2024 22:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C8EBC2BD10;
	Mon, 20 May 2024 22:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716243331;
	bh=426rdnFhOzmZGODgfSzTjGDMs/RniLV9geTTwINhcgI=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=juAMYDYswiJ3BVDHfGdRR51rNdcJ+6eH7AT5MyopUhrxWkk5XhvdqM43TEUljtdc9
	 c0Kloni9j7kqYguMw3ykGXL2wJB6w5yOLi2JqeqrbASodbY3oiDnspSywpKzqoERqK
	 U8RbYx4/YN9Web6JcL+ZSnO2Qzq6l6hBrohgmVfVigD10fy3ijdscKyLNxoxjyM8TG
	 2Wm04pvQo0+sF61KANVDkvyI+BhdRqKd+NZ60Ezayh2BofSiVPoPi2DL0f3U4tlGj7
	 zVs0mSor6BUfFKx0t6YEjC+sz+QPMM+DX2NeZU8E50bRHDzF2lVmavwtjvXfO0Sxs7
	 iAzrwn/U30f5A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 01697C54BB0;
	Mon, 20 May 2024 22:15:31 +0000 (UTC)
Subject: Re: [GIT PULL] soc: devicetree updates for v6.10, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <7b555e52-a83b-4218-9251-27dcb4e93268@app.fastmail.com>
References: <7b555e52-a83b-4218-9251-27dcb4e93268@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <7b555e52-a83b-4218-9251-27dcb4e93268@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-late-6.10
X-PR-Tracked-Commit-Id: 01a7f9e1a97ee48ed187b040afcda23886b9f48d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1b036162097060e7e762b601de6517d9f2c7514e
Message-Id: <171624333099.11553.4340948832769130968.pr-tracker-bot@kernel.org>
Date: Mon, 20 May 2024 22:15:30 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, Neil Armstrong <neil.armstrong@linaro.org>, Joel Stanley <joel@jms.id.au>, linux-kernel@vger.kernel.org

The pull request you sent on Mon, 20 May 2024 21:49:14 +0000:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-late-6.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1b036162097060e7e762b601de6517d9f2c7514e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
