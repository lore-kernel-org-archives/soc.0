Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C44EC5478C
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B482C43394; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25ADAC433F1
	for <soc@kernel.org>; Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709574032;
	bh=zsYtFHmoONe7ueOdZFrFvIrlS9Us75wRStd/JmRLmBI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=aef0Xb9eq3kQpo0+yk62h/W5eUc8TGynQbdtp3laA8af8tUFEhVzsgGY5PMf8raHR
	 Gi0Yt111qLAjwJzTWEIV0FfzHtDYn4C5eJ7YcRAz5oj/k2RPldZuEpohISQ6cs46Jn
	 oSVTz4VfPlVl/ZYSfXyY9NmytNsx/uTx0Y4b8xH7RMSTH4zxUfwB9Nq1j9HWfJkhcG
	 4Xg8C+J1c11DBwrczihJAeei1vUOz7e6O+ucu1RGFNk26nTDANHSComBEMdHWI9gAE
	 9d5y7hhwBdpLP9CC2nUuwLGvli0s0LTHc55WdC6uBTuYtluRocAJQFrsyi6Epe0ecO
	 mvwe5hu2FNTmA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 03F37D9A4BB;
	Mon,  4 Mar 2024 17:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170957403195.23732.5044947943356390117.git-patchwork-summary@kernel.org>
Date: Mon, 04 Mar 2024 17:40:31 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/5] i.MX SoC changes for 6.9
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829673
  Lore link: https://lore.kernel.org/r/20240226034147.233993-1-shawnguo2@yeah.net
    Patches: [GIT,PULL,1/5] i.MX SoC changes for 6.9
             [GIT,PULL,5/5] i.MX defconfig for 6.9

Patch: [GIT,PULL] Qualcomm ARM64 defconfig updates for v6.9
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829545
  Lore link: https://lore.kernel.org/r/20240225032456.481112-1-andersson@kernel.org

Series: [GIT,PULL,1/3] samsung: drivers for v6.9, part two
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=830191
  Lore link: https://lore.kernel.org/r/20240227080755.34170-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] samsung: drivers for v6.9, part two
             [PULL,v6.9,2/3] ARM: defconfig: enable STMicroelectronics accelerometer and gyro for Exynos
             [PULL,v6.9,3/3] ARM: dts: samsung: exynos4412: decrease memory to account for unusable region

Patch: [GIT,PULL] Rockchip arm64 defconfig changes for 6.9 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=831791
  Lore link: https://lore.kernel.org/r/14841602.uLZWGnKmhe@phil

Patch: [GIT,PULL] ARM: dts: ti: keystone: Updates for v6.9
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=832096
  Lore link: https://lore.kernel.org/r/20240304133843.e6rm5va6w4oavgoy@posted

Patch: [GIT,PULL] Reset controller updates for v6.9
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=831488
  Lore link: https://lore.kernel.org/r/20240301111300.4038207-1-p.zabel@pengutronix.de

Series: [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.9
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=830521
  Lore link: https://lore.kernel.org/r/e7e984db-47b9-404a-9471-5d2ed0effe1d@ti.com
    Patches: [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.9
             [GIT,PULL,2/2] ARM/arm64: defconfig: Updates for v6.9 for TI K2/K3 platforms

Patch: [GIT,PULL] ARM: vexpress: Update for v6.9
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=828942
  Lore link: https://lore.kernel.org/r/20240223033307.117906-1-sudeep.holla@arm.com

Patch: [GIT,PULL] Update TI clksel clocks to use reg
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=830549
  Lore link: https://lore.kernel.org/r/pull-1709102378-94138@atomide.com

Patch: arm64: defconfig: drop ext2 filesystem and redundant ext3
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=828329
  Lore link: https://lore.kernel.org/r/20240221155033.44160-1-krzysztof.kozlowski@linaro.org


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


