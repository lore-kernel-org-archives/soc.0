Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68D4C47073
	for <soc@archiver.kernel.org>; Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF546C433C8; Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A97E4C433C7
	for <soc@kernel.org>; Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704190300;
	bh=kWd57aB45IoO4jzZWqtRyrNJ1pngVwQqv45Tuchvs0Q=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=pc3+pDurHdnANhJBdFZdhWfdyW83tZbL4saftH577ugZIeolvtpps1LMTyM7igdFy
	 +t+WAp66pxd67S43oHX0850I/I6VOUUAxDMTYHX6vL1PdAFeTZCtYiDcamULX7lYh9
	 d9fT4l4hCUzwShGdBrMVVWN6l/7DSQyCQgLhPfFmtK6vFzSBcAhnNhYAF65+RdN3Wa
	 nvZBfOmMbTVeWhmxDMQqeGJ4kXQQqUWE1MCbnUEjhRRwoIPF925A0zwQ/7/G99OmfR
	 kqr6DprmHEu2rWqnDduoUPThELZOCTqRJ8lg1ML5S0XFN6dZwvtx0NvAslNnkwDIL2
	 Pr5/fH/uWg8VQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 96FADDCB6CE;
	Tue,  2 Jan 2024 10:11:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170419030061.6407.14025494296397200641.git-patchwork-summary@kernel.org>
Date: Tue, 02 Jan 2024 10:11:40 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: sprd: DTS and bindings for v6.8-rc1
  Submitter: Chunyan Zhang <chunyan.zhang@unisoc.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=813159
  Lore link: https://lore.kernel.org/r/20231228084958.1439115-1-chunyan.zhang@unisoc.com

Patch: ARM: MAINTAINERS: drop empty entries for removed boards
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811045
  Lore link: https://lore.kernel.org/r/20231218134532.50599-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] Rockchip dts64 changes for 6.8 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=813733
  Lore link: https://lore.kernel.org/r/3711719.VqM8IeB0Os@diego

Patch: [GIT,PULL] Rockchip dts32 changes for 6.8 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=813734
  Lore link: https://lore.kernel.org/r/15502825.JCcGWNJJiE@diego

Patch: ARM: Delete ARM11MPCore perf leftovers
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=812756
  Lore link: https://lore.kernel.org/r/20231224-drop-11mpcore-fix-v1-1-d8b16d1c1fae@linaro.org

Patch: [GIT,PULL] A few more Qualcomm Arm64 defconfig updates for v6.8
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=813453
  Lore link: https://lore.kernel.org/r/20231231034648.3262882-1-andersson@kernel.org

Patch: [GIT,PULL] A few more Qualcomm Arm64 DeviceTree updates for v6.8
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=813452
  Lore link: https://lore.kernel.org/r/20231231034108.3262678-1-andersson@kernel.org

Patch: [GIT,PULL] A few more Qualcomm Arm32 DeviceTree updates fr v6.8
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=813447
  Lore link: https://lore.kernel.org/r/20231231033153.3262575-1-andersson@kernel.org

Patch: [GIT,PULL,1/1] Broadcom devicetree changes for 6.8
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=813165
  Lore link: https://lore.kernel.org/r/20231228085822.3656546-1-florian.fainelli@broadcom.com


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


