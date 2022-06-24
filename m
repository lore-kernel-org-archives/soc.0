Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E93CCA481
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 16:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 114F3C341CE; Fri, 24 Jun 2022 16:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9AE3C3411C
	for <soc@kernel.org>; Fri, 24 Jun 2022 16:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656086414;
	bh=BImar5V9fxRILQzKBz+48CFNklv00wsL9eEKSN+rM7M=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=D5L89k/rHM/rPjXndVmwGcmo9GwvJlnSTffCdywHm6OKBb2OPEsXTv9mokwMT0TB4
	 JJjmUJLTntkyCIup2tS7MM0TEZq2JGvduttXcMoDMJBWSM75CKxPD29kTVx0DJulUZ
	 FDmPkrXO4AKjHn0biHLEu5WLn3ZXiVAqt9Q2iny06Aga30U9q3RRfModQinCqdWUJq
	 41vXsxOS+FQ7GyrXFnGBBk7PDMTLBg784qdyjZ7wh7+VwJ8ty1AbSGdD4q2s5ZrhrF
	 DjjnkrL+hi2WUdh8qNo5em5J6eKlB4J0tlvEEzx0G/OXVaMT88NMm737/XGre7gC1L
	 PtZ2SNp1h2JFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C02B3E574DA;
	Fri, 24 Jun 2022 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165608641371.3411.17669885978824514952.git-patchwork-summary@kernel.org>
Date: Fri, 24 Jun 2022 16:00:13 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Broadcom devicetree fixes for 5.19
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=652074
  Lore link: https://lore.kernel.org/r/20220620170745.2485199-1-f.fainelli@gmail.com

Patch: [v2] arm: mach-spear: Add missing of_node_put() in time.c
  Submitter: Liang He <windhl@126.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=650943
  Lore link: https://lore.kernel.org/r/20220616093027.3984903-1-windhl@126.com

Patch: [GIT,PULL] arm64: dts: TI K3 fixes for v5.19
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=651624
  Lore link: https://lore.kernel.org/r/20220618031627.xxvscc22c6doaa3t@kahuna

Patch: ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=653458
  Lore link: https://lore.kernel.org/r/20220624070511.4070659-1-joel@jms.id.au


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


