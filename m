Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD22C433FE
	for <soc@archiver.kernel.org>; Fri,  4 Nov 2022 21:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36170C433B5; Fri,  4 Nov 2022 21:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 123A3C433D7;
	Fri,  4 Nov 2022 21:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667596664;
	bh=0R7VRqp4GtacO4keipzAYdte1ejOk57Myp5v3MHYuNA=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=EPPXFun1uVhVrapzYgkoykCPyjNpK1CIOrI16zOf2hJv9cN2IjlH+B3Ulv5EsGMak
	 5I3ITLwWXLoPbU1eXByjKqop3KKn6/ISqunDks0b0pZDjId9VaFwU/ueIiazD0OElP
	 Xotxu2tI2apL6yn+xZu7PS/pU7oOjh3MUS0aCxU4T20JBV4r9pQrSEwypku7ufNxMI
	 9nzRBJtdK0d1HSU2Siy75hrqwOP9Zj7ijyugRb75dOYe972AzsK46/cPOCk/2Cliqt
	 705urpzuPhEmn2TelkZB/q09W6gtcHd9X80fqaipoz41YuhT/gFfRBatr0snLrT/YW
	 93QhjRMD/E/ag==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 006C8E270FB;
	Fri,  4 Nov 2022 21:17:44 +0000 (UTC)
Subject: Re: [GIT PULL] ARM: SoC fixes for 6.1, part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <518fccac-657a-4ff4-8dcd-5225421e989a@app.fastmail.com>
References: <518fccac-657a-4ff4-8dcd-5225421e989a@app.fastmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <518fccac-657a-4ff4-8dcd-5225421e989a@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-2
X-PR-Tracked-Commit-Id: 5449cabd95bbf141e2b7471e8d3cedb6f3b92492
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 10d916c86ecafeccaed89175ebf9b832dddde380
Message-Id: <166759666399.9521.14899282011233031415.pr-tracker-bot@kernel.org>
Date: Fri, 04 Nov 2022 21:17:43 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@arm.com>

The pull request you sent on Fri, 04 Nov 2022 12:38:47 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/10d916c86ecafeccaed89175ebf9b832dddde380

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
