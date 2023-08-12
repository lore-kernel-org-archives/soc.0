Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D93EC0015E
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 35434C433CC; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12416C433C7
	for <soc@kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=Y4kLPbb5Le3zOXVrtcUs10aoVqsOAE8bKiC4a12owUA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=GCLXYRUAcYpTQzNF39cfB4q25jqCiKSiNLQXKPPLfpiAgscRR/GakotGNsUk4yfN0
	 +k88RT9Svr+nMFOVttU1cHnr3ZOODxPKRq0pCEXt74WTdya4kiLpal/1aXbCrZTigs
	 aVhqV9jxiszebFj7j4wTCl6Bmnlqo8k83c9BJMoKWPu1HVr5aZx82R+UX0LOez5hmR
	 ZbzHSjCQlLuDQfsyusn5AzoauIbWkGM6UqVVZDFd3POMWuSS6P7TWBvEfFCs/Tg/Qp
	 wCyNoe9OUtKoU0dUyS+ZLyWWeZjM3gsC0Cak/PRyxucmLZLC9k5rgZG4IxFoIzjmZH
	 WBAWS2b5fUhOQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E1925C3274B;
	Sat, 12 Aug 2023 09:14:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168883.30475.1563599719485757688.git-patchwork-summary@kernel.org>
Date: Sat, 12 Aug 2023 09:14:48 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] AT91 SoC updates for 6.6
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=772887
  Lore link: https://lore.kernel.org/r/20230804044118.231478-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] arm64: dts: juno: Update for v6.6
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=773098
  Lore link: https://lore.kernel.org/r/20230804123223.3258086-1-sudeep.holla@arm.com

Series: [GIT,PULL,1/4] Devicetree binding changes for omaps for v6.6
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=774861
  Lore link: https://lore.kernel.org/r/pull-1691658952-110529@atomide.com
    Patches: [GIT,PULL,1/4] Devicetree binding changes for omaps for v6.6
             [GIT,PULL,3/4] Devicetree changes for omaps for v6.6
             [GIT,PULL,4/4] SoC changes for omaps for v6.6

Series: [GIT,PULL,1/4] soc/tegra: Changes for v6.6-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=770498
  Lore link: https://lore.kernel.org/r/20230728094129.3587109-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/4] soc/tegra: Changes for v6.6-rc1
             [GIT,PULL,2/4] dt-bindings: Changes for v6.6-rc1
             [GIT,PULL,3/4] ARM: tegra: Device tree changes for v6.6-rc1
             [GIT,PULL,4/4] arm64: tegra: Device tree changes for v6.6-rc1

Series: [GIT,PULL,1/3] samsung: drivers for v6.6
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=775030
  Lore link: https://lore.kernel.org/r/20230810151250.220202-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] samsung: drivers for v6.6
             [GIT,PULL,2/3] arm64: dts: samsung: DTS for v6.6
             [GIT,PULL,3/3] ARM: dts: samsung: DTS for v6.6

Series: Renesas SoC updates for v6.6
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=770555
  Lore link: https://lore.kernel.org/r/cover.1690545139.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.6
             [GIT,PULL,2/3] Renesas ARM SoC updates for v6.6
             [GIT,PULL,3/3] Renesas DTS updates for v6.6

Series: ARM: DT include cleanups
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=772821
  Lore link: https://lore.kernel.org/r/20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org
    Patches: [v2,01/23] ARM: l2x0: Add explicit includes for init and types
             [v2,02/23] ARM: sti: Drop unused includes
             [v2,03/23] ARM: alpine: Drop unused includes
             [v2,04/23] ARM: berlin: Drop unused includes
             [v2,05/23] ARM: dove: Drop unused includes
             [v2,06/23] ARM: hpe: Drop unused includes
             [v2,07/23] ARM: mmp: Drop unused includes
             [v2,08/23] ARM: nomadik: Drop unused includes
             [v2,09/23] ARM: npcm: Drop unused includes
             [v2,10/23] ARM: nspire: Drop unused includes
             [v2,11/23] ARM: pxa: Drop unused includes
             [v2,12/23] ARM: rockchip: Drop unused includes
             [v2,13/23] ARM: versatile: Drop unused includes
             [v2,14/23] ARM: mvebu: Explicitly include correct DT includes
             [v2,15/23] ARM: spear: Explicitly include correct DT includes
             [v2,16/23] bus: Explicitly include correct DT includes
             [v2,17/23] firmware: Explicitly include correct DT includes
             [v2,18/23] soc: aspeed: Explicitly include correct DT includes
             [v2,19/23] soc: mediatek: Explicitly include correct DT includes
             [v2,20/23] soc: rockchip: Explicitly include correct DT includes
             [v2,21/23] soc: sunxi: Explicitly include correct DT includes
             [v2,22/23] soc: xilinx: Explicitly include correct DT includes
             [v2,23/23] soc: fsl: Explicitly include correct DT includes

Patch: [GIT,PULL] amlogic ARM updates for v6.6
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=773120
  Lore link: https://lore.kernel.org/r/bbdfc9d4-6e02-a1aa-7871-b24f9da3419b@linaro.org

Patch: [GIT,PULL] Microchip ARM64 DT updates for 6.6
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=772888
  Lore link: https://lore.kernel.org/r/20230804044132.231508-1-claudiu.beznea@tuxon.dev

Patch: ARM: dts: st: spear: split interrupts per cells
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=770906
  Lore link: https://lore.kernel.org/r/20230730111536.98164-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] arm: dts: hisilicon dts updates for v6.6
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=772926
  Lore link: https://lore.kernel.org/r/64CC9B21.70907@hisilicon.com

Patch: [v2] soc: fsl: Explicitly include correct DT includes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=769023
  Lore link: https://lore.kernel.org/r/20230724205551.768767-1-robh@kernel.org

Patch: [GIT,PULL] arm64: dts: ZynqMP DT changes for v6.6
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=773070
  Lore link: https://lore.kernel.org/r/fde6d7b4-c751-219d-3ec5-04e5bad2aa17@monstr.eu

Patch: [GIT,PULL] ARM: aspeed: devicetree changes for 6.6
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=774963
  Lore link: https://lore.kernel.org/r/CACPK8Xc76O5kLEAXRtbFXZcP=ObrKR0Kpez_er+zV2vZffZe7A@mail.gmail.com

Patch: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.6
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=772922
  Lore link: https://lore.kernel.org/r/64CC99A3.5030701@hisilicon.com

Patch: [GIT,PULL] Allwinner device tree changes for 6.6
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=773441
  Lore link: https://lore.kernel.org/r/20230806180546.GA127039@jernej-laptop

Series: [v7,1/2] dt-bindings: arm: aspeed: add Inventec starscream-bmc
  Submitter: PJ Chen <Chen.PJ@inventec.com>
  Committer: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=761901
  Lore link: https://lore.kernel.org/r/20230703060222.24263-1-chen.pj@inventec.com
    Patches: [v7,1/2] dt-bindings: arm: aspeed: add Inventec starscream-bmc
             [v7,2/2] ARM: dts: aspeed: Adding Inventec Starscream BMC

Patch: [RESEND] arm64: dts: mediatek: Fix "status" values
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=773295
  Lore link: https://lore.kernel.org/r/20230804225813.12493-1-robh@kernel.org

Patch: ARM: spear: Explicitly include correct DT includes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=766722
  Lore link: https://lore.kernel.org/r/20230717225414.3210914-1-robh@kernel.org

Patch: [GIT,PULL] AT91 DT updates for 6.6
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=772886
  Lore link: https://lore.kernel.org/r/20230804044102.231448-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.6
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=773121
  Lore link: https://lore.kernel.org/r/d5f95654-ebcd-bd37-02f9-840e50b17e44@linaro.org


Total patches: 53

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


