Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DE3C001B0
	for <soc@archiver.kernel.org>; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53EFAC433CB; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A83EC433C7
	for <soc@kernel.org>; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688589724;
	bh=Ni7myBNrKSvNuHNufQ2tAQ0GK1fVjIKAdPsKs7Xh9xo=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=c7ZliFi7DWu3pwyjxRB8x+XQYg5xeqweY3WTRTgSqpJ4wkUvxuDuWGxT2bubZ2lss
	 jwLR9MGUgiAo5ruXgrBcRYSnEEtBW5yqC/zkTN7x1bzlkNdHijjgYSLbpYnTY08Mgv
	 /L1Z3OYIJYzhZY/jaxGApFSTKidElfgPvXYRZKx01bkdd53t2qno4u+IAMJ41cSaYR
	 jvic5NvaUVPxIb6ONuH5jw4ODOjJd3KAhGC3wF0GGEOsep/Mt/AW1RepVsfAEctoQc
	 m5/aQlDFa0EFxGhEkmXCvjQYuRp50uGlmCbDt/mKmd/73IFbpMw7hjvCBFeqVvlmeR
	 NrbXVxGDxgwkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 16F8CC0C40E;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168858972403.10612.16132315746112738200.git-patchwork-summary@kernel.org>
Date: Wed, 05 Jul 2023 20:42:04 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: Add support for sam9x7 SoC family
  Submitter: Varshini Rajendran <varshini.rajendran@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=759895
  Lore link: https://lore.kernel.org/r/20230623203056.689705-1-varshini.rajendran@microchip.com
    Patches: [v2,01/45] dt-bindings: microchip: atmel,at91rm9200-tcb: add sam9x60, sam9x7 compatible
             [v2,32/45] spi: dt-bindings: atmel,at91rm9200-spi: add sam9x7 compatible

Patch: [GIT,PULL] RISC-V Devicetrees for v6.5
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=756407
  Lore link: https://lore.kernel.org/r/20230612-fasting-floss-0bc05a08bc7a@spud

Patch: [GIT,PULL,v2] dt-bindings: Changes for v6.5-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=758777
  Lore link: https://lore.kernel.org/r/20230620162615.2043450-1-thierry.reding@gmail.com

Patch: [GIT,PULL] RISC-V: make ARCH_THEAD preclude XIP_KERNEL
  Submitter: Conor Dooley <conor.dooley@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=760812
  Lore link: https://lore.kernel.org/r/20230628-left-attractor-94b7bd5fbb83@wendy

Patch: bus: ixp4xx: fix IXP4XX_EXP_T1_MASK
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=759980
  Lore link: https://lore.kernel.org/r/20230624122139.3229642-1-linus.walleij@linaro.org

Patch: [GIT,PULL] Qualcomm ARM32 DeviceTree updates for v6.5
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=756035
  Lore link: https://lore.kernel.org/r/20230611010843.2482142-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm ARM64 defconfig updates for v6.5
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=756006
  Lore link: https://lore.kernel.org/r/20230610170955.2478831-1-andersson@kernel.org

Patch: ARM: dts: st: add missing space before {
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=762736
  Lore link: https://lore.kernel.org/r/20230705150033.293832-1-krzysztof.kozlowski@linaro.org


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


