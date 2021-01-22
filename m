Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E38C433E6
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0A20323B01; Fri, 22 Jan 2021 23:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E7A5423ACA
	for <soc@kernel.org>; Fri, 22 Jan 2021 23:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611356412;
	bh=9UQsICpBCu3bfRKKuk7QXxPYdCJAsAwAOU+qm4IKV6s=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=RwD1rfEsXyH/rqnILYJkSc/WBaKBxMRIu1oZND6CdrbFaMSanilQVY+7x8D3JDMZ9
	 L1qH5Xpe/D9PcKkhEDZL4dFaSL8t47JzQMY3qDcNJ67Nr9ODEceqfvGBDJj8zL0HEZ
	 ZrMYR8EBGnKYHtQtBX5p9IbfsXQilpGn8y1jow3doyaxkzxrzHnYKrDbAtA6LQbSJ7
	 wGi0Fo3CDQ+5+H47tZ9wCOhCbsRgexruXjcWKF5F+llQgnGNCfCiAoJ5ePO0W2ZOFG
	 n9Kvpe1t1vajUKce/wybsdYuJhaNa+NZow0B1paCuxEedlxfnFQDrzhqqSjvqrf8x5
	 srdAbkN4udhKQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E3FF6652D8;
	Fri, 22 Jan 2021 23:00:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161135641292.29035.9569518047970657709.git-patchwork-summary@kernel.org>
Date: Fri, 22 Jan 2021 23:00:12 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v5.12
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=418423
  Lore link: https://lore.kernel.org/r/20210120174356.cnxopzjjpqo5e3ws@bogus
Patch: [GIT,PULL] ARM: at91: dt for 5.12
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=420003
  Lore link: https://lore.kernel.org/r/20210122145056.171283-1-nicolas.ferre@microchip.com
Patch: [GIT,PULL] i.MX fixes for 5.11, round 2
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=417311
  Lore link: https://lore.kernel.org/r/20210119091949.GD4356@dragon
Patch: [GIT,PULL] OP-TEE driver fix for v5.11
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=419665
  Lore link: https://lore.kernel.org/r/20210122074234.GA1074747@jade
Patch: [GIT,PULL] SoCFPGA DTS updates for v5.12
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=417815
  Lore link: https://lore.kernel.org/r/20210120012334.25730-1-dinguyen@kernel.org
Patch: [GIT,PULL] Ux500 DTS updates for the v5.12 kernel cycle
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=420245
  Lore link: https://lore.kernel.org/r/CACRpkdbn=P63V9aEO2wKu2DwvVUcbjwCEV_JvKwWZ0netT75ig@mail.gmail.com
Patch: [GIT,PULL] ARM: at91: defconfig for 5.12
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=419997
  Lore link: https://lore.kernel.org/r/20210122144638.170565-1-nicolas.ferre@microchip.com
Patch: ARM: multi_v7_defconfig: Enable Actions Semi platform and drivers
  Submitter: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=418793
  Lore link: https://lore.kernel.org/r/20210121061447.26517-1-manivannan.sadhasivam@linaro.org
Patch: ARM: dts: nomadik: Fix up MMC node names
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=420279
  Lore link: https://lore.kernel.org/r/20210122222038.2888747-1-linus.walleij@linaro.org
Patch: [v2] ARM: mstar: Unify common parts of BreadBee boards into a dtsi
  Submitter: Daniel Palmer <daniel@0x0f.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=406037
  Lore link: https://lore.kernel.org/r/20201224020354.2212037-1-daniel@0x0f.com

Total patches: 10

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


