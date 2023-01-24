Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D9CC54E94
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B7F1AC433A0; Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1D42C433D2
	for <soc@kernel.org>; Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674595889;
	bh=DymTCT7IAhsM5+Kb/L3Xi2maRdy8TJSiyxp1s5Qq1a4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=pnUVbLAIMXIaFWY0i1e4E+DhBlZMFOLNQgIPUbTwaZ4T5u7honI5KBX4mhapir/jX
	 +G63ngaQpBrJ071Un20jmrt2uP3Zgu94lSX+NsiqZ7ZOb10GGBtsiDRg7ZyIiTXYYz
	 cWMA38uSV5Vfc95BEYaX6iFVdRfxPJJ+qFL3BV8YFnh8JRxDkIULOi1fQmWJCR+bZk
	 nKEXcyd/2WTpw6NRU+mer7Swp05VHZNSMj7gXSWQtrhgfUJEV/o12wvEB3JosKEgcR
	 u+4VES6FY1MhpjJ6SqyTyYDkEx17eI9gtztddCY+oQzuTOVj2fPqAEiMY9l5avIQNr
	 yesDk8NjUVtjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 89993C5C7D4;
	Tue, 24 Jan 2023 21:31:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167459588955.12731.6847684045727559657.git-patchwork-summary@kernel.org>
Date: Tue, 24 Jan 2023 21:31:29 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/2] Devicetree changes for omaps for v6.3
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=715120
  Lore link: https://lore.kernel.org/r/pull-1674566471-434733@atomide.com
    Patches: [GIT,PULL,1/2] Devicetree changes for omaps for v6.3
             [GIT,PULL,2/2] Clean-up for omamps for v6.3

Patch: [GIT,PULL] One clean-up for omap1 for v6.3
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=715121
  Lore link: https://lore.kernel.org/r/pull-1674566532-427457@atomide.com

Series: TQMLS1021A support
  Submitter: Alexander Stein <alexander.stein@ew.tq-group.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=715071
  Lore link: https://lore.kernel.org/r/20230124110213.3221264-1-alexander.stein@ew.tq-group.com
    Patches: [v3,01/10] dt-bindings: arm: fsl: add TQ-Systems LS1021A board
             [v3,08/10] ARM: multi_v7_defconfig: Add options to support TQMLS102xA series
             [v3,09/10] kbuild: Add config fragment merge functionality
             [v3,10/10] ARM: add multi_v7_lpae_defconfig

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v6.3
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=714196
  Lore link: https://lore.kernel.org/r/20230120162152.1438456-1-sudeep.holla@arm.com

Patch: ARM: ep93xx: Convert to use descriptors for GPIO LEDs
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=710965
  Lore link: https://lore.kernel.org/r/20230111132210.134478-1-linus.walleij@linaro.org

Patch: [GIT,PULL] memory: drivers for v6.3, corrected, v2
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=714677
  Lore link: https://lore.kernel.org/r/20230123105330.63709-1-krzysztof.kozlowski@linaro.org

Patch: arm64: drop redundant "ARMv8" from Kconfig option title
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=714126
  Lore link: https://lore.kernel.org/r/20230120125722.270722-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] samsung: soc for v6.3
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=714480
  Lore link: https://lore.kernel.org/r/20230122122605.30720-1-krzysztof.kozlowski@linaro.org

Series: Renesas SoC updates for v6.3
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=712036
  Lore link: https://lore.kernel.org/r/cover.1673702287.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.3
             [GIT,PULL,2/3] Renesas driver updates for v6.3


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


