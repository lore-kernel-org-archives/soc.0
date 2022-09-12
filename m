Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11F31ECAAD5
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E673AC433D7; Mon, 12 Sep 2022 15:30:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D00B7C433D6
	for <soc@kernel.org>; Mon, 12 Sep 2022 15:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662996624;
	bh=jyuDkYpvPTQdCNaOdR8kXlylK39kYLcZnIWOSv1Lqfc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=h7tf7jicvwml1iD2M0nZrA+jI9NLQ0yxjR2eY9g1WFO8LYKLwCNmtB6smyOEXUjfI
	 lYJ/CYxjj1Z+ptryN9Ap87MoAFRUShSnH5moTqforWZ3MEa2IOBhXUz4C16oocY4xz
	 IFnZ5swYfXMveDZ1QbzUsASNe1EBhKb+6GVQiBZzHHUZ9Z7/x2rnI+/TgzVOBDk0Pn
	 A4OIYqStAAmWAsayWBjmVD6rr8YC/lAkgF0t/Ywc5+gYMg2pPh24XXBHw9EmbwuhLI
	 f74aGKwkLo46BqRj5mXYTgFrf4kX6s5ZFPb0zeR9GYLlGJz2ecs0NI59jIs0FkQL76
	 57HqR7TJDcI2A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B6B4BC04E59;
	Mon, 12 Sep 2022 15:30:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166299662474.5098.9954855704142854566.git-patchwork-summary@kernel.org>
Date: Mon, 12 Sep 2022 15:30:24 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Rockchip dts64 changes for 6.1 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=675875
  Lore link: https://lore.kernel.org/r/5600929.DvuYhMxLoT@phil

Patch: [GIT,PULL] Rockchip dts fixes for 6.0
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=675874
  Lore link: https://lore.kernel.org/r/2645885.mvXUDI8C0e@phil

Patch: [GIT,PULL] Rockchip driver changes for 6.1 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=675881
  Lore link: https://lore.kernel.org/r/2252399.ElGaqSPkdT@phil

Patch: ARM: config: ixp4xx: Disable legacy EEPROM driver
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=676080
  Lore link: https://lore.kernel.org/r/20220911214042.1857352-1-linus.walleij@linaro.org

Series: [GIT,PULL,1/2] Samsung SoC driver for v6.1
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=675736
  Lore link: https://lore.kernel.org/r/20220909150849.820523-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] Samsung SoC driver for v6.1
             [GIT,PULL,2/2] arm64: dts: samsung: for v6.1

Series: [PULL,fixes,1/4] dt-bindings: memory-controllers: fsl,imx8m-ddrc: drop Leonard Crestez
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=675752
  Lore link: https://lore.kernel.org/r/20220909153037.824092-1-krzysztof.kozlowski@linaro.org
    Patches: [PULL,fixes,1/4] dt-bindings: memory-controllers: fsl,imx8m-ddrc: drop Leonard Crestez
             [GIT,PULL,2/4] memory: drivers for v6.1
             [GIT,PULL,3/4] memory: brcm for v6.1
             [GIT,PULL,4/4] memory: mediatek for v6.1

Patch: [GIT,PULL] Rockchip dts32 changes for 6.1 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=675876
  Lore link: https://lore.kernel.org/r/4766760.31r3eYUQgx@phil

Patch: [GIT,PULL] STM32 DT changes for v6.1 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=676236
  Lore link: https://lore.kernel.org/r/d80afc20-2745-24a2-ab70-a5a03439bd50@foss.st.com


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


