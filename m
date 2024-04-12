Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF9FC4345F
	for <soc@archiver.kernel.org>; Fri, 12 Apr 2024 20:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4AFEFC4AF07; Fri, 12 Apr 2024 20:17:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33C43C32783;
	Fri, 12 Apr 2024 20:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712953054;
	bh=l6MVm4fYmOjNFAcaZ+mBIuLxVK28bF5PHXlbB/aZFqA=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=ZPJn5CmS54Dw7dfTctA4rwwB8LmqndbaYm0YMlmcCSXa0Zmy4yQrr9yFHrRWty9GA
	 OkIY1sV+cpYqgnhASILyU+lVwOAdMCxIgFUyuF20qBoY2qeR6N77HB5MDGzQwtZup7
	 /ZD7ViVqrssWTyu/qibKkFnTXlmnlncnKRxjaj2ojFxecIigAPeDHXReF2OrZeXHTn
	 2RCEPeD7Pb8Got96CUfyvWaumkzPxrZSXPYptXvnao8WXn7WOac6HwniStTdzS6OxO
	 TcMu8sKK9JuMUEtZu0h0m1vi/Xw5fI569EbrPL2CMV6MSfN7EuiiDA2XptHJE4g//+
	 Amv6La2qFEIYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 27BB8DF7856;
	Fri, 12 Apr 2024 20:17:34 +0000 (UTC)
Subject: Re: [GIT PULL] SoC fixes for 6.9
From: pr-tracker-bot@kernel.org
In-Reply-To: <4c6039da-5362-46ad-8126-dacaf7ad1169@app.fastmail.com>
References: <4c6039da-5362-46ad-8126-dacaf7ad1169@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <4c6039da-5362-46ad-8126-dacaf7ad1169@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.9-1
X-PR-Tracked-Commit-Id: 011d79ef1cfad701c2d8e7e80d8c77523af9c771
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 678e14c772130d3a83225ed56fb9860a40bca38b
Message-Id: <171295305415.15771.6575415152452339171.pr-tracker-bot@kernel.org>
Date: Fri, 12 Apr 2024 20:17:34 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

The pull request you sent on Fri, 12 Apr 2024 21:48:34 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.9-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/678e14c772130d3a83225ed56fb9860a40bca38b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
