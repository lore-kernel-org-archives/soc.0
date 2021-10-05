Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94CF2C4332F
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5151261526; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3A90661502;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633441809;
	bh=+oApUjwYWxnrID9UV55HB5X5ocrj53D6KaUXijN6aeA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AjT0hn6lSRsSYwKCQQ67gnRBZOUZv+MUE1JS3oY4ELnjHAs3SN6wWF5STlNIhdbkp
	 80n7Zw7AkxTQHOOm8oB4Zq61dzEWSJIY8EmukrvLdFrBtY0hCUX8SFaOMueJGPkEU2
	 7d6AZ6kndRh5cNJPPhfEFZER91D7IK9FmGTzm5YHZ5gSsm06qaumZDECHnOYaM19Vx
	 PaBAn8ozSmonXQJoeZ2n8lryoGOM/mKmADQUYHbDMtyVjUDGAt/+yuMeIvQkzFWMqX
	 mYf0o1u9DVn7OW7cOBdqnh3gWroBCWpp9TU63nH/GkNEHpjBqQzw2fsYiEYJycFssQ
	 5fgcz3klXin7w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3136260A3A;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: omap1: move omap15xx local bus handling to usb.c
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344180919.2242.1351810085839590302.git-patchwork-notify@kernel.org>
Date: Tue, 05 Oct 2021 13:50:09 +0000
References: <20210927144118.2464881-1-arnd@kernel.org>
In-Reply-To: <20210927144118.2464881-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Mon, 27 Sep 2021 16:40:50 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Commit 38225f2ef2f4 ("ARM/omap1: switch to use dma_direct_set_offset for
> lbus DMA offsets") removed a lot of mach/memory.h, but left the USB
> offset handling split into arch/arm/mach-omap1/usb.c and
> drivers/usb/host/ohci-omap.c.
> 
> [...]

Here is the summary with links:
  - ARM: omap1: move omap15xx local bus handling to usb.c
    https://git.kernel.org/soc/soc/c/94ad8aacbc2d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


