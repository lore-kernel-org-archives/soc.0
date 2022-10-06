Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06906C433F5
	for <soc@archiver.kernel.org>; Thu,  6 Oct 2022 19:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3AD4C43143; Thu,  6 Oct 2022 19:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9E79C43144;
	Thu,  6 Oct 2022 19:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665082822;
	bh=SGEJFOUgGoY+5cumytRZXsB8C/YSbrfEo1ULY6T4c34=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=XbtQoGrIL6NMdDqX66zBO4XjnGwst4UllcTZRWtGtbXIJgT1LCgllyWgX0/us+/c0
	 mOcFxhlCa4K4YaHyYGT68EZchbgiPyqwzi+ChA7EgphpP3qAkXHAcWH86K6UWRP2b3
	 7cDWEKZYlVjZG8GpEJ9Rjn9bnalDwC2wfs3pkinMCtpSpa6nDMkSzddvAD3YLNu+1k
	 QvP8mi7Bv93WxVbfv4jb1x6PErKM9WUkai18SpBYhxx1dOA56ePpV+vl4YQu6y8c1U
	 PwZGkkfP3JNcaK9m7uW/8P/muX1c6QOx6qGGX8cAdMuOB8jMPjZzJMYF8p9gSHHT+y
	 4DogBsvp48bUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 98FF3E2A05E;
	Thu,  6 Oct 2022 19:00:22 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] ARM: SoC driver updates for 6.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <7eea916e-4757-4c17-8a49-c67267ab7ea7@app.fastmail.com>
References: <70d8e5d8-6fa4-496d-88d6-2604d0c3e982@app.fastmail.com> <7eea916e-4757-4c17-8a49-c67267ab7ea7@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <7eea916e-4757-4c17-8a49-c67267ab7ea7@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-6.1
X-PR-Tracked-Commit-Id: 4413794917ba3ff42ade432870248b500253f152
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ff6862c23d2e83d12d1759bf4337d41248fb4dc8
Message-Id: <166508282262.16472.8647572991204167131.pr-tracker-bot@kernel.org>
Date: Thu, 06 Oct 2022 19:00:22 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Thu, 06 Oct 2022 11:23:59 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-drivers-6.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ff6862c23d2e83d12d1759bf4337d41248fb4dc8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
