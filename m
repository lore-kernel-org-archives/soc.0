Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9D8C41513
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F0C68C4AF1C; Mon, 29 Apr 2024 16:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D596AC113CD
	for <soc@kernel.org>; Mon, 29 Apr 2024 16:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408887;
	bh=BKHzhmaYsOp+qzwNycKI5WsaFr+ZqtwIaKBbGpBUgMw=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=t7hBGA/fkjBJw5AsNEwG8VVf+y8R+A8MS/DjL7+Fcq7K44/A/U1E9Py0kC5K0nR38
	 5HCG8FGr9q24L7DK5yatJjGJqX8aNI6u0HlfPsmGd8eIqEC6lLSlNy/kgv/1/AFEqU
	 4DeWwH7FCrJm2zSgQnqkwQv+05J5HkxbfWaQ8M0EjE7OXAELkwSRsP38o2hoLRoxJr
	 4fcsEO6BjfJQ48r+sgINQXb/qeZpr4/JqMiUOKXDovrgaTs+dQoe9B6GbDP2imLITQ
	 lNV4JDFnAqkTUr+hmEXKhtK9rDLvkET4jaoSp2EnV4w4NENJB4lZlal91dMi5liS0Z
	 9IkfaXqEhX66A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BCC2FE2D48A;
	Mon, 29 Apr 2024 16:41:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888769.20509.4459913553615699164.git-patchwork-summary@kernel.org>
Date: Mon, 29 Apr 2024 16:41:27 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/5] soc/tegra: Changes for v6.10-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848372
  Lore link: https://lore.kernel.org/r/20240426180519.3972626-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/5] soc/tegra: Changes for v6.10-rc1
             [GIT,PULL,2/5] dt-bindings: Changes for v6.10-rc1
             [GIT,PULL,3/5] ARM: tegra: Changes for v6.10-rc1
             [GIT,PULL,4/5] arm64: tegra: Changes for v6.10-rc1

Patch: [GIT,PULL] Rockchip dts64 changes for 6.10 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848024
  Lore link: https://lore.kernel.org/r/15361932.O9o76ZdvQC@phil

Series: [GIT,PULL,1/2] arm64: dts: cleanup and fixes for v6.10
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848655
  Lore link: https://lore.kernel.org/r/20240428163316.28955-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] arm64: dts: cleanup and fixes for v6.10
             [GIT,PULL,2/2] ARM: dts: cleanup for v6.10

Patch: [GIT,PULL] Allwinner device tree changes for 6.10
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848347
  Lore link: https://lore.kernel.org/r/20240426164510.GA101219@jernej-laptop

Series: Renesas SoC updates for v6.10
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=843995
  Lore link: https://lore.kernel.org/r/cover.1712915528.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.10
             [GIT,PULL,3/4] Renesas DT binding updates for v6.10
             [GIT,PULL,4/4] Renesas DTS updates for v6.10

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v6.10
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848533
  Lore link: https://lore.kernel.org/r/20240427175951.1439887-1-andersson@kernel.org

Series: [GIT,PULL,1/2] ARM: dts: samsung: dts for v6.10
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=847725
  Lore link: https://lore.kernel.org/r/20240425071856.9235-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] ARM: dts: samsung: dts for v6.10
             [GIT,PULL,2/2] arm64: dts: samsung: dts for v6.10

Patch: [GIT,PULL] Allwinner device tree changes for 6.10, part 2
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848501
  Lore link: https://lore.kernel.org/r/20240427133006.GA146501@jernej-laptop

Patch: [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.10
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848524
  Lore link: https://lore.kernel.org/r/20240427163625.1432458-1-andersson@kernel.org

Series: [GIT,PULL,1/5] i.MX SoC changes for 6.10
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848630
  Lore link: https://lore.kernel.org/r/20240428121247.10370-1-shawnguo2@yeah.net
    Patches: [GIT,PULL,1/5] i.MX SoC changes for 6.10
             [GIT,PULL,2/5] i.MX DT bindings for 6.10
             [GIT,PULL,3/5] i.MX ARM device tree for 6.10
             [GIT,PULL,4/5] i.MX arm64 device tree for 6.10

Patch: [GIT,PULL] Microchip ARM64 DT updates for v6.10
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848856
  Lore link: https://lore.kernel.org/r/20240429121429.1941241-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] Devicetree changes for omaps for v6.10
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=847705
  Lore link: https://lore.kernel.org/r/pull-1714020191-304166@atomide.com

Patch: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.10
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=847825
  Lore link: https://lore.kernel.org/r/662A4115.9020805@hisilicon.com

Patch: [GIT,PULL] STM32 DT changes for v6.10#1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=847860
  Lore link: https://lore.kernel.org/r/2040767c-413e-4447-b354-c44999930e4c@foss.st.com

Patch: [GIT,PULL] Renesas DTS updates for v6.10 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848118
  Lore link: https://lore.kernel.org/r/cover.1714116737.git.geert+renesas@glider.be

Patch: [v2] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
  Submitter: Rob Herring <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=845582
  Lore link: https://lore.kernel.org/r/20240417203853.3212103-1-robh@kernel.org


Total patches: 26

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


