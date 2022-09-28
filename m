Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E45BC32771
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A615C43140; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33D41C433B5
	for <soc@kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398829;
	bh=YKpiIXTPZnD5FJKFV906EhkkCGz8WqFOlKm87F1Wnf0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=tNHzLTPpgXhWKbSOZfTNdXU6yZOxZYqPKlJ22a3FpD9FdEoO2GZ6CF3GMHJesYDHZ
	 iG2mAmQrmZfc5yB92LAZBpLjXTJW7QQLf0N0/dQd8+QNhDhl8UqQrl/NBE8MBVxiUm
	 kUfVi4uo3Azx470X8qbttaloKzwwEwujD1++KX6mghlRx8E1t44Fa2+wjzwCma5wii
	 4aU6UXQk+Flehb1tSmVPKm4NP7NQS4Jhf2yFJvQc+cMWY1sRzBq+9sgYxNWB6HLk63
	 WOjjeAFA3cuXW9hqzvoFAMS/VYfzNuDJcGHq91C5mvfGto9o/vBW2LOmTB4glwkUY1
	 ThZi8kBIB7oVA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 018D3C395DA;
	Wed, 28 Sep 2022 21:00:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166439882892.18494.5537754798939492194.git-patchwork-summary@kernel.org>
Date: Wed, 28 Sep 2022 21:00:28 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: aspeed: devicetree changes for 6.1
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=681299
  Lore link: https://lore.kernel.org/r/CACPK8Xepnci+f+7Pi1jtXod8Jmt+OnJYfDRENjiP-xDBQwFCVg@mail.gmail.com

Series: Update UniPhier armv7 devicetree
  Submitter: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=676415
  Lore link: https://lore.kernel.org/r/20220913042249.4708-1-hayashi.kunihiko@socionext.com
    Patches: [v3,1/9] ARM: dts: uniphier: Rename pvtctl node to thermal-sensor
             [v3,2/9] ARM: dts: uniphier: Rename usb-phy node for USB2 to usb-controller
             [v3,3/9] ARM: dts: uniphier: Rename usb-glue node for USB3 to usb-controller
             [v3,4/9] ARM: dts: uniphier: Rename gpio-hog node
             [v3,5/9] ARM: dts: uniphier: Use GIC interrupt definitions
             [v3,6/9] ARM: dts: uniphier: Add ahci controller nodes for Pro4
             [v3,7/9] ARM: dts: uniphier: Add ahci controller nodes for PXs2
             [v3,8/9] ARM: dts: uniphier: Move interrupt-parent property to each child node in uniphier-support-card
             [v3,9/9] ARM: dts: uniphier: Remove compatible "snps,dw-pcie-ep" from pcie-ep node

Series: Update UniPhier armv8 devicetree
  Submitter: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=676416
  Lore link: https://lore.kernel.org/r/20220913042321.4817-1-hayashi.kunihiko@socionext.com
    Patches: [v3,01/10] arm64: dts: uniphier: Rename pvtctl node to thermal-sensor
             [v3,02/10] arm64: dts: uniphier: Rename usb-phy node for USB2 to usb-controller
             [v3,03/10] arm64: dts: uniphier: Rename usb-glue node for USB3 to usb-controller
             [v3,04/10] arm64: dts: uniphier: Rename gpio-hog nodes
             [v3,05/10] arm64: dts: uniphier: Use GIC interrupt definitions
             [v3,06/10] arm64: dts: uniphier: Add ahci controller nodes for PXs3
             [v3,07/10] arm64: dts: uniphier: Add USB-device support for PXs3 reference board
             [v3,08/10] arm64: dts: uniphier: Fix opp-table node name for LD20
             [v3,09/10] arm64: dts: uniphier: Remove compatible "snps,dw-pcie" from pcie node
             [v3,10/10] arm64: dts: uniphier: Add L2 cache node

Patch: ARM: aspeed: Kconfig: Fix indentation
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=681276
  Lore link: https://lore.kernel.org/r/20220928025926.2592030-1-joel@jms.id.au

Patch: [RESEND,v2] firmware/psci: Add debugfs support to ease debugging
  Submitter: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=680448
  Lore link: https://lore.kernel.org/r/20220926110758.666922-1-dmitry.baryshkov@linaro.org

Patch: [GIT,PULL] Rockchip dts64 changes for 6.1 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=680181
  Lore link: https://lore.kernel.org/r/38114097.10thIPus4b@phil

Patch: [RESEND,v2] firmware/psci: Print a warning if PSCI doesn't accept PC mode
  Submitter: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=680446
  Lore link: https://lore.kernel.org/r/20220926110249.666813-1-dmitry.baryshkov@linaro.org

Series: Two patches for next cycle, v6.1
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=680436
  Lore link: https://lore.kernel.org/r/20220926104354.118578-1-krzysztof.kozlowski@linaro.org
    Patches: [PULL,1/2] ARM: dts: exynos: correct s5k6a3 reset polarity on Midas family
             [PULL,2/2] ARM: s3c: remove orphan declarations from arch/arm/mach-s3c/devs.h

Patch: [GIT,PULL] Rockchip driver changes for 6.1 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=680182
  Lore link: https://lore.kernel.org/r/3790767.LM0AJKV5NW@phil

Patch: ARM: Drop CMDLINE_FORCE dependency on !ARCH_MULTIPLATFORM
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=681018
  Lore link: https://lore.kernel.org/r/c557b149780faa2299700585afc9d270ede7f78b.1664285062.git.geert+renesas@glider.be

Patch: [GIT,PULL] ARM: aspeed: defconfig changes for 6.1
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=681298
  Lore link: https://lore.kernel.org/r/CACPK8XeLzL3hT8fwVw9fV7Ccduz_PNhZn_67z2yXefCEha6jJg@mail.gmail.com

Patch: [GIT,PULL] memory: Second round for v6.1
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=680438
  Lore link: https://lore.kernel.org/r/20220926105023.119781-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] Rockchip defconfig64 changes for 6.1 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=680183
  Lore link: https://lore.kernel.org/r/1989419.QkHrqEjB74@phil

Patch: ARM: Drop CMDLINE_* dependency on ATAGS
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=681019
  Lore link: https://lore.kernel.org/r/09f0619e8038654d01588d9ad3a023485b2bd77f.1664285209.git.geert+renesas@glider.be


Total patches: 32

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


