Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93F0C43460
	for <soc@archiver.kernel.org>; Tue, 18 May 2021 13:40:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7E0416105A; Tue, 18 May 2021 13:40:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 67F0761074;
	Tue, 18 May 2021 13:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621345209;
	bh=yobA0qpS4IzGqtE1gFX/8znoqtiQtQ3kDFWw3ZPUYHQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lCdrhGaLlEgJOKe0uJ5DqQEkOw6NVlPNgHys+KA6C7D4QPBM98QYRtco1diEM6osC
	 Wke9aEikaIBZdaGY9WvhqeKs8z6kOdr24e9JKQbHU/9xZSpfTUdfBqmjqEQGaZ5FNJ
	 Q2BBCj9aAPaNQcFHev2ylz2/VkULNXwgFZXkG6Wr65F8KoQfko5oYWE2XZMAXc37MX
	 z3YOGMAGImsizhwZ5F8zUYeA9ho0u+uSDSXltoJQtQAJXBzbUeI5zpadulO05Hgk+Q
	 zck8eFgSrHiKlt2S8vNrnbumIZvhU24xgl3pOh8pV7kYMCxeLEZKfeEhKEGg95aMbw
	 /Irks65f9kHkA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5E1D2608FB;
	Tue, 18 May 2021 13:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: npcm: wpcm450: select interrupt controller driver
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162134520937.27929.1315945921543373439.git-patchwork-notify@kernel.org>
Date: Tue, 18 May 2021 13:40:09 +0000
References: <20210518071514.604492-1-joel@jms.id.au>
In-Reply-To: <20210518071514.604492-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Tue, 18 May 2021 16:45:14 +0930 you wrote:
> From: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> 
> The interrupt controller driver is necessary in order to have a
> functioning Linux system on WPCM450. Select it in mach-npcm/Kconfig.
> 
> Signed-off-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> Fixes: ece3fe93e8f4 ("ARM: npcm: Introduce Nuvoton WPCM450 SoC")
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Link: https://lore.kernel.org/r/20210513165627.1767093-1-j.neuschaefer@gmx.net
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> 
> [...]

Here is the summary with links:
  - ARM: npcm: wpcm450: select interrupt controller driver
    https://git.kernel.org/soc/soc/c/d37316b72e8b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


