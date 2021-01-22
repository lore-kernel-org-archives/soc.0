Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEC4C433E0
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 23:00:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4D98123B06; Fri, 22 Jan 2021 23:00:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 35D1023AC8
	for <soc@kernel.org>; Fri, 22 Jan 2021 23:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611356411;
	bh=63C9lasRMcXNyfqSTyAqCnbp+taUZMgb3xaP/ppvIUw=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=oOHfJwIx5MKqpZ5CAoiwQ2su3kG28vX1zWng4EQ6jFkKUm1LGRzYaOUZi5n/6Z9mz
	 51aq47vxjjuANvMPLRbYDxW5ExRA2bcmUZ8f0u8ooRgzoZ1BnXwNAJw46I22FqjHto
	 6xWMKhd2r+YemfsOcwHfCQq5uBDE/LM9KxxpQ5KQXSszj5o1EHZqHK7eLhmgHcuq3l
	 K11HnjG612qYwOZJe7yJCx561So9B3ayPQi6SFCxlebQbf5EF/kIflwhlutDwcwsye
	 xXK25vIy6xKNmuWAoMd7eO5GuSwFHFoNN/9ocqx3XMEpzmn/UmLAu2ehF3t4VfaEth
	 0iQFQsejEOkYg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 22601652D1;
	Fri, 22 Jan 2021 23:00:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161135641106.29035.3022552300825678437.git-patchwork-summary@kernel.org>
Date: Fri, 22 Jan 2021 23:00:11 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: MAINTAINERS: Include bcm2835 subsequents into search
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=419475
  Lore link: https://lore.kernel.org/r/20210121203302.3639841-3-f.fainelli@gmail.com
Patch: [GIT,PULL] i.MX fixes for 5.11, round 2
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=417311
  Lore link: https://lore.kernel.org/r/20210119091949.GD4356@dragon
Patch: [GIT,PULL] OP-TEE driver fix for v5.11
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=419665
  Lore link: https://lore.kernel.org/r/20210122074234.GA1074747@jade

Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


