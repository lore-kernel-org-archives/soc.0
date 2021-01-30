Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB26C433E0
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4B32364E09; Sat, 30 Jan 2021 11:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3473E64DDD
	for <soc@kernel.org>; Sat, 30 Jan 2021 11:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006208;
	bh=gR31lZbaYjU/q2I790wrYPyKdubifwkXbigLhSPHACU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=hCsHXg5uCitC7LDR0bLJokXKx5EWVmWU10MczxR5GQsVN/xc7IDdfJy4mvSxieJ8g
	 WrZHge9ihIw2nzYVKKNR32DHagX1R+zjC/nf7e722R66Li+0qrpKvT72BB1gGXVWJd
	 c01lJB8ZQqsy7RLlP1EW6AggSWfWpFHFKU0TPAdri16pTH+c6zY6t0qQsaAV2KKJ5I
	 3T77HMcFWaz86prY3/P6YGEhnjmP3BT4GkP8QkW3cPsaUP8rfeVSVPSS8hfrpzGoHR
	 uALI05fuUovAb+ZUfG5xvDUiBnAMLZXUhWezfBoE8fL+w1fdCc3LA+GigxGJDVBzE4
	 5ZWpiRKnm8izQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 217C060983;
	Sat, 30 Jan 2021 11:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161200620807.5475.5706224456577873216.git-patchwork-summary@kernel.org>
Date: Sat, 30 Jan 2021 11:30:08 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] Reset controller updates for v5.12
  Submitter: Philipp Zabel <pza@pengutronix.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=424465
  Lore link: https://lore.kernel.org/r/20210129153108.GA26994@pengutronix.de
Patch: [GIT,PULL] ARM: at91: soc for 5.12 #2
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=424331
  Lore link: https://lore.kernel.org/r/20210129090030.26976-1-nicolas.ferre@microchip.com

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


