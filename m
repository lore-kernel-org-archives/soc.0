Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3DFEC43217
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 18:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 90A44C36AF9; Thu, 26 May 2022 18:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AE31C36AF7;
	Thu, 26 May 2022 18:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653589210;
	bh=t/rTetXOnmOIOo6Blq2ue4XJTlJ/yCS61ly8/hGK85o=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=b2yCjYc2hMtcmoL0of4jAs7sHCxvmOk01ZvJEtFS0XGoMT8/BlybJfzn/yiOpa13P
	 m5/F4h1RI7Uz5MWc1FaZ21LMzMbHTRGStNbcHE2hEXklws2aQiLp/IJbnJ4E0nCTC6
	 ddAeQdcP1QnGgqxcrH2rKeaOovx4hD1DtIGktoWFCRfNmCRwuUVLdSr11ol2a8MF/L
	 lwHGtLPDNoOPkgszde8NfybAbhVVTiYhRswXP1ECC2zPKwbB60QJC7gn91sRlRy3Dl
	 tB6jLe8CvZ+LVWAuxgNFaW+NhzaZWb65JTAysZjE81hLwgXJOpXP1bi4yto9dYoqg2
	 X+lIBX44c/xyQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 61B7BF03942;
	Thu, 26 May 2022 18:20:10 +0000 (UTC)
Subject: Re: [GIT PULL 5/5] ARM: ARMv4T/v5 multiplatform support for v5.19, part 1
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3gqQbZG5gdh_cRmGx8B6XR8CGYcXN7wMu-YmCBwD1wGQ@mail.gmail.com>
References: <CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com> <CAK8P3a3gqQbZG5gdh_cRmGx8B6XR8CGYcXN7wMu-YmCBwD1wGQ@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a3gqQbZG5gdh_cRmGx8B6XR8CGYcXN7wMu-YmCBwD1wGQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-multiplatform-5.19-1
X-PR-Tracked-Commit-Id: 1a23accae82d780b5d5de6254d32c270aeb7f664
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ecf0aa5317b0ad6bb015128a5b763c954fd58708
Message-Id: <165358921039.17369.13096394333305006429.pr-tracker-bot@kernel.org>
Date: Thu, 26 May 2022 18:20:10 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Thu, 26 May 2022 16:51:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/arm-multiplatform-5.19-1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ecf0aa5317b0ad6bb015128a5b763c954fd58708

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
