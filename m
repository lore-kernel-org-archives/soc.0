Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8980BC433EF
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 73C73C36AE8; Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C167C36AE7
	for <soc@kernel.org>; Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1640010612;
	bh=lEOrQyUjob5mvhLm2pxV05peEanQHN2nYrSSkrfdhZ8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=JpKiyCtlMjRRjOim7Clknx1n7xkkAi8Uh7lD001ULn4Zz7kjOdIgOcDeDQ7WRtvWo
	 p/STwlHlcqEYa7IgpBDsf8Tc4G14Jy/8GDOFkI6beTgZznfcJn0BJkFukHLch1geuX
	 xbUpD+QhIJ2ZgMLyFCFw12nMtVHtaI4ddB7CCCz2f4tDheUdSbGbA3gMPT7+TzlYcQ
	 KhdC7Po0qdzSIpg5SyJnK2D1Zk0diBoQ7ZBc9Jjsdbh6Pi3AJKw23489XiSDXZITfc
	 N+XZ66SbOnmG/PscqGyys22Gvf3Vl0MJLKKdYOiKiR0O2pI9KmIbkCulchC+hDNseA
	 TFI1bihaSlraA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4B27960979;
	Mon, 20 Dec 2021 14:30:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164001061230.9073.14585891390050343186.git-patchwork-summary@kernel.org>
Date: Mon, 20 Dec 2021 14:30:12 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: at91: soc for 5.17
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=597535
  Lore link: https://lore.kernel.org/r/20211217164134.28566-1-nicolas.ferre@microchip.com

Patch: [-next] reset: starfive-jh7100: Fix 32bit compilation
  Submitter: Emil Renner Berthing <kernel@esmil.dk>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=598217
  Lore link: https://lore.kernel.org/r/20211220121800.760846-1-kernel@esmil.dk

Patch: [GIT,PULL] i.MX fixes for 5.16, round 3
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=597779
  Lore link: https://lore.kernel.org/r/20211218052003.GA25102@dragon

Patch: [GIT,PULL] soc: Keystone driver update for v5.17
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=597509
  Lore link: https://lore.kernel.org/r/20211217154921.cagzppcensxx6wm4@pension


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


