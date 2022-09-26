Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FB9C6FA82
	for <soc@archiver.kernel.org>; Mon, 26 Sep 2022 21:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A4D7C433D6; Mon, 26 Sep 2022 21:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 34410C433C1
	for <soc@kernel.org>; Mon, 26 Sep 2022 21:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664227815;
	bh=Qb+17QE4lhB+bjneVBSX7KMwh0PdW370SbbipuaqSF4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=QEIGUUaDTaZXKFC7JJ5vQBtZUaFKNJ2ax/psRRjSS0N+ycuGNkpG9mKrEIpPjVGkV
	 mHrkRxqf+in0HqByoYfCeUj1RucMDk7ZXzuzGM8LMRASrQRQi/WK328zPDz0cwG8cy
	 9g1G3LetC1gPtuxJwEpBkRhjOz9UIQGe4wQWSQ4bAPJvz63sSgMkc+Z3+i+eimOJci
	 mMs8tmb7QZ/i7dkX8aQ42/UycAc43A6qOvmd4rdodLUIu6SyF4cIniKugudyPu+caX
	 Mi655QfC3/+Z4lHjuwBrtFQz7F9JztrIWaQPKq9MBk1cUyWXhxkZPVZS35m9+YeI15
	 klzo8Mw/pEJBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0D1B3C070C8;
	Mon, 26 Sep 2022 21:30:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166422781490.14888.5962438101965337028.git-patchwork-summary@kernel.org>
Date: Mon, 26 Sep 2022 21:30:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [v2] ARM: dts: integrator: Fix DMA ranges
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=680357
  Lore link: https://lore.kernel.org/r/20220926073311.1610568-1-linus.walleij@linaro.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


