Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 224EAE7F129
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D22ECC433AB; Tue, 26 Sep 2023 21:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC8C2C4339A
	for <soc@kernel.org>; Tue, 26 Sep 2023 21:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695762232;
	bh=wx1+uHNXUdh3Ol/kYRg/GsOV8jzStPYFq/xMCtz4WMc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=dh9/X4QE32zDWdKvKzdm8mHhgvBjuN+doUi8ylG+DKpKP82cid2nzTb0Luxg2UaQF
	 8C7muOAsRjzQYPGnjPNeWe3LMzALVc0p3wsCs0HPfdbeZQY9eXWS5L0I+hzLLm9U0E
	 KTKzpS33RUOhf64yHB8PmnwFIpXf5U3kUg+dbR9RMoSVrJq+QcwI/1TZrX7p90TNL4
	 VkA641OBDMjHgMx2r+G6VpPO4J2lUpDSM2rQJRl9w8QLtPtg457uroHWg82MR8ksjJ
	 u0RNVEvcHWspSeRsxdFhfaaUxCDMhm6UMXVXQUPJhWyfuNTxfrxXi32c3jvNy+c5Lg
	 d0s62DFBzr3Kw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 98C2AC64459;
	Tue, 26 Sep 2023 21:03:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576223255.24546.5502823471200786321.git-patchwork-summary@kernel.org>
Date: Tue, 26 Sep 2023 21:03:52 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: soc: loongson: Fix some issues about loongson2_guts
  Submitter: Binbin Zhou <zhoubinbin@loongson.cn>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=781022
  Lore link: https://lore.kernel.org/r/cover.1693534134.git.zhoubinbin@loongson.cn
    Patches: [1/2] soc: loongson: loongson2_guts: Convert to devm_platform_ioremap_resource()
             [2/2] soc: loongson: loongson2_guts: Remove unneeded semicolon

Patch: [GIT,PULL] TEE fix for v6.6
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=783692
  Lore link: https://lore.kernel.org/r/20230913083909.GA473533@rayden

Series: soc: loongson: Fix some issues about loongson_pm2
  Submitter: Binbin Zhou <zhoubinbin@loongson.cn>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=780811
  Lore link: https://lore.kernel.org/r/cover.1693474728.git.zhoubinbin@loongson.cn
    Patches: [v2,1/5] soc: loongson: loongson_pm2: Add dependency for INPUT
             [v2,2/5] dt-bindings: soc: loongson,ls2k-pmc: Use fallbacks for ls2k-pmc compatible
             [v2,3/5] soc: loongson: loongson_pm2: Drop useless of_device_id compatible
             [v2,4/5] dt-bindings: soc: loongson,ls2k-pmc: Allow syscon-reboot/syscon-poweroff as child
             [v2,5/5] soc: loongson: loongson_pm2: Populate children syscon nodes

Series: soc: loongson: Fix some issues about loongson2_pm
  Submitter: Binbin Zhou <zhoubinbin@loongson.cn>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=781298
  Lore link: https://lore.kernel.org/r/cover.1693623752.git.zhoubinbin@loongson.cn
    Patches: [v3,1/5] soc: loongson: loongson2_pm: Add dependency for INPUT
             [v3,2/5] dt-bindings: soc: loongson,ls2k-pmc: Use fallbacks for ls2k-pmc compatible
             [v3,3/5] soc: loongson: loongson2_pm: Drop useless of_device_id compatible
             [v3,4/5] dt-bindings: soc: loongson,ls2k-pmc: Allow syscon-reboot/syscon-poweroff as child
             [v3,5/5] soc: loongson: loongson2_pm: Populate children syscon nodes

Series: [GIT,PULL,1/4] Broadcom devicetree changes for 6.6
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=777464
  Lore link: https://lore.kernel.org/r/20230818164539.2871539-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/4] Broadcom devicetree changes for 6.6

Series: [GIT,PULL,v2,1/2] dt-bindings: Changes for v6.6-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=781117
  Lore link: https://lore.kernel.org/r/20230901101742.1871434-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,v2,1/2] dt-bindings: Changes for v6.6-rc1
             [GIT,PULL,v2,2/2] arm64: tegra: Device tree changes for v6.6-rc1

Patch: [GIT,PULL] ARM: SoC/genpd driver updates for v6.6
  Submitter: Ulf Hansson <ulf.hansson@linaro.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=780340
  Lore link: https://lore.kernel.org/r/20230829213441.310655-1-ulf.hansson@linaro.org

Patch: [GIT,PULL] i.MX fixes for 6.6
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=787651
  Lore link: https://lore.kernel.org/r/20230926123710.GT7231@dragon

Patch: [GIT,PULL] RISC-V Devicetree fixes for v6.6-rc3
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=784924
  Lore link: https://lore.kernel.org/r/20230916-previous-oversold-9d30891ac6cf@spud

Patch: [GIT,PULL] aspeed: Maintainers updates for v6.6
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=787631
  Lore link: https://lore.kernel.org/r/CACPK8Xc+D=YBc2Dhk-6-gOuvKN0xGgZYNop6oJVa=VNgaEYOHw@mail.gmail.com

Patch: [RESEND] MAINTAINERS: aspeed: Update git tree URL
  Submitter: Zev Weiss <zev@bewilderbeest.net>
  Committer: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=786905
  Lore link: https://lore.kernel.org/r/20230922223405.24717-2-zev@bewilderbeest.net

Patch: ARM: uniphier: fix cache kernel-doc warnings
  Submitter: Randy Dunlap <rdunlap@infradead.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=787479
  Lore link: https://lore.kernel.org/r/20230926003548.22066-1-rdunlap@infradead.org

Patch: [GIT,PULL] Fixes for omaps and ti-sysc
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=787553
  Lore link: https://lore.kernel.org/r/pull-1695715881-95183@atomide.com

Patch: arm64: dts: mediatek: Fix "mediatek,merge-mute" and "mediatek,merge-fifo-en" types
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=780633
  Lore link: https://lore.kernel.org/r/20230830195650.704737-1-robh@kernel.org

Patch: [v2] arm64: defconfig: remove CONFIG_COMMON_CLK_NPCM8XX=y
  Submitter: Mikko Rapeli <mikko.rapeli@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=786238
  Lore link: https://lore.kernel.org/r/20230921145723.2167927-1-mikko.rapeli@linaro.org


Total patches: 25

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


