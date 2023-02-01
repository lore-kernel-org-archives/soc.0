Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAEEC63797
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4EBE8C4339C; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37F0FC433EF
	for <soc@kernel.org>; Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675269022;
	bh=r0+5Cezct0xDf2Qs28vBMw3f8W/Dou8VvCaM5Cqbct0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=IjO/InFJi1lAIrXZL0u6LnHWHNtM3KIDR6JhJ0riVYowLW1y+PDb1kPYOIGiFHvMr
	 Xc0Kanqm8y/Gt5TVixH/+eWi7EOdsDRj4hOcfmbv/MGjTiXWjycIKvMiSQOemr3V0m
	 njH3Y5IqPMk45gAniW1BXcjWh+I6vmN6WCtUYmFL8cD+OSr5Kl+4L3XbB8T7+Z/enn
	 trvn1MFVRXmHK6/DPPCufJ0K78kv+Qu8qpPeHgNm5RgD2z0rdQE1ckms4cJFskj47K
	 laWS9xjOQMrjXkRDlGDtmcKBnXUbPRa9nbvTlzyhwdum6spxHMTlfura86Gb+50MSL
	 7Tnlnw/gwZxwg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 238B7C4314C;
	Wed,  1 Feb 2023 16:30:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167526902214.23236.12119545165744006346.git-patchwork-summary@kernel.org>
Date: Wed, 01 Feb 2023 16:30:22 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: soc: zynq: Xilinx SoC changes for v6.3
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=717326
  Lore link: https://lore.kernel.org/r/5d7785ca-7fe0-1597-c56a-7a0f4d230db8@monstr.eu

Series: [GIT,PULL,1/5] Broadcom defconfig changes for 6.3
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716595
  Lore link: https://lore.kernel.org/r/20230128193823.1628716-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/5] Broadcom defconfig changes for 6.3
             [GIT,PULL,5/5] Broadcom soc changes for 6.3

Patch: [GIT,PULL] arm64: soc: zynqmp: Xilinx SoC changes for v6.3
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=717325
  Lore link: https://lore.kernel.org/r/42be5129-3ca2-ddbc-ac3b-6448245b61c2@monstr.eu

Patch: [GIT,PULL] ARM: dts: zynq: Xilinx DT changes for v6.3
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=717323
  Lore link: https://lore.kernel.org/r/850bb18f-ca22-f3d7-71a7-f367bfef4ccc@monstr.eu

Series: [GIT,PULL,1/6] i.MX drivers change for 6.3
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716755
  Lore link: https://lore.kernel.org/r/20230130023947.11780-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/6] i.MX drivers change for 6.3
             [GIT,PULL,2/6] i.MX SoC update for 6.3
             [GIT,PULL,6/6] i.MX defconfig change for 6.3

Patch: [GIT,PULL] Allwinner config changes for 6.3
  Submitter: Jernej Skrabec <jernej@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716477
  Lore link: https://lore.kernel.org/r/Y9Ra7dxkfMI9Xp3F@jernej-laptop

Patch: [GIT,PULL] arm64: dts: ZynqMP DT changes for v6.3
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=717319
  Lore link: https://lore.kernel.org/r/89d82a7e-6b42-97ce-2912-aa7dec965ff2@monstr.eu

Series: [GIT,PULL,1/3] ARM: dts: samsung: exynos for v6.3
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=716684
  Lore link: https://lore.kernel.org/r/20230129143944.5104-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] ARM: dts: samsung: exynos for v6.3
             [GIT,PULL,3/3] ARM: samsung: pull for v6.3


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


