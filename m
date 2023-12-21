Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E685C35274
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0AA63C433CB; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8E7BC433C8
	for <soc@kernel.org>; Thu, 21 Dec 2023 17:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180465;
	bh=t7OusWAKng9GaHFZbPMpq5gwE5PlaPnQllP3SmlzYn8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=aomuDIqxDLZcFhG3pqGL8G8kUcy97hFYj35PEW+z72hFKGnogxMP6AnrrrHMobY8H
	 i1GqnEjhyE+lZxctMrg4nUEgna/NISdmHUk1pfTdx/6pOXYAXB+sJ5/tPfFimKRXaB
	 ta/EnK1FNPlRGMuuRuPh0nkdZ9rg8kefX38ab8fx0THtlftjwhpJWUcAwQJhj5Jwpj
	 z2TSbV08AZ1YQyZFFg6WK8wm3xRwDJfFbf3CK7lBb738DJuzKQaqEDlPXoafKN3PSz
	 O7bBnLOPA/hYWRx2WEWQ9larEpz9DdloDFQqq1zbcSzLUOkkmxOZZeOKrfufeLriqO
	 jJA4n6o3jX5Bg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D6152D8C98B;
	Thu, 21 Dec 2023 17:41:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046586.3302.1095529266939460665.git-patchwork-summary@kernel.org>
Date: Thu, 21 Dec 2023 17:41:05 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/2] samsung: drivers for v6.8
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811717
  Lore link: https://lore.kernel.org/r/20231220084722.22149-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] samsung: drivers for v6.8
             [GIT,PULL,2/2] arm64: dts: samsung: DTS for v6.8, part two

Series: [GIT,PULL,1/3] drivers/firmware updates for v6.8 for TI K3 platforms
  Submitter: Nishanth Menon <nm@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811093
  Lore link: https://lore.kernel.org/r/20231218153043.r5psxbjjpccusjg4@september
    Patches: [GIT,PULL,1/3] drivers/firmware updates for v6.8 for TI K3 platforms
             [GIT,PULL,3/3] arm64: dts: ti: Updates for v6.8 for TI K3 platforms

Patch: [GIT,PULL] Rockchip dts32 changes for 6.8 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=809416
  Lore link: https://lore.kernel.org/r/3197878.5fSG56mABF@phil

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.8
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=812115
  Lore link: https://lore.kernel.org/r/e38724be-c9f0-4916-bfd0-d20b316db2da@linaro.org

Patch: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.8
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=808143
  Lore link: https://lore.kernel.org/r/6572C4C8.6050401@hisilicon.com

Series: [GIT,PULL,1/5] i.MX drivers change for 6.8
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810687
  Lore link: https://lore.kernel.org/r/20231216064605.876196-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/5] i.MX drivers change for 6.8
             [GIT,PULL,3/5] i.MX DT bindings for 6.8
             [GIT,PULL,4/5] i.MX ARM device tree for 6.8
             [GIT,PULL,5/5] i.MX arm64 device tree for 6.8

Patch: [GIT,PULL,RESEND] arm64: dts: ZynqMP DT changes for v6.8
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810934
  Lore link: https://lore.kernel.org/r/CAHTX3dLyA1Y9guLKSNJTChFVvkspMfTa0odULyAdcuFUSiSH3A@mail.gmail.com

Patch: [GIT,PULL] Rockchip dts64 changes for 6.8 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=809415
  Lore link: https://lore.kernel.org/r/3535836.iIbC2pHGDl@phil

Patch: [GIT,PULL] Allwinner device tree changes for 6.8
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810200
  Lore link: https://lore.kernel.org/r/ZXtWFk-Bne835txP@archlinux

Series: [GIT,PULL,1/2] arm64: dts: samsung: Exynops and Google for v6.8
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=809133
  Lore link: https://lore.kernel.org/r/20231212093105.13938-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] arm64: dts: samsung: Exynops and Google for v6.8
             [GIT,PULL,2/2] ARM: dts: samsung: Samsung for v6.8

Patch: [GIT,PULL] Fixes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=808237
  Lore link: https://lore.kernel.org/r/pull-1702037799-781982@atomide.com

Series: Add minimal Tensor/GS101 SoC support and Oriole/Pixel6 board
  Submitter: Peter Griffin <peter.griffin@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=808854
  Lore link: https://lore.kernel.org/r/20231211162331.435900-1-peter.griffin@linaro.org
    Patches: [v7,01/16] dt-bindings: watchdog: Document Google gs101 watchdog bindings
             [v7,02/16] dt-bindings: arm: google: Add bindings for Google ARM platforms
             [v7,14/16] arm64: dts: exynos: google: Add initial Google gs101 SoC support
             [v7,15/16] arm64: dts: exynos: google: Add initial Oriole/pixel 6 board support
             [v7,16/16] MAINTAINERS: add entry for Google Tensor SoC

Patch: [GIT,PULL] Microchip AT91 DT updates for v6.8
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810178
  Lore link: https://lore.kernel.org/r/20231214174954.3045355-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] arm64: dts: juno: Updates for v6.8
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=809650
  Lore link: https://lore.kernel.org/r/20231213115826.3577764-1-sudeep.holla@arm.com

Patch: [GIT,PULL] STM32 DT changes for v6.8 #1
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810407
  Lore link: https://lore.kernel.org/r/9363227b-1c44-4a20-b245-efbbbf9ab1dd@foss.st.com

Patch: ARM: dts: ste: minor whitespace cleanup around '='
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=808970
  Lore link: https://lore.kernel.org/r/20231212-ux500-dts-v1-1-5a31b6742d85@linaro.org

Patch: [GIT,PULL] RISC-V Devicetrees for v6.8
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=812187
  Lore link: https://lore.kernel.org/r/20231221-skimmed-boxy-b78aed8afdc4@spud

Series: [GIT,PULL,1/3] Devicetree changes for omaps for v6.8
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=808238
  Lore link: https://lore.kernel.org/r/pull-1702037869-295608@atomide.com
    Patches: [GIT,PULL,1/3] Devicetree changes for omaps for v6.8

Series: [GIT,PULL,1/2] Renesas driver updates for v6.8
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810499
  Lore link: https://lore.kernel.org/r/cover.1702642340.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/2] Renesas driver updates for v6.8
             [GIT,PULL,2/2] Renesas DTS updates for v6.8 (take two)

Patch: [GIT,PULL] ARM: mvebu: dt for v6.8 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811885
  Lore link: https://lore.kernel.org/r/87o7ekbyv2.fsf@BL-laptop

Patch: [GIT,PULL] Ux500 HREF520 DTS regression fix
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=810570
  Lore link: https://lore.kernel.org/r/CACRpkdZ9wCV7oohF2KX6MFwmuSPR_i7et8O5SH=op6gyQ4mOvQ@mail.gmail.com

Series: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v6.8
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=809194
  Lore link: https://lore.kernel.org/r/20231212114515.121695-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/3] MediaTek ARM64 Device Tree updates for v6.8

Patch: [GIT,PULL] Fix for am335x usb boot hang
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811786
  Lore link: https://lore.kernel.org/r/pull-1703071616-395333@atomide.com

Patch: [GIT,PULL] ARM: dts: ti: keystone: Updates for v6.8
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811094
  Lore link: https://lore.kernel.org/r/20231218153039.dok52xazqshbr6ie@playroom

Patch: [GIT,PULL] ARM: mvebu: dt64 for v6.8 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811889
  Lore link: https://lore.kernel.org/r/87le9obypx.fsf@BL-laptop

Patch: [GIT,PULL] Qualcomm ARM32 DeviceTree updates for v6.8
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=811268
  Lore link: https://lore.kernel.org/r/20231219042914.732684-1-andersson@kernel.org

Series: PolarFire SoC Auto Update Support
  Submitter: Conor Dooley <conor@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=795117
  Lore link: https://lore.kernel.org/r/20231020-agreeably-filing-3d48708e6262@spud
    Patches: [v3,1/6] dt-bindings: soc: microchip: add a property for system controller flash
             [v3,6/6] riscv: dts: microchip: add the mpfs' system controller qspi & associated flash


Total patches: 39

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


