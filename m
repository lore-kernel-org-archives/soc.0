Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670AEC3DA42
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 471D9C4AF0D; Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 310B8C116B1
	for <soc@kernel.org>; Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720449061;
	bh=OQEmCSYlxduA4vZ0x9yRjjtTOq+I5ihFlenhMBKicFY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=QuviPUi8myZgrvqJb5om2TjTLptqoa55X2/3sXlG/hbx3+TP78OWdEF/U8ixDUz5G
	 se2HK818/KvCIOltUkAzJg0/qOcap4NRa7FnZlwXnlZXCiBdV5NQp6aAhWHuX85unw
	 GRE1E/xOLopolKQikqF3O91jhQIuJiTktQCW6PVyJgq9nKC4qA+RuTxbWFpRzRCcfR
	 6vOkn2Erty2NX7M0XGOvKqaUNVT5+15z6IIkkJaTKHprYkj4Fu3Ia64rBZuNx/ZfZe
	 ioRgpSG8LGmp9zyFxq0Rmc1Rfwq8AYZsQkaNiJGsJB5I8y8AhikQ4puenMKgCjpv6Y
	 jLbDA23I7wCCQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 17549C433E9;
	Mon,  8 Jul 2024 14:31:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172044906104.22805.17088784666824660893.git-patchwork-summary@kernel.org>
Date: Mon, 08 Jul 2024 14:31:01 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for v6.10
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=867372
  Lore link: https://lore.kernel.org/r/20240702030913.340814-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm driver fixes for v6.10
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=867375
  Lore link: https://lore.kernel.org/r/20240702031157.341031-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm Arm64 defconfig fixes for v6.10
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=867368
  Lore link: https://lore.kernel.org/r/20240702025740.339563-1-andersson@kernel.org

Series: [GIT,PULL,1/3] Allwinner SoC fixes for 6.10
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=867613
  Lore link: https://lore.kernel.org/r/ZoQY5k21RQLOrBQ3@wens.tw
    Patches: [GIT,PULL,1/3] Allwinner SoC fixes for 6.10


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


