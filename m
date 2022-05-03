Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C065FC433EF
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 12:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8BF53C385B1; Tue,  3 May 2022 12:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75099C385A9
	for <soc@kernel.org>; Tue,  3 May 2022 12:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651581046;
	bh=2ndtTZNcbgHMMD/3Fx10mwqP8vrqxT+Bc1tZ5/c3L8Q=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=aaOPOHEHm3aphBRN0dh0CN+zN2O3WBrWOeg2FgsdLeq6Bk0p8iVKKGCorZL49Z8q+
	 IJuKrwD7GZB9s5Y6N5VLQR6N0suQzQ0quE0trJR2SPdHgsCrk6TA0u7u24BX6lQjel
	 vEGEFG3p6PBaDSmQmfKWHAwUTLy78CkQZzBukXL4Ghjx22ClKryc47eWiUp0Me9+7y
	 1bz/5K3bsLthRUy4OdnMFRD5R7ZsYHgWl+YpI+RqIdMw0ICPPQdMsdtZahff3Ove5w
	 lPiyZ5tV05l57+FjGgdG0oCo/MknoByZ6XT7IvXtQ5LM4B2SuBu/0tAG/7+d0IFKcP
	 PrEJlKU7rLLHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4C2C5E7399D;
	Tue,  3 May 2022 12:30:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165158104624.10934.12871259575949894569.git-patchwork-summary@kernel.org>
Date: Tue, 03 May 2022 12:30:46 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: SoC fixes for 5.18, part 3
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=637156
  Lore link: https://lore.kernel.org/r/CAK8P3a2fFzrMJJZqiN7B1HnwKcCgPzbobvBZzs2_L19pkM+tYw@mail.gmail.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


