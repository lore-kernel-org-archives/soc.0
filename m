Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705E4EB64DA
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2AA10C433CC; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12F31C433C9
	for <soc@kernel.org>; Thu, 22 Jun 2023 16:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687450230;
	bh=VP3nt4jbsEiPZd0sGzzkr9/mz24gPYIQLv4PFHKqZwo=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Z7NbfveMYIYWw6gOLj9aFrNbcYwcCb9j/vQzBWomgfP9MlgYSk1SIq5oPhShQybEo
	 l3KXn7OqtaI35f0V61xnl4suCvoxTSAnt9kHAd9OUgOS/pSdsvh/UJ3nFLhRaAx4V0
	 +swNbEXgtXzM1haWSf0OfiSgvYXLC94Uup/2FvEDGt1REYoxI77TR9quf67FC7FMMZ
	 o5gBxidsGU+Dc9uhP7viDNSx6mvl+EMMilQHCPTylnu1l+bO+zBvZubnh4vRc0CkFU
	 wt+6gq5CTAZD0UR2xaS6+2qxpdBgi0VcWyy+3iC9MzCpBQoZ+Gqb05Ck9gNb2PIVO8
	 o4Zua3T1dYjTg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CBE93C395FF;
	Thu, 22 Jun 2023 16:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168745022971.12309.14966104421187908059.git-patchwork-summary@kernel.org>
Date: Thu, 22 Jun 2023 16:10:29 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: clk: nuvoton: Use clk_parent_data instead and add a header file
  Submitter: Jacky Huang <ychuang570808@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=759516
  Lore link: https://lore.kernel.org/r/20230622141343.13595-1-ychuang570808@gmail.com
    Patches: [v3,1/3] clk: nuvoton: Add clk-ma35d1.h for driver extern functions
             [v3,2/3] clk: nuvoton: Update all constant hex values to lowercase
             [v3,3/3] clk: nuvoton: Use clk_parent_data instead of string for parent clock

Patch: [GIT,PULL] Use kmemdup() in OP-TEE driver for v6.5
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757485
  Lore link: https://lore.kernel.org/r/20230615130049.GA979203@rayden

Patch: [GIT,PULL] Rockchip driver changes for 6.5 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=756103
  Lore link: https://lore.kernel.org/r/10286366.nUPlyArG6x@phil

Series: [GIT,PULL,1/3] Broadcom devicetree changes for 6.5
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=758394
  Lore link: https://lore.kernel.org/r/20230619134920.3384844-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/3] Broadcom devicetree changes for 6.5
             [GIT,PULL,3/3] Broadcom maintainers changes for 6.5

Patch: [GIT,PULL] memory: drivers for v6.5
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=756395
  Lore link: https://lore.kernel.org/r/20230612175508.288775-1-krzysztof.kozlowski@linaro.org

Patch: ARM: omap2: Fix copy/paste bug
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=757037
  Lore link: https://lore.kernel.org/r/20230614093032.403982-1-linus.walleij@linaro.org

Patch: [GIT,PULL] amlogic late Drivers updates for v6.5
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=759384
  Lore link: https://lore.kernel.org/r/a10ea420-7599-3f41-dfd8-1742ef436ca0@linaro.org

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v6.5
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=756276
  Lore link: https://lore.kernel.org/r/20230612121017.4108104-1-sudeep.holla@arm.com

Patch: [GIT,PULL] soc/fsl drivers changes for next(v6.5)
  Submitter: Li Yang <leoyang.li@nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=759294
  Lore link: https://lore.kernel.org/r/20230621222503.12402-1-leoyang.li@nxp.com


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


