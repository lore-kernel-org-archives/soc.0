Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE01C43334
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11FA5C341CD; Fri,  1 Jul 2022 20:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA198C3411E
	for <soc@kernel.org>; Fri,  1 Jul 2022 20:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708096;
	bh=pr7c03ruIQLH6s9YQFKCUtdRkMYmUf0YTEubmAhvUoU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Wjtsd3ndJCESX5sZYxcisTONxrsx2J+SjfHcKXJbPhgPHfIz84cUntUurDnLnQQzP
	 SPDV/gSIMYSW/Dh6bMUYMmy/ZZ0SVfeZaM7DGI9KjTLjHzSZwNw+H8/i5e18gOQxXe
	 pHKcyqRgVDlNvCRDMSOBmRV5Fk7ni5JMFPRcRNxreFrmin/ZHmZbIzvmB3NaOiGSq5
	 kH+lEEmxnlGM3bE2bLBrGVmv1tiTVq0vWytyY2200wm3xBv8Yl8ORNAtL4mrtw0/wn
	 kdbYm/AkGjU9GEOWekgOuOv6BAzWZaR0TQYhbyGkH/LNHOMrgqbDSsNcLt4KkMh9ly
	 lPu+mOXDLk9sA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C8D73E49BB8;
	Fri,  1 Jul 2022 20:41:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670809680.26141.5294083903131305575.git-patchwork-summary@kernel.org>
Date: Fri, 01 Jul 2022 20:41:36 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [1/2] arm64: dts: amlogic: adjust whitespace around '='
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Neil Armstrong <narmstrong@baylibre.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645387
  Lore link: https://lore.kernel.org/r/20220526204552.832961-1-krzysztof.kozlowski@linaro.org
    Patches: [1/2] arm64: dts: amlogic: adjust whitespace around '='
             [2/2] ARM: dts: meson: adjust whitespace around '='

Series: dt-bindings: input: gpio-keys: rework matching children
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=650801
  Lore link: https://lore.kernel.org/r/20220616005224.18391-1-krzysztof.kozlowski@linaro.org
    Patches: [v3,01/40] dt-bindings: input: gpio-keys: enforce node names to match all properties
             [v3,05/40] arm64: dts: apm: correct gpio-keys properties
             [v3,06/40] arm64: dts: broadcom: align gpio-key node names with dtschema
             [v3,09/40] arm64: dts: hisilicon: align gpio-key node names with dtschema
             [v3,10/40] arm64: dts: hisilicon: correct gpio-keys properties
             [v3,34/40] ARM: dts: animeo: align gpio-key node names with dtschema
             [v3,35/40] ARM: dts: animeo: correct gpio-keys properties

Series: [1/5] arm64: dts: altera: adjust whitespace around '='
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Dinh Nguyen <dinguyen@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645388
  Lore link: https://lore.kernel.org/r/20220526204606.833054-1-krzysztof.kozlowski@linaro.org
    Patches: [1/5] arm64: dts: altera: adjust whitespace around '='
             [2/5] arm64: dts: amd: adjust whitespace around '='
             [3/5] arm64: dts: apm: adjust whitespace around '='
             [5/5] arm64: dts: lg: adjust whitespace around '='

Series: Add Chameleon v3 devicetree
  Submitter: Paweł Anikiel <pan@semihalf.com>
  Committer: Dinh Nguyen <dinguyen@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=646609
  Lore link: https://lore.kernel.org/r/20220601154647.80071-1-pan@semihalf.com
    Patches: [v2,1/5] ARM: dts: socfpga: Change Mercury+ AA1 dts to dtsi
             [v2,2/5] ARM: dts: socfpga: Move sdmmc-ecc node to Arria 10 dts
             [v2,4/5] ARM: dts: socfpga: Add Google Chameleon v3 devicetree

Patch: [GIT,PULL] arm64: dts: socfpga: dts updates for v5.20
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=653865
  Lore link: https://lore.kernel.org/r/20220626004437.1224820-1-dinguyen@kernel.org

Patch: ARM: dts: spear: adjust whitespace around '='
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645360
  Lore link: https://lore.kernel.org/r/20220526203815.831383-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] i.MX fixes for 5.19, round 2
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=654825
  Lore link: https://lore.kernel.org/r/20220629021244.GL819983@dragon

Patch: arm64: dts: renesas: adjust whitespace around '='
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645368
  Lore link: https://lore.kernel.org/r/20220526204231.832090-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v5.19(Round 2)
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=654620
  Lore link: https://lore.kernel.org/r/20220628133315.699803-1-sudeep.holla@arm.com

Series: [1/2] arm64: dts: microchip: adjust whitespace around '='
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645363
  Lore link: https://lore.kernel.org/r/20220526204110.831805-1-krzysztof.kozlowski@linaro.org
    Patches: [1/2] arm64: dts: microchip: adjust whitespace around '='
             [2/2] ARM: dts: at91: adjust whitespace around '='

Patch: ARM: dts: axm: adjust whitespace around '='
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645362
  Lore link: https://lore.kernel.org/r/20220526204100.831742-1-krzysztof.kozlowski@linaro.org

Series: [1/2] arm64: dts: marvell: adjust whitespace around '='
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645386
  Lore link: https://lore.kernel.org/r/20220526204525.832847-1-krzysztof.kozlowski@linaro.org
    Patches: [1/2] arm64: dts: marvell: adjust whitespace around '='
             [2/2] ARM: dts: pxa: adjust whitespace around '='

Series: Renesas SoC updates for v5.20
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=653571
  Lore link: https://lore.kernel.org/r/cover.1656069631.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v5.20
             [GIT,PULL,2/4] Renesas ARM DT updates for v5.20
             [GIT,PULL,3/4] Renesas driver updates for v5.20
             [GIT,PULL,4/4] Renesas DT binding updates for v5.20

Patch: ARM: dts: aspeed: adjust whitespace around '='
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645364
  Lore link: https://lore.kernel.org/r/20220526204127.831853-1-krzysztof.kozlowski@linaro.org

Patch: arm64: dts: hisilicon: adjust whitespace around '='
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645385
  Lore link: https://lore.kernel.org/r/20220526204453.832681-1-krzysztof.kozlowski@linaro.org

Patch: arm64: dts: sprd: adjust whitespace around '='
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645366
  Lore link: https://lore.kernel.org/r/20220526204152.831948-1-krzysztof.kozlowski@linaro.org


Total patches: 33

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


