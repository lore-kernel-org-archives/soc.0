Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF8EC46467
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A2013C43470; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CCDBC433D7
	for <soc@kernel.org>; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042343;
	bh=xGNu1NMSc+BiiVFZ1yhY1xcFlNnEs4041zxq6G0QZDM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=H5ZEZr2D2SwT6jwOLgvIkzsc2LcjF3BZEYXls6dFlmOmaKHVqAjFt1toL9mjNj2oc
	 TRG/edROs0SWKQLrUMu1nFcG2cvEHgypR0IGSq3efiASaRBe//uRupGPK1cPJkVZs6
	 BePJ9xchlNKWqbpysWhPE/97Ee8EWNXqIOYgIV5GycLJz2EKynVyULsDz9WTBZOoLZ
	 mah2K6Dg/Q3TWYEgFkQQmj5kjp3rQ98Iu1YnQyReFaCtSbq42mdyXK+jSzkNUkHR9H
	 LFUCaye8A4cf2zTFrHVE2+aWOOTqJSY8Zw/iAs2cN21Cqi+wK8lXKn0/LsO8f3VFQ/
	 xhCkEKpbJLEfw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 71536C395FF;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234344.4359.16000850441437208313.git-patchwork-summary@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Add __init/__exit annotations OP-TEE driver for v6.2
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=696910
  Lore link: https://lore.kernel.org/r/Y3d4CHWl3Ofx5OrX@jade

Series: Renesas SoC updates for v6.2 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=696996
  Lore link: https://lore.kernel.org/r/cover.1668788918.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/7] Renesas ARM defconfig updates for v6.2
             [GIT,PULL,2/7] Renesas ARM DT updates for v6.2 (take two)
             [GIT,PULL,3/7] Renesas driver updates for v6.2 (take two)
             [GIT,PULL,4/7] Renesas DT binding updates for v6.2 (take two)
             [GIT,PULL,5/7] Renesas RISC-V defconfig updates for v6.2
             [GIT,PULL,6/7] Renesas RISC-V DT updates for v6.2
             [GIT,PULL,7/7] Renesas RISC-V SoC updates for v6.2

Patch: ARM: multi_v7_defconfig: enable Type-C UCSI and STM32G0 as modules
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=696389
  Lore link: https://lore.kernel.org/r/20221117103931.26174-1-alexandre.torgue@foss.st.com

Series: [GIT,PULL,1/2,-] ARM: dts: exynos: Add new SoC specific compatible string for Exynos3250 SoC
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=695858
  Lore link: https://lore.kernel.org/r/20221116093010.18515-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2,-] ARM: dts: exynos: Add new SoC specific compatible string for Exynos3250 SoC
             [GIT,PULL,2/2] arm64: dts: samsung: Pull for v6.2

Series: [GIT,PULL,1/8] soc/tegra: Changes for v6.2-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697184
  Lore link: https://lore.kernel.org/r/20221119012025.3968358-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/8] soc/tegra: Changes for v6.2-rc1
             [GIT,PULL,8/8] arm64: tegra: Default configuration updates for v6.2-rc1

Patch: [GIT,PULL] HiSilicon ARM64 DT updates for v6.2
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=695777
  Lore link: https://lore.kernel.org/r/63744D38.9010700@hisilicon.com

Series: Add UniPhier Pro5 boards support
  Submitter: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=696564
  Lore link: https://lore.kernel.org/r/20221117163219.3673-1-hayashi.kunihiko@socionext.com
    Patches: [1/2] dt-bindings: arm: uniphier: Add Pro5 boards
             [2/2] ARM: dts: uniphier: Add Pro5 board support

Patch: [GIT,PULL] Fix possible memory leak OP-TEE driver for v6.1
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=696906
  Lore link: https://lore.kernel.org/r/Y3d2OuJ60U30OkZe@jade

Patch: [GIT,PULL] Allwinner device tree changes for 6.2
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697082
  Lore link: https://lore.kernel.org/r/Y3fuAosinWbrj+Dy@jernej-laptop

Series: [GIT,PULL,1/6] i.MX drivers change for 6.2
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697265
  Lore link: https://lore.kernel.org/r/20221119125733.32719-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/6] i.MX drivers change for 6.2
             [GIT,PULL,2/6] i.MX SoC change for 6.2
             [GIT,PULL,3/6] i.MX dt-bindings update for 6.2
             [GIT,PULL,4/6] i.MX arm device tree update for 6.2
             [GIT,PULL,5/6] i.MX arm64 device tree update for 6.2
             [GIT,PULL,6/6] i.MX defconfig change for 6.2

Patch: [GIT,PULL] IXP4xx updates for v6.2
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697409
  Lore link: https://lore.kernel.org/r/CACRpkdYNwyZ1FDM07MkUfYyYGtXFQfy1xP9Utc5+K2+gn_ZW9g@mail.gmail.com

Patch: [GIT,PULL] Allwinner fixes for 6.1
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697081
  Lore link: https://lore.kernel.org/r/Y3ftpBFk5+fndA4B@jernej-laptop

Patch: [GIT,PULL] AT91 device tree updates for 6.2 #2
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=696931
  Lore link: https://lore.kernel.org/r/20221118131214.301678-1-claudiu.beznea@microchip.com

Patch: [GIT,PULL] i.MX fixes for 6.1, part 3
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697226
  Lore link: https://lore.kernel.org/r/20221119073812.GQ16229@T480

Patch: [GIT,PULL] STM32 DT changes for v6.2 #1
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=696387
  Lore link: https://lore.kernel.org/r/3235e5be-d89f-f76c-5e25-5d1210feb857@foss.st.com

Patch: [GIT,PULL] Stable branch for .dts to .dtso rename
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697090
  Lore link: https://lore.kernel.org/r/20221118211103.GA1334449-robh@kernel.org

Patch: [GIT,PULL] AT91 fixes for 6.1 #2
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=696930
  Lore link: https://lore.kernel.org/r/20221118131205.301662-1-claudiu.beznea@microchip.com


Total patches: 31

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


