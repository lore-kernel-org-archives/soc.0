Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743BBC49EBF
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D61D46140D; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BB2B0613FF;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=hJ3i/8SyBxrHhPObVGEBwYbwhwVZHMBe5vypzQpn8rI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u5rqVIIZ+Q4qQ26NTKXwQkISOhtYIPK7HvF/XTMdebHpIuEUQKl1YlSMe8vFeeQEb
	 9LFjViiGZjGGPIcmGSlXAtf46Kp45CGS8C9oFPrzo6HqH2dadVuNcJyeXQ6GSdeVdr
	 fuLiKRv+s7UuJg3UUhW6QRTSS6WOIPcC4OZpzEQ4M+zM3dKirD2hrtVRulLvXVJPEr
	 LxZL/qXMJjRQSWe/QwFVKqYNH2QBv+c6XoFsmyMQBBb2IfKiH1+5PlxB/13Lr+dfJz
	 9ZHBtnRrTBtR2wdhFBvYWSUp4Zw5HqLS4YuJI3alk+QnqkVIaud6OVQkLHtT6lrrt/
	 9Kd7Z7JIecBDQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B3DE460D31;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: dt for 5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421673.27448.16424537313801345714.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <20210611123446.20510-1-nicolas.ferre@microchip.com>
In-Reply-To: <20210611123446.20510-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 11 Jun 2021 14:34:46 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are the first batch of dt changes for 5.14. Very small amount this time.
> 
> Thanks, best regards,
>   Nicolas
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: dt for 5.14
    https://git.kernel.org/soc/soc/c/9495e151f1c7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


