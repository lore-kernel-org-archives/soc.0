Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9513DC001E0
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F461C433CB; Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35F39C433C8
	for <soc@kernel.org>; Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691828596;
	bh=RN3I4nor7Gy810sX1x3JEbLOGQDvi3JzPeMmoM9e0yg=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=AGaDyVTsoBH7tlX8+FHMaMBqG+XbJsgFDVMqPq2ZEnaoBU9PVYGgSXFbwMFsIFiJD
	 Js2edpR7xBSY4UBZnpoN2MrhQdgZLUgD7rh9le+zGnFXuHOrJO0V0emLLoJy/khl58
	 K6PZUu0Fsl4JgT5oMBXchHvAPb19K0ylCoJet6I6q1n94JgIM5H8IL1RNAJPuZvgHc
	 naGlLAPqRcXcbyriK37SsfU6ub01d8lCs/zSXaEaE6BO2Bs3Ew4SrrJ5wvXNFotIZF
	 9tMQxTPkz1DuE/8UrrbGNkLMP0diGA5YTAXr87mg0bfWLUVbe+hBTZGlosMi7+uCDz
	 fBHgRa7viDu0A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 15325C3274B;
	Sat, 12 Aug 2023 08:23:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169182859600.22229.2504195927423779293.git-patchwork-summary@kernel.org>
Date: Sat, 12 Aug 2023 08:23:16 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: ARM: dts: integrator: fix PCI bus dtc warnings
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=775208
  Lore link: https://lore.kernel.org/r/20230811-versatile-dts-v6-6-v1-1-d8cb9d1947ed@linaro.org

Patch: [GIT,PULL] i.MX fixes for 6.5, 2nd round
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=774455
  Lore link: https://lore.kernel.org/r/20230809100034.GS151430@dragon

Patch: [GIT,PULL] ARM: soc: Zynq SoC changes for v6.6
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=773065
  Lore link: https://lore.kernel.org/r/a56457a0-7e5a-df46-2c86-3f2ace578984@monstr.eu


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


