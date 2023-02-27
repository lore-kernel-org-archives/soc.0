Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37352C64ED8
	for <soc@archiver.kernel.org>; Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 17D31C4339E; Mon, 27 Feb 2023 13:50:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01049C433D2
	for <soc@kernel.org>; Mon, 27 Feb 2023 13:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677505818;
	bh=ZBOybmP/e0Z6Q7xiMDAZsvvKAv0BOjHLM8GljZ2CXHE=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ua11CQSxiU/nXelVGmbyLE8g3sQbW8wqNVfb3zg/fIzpu/a7VhnI7PpWQ1IJn3rtQ
	 v5xBxpGFR1L3f9G/M/fXA2VslHhXI/ykCDepDNDhtH2ylI1o510a79QflTGWbmESHr
	 WYdilwDGvISHn+Y9G1cJ2Z2sbrYIwBZ5aUcClcEkIYaV9fV1T26H3X1KNQKhHey4R7
	 unpZVR/YFLB1YpPApX9BXjoHWuJAfnbhq4RsbTBSircvxswjMZwoqci0za9vZQ6Xh2
	 SMzFixF+eRLCDF1oTgfpcQkeP/KLYe+kmhHHMy/8aqAihxwj0P1u/NS/AmOQM8XPA2
	 UfbxzQJabxUug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D30DBE68D2D;
	Mon, 27 Feb 2023 13:50:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167750581781.1456.17570291990093671429.git-patchwork-summary@kernel.org>
Date: Mon, 27 Feb 2023 13:50:17 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: ARM: dts: spear320-hmi: correct STMPE GPIO compatible
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=724862
  Lore link: https://lore.kernel.org/r/20230225162237.40242-1-krzysztof.kozlowski@linaro.org

Patch: ARM: dts: aspeed: p10bmc: Update battery node name
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=723575
  Lore link: https://lore.kernel.org/r/20230221003352.1218797-1-joel@jms.id.au

Patch: arm64: defconfig: Add IOSCHED_BFQ to the default configs
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=724632
  Lore link: https://lore.kernel.org/r/20230224135230.2295826-1-linus.walleij@linaro.org

Patch: arm64: defconfig: Fix unintentional disablement of PCI on i.MX
  Submitter: Mark Brown <broonie@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=723529
  Lore link: https://lore.kernel.org/r/20230220-imx-pci-defconfig-v1-1-2210cf08340e@kernel.org

Patch: [GIT,PULL] fixes: ARM: dts: samsung: Fixes for v6.3
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=723683
  Lore link: https://lore.kernel.org/r/20230221095337.9453-1-krzysztof.kozlowski@linaro.org


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


