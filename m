Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D45DCCA485
	for <soc@archiver.kernel.org>; Tue, 12 Jul 2022 21:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68239C3411E; Tue, 12 Jul 2022 21:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DA8EC3411C
	for <soc@kernel.org>; Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657661421;
	bh=4BVCEzos626TSGtUNsY/wiRJrmjUSo+zCNxKKuxMBR4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=J1QPIMl9ir0BpqzzuXrr08jb0o/p1wuGeFWtAIgMmMBgbDISI+vrvm0Pd11vfObzN
	 kRBBxqTOTJ214COOAgq8+3YIpTdHBUTdScEMkNmibC7vQcQBvJ+TrLVRjNMt1GNuJi
	 b+HV4qfQw7dpGaOLoDKa6XQazO2aNegt6M3/lwhSv71X0CCFK7bH5UzS7aXAjAq2ZG
	 MohbmV36VCIGX0q7HMaYQSgjqzdgAwg+6kln5nczJY1NUpgorXEeVDOzsrM084efwF
	 7wnSQN/bScICYaNPbVNPV++4q0iqeD2d0Ux4HdgqAdVUhHEtTv+JVdoOlWDDRskBpO
	 4A6KJjBJo013A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2DE57E45224;
	Tue, 12 Jul 2022 21:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165766142012.32298.5251429659273951508.git-patchwork-summary@kernel.org>
Date: Tue, 12 Jul 2022 21:30:20 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Broadcom SoC updates for 5.20
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=658639
  Lore link: https://lore.kernel.org/r/20220711164451.3542127-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/7] Broadcom defconfig changes for 5.20
             [GIT,PULL,2/7] Broadcom defconfig-arm64 changes for 5.20
             [GIT,PULL,5/7] Broadcom drivers changes for 5.20

Series: NVIDIA Tegra changes for v5.20-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=658015
  Lore link: https://lore.kernel.org/r/20220708185608.676474-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/7] soc/tegra: Changes for v5.20-rc1
             [GIT,PULL,2/7] firmware: tegra: Changes for v5.20-rc1
             [GIT,PULL,4/7] memory: tegra: Changes for v5.20-rc1
             [GIT,PULL,7/7] arm64: tegra: Default configuration updates for v5.20-rc1

Series: [GIT,PULL,1/6] i.MX drivers change for 5.20
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=658116
  Lore link: https://lore.kernel.org/r/20220709082951.15123-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/6] i.MX drivers change for 5.20
             [GIT,PULL,6/6] i.MX defconfig update for 5.20

Series: [GIT,PULL,1/3] TI SoC driver updates for v5.20
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=658069
  Lore link: https://lore.kernel.org/r/20220708232655.reqjdbib52ejdja4@unadvised
    Patches: [GIT,PULL,1/3] TI SoC driver updates for v5.20


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


