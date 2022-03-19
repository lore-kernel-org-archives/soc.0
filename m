Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2FCC433FE
	for <soc@archiver.kernel.org>; Sat, 19 Mar 2022 22:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 44F4BC340F5; Sat, 19 Mar 2022 22:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20489C340ED
	for <soc@kernel.org>; Sat, 19 Mar 2022 22:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647727211;
	bh=Avqh8oXk4goKE1TDiXjraBC7WtK7AQxcje7C1ccl/q0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=N91vRng0txjmW2sRMV8b0swq7LhwSh1+ReWL9jztVF/iCKQEV0H0GPhpEdCdoVmCW
	 kHVZg31i+NZBYQTSNvM5xHYhIYRAcHAU//Fs3Dqtg7M+wiDpPxSGJSxaf3G5IlmaVO
	 mCH/kV0lKAYZhYmCkXr1lBCQpmGrCpnqjCUsrxgLMiZ03Mgp40O1KalZafKnwchw0F
	 lb3z1sV5Hb1PI0a9h2GfspjSYSDey2fvQ0dbSlq9mLSkxNqyL3G7VCGPzCm4HY9TNW
	 5msLHqX9aMeq3EBHN8B0f2Xgj/JtGBiBqG81ayv6KttwiLhIzOstdXPlmi8cJqJXSz
	 Tf+Pzi/KaMWBg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F11A2E6D3DD;
	Sat, 19 Mar 2022 22:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164772721093.21632.5114829360709719734.git-patchwork-summary@kernel.org>
Date: Sat, 19 Mar 2022 22:00:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: ARM: spear: fix typos in comments
  Submitter: Julia Lawall <julia.lawall@inria.fr>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=624578
  Lore link: https://lore.kernel.org/r/20220318103729.157574-21-Julia.Lawall@inria.fr

Series: ARM: configs: fix multi_v5_defconfig
  Submitter: Andre Przywara <andre.przywara@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=624362
  Lore link: https://lore.kernel.org/r/20220317183043.948432-1-andre.przywara@arm.com
    Patches: [1/5] ARM: configs: multi_v5_defconfig: remove deleted platforms
             [2/5] ARM: configs: multi_v5_defconfig: re-enable CONFIG_V4L_PLATFORM_DRIVERS
             [3/5] ARM: configs: multi_v5_defconfig: re-enable DRM_PANEL and FB_xxx
             [4/5] ARM: configs: clean up multi_v5_defconfig

Patch: arm64: dts: n5x: drop invalid property and fix edac node name
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=624630
  Lore link: https://lore.kernel.org/r/20220318121044.108750-1-krzysztof.kozlowski@canonical.com


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


