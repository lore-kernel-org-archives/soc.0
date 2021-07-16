Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E2FC63799
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4C38761417; Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2F01E61413;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470526;
	bh=4ocBDppFKyKaDrb9VQztUR8NY97MMjQjpAdOo4zrN9M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HRfe0P4pFfKQ0aScW9+DgmU39LLoZd0Az2GgaOW4OqjUaFoj/rPJcIKcMDbeeN+YB
	 c9EWZAoef9xr2pDe5aepLw8x+92l6AS6YqIAto80RloX4jHJ4RTQoqBb8sfkI5wK2o
	 tSUt8Z6yzGmtJIsCTk8IFaGyD9i5WidvX8jYKTDFPyBmjpdTJ2jBkBOsLUup2OMaNh
	 iKrWzYo6+/dqt93UcY9pIrzkt8mBZGHtqWZ/WufUnWfZC/si5yhpaiKbF0GQEdlg6v
	 BAhdj78JNb6WveDbTJOPKUi+n7Wir+4J2keR4ZfZ5RB2hkVuVbc9utQdtJeRoEdqPD
	 4Lrkz7pxTjIiw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2994760ACA;
	Fri, 16 Jul 2021 21:22:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: configs: Update Vexpress defconfig
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162647052616.25202.5233992871975848491.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jul 2021 21:22:06 +0000
References: <20210713133708.94397-1-linus.walleij@linaro.org>
In-Reply-To: <20210713133708.94397-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Tue, 13 Jul 2021 15:37:08 +0200 you wrote:
> This updates the Versatile Express defconfig for the changes
> in the v5.14-rc1 kernel:
> 
> - The Framebuffer CONFIG_FB needs to be explicitly selected
>   or we don't get any framebuffer anymore. DRM has stopped to
>   select FB because of circular dependency.
> - CONFIG_CMA options were moved around.
> - CONFIG_MODULES options were moved around.
> - CONFIG_CRYPTO_HW was moved around.
> 
> [...]

Here is the summary with links:
  - ARM: configs: Update Vexpress defconfig
    https://git.kernel.org/soc/soc/c/49e7757a73d1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


