Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B40C433F5
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 20:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 20CA26137C; Thu, 21 Oct 2021 20:20:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0AE7861373;
	Thu, 21 Oct 2021 20:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634847608;
	bh=/px+GwD03WjBaxA4kw8j/a6/paZgb3O3kroEwuZUxqM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EGyM63ZyZDT2BrR6WgYfHp5EyRMn9UY8Czkq/1DTKPYz31ibbm4Dy3FhDCpMLxLN0
	 US6e1BuJAY3zDdYYoMC9d0SDo6ooKrEYClYd1n5ogcA8dNhKTwN+XVfESPOAbrt8wU
	 JtQUVpSOut3fDvX4pz7opNZmYmbcuxq1Yqntop5kXNTJE4jHXx6nIwJXZWxSpNswQL
	 1Eel15e9/wTQu6D8hTgGQR/ckn7ZlRIWHNSRdZa0kcf/qBfVT3UBxWkT6O/P7xz57q
	 3J80qydsO+XgftWkfMl0H2mcJUBpanKfUhQXhJ6AF0mdVORBXRQwEIEfizWTJzWX6l
	 XfinfUunViImw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F2F8160A24;
	Thu, 21 Oct 2021 20:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] optee: smc_abi.c: add missing #include <linux/mm.h>
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163484760799.31591.2103177744411039023.git-patchwork-notify@kernel.org>
Date: Thu, 21 Oct 2021 20:20:07 +0000
References: <20211021125539.3858495-1-jens.wiklander@linaro.org>
In-Reply-To: <20211021125539.3858495-1-jens.wiklander@linaro.org>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 Oct 2021 14:55:39 +0200 you wrote:
> Adds missing #include <linux/mm.h> drivers/tee/optee/smc_abi.c to fix
> compile errors like:
> drivers/tee/optee/smc_abi.c:405:15: error: implicit
> declaration of function 'page_to_section'
> [-Werror,-Wimplicit-function-declaration]
>         optee_page = page_to_phys(*pages) +
>                      ^
> arch/arm/include/asm/memory.h:148:43: note: expanded from
> macro 'page_to_phys'
>                                                ^
> include/asm-generic/memory_model.h:52:21: note: expanded
> from macro 'page_to_pfn'
>                     ^
> include/asm-generic/memory_model.h:35:14: note: expanded
> from macro '__page_to_pfn'
>         int __sec = page_to_section(__pg);                      \
>                     ^
> drivers/tee/optee/smc_abi.c:405:15: note: did you mean
> '__nr_to_section'?
> arch/arm/include/asm/memory.h:148:43: note: expanded from
> macro 'page_to_phys'
>                                                ^
> include/asm-generic/memory_model.h:52:21: note: expanded
> from macro 'page_to_pfn'
>                     ^
> include/asm-generic/memory_model.h:35:14: note: expanded
> from macro '__page_to_pfn'
>         int __sec = page_to_section(__pg);                      \
>                     ^
> include/linux/mmzone.h:1365:35: note: '__nr_to_section'
> declared here
> static inline struct mem_section *__nr_to_section(unsigned long nr)
> 
> [...]

Here is the summary with links:
  - optee: smc_abi.c: add missing #include <linux/mm.h>
    https://git.kernel.org/soc/soc/c/34f3c67b8178

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


