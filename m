Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22968C77B7A
	for <soc@archiver.kernel.org>; Fri, 26 May 2023 11:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE82EC4339C; Fri, 26 May 2023 11:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8153C433EF
	for <soc@kernel.org>; Fri, 26 May 2023 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685101827;
	bh=DmrjjjHFogrZCqFWrlWMaR8sJPyZUTtvrUAXJ9m5mDM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=P/d2niT/No1AvM3cdDDQH54Ru1uxGoBP+lNCkRAc4hkJeYDM7Qlxo6m0gm6EG5SwW
	 gLtAoScs1fGVBk1PK9kvNSBt2r26w9JdJO+vclBRc4eMvMUNQKIp6WJ94mbDp6SUSK
	 G2tN51t+2QhaJO69UvXi/5HozVe8sSTWoxZUvXsaFuyyGr3nSr23PXQeoKXj9TMt4r
	 hrxf+Q2OR45/RUxXGcAkrcvkSQo9efH4ASzdsAaGA0kHSYsCBZTTnUqoyv7+1Oe1Hy
	 RW5noGjTc/Qh3fhjRTxxgvSGLGWA+pTlGNcokLOOBZ7tIwBjmnIwcfxrQe0X6SRN1Q
	 vJv1YQhHhhtNA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9B90FC4166F;
	Fri, 26 May 2023 11:50:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168510182754.28560.4086652414684165891.git-patchwork-summary@kernel.org>
Date: Fri, 26 May 2023 11:50:27 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: ARM: SoC: address -Wmissing-prototype warnings
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=748058
  Lore link: https://lore.kernel.org/r/20230516153109.514251-1-arnd@kernel.org
    Patches: [01/13] ARM: davinci: fix davinci_cpufreq_init() declaration
             [02/13] ARM: ep93xx: fix missing-prototype warnings
             [03/13] ARM: highbank: add missing include
             [04/13] ARM: imx: add missing include
             [06/13] ARM: lpc32xx: add missing include
             [07/13] ARM: omap1: add missing include
             [08/13] ARM: omap2: fix missing tick_broadcast() prototype
             [09/13] ARM: orion5x: fix d2net gpio initialization
             [10/13] ARM: pxa: fix missing-prototypes warnings
             [11/13] ARM: sa1100: address missing prototype warnings
             [12/13] ARM: spear: include "pl080.h" for pl080_get_signal() prototype
             [13/13] ARM: versatile: mark mmc_status() static

Series: Renesas SoC updates for v6.5
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=751307
  Lore link: https://lore.kernel.org/r/cover.1685094238.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.5
             [GIT,PULL,2/3] Renesas driver updates for v6.5
             [GIT,PULL,3/3] Renesas DTS updates for v6.5

Patch: arm-cci: add cci_enable_port_for_self prototype
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=748142
  Lore link: https://lore.kernel.org/r/20230516201218.556437-1-arnd@kernel.org

Patch: [GIT,PULL] Reset controller updates for v6.5
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=746759
  Lore link: https://lore.kernel.org/r/20230511133235.874566-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] OMAP GPIO numbers cleanup
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=750664
  Lore link: https://lore.kernel.org/r/CACRpkdbtE9yfx9kZqGwsHim91WsxHERecrGwjnr6TQpCUMsQwg@mail.gmail.com

Series: [GIT,PULL,1/2] arm64: dts: cleanup and fixes for v6.5
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=748446
  Lore link: https://lore.kernel.org/r/20230517131255.471002-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] arm64: dts: cleanup and fixes for v6.5
             [GIT,PULL,2/2] ARM: dts: cleanup for v6.5

Patch: ARM: s3c: remove obsolete config S3C64XX_SETUP_IDE
  Submitter: Lukas Bulwahn <lukas.bulwahn@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=745675
  Lore link: https://lore.kernel.org/r/20230508040433.13648-1-lukas.bulwahn@gmail.com


Total patches: 21

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


