Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F56C4167B
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 14:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F80AC341C5; Fri, 27 May 2022 14:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09B6CC3411F;
	Fri, 27 May 2022 14:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653661215;
	bh=MTWyaf4wXXsKVMeBgHkil5VofCOB7OI8h5oAvm8X7xk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dxHTWC4Y7gipPsaT5ke3Gs+IBwdi919QOExwAKSUGv57IgvLxv1w8vmRREjXCWz74
	 ZtVQAhWau+2Nuj3nEhM6W0yZMcQRAc0OE72T8WsB4FCZNmtllee3jsDqWhOOh9yqd4
	 ImPrwkzgeIKzI3NZpOPBFwwBL4NjtxfdS1VqJz4cxNK4w0+T83JOaDtZWAeBRUF6Ts
	 ZG3CuPe2rNx0OErgXdqRX29wIy+Kp74Zl4X+VHmzFkWEjVem7cBzIrLV7ZYoD/oF66
	 YADt69cLMfntJYGp9njJldNCNIiCB1VAUmDQLgG9ZcMJ9Xi7SZWVj9OYy3G13TD7yL
	 qbzgz3P7ALJUg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D42AEF03950;
	Fri, 27 May 2022 14:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: configs: enable support for Kontron KSwitch D10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165366121486.3919.5552484325441531524.git-patchwork-notify@kernel.org>
Date: Fri, 27 May 2022 14:20:14 +0000
References: <20220518141542.531148-1-michael@walle.cc>
In-Reply-To: <20220518141542.531148-1-michael@walle.cc>
To: Michael Walle <michael@walle.cc>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 18 May 2022 16:15:42 +0200 you wrote:
> The Kontron KSwitch D10 is based on a Microchip LAN9668 SoC. It is a
> managed ethernet network switch with either 8 copper ports or 6 copper
> ports and 2 SFP cages.
> 
> Enable all required kconfig symbols, either as module where possible or
> compiled-in where it is not possible.
> 
> [...]

Here is the summary with links:
  - ARM: configs: enable support for Kontron KSwitch D10
    https://git.kernel.org/soc/soc/c/01ba87a4b792

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


