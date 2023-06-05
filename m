Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4C5C7EE24
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AAB20C433A1; Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91DD9C4339C
	for <soc@kernel.org>; Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685980254;
	bh=UXCtnOJPyrC2NlwotqxQ0AzOsgoADGXLnDagHc1Mp4A=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=DKdSujFOcyzsqULUrZ3M2CKbYchQp0GR1Jb0L8TEdzHc6lo4K+y0YCq7IWuvu+Ghr
	 0l8RjxyvwJ0OqREHJ47Jz2FTYxrR0u61LaYF7VDhnFpAQOqHztz/r/W/Lz//6sYdS7
	 +k55RFoiYPVoaOueb5VGeaxd2TJyXgfkUsEFLFL4xGS6hfX2cd8vi6cCUlqnRwFWOQ
	 SorRF2R8iOatMGeS8b/f5//kI4lMgCiX1sb0NG1O0ghrpDwylpc0FBlj/uTlC9/VXA
	 hX8STMLbxOIo9C7+xQf8uMoYFz327/1gkm3Qx5znkhtXt0re1GXm/F5BU4Yh92GEQN
	 5lzuhWRvqzcTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 72188E87231;
	Mon,  5 Jun 2023 15:50:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168598025446.10098.14404862964051699641.git-patchwork-summary@kernel.org>
Date: Mon, 05 Jun 2023 15:50:54 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Introduce Nuvoton ma35d1 SoC
  Submitter: Jacky Huang <ychuang570808@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=753907
  Lore link: https://lore.kernel.org/r/20230605040749.67964-1-ychuang570808@gmail.com
    Patches: [v13,01/10] arm64: Kconfig.platforms: Add config for Nuvoton MA35 platform
             [v13,02/10] arm64: defconfig: Add support for Nuvoton MA35 family SoCs
             [v13,03/10] dt-bindings: clock: nuvoton: add binding for ma35d1 clock controller
             [v13,04/10] dt-bindings: reset: nuvoton: Document ma35d1 reset control
             [v13,05/10] dt-bindings: arm: Add initial bindings for Nuvoton platform
             [v13,06/10] dt-bindings: serial: Document ma35d1 uart controller
             [v13,07/10] arm64: dts: nuvoton: Add initial ma35d1 device tree
             [v13,08/10] clk: nuvoton: Add clock driver for ma35d1 clock controller
             [v13,09/10] reset: Add Nuvoton ma35d1 reset driver support

Patch: [GIT,PULL] AT91 fixes for 6.4
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=752157
  Lore link: https://lore.kernel.org/r/20230530105930.11621-1-claudiu.beznea@microchip.com

Patch: [GIT,PULL] Qualcomm driver fixes for 6.4
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=753130
  Lore link: https://lore.kernel.org/r/20230601141058.2246039-1-andersson@kernel.org

Patch: [RESEND,GIT,PULL] Qualcomm ARM64 DeviceTree fixes for 6.4
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=753139
  Lore link: https://lore.kernel.org/r/20230601142659.2246348-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm ARM32 fix for 6.4
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=753124
  Lore link: https://lore.kernel.org/r/20230601140347.2245680-1-andersson@kernel.org


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


