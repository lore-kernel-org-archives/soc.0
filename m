Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31068C433F5
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 21:50:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F34FB60F14; Mon, 11 Oct 2021 21:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DC88860F0F
	for <soc@kernel.org>; Mon, 11 Oct 2021 21:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633989009;
	bh=KtLChkRwkhBwDadJ0sFOoa90MLQh7LhoQ53jWGynSvA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ekkbCfIRiXIz+a1kSeYbhl/NnnuzFJQ6n1Z0y1uVmKjMspabLUgiWjQGNIu+JC2Vz
	 ajkzg1z5+es0debMal3JyJZdDWQknmObe1ZhYHrWHx6zmuNFC0q0CmDVsG/5O5C5MR
	 Lsmgu8NStzg008R2rEUeF1DSP0ELBxdsgIsyueZKgUggqOKD+1aQZ3jYbgtvhd4Ui1
	 hpk0xDwhuiM3/2FovGsLF2+aHbc40B15CbpKQpgdLj3hTWmcJWNH9o4ao98QmVgwfu
	 Togz04K6LENUKUGQrhtp0S7/Uu3Tc8NvQBUcp5eJbMGzKHEhxdDx7DilKNXHICM40O
	 SH2eCgVeB6Acw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C94F1608FC;
	Mon, 11 Oct 2021 21:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163398900976.3472.9300997212016825100.git-patchwork-summary@kernel.org>
Date: Mon, 11 Oct 2021 21:50:09 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Add Unisoc's UMS512 support
  Submitter: Chunyan Zhang <zhang.lyra@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=559645
  Lore link: https://lore.kernel.org/r/20211008034533.343167-1-zhang.lyra@gmail.com
    Patches: [v2,1/2] dt-bindings: arm: Add bindings for Unisoc's UMS512
             [v2,2/2] arm64: dts: Add support for Unisoc's UMS512

Patch: [GIT,PULL] arm64: dts: ZynqMP DT changes for v5.16-v2
  Submitter: Michal Simek <michal.simek@xilinx.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=558909
  Lore link: https://lore.kernel.org/r/9815867c-ffbb-fc9d-64b9-badee5e2862b@xilinx.com

Patch: [GIT,PULL] ARM: at91: dt for 5.16
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=561069
  Lore link: https://lore.kernel.org/r/20211011123438.16562-1-nicolas.ferre@microchip.com


Total patches: 4

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


