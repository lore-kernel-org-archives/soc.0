Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CCEC4706E
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4189AC433C7; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B611C433C8
	for <soc@kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=OlENYlC4CyWlzYmeZdX2veJ/0b56t8z8LiqRA+stIqQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=EsUhCionm4t/fAjoWQQufgE6WXAiFoZoyR0R7QCLeMSYuOlXHERTpaQqf536py+xR
	 OX5G2Q6pXKiQHBuqEsd4NG+mrwz0j70tFQ7J85K0TKx2IGvuDpSuw4IezqHjtNM43y
	 ZJYjJb77gCbRc5zMF12GnSEFGIknaMWbeGYVb5CeiQD5WeQM+K5dRSxO6xoD2W6xsf
	 7Vx/9F5SCZcJtQ4i4ZNQ4wBrRJ8e766WW0R2OZN5LT2DjPojSay/dqe3+sROYx4aYg
	 giD36LMoN14BHvF/LwurERLqXlrN298H5z13m4ED17c77qy9BAWs4soSqT+LmCBbth
	 yaF6lvthacSow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 094D3C41620;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646698.10550.11004267840197101621.git-patchwork-summary@kernel.org>
Date: Fri, 22 Dec 2023 12:01:06 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] OP-TEE kernel private shared memory optimizations for 6.8
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=808763
  Lore link: https://lore.kernel.org/r/20231211115815.GA616539@rayden

Series: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v6.8
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=809194
  Lore link: https://lore.kernel.org/r/20231212114515.121695-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v6.8
             [GIT,PULL,2/3] MediaTek soc driver updates for v6.8
             [GIT,PULL,3/3] MediaTek ARM64 defconfig updates for v6.8

Patch: [GIT,PULL] memory: drivers for v6.8, part two
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=812123
  Lore link: https://lore.kernel.org/r/20231221101956.16351-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] Microchip AT91 SoC updates for v6.8
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810177
  Lore link: https://lore.kernel.org/r/20231214174830.3045180-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] OP-TEE reserved system thread for 6.8
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=808736
  Lore link: https://lore.kernel.org/r/20231211102600.GA571787@rayden

Series: Add minimal Tensor/GS101 SoC support and Oriole/Pixel6 board
  Submitter: Peter Griffin <peter.griffin@linaro.org>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=808854
  Lore link: https://lore.kernel.org/r/20231211162331.435900-1-peter.griffin@linaro.org
    Patches: [v7,01/16] dt-bindings: watchdog: Document Google gs101 watchdog bindings
             [v7,03/16] dt-bindings: serial: samsung: Add google-gs101-uart compatible
             [v7,04/16] dt-bindings: serial: samsung: Make samsung,uart-fifosize a required property
             [v7,05/16] dt-bindings: soc: samsung: usi: add google,gs101-usi compatible
             [v7,06/16] dt-bindings: clock: google,gs101: fix incorrect numbering and DGB suffix
             [v7,07/16] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
             [v7,08/16] clk: samsung: clk-gs101: Add cmu_top, cmu_misc and cmu_apm support
             [v7,10/16] watchdog: s3c2410_wdt: Add support for WTCON register DBGACK_MASK bit
             [v7,11/16] watchdog: s3c2410_wdt: Update QUIRK macros to use BIT macro
             [v7,12/16] watchdog: s3c2410_wdt: Add support for Google gs101 SoC
             [v7,13/16] tty: serial: samsung: Add gs101 compatible and common fifoszdt_serial_drv_data

Patch: [GIT,PULL,RESEND,v2] arm64: soc: ZynqMP SoC changes for v6.8
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810976
  Lore link: https://lore.kernel.org/r/CAHTX3dJ=6y=vEgmH7Qqe=6TJZT=D-egKDmLLER4fS0=OHJRGZA@mail.gmail.com

Patch: [GIT,PULL] Qualcomm ARM64 defconfig updates for v6.8
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811271
  Lore link: https://lore.kernel.org/r/20231219043307.732781-1-andersson@kernel.org

Patch: [GIT,PULL] memory: drivers for v6.8
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=809537
  Lore link: https://lore.kernel.org/r/20231213061523.4803-1-krzysztof.kozlowski@linaro.org

Series: [GIT,PULL,1/2] samsung: drivers for v6.8
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811717
  Lore link: https://lore.kernel.org/r/20231220084722.22149-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] samsung: drivers for v6.8

Series: [GIT,PULL,1/3] drivers/firmware updates for v6.8 for TI K3 platforms
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811093
  Lore link: https://lore.kernel.org/r/20231218153043.r5psxbjjpccusjg4@september
    Patches: [GIT,PULL,1/3] drivers/firmware updates for v6.8 for TI K3 platforms
             [GIT,PULL,2/3] arm64: defconfig: Updates for v6.8 for TI K3 platforms

Series: [GIT,PULL,1/5] i.MX drivers change for 6.8
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810687
  Lore link: https://lore.kernel.org/r/20231216064605.876196-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/5] i.MX drivers change for 6.8
             [GIT,PULL,2/5] i.MX SoC change for 6.8

Patch: [GIT,PULL] RISC-V cache drivers for v6.8
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=812169
  Lore link: https://lore.kernel.org/r/20231221-catatonic-monday-d4c61283b136@spud

Patch: [GIT,PULL] Qualcomm driver updates for v6.8
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811264
  Lore link: https://lore.kernel.org/r/20231219041855.732578-1-andersson@kernel.org

Series: [GIT,PULL,1/2] Renesas driver updates for v6.8
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810499
  Lore link: https://lore.kernel.org/r/cover.1702642340.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/2] Renesas driver updates for v6.8

Patch: [GIT,PULL] Reset controller updates for v6.8
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=809723
  Lore link: https://lore.kernel.org/r/20231213153313.278867-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] OP-TEE cleanup for v6.8
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810075
  Lore link: https://lore.kernel.org/r/20231214132237.GA3092763@rayden

Patch: [GIT,PULL] amlogic drivers updates for v6.8
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=812114
  Lore link: https://lore.kernel.org/r/a987f881-1c23-4528-9cb1-e5a875b7e7a8@linaro.org

Patch: [GIT,PULL] OP-TEE FF-A asynchronous notifications for 6.8
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=808748
  Lore link: https://lore.kernel.org/r/20231211105249.GA587253@rayden

Patch: [GIT,PULL] ARM: mvebu: drivers for v6.8 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811890
  Lore link: https://lore.kernel.org/r/87il4sbym0.fsf@BL-laptop

Series: [GIT,PULL,1/3] Devicetree changes for omaps for v6.8
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=808238
  Lore link: https://lore.kernel.org/r/pull-1702037869-295608@atomide.com
    Patches: [GIT,PULL,1/3] Devicetree changes for omaps for v6.8
             [GIT,PULL,2/3] Defconfig changes for omaps for v6.8
             [GIT,PULL,3/3] Maintainer changes for v6.8

Patch: [v2] ARM: Delete ARM11MPCore (ARM11 ARMv6K SMP) support
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=807872
  Lore link: https://lore.kernel.org/r/20231207-drop-11mpcore-v2-1-560b396f3bf5@linaro.org

Patch: [GIT,PULL] ARM: mvebu: arm for v6.8 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811884
  Lore link: https://lore.kernel.org/r/87r0jgbyz4.fsf@BL-laptop

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v6.8
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=809651
  Lore link: https://lore.kernel.org/r/20231213115953.3578115-1-sudeep.holla@arm.com

Patch: [GIT,PULL] Improved TEE shared buffer support for v6.8
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810078
  Lore link: https://lore.kernel.org/r/20231214134139.GA3098718@rayden

Patch: ARM: multi_v7_defconfig: enable STM32 DCMIPP media support
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810408
  Lore link: https://lore.kernel.org/r/20231215100656.729094-1-alexandre.torgue@foss.st.com

Patch: [GIT,PULL] hisilicon: driver updates for v6.8
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=808141
  Lore link: https://lore.kernel.org/r/6572C41B.6050703@hisilicon.com

Patch: [GIT,PULL] RISC-V SoC drivers for v6.8
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=812161
  Lore link: https://lore.kernel.org/r/20231221-droop-unblock-81e4fe14acee@spud

Patch: [GIT,PULL] Qualcomm ARM64 updates for v6.8
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811445
  Lore link: https://lore.kernel.org/r/20231219145402.874161-1-andersson@kernel.org


Total patches: 45

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


