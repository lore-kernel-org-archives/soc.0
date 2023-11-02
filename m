Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6779FC4332F
	for <soc@archiver.kernel.org>; Thu,  2 Nov 2023 01:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C649C43391; Thu,  2 Nov 2023 01:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 107ECC433CA;
	Thu,  2 Nov 2023 01:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698887412;
	bh=BOtsrLcfJW9CKtJpPzm3HTLhhbixlpH++3A6xiGgS+Y=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=AatswzQYlKd9nMaPWt9b/0KaIobuSIcbgFt+uPsGwPXRNlzaqTkvN+iWDHyTFAKKL
	 Sa5tqZTWBnmHXBHUbm8hphiQOkItfK9fmIeKI3ZzUydT2pSalMNysGt//FKzqaLlDn
	 N3zPkBWN8lL22UVy8QCnsTVeyTTGtSzvpi+8ScOrct4ur1u9ToekEb2nSF5e7vPcPc
	 HmQiWxgIVAx1PW2pdIH642IZ+09QMUdKn8WvWXyg5QxnritE0Z03GBV3KKhyh/xvWQ
	 NeFgpR3/ygxPsDZ4TeSiFkDBzXC9d3DHH1TR5YVuzy6PzkqLPFTctZ0stHQIyYv3ll
	 Es/grJf6NOKLg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EF96DC3959F;
	Thu,  2 Nov 2023 01:10:11 +0000 (UTC)
Subject: Re: [GIT PULL 1/4] SoC DT updates for v6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <96986a4b-b9d5-4fdb-bfa6-1d75ec31ade6@app.fastmail.com>
References: <263c2cf0-c35a-4d3c-85b3-fcb692cbfd40@app.fastmail.com> <96986a4b-b9d5-4fdb-bfa6-1d75ec31ade6@app.fastmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <96986a4b-b9d5-4fdb-bfa6-1d75ec31ade6@app.fastmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.7
X-PR-Tracked-Commit-Id: c505e1e4b10d751e93ca361d56d2270d6180a183
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c035f0268b87fc21f517f638b3bad26c81babc85
Message-Id: <169888741195.4705.1125126181181491242.pr-tracker-bot@kernel.org>
Date: Thu, 02 Nov 2023 01:10:11 +0000
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, soc@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

The pull request you sent on Thu, 02 Nov 2023 00:36:34 +0100:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c035f0268b87fc21f517f638b3bad26c81babc85

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
