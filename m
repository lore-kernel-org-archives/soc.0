Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9879C77B73
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6EECEC433A1; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55193C433D2
	for <soc@kernel.org>; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681489263;
	bh=cL1uCpOzBd0quWS0nQ3XmtnHY5ak3iWTN60PxCT4C88=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=WnFYaPgaPmhZGdjh4D0f1dGZT5D7a7Gedjrw2MgGy0zH6df+/cIx94gdwxxJn9F73
	 /9tPPTqV+MIeZQuo28ZO2C83j/CsLFZBj/l2l0KfO4Yj3C0RHWhpRfqZgQKiOHUKtw
	 0FVLJAiQtxHYAEzXKDwnmMXiMaSN4za9Xi04A9lTGobHcTvdf6y4f80eJkt11sCvyT
	 k28+Ph245BWhIPo8MJmIux51Miyr/2PgcTvni/k+NNio5eE6ZXlIkae0TRCrkG+rgu
	 UUvD3Sh8pEbSuM22FWvXu+Nx3cTHut795sFG3t3ZuuIc/Rq9GSEvAgJFitQAuC7enI
	 nDPCLz+RGNElQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 340C9E52446;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168148926313.30442.14577396621649599291.git-patchwork-summary@kernel.org>
Date: Fri, 14 Apr 2023 16:21:03 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/3] arm64: dts: samsung: dts64 for v6.4
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=737072
  Lore link: https://lore.kernel.org/r/20230405080438.156805-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] arm64: dts: samsung: dts64 for v6.4
             [GIT,PULL,2/4] ARM: dts: samsung: dts for v6.4

Patch: [GIT,PULL] More Qualcomm ARM64 Devicetree updated for v6.4
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=739691
  Lore link: https://lore.kernel.org/r/20230414031550.2412379-1-andersson@kernel.org

Series: [GIT,PULL,1/7] ARM: tegra: Core changes for v6.4-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=737584
  Lore link: https://lore.kernel.org/r/20230406124804.970394-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/7] ARM: tegra: Core changes for v6.4-rc1
             [GIT,PULL,4/7] dt-bindings: Changes for v6.4-rc1
             [GIT,PULL,5/7] ARM: tegra: Device tree changes for v6.4-rc1
             [GIT,PULL,6/7] arm64: tegra: Device tree changes for v6.4-rc1

Series: Renesas SoC updates for v6.4 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738359
  Lore link: https://lore.kernel.org/r/cover.1681113111.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM SoC updates for v6.4
             [GIT,PULL,3/3] Renesas DTS updates for v6.4 (take two)

Patch: [GIT,PULL] ARM: aspeed: devicetree changes for 6.4
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=739382
  Lore link: https://lore.kernel.org/r/CACPK8XfmK5S=1PQjBQHb6daDR3qTWN-_NLoXP7+ZDCk13wDxcA@mail.gmail.com

Patch: [GIT,PULL] A few more Qualcomm ARM32 DeviceTree updates for v6.4
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=739677
  Lore link: https://lore.kernel.org/r/20230414023723.2411793-1-andersson@kernel.org

Patch: [GIT,PULL] Rockchip dts32 changes for 6.4 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738268
  Lore link: https://lore.kernel.org/r/9713202.NyiUUSuA9g@phil

Patch: [GIT,PULL] STM32 DT changes for v6.4 #1
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=737920
  Lore link: https://lore.kernel.org/r/63987ed6-2813-15ff-e058-73312a730d61@foss.st.com

Patch: [GIT,PULL] Rockchip dts64 changes for 6.4 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738267
  Lore link: https://lore.kernel.org/r/7289562.MhkbZ0Pkbq@phil

Series: [GIT,PULL,1/6] i.MX drivers update for 6.4
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738165
  Lore link: https://lore.kernel.org/r/20230408101928.280271-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/6] i.MX drivers update for 6.4
             [GIT,PULL,3/6] i.MX dt-bindings update for 6.4
             [GIT,PULL,4/6] i.MX arm32 device tree changes for 6.4
             [GIT,PULL,5/6] i.MX arm64 device tree changes for 6.4

Series: [GIT,PULL,1/4] Broadcom devicetree changes for 6.4
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738595
  Lore link: https://lore.kernel.org/r/20230410232606.1917803-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/4] Broadcom devicetree changes for 6.4
             [GIT,PULL,2/4] Broadcom devicetree-arm64 changes for 6.4

Patch: ARM: dts: nomadik: Replace deprecated spi-gpio properties
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738565
  Lore link: https://lore.kernel.org/r/20230410220300.2431524-1-linus.walleij@linaro.org

Patch: [GIT,PULL] Allwinner device tree changes for 6.4
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738185
  Lore link: https://lore.kernel.org/r/20230408125156.GA17050@jernej-laptop

Patch: [GIT,PULL] Apple SoC DT updates for 6.4
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=737465
  Lore link: https://lore.kernel.org/r/7263df01-aebc-2db5-f074-4805e0ae9fbc@marcan.st

Patch: [GIT,PULL] RISC-V Devicetrees for v6.4
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=737792
  Lore link: https://lore.kernel.org/r/20230406-shank-impromptu-3d483bbc249f@spud

Series: [GIT,PULL,1/3] soc: ti: Updates for v6.4
  Submitter: Nishanth Menon <nm@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738447
  Lore link: https://lore.kernel.org/r/20230410140506.ucvkwq7vz2h47vyj@stipulate
    Patches: [GIT,PULL,1/3] soc: ti: Updates for v6.4
             [GIT,PULL,3/3] arm64: dts: ti: K3 updates for v6.4


Total patches: 26

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


