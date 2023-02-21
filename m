Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC22C61DA3
	for <soc@archiver.kernel.org>; Tue, 21 Feb 2023 00:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7ECFC4339B; Tue, 21 Feb 2023 00:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8481C4339C;
	Tue, 21 Feb 2023 00:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676937932;
	bh=0pbiw1TarnjBbjlGkqWgK6SVfJokA9b2gZ1QQYqhBD8=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=Bf7bumncd2VlMsoLX1os/ZR8JA8FsEP4dOaPW3gij+tLhmguKX9IG5dR1DTZb39Jg
	 05YYnVe2UJSLV+uLQGyaFHr377qeVF8AYihg4JtnaO9VaKG4plDP7GqseI0Rr+yXaN
	 dl1P8MzGR++4Ihkc8r8SWZk2/GnC0cRL63fDbr0gZjxY/gB1JgshbIiG+9YzRxUGD4
	 /plodOrgU7gVoNJeMO2OoVhrgtuoQEJqLPVjpxk35dKGQz9+fCIdGySz2X+jPz0zCU
	 HmQ7IlHZGWLQ8ue0CKkQoXZWnmx2ciZmVeHc9J2NAa9vTPyjqTGQ2ppE3g+tsQN7Bk
	 R6EWW3QS57puA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B5B01E68D20;
	Tue, 21 Feb 2023 00:05:32 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] ARM: SoC updates for 6.3
From: pr-tracker-bot@kernel.org
In-Reply-To: <5298daba-9487-4c3c-8920-d8be6918b3e2@app.fastmail.com>
References: <99179367-0d59-4938-b44c-ca9408ad784e@app.fastmail.com> <5298daba-9487-4c3c-8920-d8be6918b3e2@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <5298daba-9487-4c3c-8920-d8be6918b3e2@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-6.3
X-PR-Tracked-Commit-Id: 27aaad0e7c7259101568ac8763a34810e81336cd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b32c6e029c1313125cc7b0a9061dda2304c23b7b
Message-Id: <167693793273.20221.15490178007279991634.pr-tracker-bot@kernel.org>
Date: Tue, 21 Feb 2023 00:05:32 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Fri, 17 Feb 2023 18:25:35 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-soc-6.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b32c6e029c1313125cc7b0a9061dda2304c23b7b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
