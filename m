Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40660C433FE
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16EE5C385B2; Tue,  3 May 2022 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01F2DC385A4
	for <soc@kernel.org>; Tue,  3 May 2022 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651589422;
	bh=Sv9iN9b8WrxnZ29WO/MgDGWxAoIyjXu+BydNQtkraW4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=FhWuXt6Ahr8xq/bo5Akfx6P486pvOvklAL4p0jLHjh0EaqUxUsJ94ldyZ8BzKOoWS
	 pXnYfyNPLPJCf96Zo8T4RhQWx2jL+wAR351XxUKzvv1vgKhe4lSnwU9IwarX5hX7ju
	 E3kvlmvGXOG8urATKLbxA1py1Ww6AMH8ioyNbXdP9gNdXeHa0CLAqRPNF3i4pEQIOe
	 Nh4grIbezf0ZgImJtJxlAHKRI+9FSBPYS0Z3/pT6WyWjIKcS1n+KHz/oeSqd4ImcZV
	 FBT7JSOO7PstdU036xK7Ipvfgx5/8BJphopo5sN0L6nE4G1Yz0fJxgLS2QFmA2Ffwj
	 +7AHaIfmG9gJw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C59E5E6D402;
	Tue,  3 May 2022 14:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165158942171.22061.11747346146220737285.git-patchwork-summary@kernel.org>
Date: Tue, 03 May 2022 14:50:21 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/4] Maintainaer updates for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=636158
  Lore link: https://lore.kernel.org/r/pull-1651061256-836848@atomide.com
    Patches: [GIT,PULL,1/4] Maintainaer updates for omaps
             [GIT,PULL,2/4] Defconfig changes for omaps
             [GIT,PULL,3/4] SoC clean-up for omaps
             [GIT,PULL,4/4] Drivers changes for ti-sysc

Patch: [GIT,PULL] DTS updates for the v5.19 kernel
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=637343
  Lore link: https://lore.kernel.org/r/CACRpkdYngWscqak5phKm58O2GF0RmVETgwW4NCKTBiASdaEcyg@mail.gmail.com

Series: Renesas ARM defconfig updates for v5.19
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=634697
  Lore link: https://lore.kernel.org/r/cover.1650638502.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/4] Renesas ARM defconfig updates for v5.19
             [GIT,PULL,2/4] Renesas ARM DT updates for v5.19
             [GIT,PULL,3/4] Renesas driver updates for v5.19
             [GIT,PULL,4/4] Renesas DT binding updates for v5.19

Series: [GIT,PULL,1/2] Binding changes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=635606
  Lore link: https://lore.kernel.org/r/pull-1650961799-428630@atomide.com
    Patches: [GIT,PULL,1/2] Binding changes for omaps
             [GIT,PULL,2/2] Devicetree changes for omaps

Patch: [GIT,PULL] ARM: aspeed: Fixes for v5.18
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=637474
  Lore link: https://lore.kernel.org/r/CACPK8XdhLfafOfqvR0r7p6V6AhtNXD4uZGaz7Y+Y4P-rc9p0tQ@mail.gmail.com

Patch: arm: nomadik: drop selecting obsolete CLKSRC_NOMADIK_MTU_SCHED_CLOCK
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=630792
  Lore link: https://lore.kernel.org/r/20220410145623.2620380-1-linus.walleij@linaro.org


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


