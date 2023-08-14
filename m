Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106C2C001B0
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 17:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E90D6C433CD; Mon, 14 Aug 2023 17:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE545C433C7
	for <soc@kernel.org>; Mon, 14 Aug 2023 17:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692033026;
	bh=12pZwF9ybrii095Daq2vabMwpHOHLApXwQmSHSXWMsg=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=C+LsYcd2rFTya/yva0cGZmKiPkO27hLGI994PN3Erlz05dNTS2nADLrIcsXjMeJHH
	 v70KOoXO3ve9M1dF8wLCena4/25O4vV0HE+WL+zX+QHt30GOFkD1fIbK1XxE0Z1SBq
	 Op+eIAP/gF+foF1ub0GW8k7n1f16/SrMaXLk+6WgyHLVmDCbEcrVQdF3gvV8yfoWIB
	 KCNdj/fBQzzLNaqVnMK0tzs4F5Kn+YcZoIfU7Z7cmd69FWIVUyFM49eIfDamMkSNa3
	 VSW9ENfddc96FqENLIP8DtkM/ROIW963PrOk52KZwaeI4mdqiqx9Zzu8V30jl2A1oX
	 o8bSDhu3OcxjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A74A8E93B32;
	Mon, 14 Aug 2023 17:10:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169203302663.15030.12327491109082088570.git-patchwork-summary@kernel.org>
Date: Mon, 14 Aug 2023 17:10:26 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/6] i.MX drivers update for 6.6
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=775738
  Lore link: https://lore.kernel.org/r/20230813133354.847010-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/6] i.MX drivers update for 6.6
             [GIT,PULL,2/6] i.MX SoC change for 6.6
             [GIT,PULL,6/6] i.MX defconfig change for 6.6

Patch: [GIT,PULL] ARM: mvebu: arm for v6.6 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=775688
  Lore link: https://lore.kernel.org/r/87jzu0t0mu.fsf@BL-laptop

Patch: [GIT,PULL] memory: drivers for v6.6
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=775939
  Lore link: https://lore.kernel.org/r/20230814120052.27485-1-krzysztof.kozlowski@linaro.org

Patch: [PULL] final oxnas removal for 6.6
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=775880
  Lore link: https://lore.kernel.org/r/3f91bb89-bf7b-d967-a302-2a8e1b0c3b01@linaro.org

Patch: [GIT,PULL] ARM: mvebu: dt64 for v6.6 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=775690
  Lore link: https://lore.kernel.org/r/87edk8t0kl.fsf@BL-laptop

Patch: [PULL] ARM: s5pv210: Explicitly include correct DT includes
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=775930
  Lore link: https://lore.kernel.org/r/20230814114051.25840-1-krzysztof.kozlowski@linaro.org

Series: [GIT,PULL,1/4] soc: ti: Driver updates for v6.6
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=776030
  Lore link: https://lore.kernel.org/r/20230814160633.my3xbk5k2pxkvjyi@degrease
    Patches: [GIT,PULL,1/4] soc: ti: Driver updates for v6.6
             [GIT,PULL,2/4] arm64: defconfig: TI K3 updates for v6.6
             [GIT,PULL,4/4] ARM: keystone: Updates for v6.6

Patch: [GIT,PULL] ARM: mvebu: dt for v6.6 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=775689
  Lore link: https://lore.kernel.org/r/87h6p4t0lv.fsf@BL-laptop


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


