Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0C6C7EE43
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ACD8DC433A0; Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9705DC433EF
	for <soc@kernel.org>; Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686316227;
	bh=J4lxci2lHtkTHGJKVPPa1n+zXmfL7sXwxtH6RWRtNic=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=csb8GVFyZ1r1C6wjQVQN7aAEhzdGhRi0Ul5Ma0xpQcPEDAfJ05y3FA6WeXCNwFaZu
	 w1v96MQem6zhBHyDGK5SLTXcU7w05gDMbWw9LUrl0xoi6L5NT6fK9/Qd/EME2qd16w
	 gufoeiYgqsIp8CgRqww3OFvIsknDVRhZmlQORL3go8TgCHH48yA+KKgFj++AMLTzPM
	 3bsopW0pu4RAKg/q4RapfwJPJXqCuHrLrCYUcxs9rBXXfSZ78k+Adf1ifMUB97HAbA
	 5syx5zivaRHd1TY6CCh5roLkUXVXyu0szA+LwVMsga0kgU+MOMhR8mYwLBMx3MH7zX
	 XpqMS4dXIR2AQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 82A6EC43143;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168631622753.816.11240861712963369727.git-patchwork-summary@kernel.org>
Date: Fri, 09 Jun 2023 13:10:27 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] amlogic ARM DT updates for v6.5
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=755598
  Lore link: https://lore.kernel.org/r/21b55df9-3eda-0a0f-cf76-79b1d7735314@linaro.org

Patch: Input: ads7846 - Fix usage of match data
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=754605
  Lore link: https://lore.kernel.org/r/20230606191304.3804174-1-linus.walleij@linaro.org

Series: Renesas SoC updates for v6.5 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=755646
  Lore link: https://lore.kernel.org/r/cover.1686304609.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.5 (take two)
             [GIT,PULL,2/3] Renesas driver updates for v6.5 (take two)
             [GIT,PULL,3/3] Renesas DTS updates for v6.5 (take two)

Patch: [GIT,PULL] Clean-up for omaps for v6.5
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=753926
  Lore link: https://lore.kernel.org/r/pull-1685946511-835910@atomide.com

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.5
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=755599
  Lore link: https://lore.kernel.org/r/37e5de2f-47f1-a3f3-f1e4-4a304192e556@linaro.org

Series: [GIT,PULL,1/3] samsung: drivers for v6.5
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=753442
  Lore link: https://lore.kernel.org/r/20230602091501.15178-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] samsung: drivers for v6.5

Patch: [GIT,PULL] arm: dts: hisilicon dts updates for v6.5
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=755543
  Lore link: https://lore.kernel.org/r/6482C732.3060300@hisilicon.com

Patch: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.5
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=755546
  Lore link: https://lore.kernel.org/r/6482C916.1010507@hisilicon.com

Patch: [GIT,PULL] arm64: soc: ZynqMP SoC changes for v6.5
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=755313
  Lore link: https://lore.kernel.org/r/411aee78-e7e8-5966-cbe8-40ff45e27ba2@monstr.eu

Patch: [GIT,PULL] AMDTEE fix for v6.5
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=754318
  Lore link: https://lore.kernel.org/r/20230606075843.GA2792442@rayden

Series: [GIT,PULL,1/3] Non-urgent driver fix for ti-sysc for v6.5
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=753460
  Lore link: https://lore.kernel.org/r/pull-1685700720-242492@atomide.com
    Patches: [GIT,PULL,1/3] Non-urgent driver fix for ti-sysc for v6.5
             [GIT,PULL,2/3] Clean-up for omap pinctrl-single nodes for v6.5

Patch: [GIT,PULL] ARM: dts: Zynq DT changes for v6.5
  Submitter: Michal Simek <michal.simek@amd.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=755309
  Lore link: https://lore.kernel.org/r/c5c99ba2-f004-306c-6251-551826f90df8@amd.com

Patch: [GIT,PULL] i.MX fixes for 6.4, round 2
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=754912
  Lore link: https://lore.kernel.org/r/20230607141312.GU4199@dragon


Total patches: 16

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


