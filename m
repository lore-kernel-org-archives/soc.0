Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F3ECD5BCB
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 15:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D4EDC4CEC7; Thu,  5 Sep 2024 15:40:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865A6C4CEC3
	for <soc@kernel.org>; Thu,  5 Sep 2024 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725550831;
	bh=6+sL4w+9X8+NX6rbN6sN/u2xZqMmhMMEss48XVWyQDc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=sm5WuUhZFR0qUo9zTNXRIcZGiyzs/SW14YrzoaArGk3Zvk/5hM6Lvg20C1rj9mfYz
	 GHouKunf+Wktn0CQXbA9xMHTgV8HW5aIa6HsCYThegxCTbZXtacvAFB8KJ8KT/RiG1
	 GiRONhVt22/qrw+Fb20N/yKeB02hepCYeJzmowWx7mksb9RlA1CkRht+oGM5OJE/S6
	 kpBD4qMjCYt4qz6FJLcIaUi8Gvj1pF4CmLXxVk2KuqQQQSFjXDDhOkQjC23wx1vMzm
	 NTiCQc+ee+z/fDkvMmR/kwgPB6at92TZmYev/11L5JN1lOfjopUSikxoohW1co+dMw
	 QNmM9lZRCmYmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 749153806651;
	Thu,  5 Sep 2024 15:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172555083206.1737985.11418044194590355413.git-patchwork-summary@kernel.org>
Date: Thu, 05 Sep 2024 15:40:32 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: arm64: dts: nuvoton: Add pinctrl and gpio nodes for MA35D1
  Submitter: Jacky Huang <ychuang570808@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=880744
  Lore link: https://lore.kernel.org/r/20240819035647.306-1-ychuang570808@gmail.com
    Patches: [1/3] arm64: dts: nuvoton: Add syscon to the system-management node
             [2/3] arm64: dts: nuvoton: ma35d1: Add pinctrl and gpio nodes
             [3/3] arm64: dts: nuvoton: ma35d1: Add uart pinctrl settings

Patch: [GIT,PULL] amlogic drivers updates for v6.12
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=887242
  Lore link: https://lore.kernel.org/r/577ad7fe-19b1-468a-b994-573855493fd7@linaro.org

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.12
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=887243
  Lore link: https://lore.kernel.org/r/cc8fb460-5ac0-4b16-8490-8ac9f89f1b7f@linaro.org

Patch: [GIT,PULL] Qualcomm driver updates for v6.12
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=886941
  Lore link: https://lore.kernel.org/r/20240904193042.15118-1-andersson@kernel.org

Patch: arm64: dts: toshiba: Fix pl011 and pl022 clocks
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=883496
  Lore link: https://lore.kernel.org/r/20240826183848.1290957-2-robh@kernel.org

Patch: [v2] ARM: dts: Fix undocumented LM75 compatible nodes
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=880420
  Lore link: https://lore.kernel.org/r/20240816164717.1585629-1-robh@kernel.org

Series: [GIT,PULL,1/3] samsung: drivers for v6.12
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=883788
  Lore link: https://lore.kernel.org/r/20240827121638.29707-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] samsung: drivers for v6.12
             [GIT,PULL,3/3] ARM: samsung: soc/mach for v6.12

Patch: [GIT,PULL] Microchip AT91 SoC updates for v6.12
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=885554
  Lore link: https://lore.kernel.org/r/20240901133110.2038675-3-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] Reset controller updates for v6.12
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=886721
  Lore link: https://lore.kernel.org/r/20240904103921.1479579-1-p.zabel@pengutronix.de


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


