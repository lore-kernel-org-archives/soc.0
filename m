Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C43B8C433E9
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7C6B664F55; Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6455864F37;
	Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613056808;
	bh=VaSrqyfESwnhwlkTtLnwJcQF3tSf7gX2gZJCnz6L9jk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZH878XfxXJGYuLV5y3wvZI42LRapQAb1p4XPoebSedF7/efemxWg+qYrlkuOwEdbK
	 m8ld7lvxVzgJAa/y7mTq2MTw5BSrRFwtOVyOA6eUz9zpYiXytfDDL0I3H8Mu4qsGBd
	 +ckdis+LUBOiV8tD3Z9CsU34O7eP3z6uHWWlvcPlZYnQVPUOMJEKSgwD7T4poTql9L
	 o8iCe5lyDfk/pU5IIZ73vQxkEjgNevxwAnL2wbmJZX4R6bYL/+RwV+rWU5SmxwEspR
	 PWOlIwduu/W1ViJqunrzI6doi7/nnDJmTmuuUDWn7gEzPiLp7wkU7mTevb3gzzF0FH
	 SSopzD7GY1pyg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4FFA960A28;
	Thu, 11 Feb 2021 15:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: arm: samsung: include S3C headers in platform
 entry
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161305680832.9082.3472043358629015047.git-patchwork-notify@kernel.org>
Date: Thu, 11 Feb 2021 15:20:08 +0000
References: <20210210172303.335268-1-krzk@kernel.org>
In-Reply-To: <20210210172303.335268-1-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/for-next):

On Wed, 10 Feb 2021 18:23:03 +0100 you wrote:
> Several S3C24xx/S3C64xx headers in include/linux are not caught by
> Samsung S3C/S5P/Exynos maintainer entry and might look like abandoned.
> Include them in "ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES"
> entry.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: arm: samsung: include S3C headers in platform entry
    https://git.kernel.org/soc/soc/c/36de760a5a90

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


