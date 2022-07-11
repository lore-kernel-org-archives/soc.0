Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9A0C43334
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C385FC341CD; Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A880FC341C8
	for <soc@kernel.org>; Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657556427;
	bh=zQU96ghCYwC9EIK5wFUm1Jo0kUb7yn3aQJlHZWCWZRU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Sd336Y148IWP4EzUcpRBNPTId6dUJPV5dSHVxF8YdpjwYyAYDWQq/NOpSudi8HD7g
	 RgciTopsGIupbEBUIq5WzDI2kzSSJWBsAELIsUJc6H+fN/4Nb/V69k9+779geew1+M
	 28FCuHjuJjulxGOi+leVaeWEhhtHDYAet5+yFhc8cXnoIH09gxrYrsgVCxPIqNC4GU
	 922lyW5K6dcZDQbTC2dQ59HKE5lQBVGaMXEQ2QpMfsQsGERXEkMGNYVkd+1w1RGnKf
	 aw32RP4l0d4yjLkHCRlzGKIBg0G3jHzU7TMCSj43IYmrOAiETXjOS+T3qE0eRnXZsI
	 /fCyFLHEqD90A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8A2D5E45222;
	Mon, 11 Jul 2022 16:20:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165755642756.9192.4344593268925543518.git-patchwork-summary@kernel.org>
Date: Mon, 11 Jul 2022 16:20:27 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: NVIDIA Tegra changes for v5.20-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=658015
  Lore link: https://lore.kernel.org/r/20220708185608.676474-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/7] soc/tegra: Changes for v5.20-rc1
             [GIT,PULL,3/7] dt-bindings: Changes for v5.20-rc1
             [GIT,PULL,5/7] ARM: tegra: Device tree changes for v5.20-rc1
             [GIT,PULL,6/7] arm64: tegra: Device tree changes for v5.20-rc1

Series: [GIT,PULL,1/6] i.MX drivers change for 5.20
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=658116
  Lore link: https://lore.kernel.org/r/20220709082951.15123-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/6] i.MX drivers change for 5.20
             [GIT,PULL,3/6] i.MX DT bindings update for 5.20
             [GIT,PULL,4/6] i.MX device tree change for 5.20
             [GIT,PULL,5/6] i.MX arm64 device tree update for 5.20

Series: [GIT,PULL,1/3] TI SoC driver updates for v5.20
  Submitter: Nishanth Menon <nm@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=658069
  Lore link: https://lore.kernel.org/r/20220708232655.reqjdbib52ejdja4@unadvised
    Patches: [GIT,PULL,1/3] TI SoC driver updates for v5.20
             [GIT,PULL,2/3] arm64: dts: TI K3 updates for v5.20
             [GIT,PULL,3/3] ARM: dts: TI K2 updates for v5.20

Patch: [GIT,PULL] i.MX fixes for 5.19, round 3
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=658104
  Lore link: https://lore.kernel.org/r/20220709032716.GA9868@dragon


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


