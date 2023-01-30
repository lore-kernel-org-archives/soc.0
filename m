Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF155C636CD
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89200C4339B; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71C71C433EF
	for <soc@kernel.org>; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=aB1m0oi26pVdNSu8ergm1Xt1y8sKrz98PT/Jr0bxVvQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Zu90CQS2yzUaD3C/i/h0JbMolcWVU8YgVJ7XhCZiS3y0J9b9PbiCxpTzxk2dVioYR
	 Fz+ZwW1z/YAQOvRdzbehLriKkLeajpsC6P6QUUhHGfKj7piAFXDatvQDrnU2vz3zRN
	 WOv6GDwj8ePmkMPK+fGRBqn8fDjGMe4aEb9kCJjlN2o/1SNwa0bDtWREiQUIuHGUVx
	 GAjs64zv6vGBU0o/q1516gBzeD0b5FhZOBP0W/PnqSnZTz7UAjsAiYLxIlRd3dEaz4
	 naSU8M1fO9fwRQLkQ2cQxqIhDEobd4MEAFXzRuHzpAvzC/xBmcl4wX4fJtW8VJCOKL
	 8MIpVnYjqIl/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5D5D6C04E36;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786037.29049.4861538872861100360.git-patchwork-summary@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/2] arm64: dts: cleanup for v6.3, part two
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716687
  Lore link: https://lore.kernel.org/r/20230129144525.5802-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] arm64: dts: cleanup for v6.3, part two
             [GIT,PULL,2/2] ARM: dts: cleanup for v6.3, part two

Patch: [GIT,PULL] amlogic ARM updates for v6.3
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716956
  Lore link: https://lore.kernel.org/r/61700737-c226-1c07-fba7-6dca896fdab4@linaro.org

Series: [GIT,PULL,1/5] Broadcom defconfig changes for 6.3
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716595
  Lore link: https://lore.kernel.org/r/20230128193823.1628716-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/5] Broadcom defconfig changes for 6.3
             [GIT,PULL,3/5] Broadcom devicetree-arm64 changes for 6.3
             [GIT,PULL,4/5] Broadcom drivers changes for 6.3

Patch: [GIT,PULL] Qualcomm ARM64 Devicetree updates for v6.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716003
  Lore link: https://lore.kernel.org/r/20230126202528.3691539-1-andersson@kernel.org

Series: [GIT,PULL,1/6] i.MX drivers change for 6.3
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716755
  Lore link: https://lore.kernel.org/r/20230130023947.11780-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/6] i.MX drivers change for 6.3
             [GIT,PULL,3/6] i.MX DT bindings update for 6.3
             [GIT,PULL,4/6] i.MX arm device tree change for 6.3
             [GIT,PULL,5/6] i.MX arm64 device tree change for 6.3

Series: Renesas SoC updates for v6.3 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716304
  Lore link: https://lore.kernel.org/r/cover.1674815093.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas driver updates for v6.3 (take two)
             [GIT,PULL,2/3] Renesas DT binding updates for v6.3
             [GIT,PULL,3/3] Renesas DT updates for v6.3 (take two)

Patch: [GIT,PULL] Qualcomm ARM DT updates for v6.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=715953
  Lore link: https://lore.kernel.org/r/20230126174725.3681745-1-andersson@kernel.org

Patch: [GIT,PULL] RISC-V SoC drivers for v6.3
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=715978
  Lore link: https://lore.kernel.org/r/Y9LNIm9pkr+Owv/e@spud

Patch: [GIT,PULL] amlogic Drivers updates for v6.3
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716942
  Lore link: https://lore.kernel.org/r/ec9552d8-96df-a677-ab94-9723f5c30f1c@linaro.org

Series: [GIT,PULL,1/3] ARM: dts: samsung: exynos for v6.3
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716684
  Lore link: https://lore.kernel.org/r/20230129143944.5104-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] ARM: dts: samsung: exynos for v6.3
             [GIT,PULL,2/3] arm64: dts: samsung: second for v6.3

Patch: [GIT,PULL] Allwinner drivers changes for 6.3
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716467
  Lore link: https://lore.kernel.org/r/Y9RXXATRNqEv0GJT@jernej-laptop

Series: [GIT,PULL,1/3] dt-bindings: Changes for v6.3-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716308
  Lore link: https://lore.kernel.org/r/20230127163719.460954-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/3] dt-bindings: Changes for v6.3-rc1
             [GIT,PULL,2/3] ARM: tegra: Device tree changes for v6.3-rc1
             [GIT,PULL,3/3] arm64: tegra: Device tree changes for v6.3-rc1

Patch: [GIT,PULL] RISC-V Devicetrees for v6.3
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=715985
  Lore link: https://lore.kernel.org/r/Y9LP+Za1h0fkBa58@spud

Patch: [GIT,PULL] Allwinner device tree changes for 6.3
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716475
  Lore link: https://lore.kernel.org/r/Y9Raak4mhdtL0L8e@jernej-laptop

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.3
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716948
  Lore link: https://lore.kernel.org/r/c1641ffd-71c9-9ac9-89d9-c22da4acea10@linaro.org


Total patches: 26

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


