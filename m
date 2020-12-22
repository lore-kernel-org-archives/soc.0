Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732DDC433DB
	for <soc@archiver.kernel.org>; Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 307142312E; Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 148A523103
	for <soc@kernel.org>; Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608656407;
	bh=RxvxTMzLYYN/nfh2GOUpEXyb90Foh3MldeKFi0E4mQY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=XK4XnS0uicfbe57OBieiO8Vw8BkFQtsNeVoZozksqkYsHxNqJE8qmk12IZ23qJ2eb
	 KnAXiPnbWa9B/LLofjrIU+ouS6FIZWI5Ih6VltBn5LGvLqIlGwcuG4yHQn4pGpmtXr
	 9G5md9ta7+K0m6gTHMSMQBEutG9TRSHLN+dKsxtI4GDQAZa7RyuHaovBp9i86EHR1Z
	 w5M0j0rJfptJAuYGAND7d6dv3OUR5uXP3iDR5EcZjSxsNe34amAB2nhGWzo8lOgCtK
	 M2xUXM9G1m50C3qp4rVLHet1NC6FEJkxozLAhOdMfKdAGwwxbs5o8927vUWtzyljA5
	 rUnH2adkrUqNg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 03D6B60113;
	Tue, 22 Dec 2020 17:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160865640694.31426.14387056833702803942.git-patchwork-summary@kernel.org>
Date: Tue, 22 Dec 2020 17:00:06 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: ARM: dts: ux500/golden: Set display max brightness
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=401867
  Lore link: https://lore.kernel.org/r/20201214223413.253893-1-linus.walleij@linaro.org
Patch: [GIT,PULL] Few regression fixes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=400335
  Lore link: https://lore.kernel.org/r/pull-1607674932-973902@atomide.com
Patch: soc: mediatek: mmsys: Specify HAS_IOMEM dependency for MTK_MMSYS
  Submitter: Matthias Brugger <matthias.bgg@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=399673
  Lore link: https://lore.kernel.org/r/20201210115124.1285-1-matthias.bgg@kernel.org

Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


