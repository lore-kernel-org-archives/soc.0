Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1068DC0015E
	for <soc@archiver.kernel.org>; Thu, 29 Jun 2023 22:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB395C433CA; Thu, 29 Jun 2023 22:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3140C433C9;
	Thu, 29 Jun 2023 22:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688078360;
	bh=sXmtI151s5oaULzVJkYQqFrahx2UCzhae/Wwqi270XY=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=PEI8lVwKfXk4w3iMne5Z9u5vfOqvIArIJaqhDragFjm3Ajx6AycCaDBtgihvHH0qV
	 UaLqqCIiNHXpo7caRS16X76TCgFQVN7pyMovd9RKGK3xAeRbei25L6OUKt9gxoxCD/
	 THKlbPTtIGiejlatyscX5cmehpWjfMuJPupF6uS1A8u/s1hDIrC9cMr6srjigmxo9t
	 9VbVZSDmnJ5O3yb0RPPoGOkWTDRL46jhdGVOVM3OR9kmLC2RVD6CtQrz09g1MMXgD7
	 AaJ9N0owLMLGW/VA3ofHQRWmOhKc+UUZXmcZzHKQUfQXu8dNCY4s6wzR5xhyRdfCko
	 C5dooYwXYS3Mw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B15FAE5381B;
	Thu, 29 Jun 2023 22:39:20 +0000 (UTC)
Subject: Re: [GIT PULL 2/5] ARM: New SoC support for 6.5
From: pr-tracker-bot@kernel.org
In-Reply-To: <8b809904-4514-47f1-9a49-93d1ebdc70e1@app.fastmail.com>
References: <80fba92e-3836-4d27-8be6-1e5f7b5b2f53@app.fastmail.com> <8b809904-4514-47f1-9a49-93d1ebdc70e1@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <8b809904-4514-47f1-9a49-93d1ebdc70e1@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-newsoc-6.5
X-PR-Tracked-Commit-Id: f50a000b42195a0e0d22c34c16b7c488b22063a2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a9025a5f16ed610ea28a188cb0946cb71fafff17
Message-Id: <168807836072.26000.11634777355666874365.pr-tracker-bot@kernel.org>
Date: Thu, 29 Jun 2023 22:39:20 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Thu, 29 Jun 2023 17:20:14 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-newsoc-6.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a9025a5f16ed610ea28a188cb0946cb71fafff17

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
