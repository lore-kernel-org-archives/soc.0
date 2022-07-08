Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C7BCCA47F
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 07:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6526C341CB; Fri,  8 Jul 2022 07:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCD15C341CA
	for <soc@kernel.org>; Fri,  8 Jul 2022 07:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657266614;
	bh=wBq8OpYaIfhJGc8rwQwZvAoRQ27k+lKphi2JyO2jCII=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=aC1VnZKW5/V8Nl9QdOHJQFkIWpmcpGIhlrEbk0IrtMbwqtw8S23t1Cz9vvfcHYdt0
	 Uf78tNK0fk4yoO0Dc8a893oBwonwfd2EN4FiQhugmseiJPGAmogVuBRTTf7huVCA1E
	 iAuBoNolHIcXZWu8HIKvKVHIT0QFMu3VC0VV8D20rLxFnwYygfXg+5llV/5PYaZ/me
	 Gd7wpVj2oGN8+zNWf+C45z87dbJpTvAHGXddrWjZvutQAOHYH0s73+UOzouLCpCqJ4
	 ZMdvTwpGuUaDSpmlJ0SRGSKPHEYjLKYwid/2+qytl46pUVchuphyOvPtRZZAhg/JKI
	 +45bizyH+78Tg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B4CD7E45BDB;
	Fri,  8 Jul 2022 07:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165726661473.10888.4353124721902763282.git-patchwork-summary@kernel.org>
Date: Fri, 08 Jul 2022 07:50:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: soc: ZynqMP SoC changes for v5.20
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=657444
  Lore link: https://lore.kernel.org/r/0196d1f3-e9c7-ef51-143d-e98b14980f63@monstr.eu

Patch: [GIT,PULL] Reset controller fixes for v5.19
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=657354
  Lore link: https://lore.kernel.org/r/20220707101344.3329314-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] ARM: dts: Zynq DT changes for v5.20
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=657450
  Lore link: https://lore.kernel.org/r/87d2bd4a-b90d-6396-17c5-c95ac64d17d0@monstr.eu

Patch: [GIT,PULL] arm64: dts: ZynqMP DT changes for v5.20
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=657458
  Lore link: https://lore.kernel.org/r/452e8c68-b63b-f4f6-a937-67f65c64a8a0@monstr.eu

Patch: [GIT,PULL] ARM: soc: Zynq SoC changes for v5.20
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=657447
  Lore link: https://lore.kernel.org/r/e1d0a721-afa4-93a0-7119-0e4481a0624b@monstr.eu


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


