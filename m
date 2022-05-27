Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47852C433FE
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 14:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0366EC385A9; Fri, 27 May 2022 14:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D89EEC34114;
	Fri, 27 May 2022 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653661214;
	bh=VmovNkCjskH5vmHymygXTqovdgp7LWwEL6B9EAiqoxc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tcwJ704P/TgVRBKaGEGKYnij2ACIk+Fxl6IFwhZlD4iYp0dAiPsFoIsKcVjhnVE9d
	 s64y25VVBoPXNowejjVSle6HWNIFhd6u8nYBBvzzRkbGWgva/ECuWpzh8wC2zpaBKK
	 JgPOfVH8M4Kx3wq4YElUXlxzjYQ4zqHgHcCzUl8A6IpJ37zKC/ZTHNPTLmjdHZCIiS
	 6NIEC3Ikszsx7xn7oEEeoorCRKVUcNY8h1rfT6NW56gHKxHY779BcXC+uUPciHx5UX
	 odmYe70sv2d2rKIT8Va8u4aEIATFFJMo7+UfNsa0jxgDFvzopGZf+SCFOO4TAE5vXS
	 XW7LYdIFREJZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BCC40EAC081;
	Fri, 27 May 2022 14:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: ep93xx: Make ts72xx_register_flash() static
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165366121477.3919.12012967610666322290.git-patchwork-notify@kernel.org>
Date: Fri, 27 May 2022 14:20:14 +0000
References: <20220523065616.325052-1-alexander.sverdlin@gmail.com>
In-Reply-To: <20220523065616.325052-1-alexander.sverdlin@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 23 May 2022 08:56:16 +0200 you wrote:
> ... and fix the warning/error:
> 
> arch/arm/mach-ep93xx/ts72xx.c:154:13: error: no previous prototype for function 'ts72xx_register_flash' [-Werror,-Wmissing-prototypes]
> void __init ts72xx_register_flash(struct mtd_partition *parts, int n,
>             ^
> arch/arm/mach-ep93xx/ts72xx.c:154:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> void __init ts72xx_register_flash(struct mtd_partition *parts, int n,
> ^
> static
> 
> [...]

Here is the summary with links:
  - ARM: ep93xx: Make ts72xx_register_flash() static
    https://git.kernel.org/soc/soc/c/75577fbecb2e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


