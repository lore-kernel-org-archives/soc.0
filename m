Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A226DC41513
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C3FBC4AF16; Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 667C9C4AF0C
	for <soc@kernel.org>; Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720533033;
	bh=qRBTpbjCsZcs3c/gEW0i6HPP9yhtrlazpgAMk30okcM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Ra7/TGdIds2h3pje3Md2oW26ZZi69aphly5PDGiTwSn0v28Exwm50bPG6ZNtUiQst
	 R/oT4LtKgMqLczGeEuLbjhlh7cQR1fRSrkHsLwEfzml5o9Y32gayzp/eAVXCf+zd33
	 D/09jwt/xTuRuLKehDwhdJpofV6I14XkaiisAjrEmjm8JJ008gKDjSCLLMH+h0efa9
	 3bM5gXSPX7lG5eebfxkza1mRvYyBebgmKRhfkQ9Jtp7u23/cW+eDAkXE94wu1WP6nr
	 yb04oMrt7aPCDQG4i3r2cz7Nqz8zClK+jkvUNLv/vaH+6c0E9JJSZMzA6Yz/ln/3K8
	 sgLLpi1CydLfg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4CAC8C43468;
	Tue,  9 Jul 2024 13:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172053303325.5265.7057873281936630101.git-patchwork-summary@kernel.org>
Date: Tue, 09 Jul 2024 13:50:33 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: ARM: pxa: use software nodes/properties for GPIOs
  Submitter: Dmitry Torokhov <dmitry.torokhov@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=866701
  Lore link: https://lore.kernel.org/r/20240628180852.1738922-1-dmitry.torokhov@gmail.com
    Patches: [01/10] ARM: spitz: fix GPIO assignment for backlight
             [02/10] ARM: pxa: consolidate GPIO chip platform data
             [03/10] ARM: pxa/gumstix: convert vbus gpio to use software nodes
             [04/10] ARM: spitz: Simplify instantiating SPI controller
             [05/10] ARM: spitz: Use software nodes to describe SPI CS lines
             [06/10] ARM: spitz: Use software nodes to describe audio GPIOs
             [07/10] ARM: spitz: Use software nodes to describe LCD GPIOs
             [08/10] ARM: spitz: Use software nodes to describe MMC GPIOs
             [09/10] ARM: spitz: Use software nodes to describe LED GPIOs
             [10/10] ARM: spitz: Use software nodes for the ADS7846 touchscreen

Patch: [GIT,PULL] arm64: dts: ZynqMP SOC changes for 6.11
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=865334
  Lore link: https://lore.kernel.org/r/CAHTX3dKMtqgNpkEvrw0p2w+SPN83Ai1_kzhefUGOO5rMkPaH_w@mail.gmail.com

Series: Fixes for turris-omnia-mcu
  Submitter: Marek Behún <kabel@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=869243
  Lore link: https://lore.kernel.org/r/20240708114002.4285-1-kabel@kernel.org
    Patches: [1/2] platform: cznic: turris-omnia-mcu: Depend on OF
             [2/2] platform: cznic: turris-omnia-mcu: Depend on WATCHDOG

Patch: [v2] MAINTAINERS: thead: add git tree
  Submitter: Drew Fustini <drew@pdp7.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=868564
  Lore link: https://lore.kernel.org/r/20240704180913.2516959-1-drew@pdp7.com

Series: [v2,1/2] ti: omap: MAINTAINERS: move Benoît Cousson to CREDITS
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=861086
  Lore link: https://lore.kernel.org/r/20240612084038.18519-1-krzysztof.kozlowski@linaro.org
    Patches: [v2,1/2] ti: omap: MAINTAINERS: move Benoît Cousson to CREDITS
             [v2,2/2] amazon: MAINTAINERS: change to odd fixes and Tsahee Zidenberg to CREDITS


Total patches: 16

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


