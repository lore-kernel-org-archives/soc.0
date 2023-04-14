Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9AFC77B77
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C339BC433AA; Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A991EC433AC;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681477830;
	bh=q2LoNDNQJix5Mi+/1Ivm4NlucG822h80/DWH68Ufdmg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=L0pt6uUTDACW33GwJ8zKQVf5j/J1Tej0N1i5RoWlCoUfWDEvdzJnq0dmjPomJlZSL
	 8R+6IYZDjmFNovUuHweIsxhktAiJeqIeCDFJSUJxaPWMltdYtKwF7T45iP2hoSpdY7
	 EHZDU98OnHr+yRg7erkWsD9blQ5HhwMNG8SjgG2YYVuIhgMxrgju1g3EM5Y3tQE51q
	 1Iqsz7TF9wlBQn4H+n1Fovstj2t7JHsCp6ShpWLhTkkoVkUSJr06TUTR8DNLHouO9E
	 o2nIpUUkkpgN4xkF7hzqFiWVPaVhAH1zHk1i8MJUB75LHm8o3jt9yygIWeJ+XnjC8x
	 TXntCTzWnUMrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 81740E52505;
	Fri, 14 Apr 2023 13:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: configs: Update U8500 defconfig
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147783052.23940.13346241093237737135.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 13:10:30 +0000
References: <20230405105439.1739575-1-linus.walleij@linaro.org>
In-Reply-To: <20230405105439.1739575-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  5 Apr 2023 12:54:39 +0200 you wrote:
> Update the U8500 defconfig accordingly:
> 
> - Add the NFC modules used by some U8500-based systems.
> 
> - Switch out the now deleted UX500 crypto drivers to the
>   STM32 drivers that we have augmented to work with
>   UX500.
> 
> [...]

Here is the summary with links:
  - ARM: configs: Update U8500 defconfig
    https://git.kernel.org/soc/soc/c/344cad0660ea

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


