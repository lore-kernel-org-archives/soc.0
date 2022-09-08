Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC0BC54EE9
	for <soc@archiver.kernel.org>; Thu,  8 Sep 2022 15:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 23EF4C433D7; Thu,  8 Sep 2022 15:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05803C433C1;
	Thu,  8 Sep 2022 15:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662652215;
	bh=6YjDkvW3Fo7XWncjRa3xx2gZ0rMRuhyj+o7OClsgato=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EzugctIDwDB+upm+pXFg08ee+3SxpR6jpLM6uQugpKwffEXXxON7zlUc7HsnIjEL1
	 vX2U1bf6rzpZfB2N55Lj17VziIaAMCTWOsQmaS06ZI+Bff22oylJawMvKIlzBSZIPx
	 iYXGOdFtj0+4aicVwsW8N/yFfWDs2SZobAZlzPdS77G0m6qDcytnZQYaachpN4aShe
	 5VBjM9D17r7QNEbECC4/66RU/cXm5wp9TXk6Tl0JK9cMOfCu+UIsZ4ehBhzYnyvrvw
	 vfG8FqFLuaCuZBjej1slQAn8uBQVZH4d8iw3XcCTPE6TEb1Va/69BhywxpQ2GfG0so
	 GlKTWBoNsXyUg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D73A1C73FF0;
	Thu,  8 Sep 2022 15:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ARM: dts: fix Moxa SDIO 'compatible',
 remove 'sdhci' misnomer
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166265221487.8789.18015291269483294149.git-patchwork-notify@kernel.org>
Date: Thu, 08 Sep 2022 15:50:14 +0000
References: <20220907175341.1477383-1-saproj@gmail.com>
In-Reply-To: <20220907175341.1477383-1-saproj@gmail.com>
To: Sergei Antonov <saproj@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  7 Sep 2022 20:53:41 +0300 you wrote:
> Driver moxart-mmc.c has .compatible = "moxa,moxart-mmc".
> 
> But moxart .dts/.dtsi and the documentation file moxa,moxart-dma.txt
> contain compatible = "moxa,moxart-sdhci".
> 
> Change moxart .dts/.dtsi files and moxa,moxart-dma.txt to match the driver.
> 
> [...]

Here is the summary with links:
  - [v2] ARM: dts: fix Moxa SDIO 'compatible', remove 'sdhci' misnomer
    https://git.kernel.org/soc/soc/c/02181e68275d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


