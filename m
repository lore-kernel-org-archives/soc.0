Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FDDC433FE
	for <soc@archiver.kernel.org>; Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AE05BC43143; Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97FF7C433D6
	for <soc@kernel.org>; Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668439820;
	bh=vWorA9u5QX+Qrtrm0fN+l5jU+IIQyQsZyfoIOkDIv/E=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=uhdnXv2bBqhXX/vpTQoghsvvZv1Le7ZpwoxPb5LMulrEBtVGJhXO1QOmt3IkgOYc/
	 xbWssXFVq8AQnMZkMtO2IvOEaH74ZlcpzxEs2YkrxQx/TPaSH/EWwSDB7q1YgoohHy
	 7qzz9nznNTxwxTsNFw7sGh3HJqKcq6marqQ8mrxw8YeS63FNIh37NwbL7Xm2PJpD7a
	 tY1ItsBM/mjaBQ3/B8xTu2S5RDDIB1DXilRu63WMj1CaudWk31EQopPOeLJx7UNF88
	 rxpEXbs18sY1A84e8R5fcM918aNMyO2FsGKlu7FLFCdcSyj3ULJeiJUp5nCncOMHMA
	 i9T95/4f2Q90A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6F01AC395FE;
	Mon, 14 Nov 2022 15:30:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166843982033.12382.12107804894144517916.git-patchwork-summary@kernel.org>
Date: Mon, 14 Nov 2022 15:30:20 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/4] Renesas ARM DT updates for v6.2
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=692045
  Lore link: https://lore.kernel.org/r/cover.1667558740.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM DT updates for v6.2
             [GIT,PULL,2/4] Renesas ARM SoC updates for v6.2
             [GIT,PULL,3/4] Renesas driver updates for v6.2
             [GIT,PULL,4/4] Renesas DT binding updates for v6.2

Patch: [GIT,PULL] AT91 device tree updates for 6.2
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=694040
  Lore link: https://lore.kernel.org/r/20221110115431.180908-1-claudiu.beznea@microchip.com

Patch: [GIT,PULL] ARM: dts: Cleanups for v6.2
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=693975
  Lore link: https://lore.kernel.org/r/20221110092111.18581-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] AT91 defconfig updates for 6.2
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=694039
  Lore link: https://lore.kernel.org/r/20221110115422.180893-1-claudiu.beznea@microchip.com

Series: Support new features to the SPEAr600
  Submitter: Köry Maincent <kory.maincent@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=691318
  Lore link: https://lore.kernel.org/r/20221102171012.49150-1-kory.maincent@bootlin.com
    Patches: [v2,1/6] arm: configs: spear6xx: Refresh defconfig
             [v2,2/6] arm: dts: spear600: Fix clcd interrupt
             [v2,3/6] arm: configs: spear6xx: Enable PL110 display controller
             [v2,5/6] arm: dts: spear600: Add ssp controller nodes

Series: [v7,1/2] soc: loongson: add GUTS driver for loongson-2 platforms
  Submitter: Yinbo Zhu <zhuyinbo@loongson.cn>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=694341
  Lore link: https://lore.kernel.org/r/20221111054201.18528-1-zhuyinbo@loongson.cn
    Patches: [v7,1/2] soc: loongson: add GUTS driver for loongson-2 platforms
             [v7,2/2] dt-bindings: soc: add loongson-2 chipid

Patch: [GIT,PULL] Ux500 core changes for v6.2
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=693391
  Lore link: https://lore.kernel.org/r/CACRpkdaPDbJKUzZHsS2POVUQEjYi+6bjU6cvbg4ox=SKPXG2ng@mail.gmail.com


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


