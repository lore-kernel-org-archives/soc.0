Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBDCBC77B6E
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88724C433A1; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70FFCC433D2
	for <soc@kernel.org>; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681477830;
	bh=Cf2FBSEbHZyI6S8oN8fzxvBl/qYj2+yJTdlWh6mrQAY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ujIMWxNaRs7yIHzjFMvt6wAb3LOUBqgEc+37TDpi2w+dkEEFzNQcQNz0zQhOygyxP
	 wj9a2iZrQeJPyn5Q6jqj5JDUab1y7bWMrVz+yLW2Uj8DWO/WnhbrxQIoklZUv5YcrK
	 cJ9b606uIMhBDLSsvkpbfWfjl5+WPMaRbpZSr/DsuyYeo/ydxSVQ+v3oBOaWM+ymYp
	 lKpFlQsyfDvLz3kBAzlYykxyDC3BXKV5R1ViHCBhtbXRH3CYUKP54NYWyv/UFqDFUl
	 N9yJW1mlltwv5qpXS85AaIwlnb7Hjgys3gBE1o5KGgETR7fKd2hOttTxF7+R+BPmEj
	 i9D3o6mk8vDVQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 46AD6E52441;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147783019.23940.16187361381173941367.git-patchwork-summary@kernel.org>
Date: Fri, 14 Apr 2023 13:10:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/7] ARM: tegra: Core changes for v6.4-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=737584
  Lore link: https://lore.kernel.org/r/20230406124804.970394-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/7] ARM: tegra: Core changes for v6.4-rc1
             [GIT,PULL,2/7] soc/tegra: Changes for v6.4-rc1
             [GIT,PULL,3/7] soc/tegra: Changes for v6.4-rc1
             [GIT,PULL,7/7] arm64: tegra: Default configuration changes for v6.4-rc1

Patch: [GIT,PULL] Allwinner drivers changes for 6.4
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738186
  Lore link: https://lore.kernel.org/r/20230408125255.GA17134@jernej-laptop

Series: Renesas SoC updates for v6.4 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738359
  Lore link: https://lore.kernel.org/r/cover.1681113111.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM SoC updates for v6.4
             [GIT,PULL,2/3] Renesas driver updates for v6.4 (take two)

Series: [GIT,PULL,1/3] arm64: dts: samsung: dts64 for v6.4
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=737072
  Lore link: https://lore.kernel.org/r/20230405080438.156805-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] arm64: dts: samsung: dts64 for v6.4
             [GIT,PULL,3/3] ARM: samsung: soc for v6.4

Series: [GIT,PULL,1/3] soc: ti: Updates for v6.4
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738447
  Lore link: https://lore.kernel.org/r/20230410140506.ucvkwq7vz2h47vyj@stipulate
    Patches: [GIT,PULL,1/3] soc: ti: Updates for v6.4
             [GIT,PULL,2/3] arm64: defconfig: TI K3 updates for v6.4

Series: [GIT,PULL,1/6] i.MX drivers update for 6.4
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738165
  Lore link: https://lore.kernel.org/r/20230408101928.280271-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/6] i.MX drivers update for 6.4
             [GIT,PULL,2/6] i.MX SoC changes for 6.4
             [GIT,PULL,6/6] i.MX defconfig updates for 6.4

Patch: ARM: configs: Update U8500 defconfig
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=737150
  Lore link: https://lore.kernel.org/r/20230405105439.1739575-1-linus.walleij@linaro.org

Series: [GIT,PULL,1/4] Broadcom devicetree changes for 6.4
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738595
  Lore link: https://lore.kernel.org/r/20230410232606.1917803-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/4] Broadcom devicetree changes for 6.4
             [GIT,PULL,3/4] Broadcom drivers changes for 6.4
             [GIT,PULL,4/4] Broadcom soc changes for 6.4

Patch: [GIT,PULL] Qualcomm ARM64 defconfig updates for v6.4
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738478
  Lore link: https://lore.kernel.org/r/20230410155955.5329-1-andersson@kernel.org

Patch: [GIT,PULL] RISC-V SoC drivers for v6.4
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=737788
  Lore link: https://lore.kernel.org/r/20230406-islamist-mop-81d651b8830d@spud

Patch: ARM: multi_v7_defconfig: Add OPTEE support
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=739381
  Lore link: https://lore.kernel.org/r/20230413072042.30657-1-alexandre.torgue@foss.st.com

Patch: [GIT,PULL] A few more Qualcomm driver updates for v6.4
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=739682
  Lore link: https://lore.kernel.org/r/20230414024302.2411985-1-andersson@kernel.org

Patch: [GIT,PULL] Apple SoC RTKit updates for 6.4
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=737469
  Lore link: https://lore.kernel.org/r/0dbd2dc1-6a2c-5b21-354b-d8314937e8e7@marcan.st


Total patches: 23

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


