Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C75AC48BF6
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32879C433A6; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C01AC433F1
	for <soc@kernel.org>; Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568720;
	bh=X6ceV1iimMsbN3Ia9hcsEC/OsnhG9bQVSjw8FIoheXo=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=OqlgHc9qh/t4tJmX7K4VA9IAJnxC9u99tsW2lGAvQIMprnejcpWkerhcNTbu6WQTL
	 IGkPQbQQoIbJRqa2dpLNfM3PSwaFLhIFnONeCqmpD4C2QouePK9B19W2gZjZ/JFWLt
	 mCoitjhhWaaAPriIvJP6tjGjtxVAN3Q9J1Q/H5NUHEjNinn64u19TZBeZy1kp3L0Qi
	 c5/bIBz9YdS1GHyB8FD9dcF5gE36R9DtQWzLY64hZPj+p3/A6dnps4xgSCbbPURCU6
	 4bupRYdnrY1aQVJW3YqQDZHOm0T6dnjHnY1nooxs76omOWKS24YefLrI0ZStLQADAZ
	 mY2VDrp4L+hcw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 08A4CD9A4B9;
	Mon,  4 Mar 2024 16:12:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956872002.25915.14441132124259624331.git-patchwork-summary@kernel.org>
Date: Mon, 04 Mar 2024 16:12:00 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/5] soc/tegra: Changes for v6.9-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829229
  Lore link: https://lore.kernel.org/r/20240223174849.1509465-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/5] soc/tegra: Changes for v6.9-rc1
             [GIT,PULL,2/5] firmware: tegra: Changes for v6.9-rc1

Patch: [GIT,PULL] i.MX fixes for 6.8, round 2
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829588
  Lore link: https://lore.kernel.org/r/ZdtPJzdenRybI+Bq@dragon

Patch: [GIT,PULL] Kerneldoc fixes for omaps for v6.9
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829807
  Lore link: https://lore.kernel.org/r/pull-1708944095-4485@atomide.com

Patch: [GIT,PULL] arm64: tegra: Device tree fixes for v6.8
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829904
  Lore link: https://lore.kernel.org/r/20240226144536.1525704-1-thierry.reding@gmail.com

Patch: [GIT,PULL] memory: drivers for v6.9, part two
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=831094
  Lore link: https://lore.kernel.org/r/20240229124600.405016-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] Qualcomm driver updates for v6.9
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829541
  Lore link: https://lore.kernel.org/r/20240225030612.480241-1-andersson@kernel.org

Patch: [GIT,PULL] Few more SoC changes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=831000
  Lore link: https://lore.kernel.org/r/pull-1709194504-639032@atomide.com

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v6.9
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=828946
  Lore link: https://lore.kernel.org/r/20240223033435.118028-1-sudeep.holla@arm.com

Patch: [GIT,PULL] Driver change for ti-sysc
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=830999
  Lore link: https://lore.kernel.org/r/pull-1709194472-263643@atomide.com

Patch: [GIT,PULL] firmware: arm_ffa: Update for v6.9
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=828941
  Lore link: https://lore.kernel.org/r/20240223033250.117878-1-sudeep.holla@arm.com

Series: [GIT,PULL,1/5] i.MX SoC changes for 6.9
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829673
  Lore link: https://lore.kernel.org/r/20240226034147.233993-1-shawnguo2@yeah.net
    Patches: [GIT,PULL,1/5] i.MX SoC changes for 6.9

Patch: [GIT,PULL] arm64: ZynqMP SoC changes for v6.9
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829860
  Lore link: https://lore.kernel.org/r/CAHTX3d+NGUJhKXxGwskSOf6U9P0Nd9rnroFczD8X2mLhFgcm0Q@mail.gmail.com

Series: [GIT,PULL,1/3] samsung: drivers for v6.9, part two
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=830191
  Lore link: https://lore.kernel.org/r/20240227080755.34170-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] samsung: drivers for v6.9, part two

Patch: [GIT,PULL] Allwinner drivers change for 6.9
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829307
  Lore link: https://lore.kernel.org/r/20240223205734.GA9027@jernej-laptop

Patch: [GIT,PULL] ARM: Zynq SoC changes for v6.9
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829843
  Lore link: https://lore.kernel.org/r/CAHTX3dJpawPhgVxSsXuSvG20JY9r4EkJu2NrrH1OKRjKxTpNAA@mail.gmail.com

Series: [GIT,PULL,1/4] samsung: drivers for v6.9
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=827269
  Lore link: https://lore.kernel.org/r/20240218182141.31213-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/4] samsung: drivers for v6.9
             [GIT,PULL,4/4] ARM: samsung: soc for v6.9

Patch: [GIT,PULL] Kconfig change for omap1
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=830998
  Lore link: https://lore.kernel.org/r/pull-1709194435-723888@atomide.com

Patch: [GIT,PULL] Allwinner device tree fix for 6.8
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829306
  Lore link: https://lore.kernel.org/r/20240223205450.GA8881@jernej-laptop

Patch: [GIT,PULL] OP-TEE fix for 6.8
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=832094
  Lore link: https://lore.kernel.org/r/20240304132727.GA3501807@rayden

Patch: [GIT,PULL] Qualcomm ARM64 DeviceTree fixes for 6.8
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829536
  Lore link: https://lore.kernel.org/r/20240225025205.479589-1-andersson@kernel.org


Total patches: 22

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


