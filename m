Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED12C48BF6
	for <soc@archiver.kernel.org>; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A3CEC433A6; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F7D9C433C7
	for <soc@kernel.org>; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709226129;
	bh=l5um9UUUEO0vPTDRvS1mT5yedyeDTb0FbK7L0bQwRJI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=h4ruqK9IuROktuh4fJbToOysnvIWTLNiQd9mKQ7Y4iUXcz8KshzYCHxITg8kZiWTg
	 c45HDC4TIuVBgV+Un8PbZYeROHpJxR+TnO/8O4d6jBQPhRBwWTCrfrmIdnm7NT9j+C
	 Qn9JqnKZTnh/NESBYb048DdVw9NW4EHdvU+IE3ituW2VySqPxAf+HUsEk/jkZhaVvA
	 mRXXZuP+CFnhETjBn9qZM/vwIJRXQipuhmkEFH4vsD0+5QbuIw5xdgOrOZMnRr3sNF
	 rBfzvFfZmEkOIO0wKbcpic2yLMbWxo6lVJT+mMcj9tBPy2OcB9wTJlyTnyn5Zxj/E7
	 dIvlOLM7ItlPg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 59397C595D2;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170922612925.13542.10592192578724587628.git-patchwork-summary@kernel.org>
Date: Thu, 29 Feb 2024 17:02:09 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Gemini DTS updates for v6.9
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=828276
  Lore link: https://lore.kernel.org/r/CACRpkdYQv9cyCZyjgQB4FTrxek9Hfu4EZ3syfHqHF7P6gzddvA@mail.gmail.com

Series: Renesas SoC updates for v6.9
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=824738
  Lore link: https://lore.kernel.org/r/cover.1707487826.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.9
             [GIT,PULL,3/4] Renesas DT binding updates for v6.9
             [GIT,PULL,4/4] Renesas DTS updates for v6.9

Series: [GIT,PULL,1/4] samsung: drivers for v6.9
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=827269
  Lore link: https://lore.kernel.org/r/20240218182141.31213-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/4] samsung: drivers for v6.9
             [GIT,PULL,2/4] arm64: dts: samsung: exynos and google for v6.9
             [GIT,PULL,3/4] ARM: dts: samsung: for v6.9

Series: Renesas SoC updates for v6.9 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829052
  Lore link: https://lore.kernel.org/r/cover.1708687130.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/2] Renesas DT binding updates for v6.9 (take two)
             [GIT,PULL,2/2] Renesas DTS updates for v6.9 (take two)

Patch: [GIT,PULL] Rockchip dts64 changes for 6.9 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=828477
  Lore link: https://lore.kernel.org/r/3622360.hdfAi7Kttb@diego

Series: [GIT,PULL,1/5] soc/tegra: Changes for v6.9-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=829229
  Lore link: https://lore.kernel.org/r/20240223174849.1509465-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/5] soc/tegra: Changes for v6.9-rc1
             [GIT,PULL,3/5] dt-bindings: Changes for v6.9-rc1
             [GIT,PULL,4/5] ARM: tegra: Device tree changes for v6.9-rc1
             [GIT,PULL,5/5] arm64: tegra: Device tree changes for v6.9-rc1

Patch: [GIT,PULL] ARM Versatile DTS fixes for v6.9
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=828470
  Lore link: https://lore.kernel.org/r/CACRpkdaL6j6OdixHFHoMms4e=tXEw_6ynBMFb6m8=7KkVgEedA@mail.gmail.com

Patch: [GIT,PULL] Rockchip dts32 changes for 6.9 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=828478
  Lore link: https://lore.kernel.org/r/37970455.XM6RcZxFsP@diego

Patch: [GIT,PULL] ARM: dts: various improvements for v6.9
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=827272
  Lore link: https://lore.kernel.org/r/20240218182656.32103-1-krzysztof.kozlowski@linaro.org

Series: [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v6.9
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=827466
  Lore link: https://lore.kernel.org/r/20240219131230.157792-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/2] MediaTek ARM64 Device Tree updates for v6.9


Total patches: 18

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


