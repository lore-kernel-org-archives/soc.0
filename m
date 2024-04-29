Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE6AC04FFE
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06D9EC4AF1A; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E350CC4AF18
	for <soc@kernel.org>; Mon, 29 Apr 2024 21:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424446;
	bh=qDt7F+LLiy57/zxtcmoyCnnkIH08rye2c1DZ8yIIqO8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=evxYAwoCwEYFaWPm6GHH3uefOIqpXyWxfht4r1ri0nuRzy/Kxeu28zwWbdx4f/Ms+
	 tLMqN28ixXjQ/cESLZ7pPKBybUwwJ7NQSKDM7wZMdsSTwErd7Uk0K8FwKAUm2IMe55
	 MQQ5Bmy1q/vNdLm6jriElylVUfJlEl5kQ4OHdYUIFFyqTqwF1HNCJg8mHqErHOLES6
	 +D+Uio+/6cULio4KfNrrUnSy4Sua0Td+JCTDMSGSvVPPcA85eCPXXTA8eL646ne/bS
	 FUeRua5Gup/O5ZWYniU5h0GEa6ehR2XFv1jH/L5Bz0AFVCIuSFqnehnLdviX8LmRL6
	 0PoPAaoPEtJKw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C8A1BC54BA4;
	Mon, 29 Apr 2024 21:00:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444676.17402.10143840822793340696.git-patchwork-summary@kernel.org>
Date: Mon, 29 Apr 2024 21:00:46 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Renesas SoC updates for v6.10
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=843995
  Lore link: https://lore.kernel.org/r/cover.1712915528.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.10
             [GIT,PULL,2/4] Renesas driver updates for v6.10

Patch: [GIT,PULL] STM32 Bus firewall for v6.10
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=847852
  Lore link: https://lore.kernel.org/r/7dc64226-5429-4ab7-a8c8-6053b12e3cf5@foss.st.com

Series: [GIT,PULL,1/5] i.MX SoC changes for 6.10
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848630
  Lore link: https://lore.kernel.org/r/20240428121247.10370-1-shawnguo2@yeah.net
    Patches: [GIT,PULL,1/5] i.MX SoC changes for 6.10
             [GIT,PULL,5/5] i.MX defconfig changes for 6.10

Patch: [GIT,PULL] Driver changes for ti-sysc for v6.10
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848588
  Lore link: https://lore.kernel.org/r/pull-1714283210-549557@atomide.com

Patch: [GIT,PULL] Qualcomm Arm64 Defconfig updates for v6.10
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848518
  Lore link: https://lore.kernel.org/r/20240427162037.1431822-1-andersson@kernel.org

Patch: [GIT,PULL] OP-TEE convert platform callback for v6.10
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=847728
  Lore link: https://lore.kernel.org/r/20240425072835.GA3258167@rayden

Patch: [GIT,PULL] Rockchip arm64 defconfig changes for 6.10 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848025
  Lore link: https://lore.kernel.org/r/8976550.lOV4Wx5bFT@phil

Patch: [GIT,PULL] TEE driver for Trusted Services
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=847732
  Lore link: https://lore.kernel.org/r/20240425073119.GA3261080@rayden

Series: [GIT,PULL,1/5] soc/tegra: Changes for v6.10-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848372
  Lore link: https://lore.kernel.org/r/20240426180519.3972626-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/5] soc/tegra: Changes for v6.10-rc1
             [GIT,PULL,5/5] arm64: tegra: Default configuration updates for v6.10-rc1

Patch: [GIT,PULL] Allwinner config changes for 6.10
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848346
  Lore link: https://lore.kernel.org/r/20240426164354.GA101098@jernej-laptop

Patch: [GIT,PULL] firmware: arm_ffa: Updates for v6.10
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848209
  Lore link: https://lore.kernel.org/r/20240426105051.1527016-1-sudeep.holla@arm.com

Series: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.10
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848907
  Lore link: https://lore.kernel.org/r/20240429140245.238210-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.10
             [GIT,PULL,2/2] MediaTek driver updates for v6.10

Patch: [GIT,PULL] Qualcomm driver updates for v6.10
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848517
  Lore link: https://lore.kernel.org/r/20240427160917.1431354-1-andersson@kernel.org

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v6.10
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848208
  Lore link: https://lore.kernel.org/r/20240426105031.1526987-1-sudeep.holla@arm.com

Patch: [GIT,PULL] hisilicon: driver updates for v6.10
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=847819
  Lore link: https://lore.kernel.org/r/662A3EDE.5070708@hisilicon.com

Patch: [GIT,PULL] memory: drivers for v6.10
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848653
  Lore link: https://lore.kernel.org/r/20240428162001.28011-1-krzysztof.kozlowski@linaro.org


Total patches: 20

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


