Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9F1C5479D
	for <soc@archiver.kernel.org>; Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 890FDC43392; Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71A09C433EF
	for <soc@kernel.org>; Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673304083;
	bh=FfxvZ+rU7mxo39ZQ5eF690GJWYfesfZ0+FVknQ7CVA0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=NyJ+ztAdAx331NY/z4w4kvHBarOSRi/tJz6pqc6DxdBlojnUE0LT0hhRC2fhhyzNH
	 rgtmEBxHWdxhdIdYHtv0/S7HggnGIhHF5pvYn0qb8fitmVItb9RYGsSJdQQ9a16y0i
	 sREic/ziCSxV9XV57r8NfWnYw/Lubw1cQeDXPOKrr8W/nDY3U6/gicwCi7kNP/MMKR
	 CCDLyYaGTfh+gk8HPZS5U5+NUBaZo9OH/xMik7ff4iHXOV/8SPS2WXRaMa0GDaZerF
	 iyy4dN4PajLvSXayL3KDmY3Q0Dr8ioQtTNThW4hqYgJE70Utgn/UydPP6dFtNTeEEN
	 wAOPlaG01dnXw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 551C8E21EE6;
	Mon,  9 Jan 2023 22:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167330408330.13717.13604432565225742746.git-patchwork-summary@kernel.org>
Date: Mon, 09 Jan 2023 22:41:23 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: ARM: footbridge: drop unnecessary inclusion
  Submitter: Alexandre Belloni <alexandre.belloni@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=703854
  Lore link: https://lore.kernel.org/r/20221212135953.212303-1-alexandre.belloni@bootlin.com

Patch: [GIT,PULL] memory: fixes: Fixes for v6.2
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=710126
  Lore link: https://lore.kernel.org/r/20230109150322.329614-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] Reset controller fixes for v6.2
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=708735
  Lore link: https://lore.kernel.org/r/20230104095855.3809733-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] i.MX fixes for 6.2
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=708235
  Lore link: https://lore.kernel.org/r/20230102132016.GA10699@T480

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v6.2
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=709486
  Lore link: https://lore.kernel.org/r/20230106093909.652657-1-sudeep.holla@arm.com

Patch: [GIT,PULL] amlogic fixes for v6.2-rc
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=709458
  Lore link: https://lore.kernel.org/r/7915c3f8-57bc-25e2-0314-c78af7a79d6a@linaro.org


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


