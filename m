Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1378C10DC1
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B08E8C43391; Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AFE6C433CA
	for <soc@kernel.org>; Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701883050;
	bh=AEOIFo40VzR5G/Abv9MlpvskZMKh5YJkDVB1zFvWG7o=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=mGoxeEbrzyYQXZoVcOTA3uEufYp9RJpVKmVfLKn4vWFRKjKpx+LNagRcmdiqVLX+C
	 OLED4k7f1hZBzk19rcBOkdyvzu3I2oomj8QnuYxBiPWvhZrO+o1R0j4qlFx8e+rBu5
	 tr5SIRMu8jsHofwJHMDJq7t31bCuBvFDASObHNQWOCgvmtNREyNhtgWVYv/YqmfR94
	 lIrzmsV0p/4l+rn3gH5AU+3X42F7HMDJvVQ7gRjUiIPqCTYfeoqcLN8VXqCnUjULw0
	 DYay4MufmzzQsGs86PzDSV2xxIygVlHkduGQgxA0DzhjF55c7E+QGzfNVHZuouKIhw
	 SpSPUSqEDvdCA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 783BFDD4EEE;
	Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170188305042.32642.7659232829314871330.git-patchwork-summary@kernel.org>
Date: Wed, 06 Dec 2023 17:17:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Renesas SoC updates for v6.8
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=805982
  Lore link: https://lore.kernel.org/r/cover.1701433485.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/2] Renesas ARM defconfig updates for v6.8
             [GIT,PULL,2/2] Renesas DTS updates for v6.8

Patch: ARM: multi_v7_defconfig: Add SCMI reset support
  Submitter: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=798583
  Lore link: https://lore.kernel.org/r/20231103085400.2924282-1-etienne.carriere@foss.st.com

Patch: [GIT,PULL] Apple SoC mailbox updates for 6.8
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=803651
  Lore link: https://lore.kernel.org/r/6e64472e-c55d-4499-9a61-da59cfd28021@marcan.st

Patch: [PULL,v2] bus: Convert to platform remove callback returning void
  Submitter: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=804953
  Lore link: https://lore.kernel.org/r/20231128174927.m46dgp4juig2omci@pengutronix.de


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


