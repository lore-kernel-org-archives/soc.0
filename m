Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B4DC3DA51
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D4BEC4AF17; Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0776DC4AF15;
	Mon,  8 Jul 2024 15:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720451508;
	bh=e5mAkDaWkfsVTorDt2QQLHz8yEvezc4qlkgCPIkMAts=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MQ6rtfnP6s3PMBZtCXldi3rkLbsadMu+se+crNjPRWDvojvxp8iwJFFXaHXXqNg+9
	 LNqdlrcR8IaZ0hXpsvp7Sq4kdXzeMEj6jWAmO+0iw/02tDj/TTbe64rNpHxY7szfuL
	 CIV5CcOplHfzGtj1kTxun25DJVnR6EtEltDq6D/2QHRtUgj4Zv3dC4nknityLnjNej
	 u089UFcQcabYE1xOYis26wOLlh4s9RzorGWkbv7swrEwpUSOvpzHXkWR3eOokamkSQ
	 +TpzYKLQ4pbWyMkssp9nPupN0UUzssDuaaiIOFrw6FTVQzUrDhLe/0R0Z1VJ6s7Aba
	 k2Dnt1Vte8THA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ECC8ADF3716;
	Mon,  8 Jul 2024 15:11:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: ixp4xx: nslu2: beeper uses PWM
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172045150796.17395.16688186018753918669.git-patchwork-notify@kernel.org>
Date: Mon, 08 Jul 2024 15:11:47 +0000
References: <20240703-ixp4xx-dts-v1-1-e5149da36f6e@linaro.org>
In-Reply-To: <20240703-ixp4xx-dts-v1-1-e5149da36f6e@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 03 Jul 2024 15:23:41 +0200 you wrote:
> The beeper in the NSLU2 is just a GPIO connected to a
> speaker, so we need to use PWM on the GPIO to get any kind
> of sound out.
> 
> Tested with some random beeps by enabling INPUT_EVDEV and
> running beep.c with e.g. beep 400 for a 400 Hz tone.
> 
> [...]

Here is the summary with links:
  - ARM: dts: ixp4xx: nslu2: beeper uses PWM
    https://git.kernel.org/soc/soc/c/8b5d415c4f9c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


