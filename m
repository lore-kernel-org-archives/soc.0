Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E19B2C3271E
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0A65C4AF10; Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9CEBC116B1
	for <soc@kernel.org>; Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720451507;
	bh=nDOkQgd4xJl2zbJbmFutEXYstjPuyNAeJ1XzVODfAW8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ut2NbWu2QTRD43pmgYnlA1A5xWjl/vlKQ+HOLZ411HTLqjWOkA7lWI6f2tzPJZQtI
	 e22SAPRBGE1dxaDbiqk6f2oc6PsM/H+LCxRBHNC9BHDSxtUA/eOCrMFgz0m3hHh8aI
	 /6SlEcbYdyuQgupobAersJ6Dvz3rMshKgdMZCBoUQBRRFDbAn9mOns5Y/esxSrk6xP
	 0a/jyaGTg6jFar3GlsSDTVx5S2jYI+oXbAylEgU8LUq+0bwFZiFhctv41Qac+nJPpa
	 R7hIA14QJKA0PM7ChvsIWkaOfQ380yVo5TSD/rkL904/gINn8BgDItxCuJignnvQbn
	 PA/qSo/xHrXGw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A0A81DF370E;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172045150759.17395.14567783906465842008.git-patchwork-summary@kernel.org>
Date: Mon, 08 Jul 2024 15:11:47 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/3] Allwinner SoC fixes for 6.10
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=867613
  Lore link: https://lore.kernel.org/r/ZoQY5k21RQLOrBQ3@wens.tw
    Patches: [GIT,PULL,1/3] Allwinner SoC fixes for 6.10
             [GIT,PULL,3/3] Allwinner SoC device tree changes for 6.11

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v6.11
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=869018
  Lore link: https://lore.kernel.org/r/20240706173140.18887-1-andersson@kernel.org

Patch: MAINTAINERS: ARM: moxa: add Krzysztof Kozlowski as maintainer
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=861662
  Lore link: https://lore.kernel.org/r/20240613135956.8899-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] 2/2 ARM: dts: various cleanup for v6.11
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=867416
  Lore link: https://lore.kernel.org/r/20240702065359.7378-2-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL,1/2] arm64: dts: various cleanup for v6.11
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=867415
  Lore link: https://lore.kernel.org/r/20240702065359.7378-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] RISC-V Devicetrees for v6.11
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=869104
  Lore link: https://lore.kernel.org/r/20240707-nuttiness-lustfully-4aaf03c991b2@spud

Patch: [v2] MAINTAINERS: ARM: vt8500: add Alexey and Krzysztof as maintainers
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=861479
  Lore link: https://lore.kernel.org/r/20240613064612.8589-1-krzysztof.kozlowski@linaro.org

Patch: MAINTAINERS: ARM: alphascale: add Krzysztof Kozlowski as maintainer
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=861219
  Lore link: https://lore.kernel.org/r/20240612141018.7348-1-krzysztof.kozlowski@linaro.org

Patch: MAINTAINERS: ARM: nspire: add Krzysztof Kozlowski as maintainer
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=861228
  Lore link: https://lore.kernel.org/r/20240612141740.8470-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.11
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=868621
  Lore link: https://lore.kernel.org/r/20240705032926.13333-1-andersson@kernel.org

Series: [GIT,PULL,1/2] arm64: dts: samsung: DTS for v6.11
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=867403
  Lore link: https://lore.kernel.org/r/20240702063514.6215-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] arm64: dts: samsung: DTS for v6.11

Patch: ARM: dts: ixp4xx: nslu2: beeper uses PWM
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=868030
  Lore link: https://lore.kernel.org/r/20240703-ixp4xx-dts-v1-1-e5149da36f6e@linaro.org

Series: [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.11
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=868853
  Lore link: https://lore.kernel.org/r/37f251a1-f3bd-402f-ab22-cf786c3871d7@ti.com
    Patches: [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.11

Patch: MAINTAINERS: ARM: axm: add Krzysztof Kozlowski as maintainer
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=861658
  Lore link: https://lore.kernel.org/r/20240613134910.7862-1-krzysztof.kozlowski@linaro.org


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


