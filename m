Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EA4C74A5B
	for <soc@archiver.kernel.org>; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1C861C433A1; Fri, 17 Mar 2023 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07469C433EF
	for <soc@kernel.org>; Fri, 17 Mar 2023 15:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679068354;
	bh=oUZlDIwMAt0ykLVGgQut8HZM7ISud3BEjpLPoKo4dK4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=V+oZwE0tJmoIQ6sGHYNKmuHZcNW2rsEL0ndomz3Al5fzgfYxOanYPA6Vopo2czGaX
	 dgP22gFOMeWse+YocshUhaa1BP1OIE7v7QHDA2FgpqUbHhd1FZYN/b1wqyxJHG9Ia7
	 WF/6L0TDISw8xHdKCa2Sx9bnttOfaMSQgRMMi/riQROxRs9Ae8Cdu8A0uC6W5Rp7Be
	 k0DCG/y8yOJnMgaMHSpvlgvdTrqu00coI74ZdShrvtjw3pgedPOPmCpBCu2+2LwdAI
	 BstCfBWpaDLi3St2SG5Y5NxlM8B0HBTSWRikToTWJdbkWItqKQMW8MKKm22bEGV679
	 DfiNolMeTyiOg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D77BAE66CBF;
	Fri, 17 Mar 2023 15:52:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167906835382.32307.5175544927515550238.git-patchwork-summary@kernel.org>
Date: Fri, 17 Mar 2023 15:52:33 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: ARM: Convert to platform remove callback returning void
  Submitter: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=729819
  Lore link: https://lore.kernel.org/r/20230314103225.2787101-1-u.kleine-koenig@pengutronix.de

Patch: arm64: virtconfig: Further shrink the config
  Submitter: Mark Brown <broonie@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=726953
  Lore link: https://lore.kernel.org/r/20230221-arm64-virtconfig-slim-v1-1-604b64be7ec3@kernel.org

Patch: ARM: dts: ixp4xx: use "okay" for status
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=728958
  Lore link: https://lore.kernel.org/r/20230310231420.583121-1-linus.walleij@linaro.org

Patch: [GIT,PULL] Fix race condition in AMDTEE driver
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=725597
  Lore link: https://lore.kernel.org/r/Y/5ZGX0lSTnZz27E@rayden

Patch: [V4] arm64: dts: sprd: Add support for Unisoc's UMS512
  Submitter: Chunyan Zhang <chunyan.zhang@unisoc.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=726797
  Lore link: https://lore.kernel.org/r/20230306085717.420353-1-chunyan.zhang@unisoc.com

Patch: [GIT,PULL] i.MX fixes for 6.3
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=730345
  Lore link: https://lore.kernel.org/r/20230315132814.GF143566@dragon

Patch: [GIT,PULL] arm64: tegra: Device tree fixes for v6.3-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=726044
  Lore link: https://lore.kernel.org/r/20230302094213.3874449-1-thierry.reding@gmail.com


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


