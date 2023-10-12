Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F6E9CDB482
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 21:21:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF111C433C7; Thu, 12 Oct 2023 21:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D259EC433C8;
	Thu, 12 Oct 2023 21:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697145664;
	bh=ncTYtC4lKZ1XWr2L7fFC/E6DJV14oj+wSORUsrtHcpg=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=MYX8PGTjjRy8wcBz8K4nYihTQKms9nbdizDbPFZglDlFCDOAvMnXmWfjcAFh9Ohdj
	 69wbcodesz7stBACAdorC09XlRIZvSe6no6Bfsb6YpbMdy55dm8A8xESCq/NqQYlwU
	 +j3yTS7WrkmklSiApKa92Hny3Or+ZAuDSMaUtmzTU3in6qhDPQsm13/FsnQoe880zb
	 CdQq/BnTZXpoFStZI+G8Zias9F4kP2KCzX2IL3d37D64dT+MFbDCDM1gmh7092wVG2
	 weEYjvdDEDmvXNkePzpOl3N+aoS5lQi8Iv2e0rmvgVbz9glpH0tNOdUjHZrmBP4apf
	 zFCN0Bko53/JQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BC3C5C39563;
	Thu, 12 Oct 2023 21:21:04 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.6, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <36814910-2a98-4567-af7f-684318a1ebef@app.fastmail.com>
References: <36814910-2a98-4567-af7f-684318a1ebef@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <36814910-2a98-4567-af7f-684318a1ebef@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.6-2
X-PR-Tracked-Commit-Id: 26de14831cf6e6a6ff96609a0623e1266a636467
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9a5a14948574ee09f339990cab69b4ab997d2f7d
Message-Id: <169714566475.14457.16719459257494816357.pr-tracker-bot@kernel.org>
Date: Thu, 12 Oct 2023 21:21:04 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Thu, 12 Oct 2023 15:09:14 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.6-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9a5a14948574ee09f339990cab69b4ab997d2f7d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
