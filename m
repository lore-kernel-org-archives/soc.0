Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5758AC4320E
	for <soc@archiver.kernel.org>; Thu, 19 Aug 2021 15:30:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2DB816115A; Thu, 19 Aug 2021 15:30:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1489261051;
	Thu, 19 Aug 2021 15:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629387005;
	bh=sKynCcyHmNMyyV/kxQ6OpcsIkBkDD+wYk7HxN82enrs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Efmk3Dl4s+iIAgZ66Jv+hOh6HNwSiwKtpzoUG21qXYjR7eE1WZY/4HrTkiCOzXRys
	 PvVHPW7oHFAvVMnBhV4SMRv3ohs5qW2PRmznyCZTBSv3UhUtgh10o0SMFiqvLX1BNu
	 thQ7CMtCoW8hRry9OzX7wQJnkxRIbyb/FY+PPexbDBgfNPsttT3rOwp3IuYCbHKUT9
	 XCYKHsLasQxH88Tw2KqW/Cx1j0T953o1QGA4RCcbiS2eQCdna1kzZYWYKS3tX3nx4q
	 MfdxGw9GSUYXYI0hnIexbkGmQSbDxGRnVJgUGha6exArTK30J9HjFb/kLAgk8Tq5gN
	 RtUKEYI0kP8dw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 07CA560A50;
	Thu, 19 Aug 2021 15:30:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][PULL/direct] ARM: s3c: delete unneed local variable "delay"
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162938700502.11207.1464442133471249406.git-patchwork-notify@kernel.org>
Date: Thu, 19 Aug 2021 15:30:05 +0000
References: <20210818204422.17919-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210818204422.17919-1-krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 18 Aug 2021 22:44:22 +0200 you wrote:
> From: Jason Wang <wangborong@cdjrlc.com>
> 
> "delay" variable on line 79 can be deleted by returning "0" on line 88.
> 
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
> Link: https://lore.kernel.org/r/20210624055627.22295-1-wangborong@cdjrlc.com
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> [...]

Here is the summary with links:
  - [PULL/direct] ARM: s3c: delete unneed local variable "delay"
    https://git.kernel.org/soc/soc/c/319a1b58f6c7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


