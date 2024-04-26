Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D846C19F4F
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 439D1C32786; Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E1FEC32783
	for <soc@kernel.org>; Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714148483;
	bh=pbwinPxU/raVcGwC5rGNAhFZBdxAoVO6dFP65u57KWo=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=tGMhKDmJ6oKO1VLMs8TAlWM+d6JHYSy3C6pD9p+o2w173b5UDnLYdSmdqFanQMxPQ
	 GPOhg1pSt9dlfgVDHvfcenRcFfkuolwnaea2CoJ9/3PigMCqjaUbnl6i4n8iqAw2Xd
	 XQ2QPAT0jPQDidX8VbP4doqJ/AHd1nPpDyb78ktyB7sxwpSaqN96EMZkv4cb6zOkgU
	 2ey3u+Pz/NT5c3MqLJTD8bbHoCWh+og6Lae2zfW9BRxTsrTsVLPfogu9+SO9yhWTQz
	 HJdAxiv8q07Zrn5zSa601z4oN4vyolpALXmf+BgnDgXystSSzSHzLfAqVdNgfwwi0H
	 vf4pQtYY6GYnQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 16C67DF3C9B;
	Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171414848302.5338.1596104197340350614.git-patchwork-summary@kernel.org>
Date: Fri, 26 Apr 2024 16:21:23 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for v6.9
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=846347
  Lore link: https://lore.kernel.org/r/20240420161002.1132240-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm driver fix for v6.9
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=846354
  Lore link: https://lore.kernel.org/r/20240420163816.1133528-1-andersson@kernel.org

Patch: [GIT,PULL] i.MX fixes for 6.9, round 2
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=847788
  Lore link: https://lore.kernel.org/r/ZioopqscxwUOwQkf@dragon

Patch: [GIT,PULL] Microchip AT91 fixes for v6.9
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=846407
  Lore link: https://lore.kernel.org/r/20240421124824.960096-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] Rockchip dts fixes for 6.9
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=846107
  Lore link: https://lore.kernel.org/r/3413596.CbtlEUcBR6@phil


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


