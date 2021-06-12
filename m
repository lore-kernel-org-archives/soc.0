Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2E4C48BCF
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 299A7613AD; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 13E30611CD
	for <soc@kernel.org>; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=oR8ttAyLZRZ/fv39cX8rRmu5iWQPrbLcZvBOR9PeHBM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=TBKCYzLYprnHA3XeNkXFv50UhcMkF0CVJolEha382YWCbQn7er468DtS7/skFCFHl
	 bKylXRPcKDB5FVFhiifRsLuIzOpMifJl7PZOWC7YLuNPyWJBN88xxSlNye3+gNuY9q
	 rnYw/P1hrTxoY6nQi8j2L3HzDCXVOrezD7h5sygapqjmvo6K8721SLdBWYWqk++Xw9
	 T0zJo+pAIp6v4zMe+rJlgnASUvFPAgGaknAl6zLV0r2AbqBuvXeOO3fPJdgzrBDLgR
	 /nvYzQDOpQh4a2aFLFUJUPMWRmsZfBtJvUKxUIUswSmdDAOZTGtrIR1dJ/q1Dg9hQl
	 4L4ef0EFkFvqw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0E7E860972;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421605.27448.17689065160538663813.git-patchwork-summary@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] Allwinner Platform Changes for 5.14
  Submitter: Maxime Ripard <mripard@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=498977
  Lore link: https://lore.kernel.org/r/bf3431f6-2196-425c-9b43-0bf4de0b6d30.lettre@localhost
Patch: [GIT,PULL] ixp4xx DTS changes for v5.14 take 1
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=491725
  Lore link: https://lore.kernel.org/r/CACRpkdbmRjGW7vpr7hG+jiRTqNMZAyKZNhtvzj=SqhZmb1+F6A@mail.gmail.com
Series: [GIT,PULL,1/2] memory: drivers for v5.14
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=498939
  Lore link: https://lore.kernel.org/r/20210611140659.61980-1-krzysztof.kozlowski@canonical.com
    Patches: [GIT,PULL,1/2] memory: drivers for v5.14
             [GIT,PULL,2/2] memory: pl353-smc for v5.14
Patch: [GIT,PULL] Rockchip dts fixes for 5.13
  Submitter: Heiko Stübner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=499185
  Lore link: https://lore.kernel.org/r/3405741.0S5aU1g85B@diego
Patch: [GIT,PULL] arm64: dts: juno: fixes for v5.14
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=498655
  Lore link: https://lore.kernel.org/r/20210611075805.2813712-1-sudeep.holla@arm.com
Series: Renesas ARM SoC updates for v5.14 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=498719
  Lore link: https://lore.kernel.org/r/cover.1623403793.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v5.14 (take two)
             [GIT,PULL,2/4] Renesas ARM DT updates for v5.14 (take two)
             [GIT,PULL,3/4] Renesas driver updates for v5.14
             [GIT,PULL,4/4] Renesas DT binding updates for v5.14
Series: [GIT,PULL,1/3] Cleanup for omaps for v5.14
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=492309
  Lore link: https://lore.kernel.org/r/pull-1622618286-677305@atomide.com
    Patches: [GIT,PULL,1/3] Cleanup for omaps for v5.14
             [GIT,PULL,2/3] Defconfig changes for omaps for v5.14
             [GIT,PULL,3/3] Devicetree changes for omaps for v5.14
Series: [GIT,PULL,1/2] ARM: dts: samsung: pull for v5.14
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=497811
  Lore link: https://lore.kernel.org/r/20210610074055.12474-1-krzysztof.kozlowski@canonical.com
    Patches: [GIT,PULL,1/2] ARM: dts: samsung: pull for v5.14
             [GIT,PULL,2/2] ARM: samsung: mach/soc for v5.14
Patch: [GIT,PULL] ARM: at91: defconfig for 5.14
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=498883
  Lore link: https://lore.kernel.org/r/20210611125659.25590-1-nicolas.ferre@microchip.com
Patch: [GIT,PULL] arm64: mediatek: DTS updates for v5.14
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=498781
  Lore link: https://lore.kernel.org/r/117d5eb5-bc99-70bb-a1a9-d7141fe96527@gmail.com
Patch: ARM: config: aspeed: Add DEBUG_FS and EXT4
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=497727
  Lore link: https://lore.kernel.org/r/20210610045338.99847-1-joel@jms.id.au
Patch: [GIT,PULL] arm64: defconfig: mediatek updates for v5.14
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=498783
  Lore link: https://lore.kernel.org/r/ad6f7f4e-7e4d-08b9-8781-71bd78444929@gmail.com
Series: Renesas ARM SoC updates for v5.14
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=490147
  Lore link: https://lore.kernel.org/r/cover.1622188833.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/2] Renesas ARM defconfig updates for v5.14
             [GIT,PULL,2/2] Renesas ARM DT updates for v5.14
Patch: [GIT,PULL] STM32 DT changes for v5.14 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=498231
  Lore link: https://lore.kernel.org/r/e4bfb255-63fb-74a8-d591-eb09821c93ee@foss.st.com
Patch: ARM: dts: ixp4xx: Add crypto engine
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=494759
  Lore link: https://lore.kernel.org/r/20210605161007.3397216-1-linus.walleij@linaro.org
Patch: [GIT,PULL] soc: mediatek: updates for v5.14
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=498779
  Lore link: https://lore.kernel.org/r/479ec9ad-95d3-ce91-8243-63596c4c6676@gmail.com
Patch: [GIT,PULL] arm64: dts: amlogic updates for v5.14
  Submitter: Neil Armstrong <narmstrong@baylibre.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=492359
  Lore link: https://lore.kernel.org/r/bb207cf8-fc7a-3121-eea8-56618b5952aa@baylibre.com
Patch: [GIT,PULL] firmware: arm_scmi: updates for v5.14
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=498653
  Lore link: https://lore.kernel.org/r/20210611075722.2813550-1-sudeep.holla@arm.com
Patch: [GIT,PULL] ARM: at91: dt for 5.14
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=498863
  Lore link: https://lore.kernel.org/r/20210611123446.20510-1-nicolas.ferre@microchip.com
Patch: [GIT,PULL] Ux500 DTS changes for v5.14
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=498425
  Lore link: https://lore.kernel.org/r/CACRpkdYh9kZJU6PAxghPRGBco_61wRZgUnTZr_3qvySPCo5rBw@mail.gmail.com
Patch: [GIT,PULL] soc: amlogic: driver updates for v5.14
  Submitter: Neil Armstrong <narmstrong@baylibre.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=492357
  Lore link: https://lore.kernel.org/r/58283600-2d9a-c259-4d80-6915e6e6c79e@baylibre.com
Patch: [GIT,PULL] ARM: aspeed: devicetree changes for 5.14
  Submitter: Joel Stanley <joel@jms.id.au>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=495785
  Lore link: https://lore.kernel.org/r/CACPK8XduV9F=piu1qh56g+YNOZOBYTW7b2Y=XVYafpYDwWmDYA@mail.gmail.com
Patch: [GIT,PULL] Reset controller updates for v5.14
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=481229
  Lore link: https://lore.kernel.org/r/418cf3a460cfe1d0f91f87e10baaf478bd41f1d5.camel@pengutronix.de
Patch: [GIT,PULL] Allwinner Fixes for 5.13
  Submitter: Maxime Ripard <mripard@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=498971
  Lore link: https://lore.kernel.org/r/ad7ba352-315c-4201-b922-4bf914a00d98.lettre@localhost
Patch: [GIT,PULL] Gemini DTS updates for v5.14
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=491613
  Lore link: https://lore.kernel.org/r/CACRpkdZWpLAcAStq8dEyGL_d9Bvp-WNPu-2EuJw1eTL4kyvgig@mail.gmail.com
Patch: ARM: dts: gemini: add crypto node
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=499183
  Lore link: https://lore.kernel.org/r/20210611220501.684997-1-linus.walleij@linaro.org
Patch: [GIT,PULL] Allwinner Device Tree Changes for 5.14
  Submitter: Maxime Ripard <mripard@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=498979
  Lore link: https://lore.kernel.org/r/96cc77ec-139d-4685-8a66-a60964cf39fd.lettre@localhost

Total patches: 35

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


