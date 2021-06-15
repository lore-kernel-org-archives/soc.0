Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDC4C48BDF
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 41A676148E; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2B81760FE9
	for <soc@kernel.org>; Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623772813;
	bh=u0wLZQdVd7HHCGJYkmeKbdz6UEQDR7KTwv8jc95VTNo=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=WgcG98q1pMRz3r7nZ6KJ+QxX/kHtyCPChOWROemkxqDCmivUADjyo3n6+aTnDAvX7
	 92UwM6wpVE17N4u5QbCGcNb+i0/6PsQzlM/8RmqwJEYKY3iAaG/7MVni83CFJ/G05E
	 qqdApJMWD9UB8In6Vbz6u5ma9pv20x+VLp8QXng/kMDsTBXmDZNUVYmkhHpIyEFA7/
	 6tx/dLEVxImfJ7BL5mFX29ypMM1tFPuHip6KToKoHW6Zr8axFErAG3nHSR6rpFU7Dc
	 PTTSM62me8ktMGNAz7kY6mlxveaoMziEarRacGgL64fbOb157NxYYm8164i/Ki4doC
	 v48tR89gKH0nA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 26226609E4;
	Tue, 15 Jun 2021 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377281315.17464.2038469190777275371.git-patchwork-summary@kernel.org>
Date: Tue, 15 Jun 2021 16:00:13 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Series: [GIT,PULL,1/2] ARM: DTS: Keystone K2G cleanup for v5.13
  Submitter: Santosh Shilimkar <santosh.shilimkar@oracle.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=499481
  Lore link: https://lore.kernel.org/r/1623564020-9958-1-git-send-email-santosh.shilimkar@oracle.com
    Patches: [GIT,PULL,1/2] ARM: DTS: Keystone K2G cleanup for v5.13
             [GIT,PULL,2/2] SOC: Keystone driver update for v5.13
Series: [GIT,PULL,1/6] dt-bindings: Changes for v5.14-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=499063
  Lore link: https://lore.kernel.org/r/20210611164437.3568059-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/6] dt-bindings: Changes for v5.14-rc1
             [GIT,PULL,2/6] soc/tegra: Changes for v5.14-rc1
             [GIT,PULL,3/6] firmware: tegra: Changes for v5.14-rc1
             [GIT,PULL,4/6] ARM: tegra: Device tree changes for v5.14-rc1
             [GIT,PULL,5/6] ARM: tegra: Default configuration changes for v5.14-rc1
             [GIT,PULL,6/6] arm64: tegra: Device tree changes for v5.14-rc1
Series: [GIT,PULL,1/6] i.MX drivers update for 5.14
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=499499
  Lore link: https://lore.kernel.org/r/20210613082544.16067-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/6] i.MX drivers update for 5.14
             [GIT,PULL,2/6] i.MX SoC changes for 5.14
             [GIT,PULL,3/6] i.MX dt-bindings update for 5.14
             [GIT,PULL,4/6] i.MX device tree changes for 5.14
             [GIT,PULL,5/6] i.MX arm64 device tree changes for 5.14
             [GIT,PULL,6/6] i.MX defconfig update for 5.14
Patch: [GIT,PULL] Qualcomm DTS updates for v5.14
  Submitter: Bjorn Andersson <bjorn.andersson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=500223
  Lore link: https://lore.kernel.org/r/20210614223840.393224-1-bjorn.andersson@linaro.org
Patch: [v3] ARM: dts: imx28: Add DTS description of imx28 based XEA board
  Submitter: Lukasz Majewski <lukma@denx.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=484367
  Lore link: https://lore.kernel.org/r/20210518142857.26170-1-lukma@denx.de
Patch: [GIT,PULL] Qualcomm driver updates for v5.14
  Submitter: Bjorn Andersson <bjorn.andersson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=500221
  Lore link: https://lore.kernel.org/r/20210614223727.393159-1-bjorn.andersson@linaro.org
Patch: [GIT,PULL] Qualcomm DTS fixes for v5.13
  Submitter: Bjorn Andersson <bjorn.andersson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=500203
  Lore link: https://lore.kernel.org/r/20210614215552.391887-1-bjorn.andersson@linaro.org
Patch: [GIT,PULL] ARM: Visconti: device tree changes for 5.14
  Submitter: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=500239
  Lore link: https://lore.kernel.org/r/20210614234654.2u3xetnn5rwhymwz@toshiba.co.jp
Patch: [GIT,PULL] Qualcomm ARM64 DT updates for v5.14
  Submitter: Bjorn Andersson <bjorn.andersson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=500219
  Lore link: https://lore.kernel.org/r/20210614223712.393096-1-bjorn.andersson@linaro.org
Patch: [GIT,PULL] Qualcomm ARM64 defconfig udpates for v5.14
  Submitter: Bjorn Andersson <bjorn.andersson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=500217
  Lore link: https://lore.kernel.org/r/20210614223704.393042-1-bjorn.andersson@linaro.org
Series: ARM/arm64: Samsung pull for v5.14, second set
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=500117
  Lore link: https://lore.kernel.org/r/20210614193309.20248-1-krzysztof.kozlowski@canonical.com
    Patches: [GIT,PULL,1/2] arm64: dts: exynos: enable PMIC wakeup from suspend on TM2
             [GIT,PULL,2/2] ARM/arm64: defconfig: samsung: pull for v5.14

Total patches: 23

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


