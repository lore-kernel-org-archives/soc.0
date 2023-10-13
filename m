Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B804CDB47E
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 112FBC433CC; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFB5CC433C7
	for <soc@kernel.org>; Fri, 13 Oct 2023 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697230838;
	bh=RI4XD1DCNnmiAwr2K1/KqAqRj9fKk14RXI15FJGV+94=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=vDbQhRDOgZrx6plpz7NqM4D9lNxtaz5UKJNobps8ocATDY3D/BFYM58dj/xtEvt9O
	 z1Z4HZbgxLLHhcTolwMGgB+OSztYOs8fHMghdSPryjx4oRKFTvFthQzP/Ezmxukdpo
	 erM8bhZcT4dytAIU50lBChFXYDXB716lZTwWjnUCvlb44pKNMwNgcxVA9i/p9D0SWR
	 3anQdk4vLbSMWjO8TlRszDbZlW673z6eTfP7A7VcIYtOfFax6DQ6fpEYAsdpBKdRMU
	 JtFk5qBhIWhIzfphkAe+NSKAu0NETMhdHoy23K2U/KZoRFLRtKyL92cm82Pg94jrI8
	 LqpVA+Dj5vZjw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CFA45C73FEA;
	Fri, 13 Oct 2023 21:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169723083784.14185.8756965350890756771.git-patchwork-summary@kernel.org>
Date: Fri, 13 Oct 2023 21:00:37 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/2] arm64: dts: minor cleanup for v6.7
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=790541
  Lore link: https://lore.kernel.org/r/20231006092823.94839-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] arm64: dts: minor cleanup for v6.7
             [GIT,PULL,2/2] ARM: dts: minor cleanup for v6.7

Series: [GIT,PULL,1/2] arm64: dts: samsung: DTS for v6.7
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=790548
  Lore link: https://lore.kernel.org/r/20231006093943.106002-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] arm64: dts: samsung: DTS for v6.7
             [GIT,PULL,2/2] ARM: dts: samsung: DTS for v6.7

Patch: [GIT,PULL] Microchip AT91 DT updates for v6.7
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=791641
  Lore link: https://lore.kernel.org/r/20231010045955.1259843-1-claudiu.beznea@tuxon.dev

Series: [GIT,PULL,1/6] soc/tegra: Changes for v6.7-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793062
  Lore link: https://lore.kernel.org/r/20231013153723.1729109-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/6] soc/tegra: Changes for v6.7-rc1
             [GIT,PULL,3/6] dt-bindings: Changes for v6.7-rc1
             [GIT,PULL,5/6] ARM: tegra: Device tree changes for v6.7-rc1
             [GIT,PULL,6/6] arm64: tegra: Device tree changes for v6.7-rc1

Series: Renesas SoC updates for v6.7
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=788761
  Lore link: https://lore.kernel.org/r/cover.1695985418.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/5] Renesas ARM defconfig updates for v6.7
             [GIT,PULL,4/5] Renesas DT binding updates for v6.7
             [GIT,PULL,5/5] Renesas DTS updates for v6.7

Patch: [GIT,PULL] Devicetree changes for omaps for v6.7
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=792078
  Lore link: https://lore.kernel.org/r/pull-1697010475-119828@atomide.com

Series: Renesas SoC updates for v6.7 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793000
  Lore link: https://lore.kernel.org/r/cover.1697200117.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.7 (take two)
             [GIT,PULL,2/3] Renesas DT binding updates for v6.7 (take two)
             [GIT,PULL,3/3] Renesas DTS updates for v6.7 (take two)

Patch: [GIT,PULL] STi DT changes for v6.7 #1
  Submitter: Patrice CHOTARD <patrice.chotard@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=792895
  Lore link: https://lore.kernel.org/r/e6b975f2-9936-465a-8253-6fcead974006@foss.st.com

Patch: [GIT,PULL] IXP4xx DTS updates
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=791533
  Lore link: https://lore.kernel.org/r/CACRpkdZZ6W8uic97S9=Aa+S+s0-0k50TDw1e00u6gFcQfAVDdw@mail.gmail.com

Patch: [GIT,PULL] Allwinner device tree changes for 6.7
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793125
  Lore link: https://lore.kernel.org/r/20231013194203.GA2155816@jernej-laptop

Patch: [GIT,PULL] Ux500 DT updates for v6.7
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=787194
  Lore link: https://lore.kernel.org/r/CACRpkdZc5Yzsos2+gRPtCT-+ohmaV69ew5YFJLakD+9VFkrkfQ@mail.gmail.com


Total patches: 20

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


