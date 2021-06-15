Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54ECC48BE5
	for <soc@archiver.kernel.org>; Tue, 15 Jun 2021 16:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8ADF1614A7; Tue, 15 Jun 2021 16:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 73F0060FE9
	for <soc@kernel.org>; Tue, 15 Jun 2021 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623772807;
	bh=ncHllvYpHZbMAvJmWCwsogIxRFJtn1Sxc2roLUOXC2E=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=pxI+YsKw6JS0L9lFDZW3QIwBYwFQmHP+5QA3awTW8f3TCOzVgD0sJux8iMkMhg5ne
	 ILdq6pEqcCLc3lHjQJWtd9hGk2ioNnkFtjkS/hxu6bf5incMeCGIlbkMzRjuVMhKQE
	 n2m8m463efdwOV3nScDte3ANRfzk7lXW8HhQCrxvSyzgVNewyYK8IC3wJZLx990JA4
	 vY7nPLeGxL4oPYmFKnCpMQVXG91jDCqpYnufiS6I5sbLiyD+syZ+hydeb3OWjoFuD9
	 prc8l2KiixD01rBm8rSEhCIAZgAF4woavHwEeaGtyL1DDrXMEmR7uN2DFhYMH3BE2H
	 +vaTQq+pYSXfg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5F711609E4;
	Tue, 15 Jun 2021 16:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162377280733.17464.7947172619562102504.git-patchwork-summary@kernel.org>
Date: Tue, 15 Jun 2021 16:00:07 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: ARM: dts: ux500: Fix LED probing
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=499549
  Lore link: https://lore.kernel.org/r/20210613123356.880933-1-linus.walleij@linaro.org
Patch: [GIT,PULL] Qualcomm DTS fixes for v5.13
  Submitter: Bjorn Andersson <bjorn.andersson@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=500203
  Lore link: https://lore.kernel.org/r/20210614215552.391887-1-bjorn.andersson@linaro.org

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


