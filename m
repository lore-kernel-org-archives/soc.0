Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45C0FC36001
	for <soc@archiver.kernel.org>; Tue, 17 Sep 2024 09:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28E08C4CED1; Tue, 17 Sep 2024 09:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100B0C4CEC6;
	Tue, 17 Sep 2024 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726566488;
	bh=VXTJuzJvV4JVdwsFYdR8PJ8NSi/a7P+br7OmuEX1B1M=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=hDIjmwK8ireqzqVgnwS9BLyHeJ2uYmECUNl5VLb9Rj9XgC5qUrr8rD2OV1QjXhl7C
	 slHGbAG434wRB5Od59EQKfPtakTOz/TyKXr8Fsl/5nGsapZWNBOpxvPMqo5n+vwPSj
	 Bs3GQB4lVzRLBtIrcw0LWd2rzLRY8zH1gJtemMcNWCyHepTxfj1PI+WAXCw6f1gKff
	 4hvJW+n7HOyiIJkf5V37AijK74Ox//eGT8HxAlkwAkwCO4vXnV7twprR8n3CxiRAyP
	 WOT4DJUPAOPA+b8aMHCQh0YHrz+y8oLcBxDQFXLqLd0o9BBmxOqYH0of70CGEmMEHx
	 nM2XPmYSVJE/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE093809A80;
	Tue, 17 Sep 2024 09:48:10 +0000 (UTC)
Subject: Re: [GIT PULL 3/4] soc: defconfig updates for 6.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <3618c698-8305-460f-bddb-67e4e06f524a@app.fastmail.com>
References: <a40b4b3a-5d61-4bef-b367-745ba058be9e@app.fastmail.com> <3618c698-8305-460f-bddb-67e4e06f524a@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <3618c698-8305-460f-bddb-67e4e06f524a@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.12
X-PR-Tracked-Commit-Id: 7eee0f8bbd1b6946236624d25a938cb34c1ba2a9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 38ea77ab07480fa57a80bbdc2706ab2807ebc9e6
Message-Id: <172656648961.78027.6636864830730624516.pr-tracker-bot@kernel.org>
Date: Tue, 17 Sep 2024 09:48:09 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Mon, 16 Sep 2024 16:32:53 +0000:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-defconfig-6.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/38ea77ab07480fa57a80bbdc2706ab2807ebc9e6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
