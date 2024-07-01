Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63A2C2BD09
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71F90C32781; Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BA01C116B1
	for <soc@kernel.org>; Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719867637;
	bh=ABvg+u08SOwkBJwLuOOuNvGhfljTZEgv3IQlq/T5ru0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=QUWg6BFnLHyFlbNVgWDuVmFr1kOwmxbSNozQKnHCI4gVWjTxZcyamSSVwYGbYwwhT
	 AVl5p1BeqS+zxsTT1XeEosh/6ydVJeNKv3lEwo2x6VrEQC0x2IkTWgkj4OPT0fTJ7y
	 a0zD0CdEGoZEzNB//0i6GNBRNE3/E5Y5oUruTkvkc7CWDX9cKt7eH9jCIxebwpc7IC
	 BdkSpSM0ZAE03y0KnMCqepwg7Row07Liamopsyum2jUeV2GThrxGl4O+ekD9LFrzho
	 5/3M9oY5TSxdN0sgiF9YUSTO2Qb4wmWzhmf6oB/visiSr4Px2+0TtANvx0iemceoe0
	 g301Xf507t4Fw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 43ACEC43446;
	Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171986763719.7657.5405148911904932755.git-patchwork-summary@kernel.org>
Date: Mon, 01 Jul 2024 21:00:37 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] amlogic drivers updates for v6.11
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=867045
  Lore link: https://lore.kernel.org/r/35093904-c4a8-432d-b010-a994fc1ee536@linaro.org

Series: Turris Omnia MCU driver
  Submitter: Marek Behún <kabel@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=867098
  Lore link: https://lore.kernel.org/r/20240701113010.16447-1-kabel@kernel.org
    Patches: [v13,1/8] dt-bindings: firmware: add cznic,turris-omnia-mcu binding
             [v13,2/8] platform: cznic: Add preliminary support for Turris Omnia MCU
             [v13,3/8] platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs
             [v13,4/8] platform: cznic: turris-omnia-mcu: Add support for poweroff and wakeup
             [v13,5/8] platform: cznic: turris-omnia-mcu: Add support for MCU watchdog
             [v13,6/8] platform: cznic: turris-omnia-mcu: Add support for MCU provided TRNG
             [v13,7/8] ARM: dts: turris-omnia: Add MCU system-controller node
             [v13,8/8] ARM: dts: turris-omnia: Add GPIO key node for front button

Patch: arm/arm64: dts: arm: Use generic clock and regulator nodenames
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=866865
  Lore link: https://lore.kernel.org/r/20240630-arm-dts-fixes-2-v1-1-a32ba57e5b1d@linaro.org

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.11
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=867044
  Lore link: https://lore.kernel.org/r/7f71e76c-c793-429a-b0ed-7296553a3eff@linaro.org

Patch: [GIT,PULL] Microchip ARM64 DT updates for v6.11
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=866849
  Lore link: https://lore.kernel.org/r/20240629174051.665027-1-claudiu.beznea@tuxon.dev


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


