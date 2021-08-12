Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235C3C4320A
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:20:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D3087610A3; Thu, 12 Aug 2021 21:20:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BD4546109D;
	Thu, 12 Aug 2021 21:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628803217;
	bh=4ZXgnrcga25NcG1BmrHmmZZVj+HthQoOQ0xYlwsZT88=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iLteNuG9fWfUDU/0BejVCBqF/qWTShE64nEdCK1KUqiH1+I6l1D8LGC09NYkhYVsG
	 ZPfzE6buvAIcFRFzePYYaEZnZhILshDXksFUG3IBbV/+iLC7Qo6Ge7TQo22hd5A1UX
	 QupqPJNFY7Bj1AiubL9LFHycVyvTBhBDUjSNOJMUu8diXNyzdS3Abfxny17wN4Yr+E
	 st+YdoxP58Y5ytIQLxbaKB91BHgBGOxLs6NViw6AvnjOmj9WOI2vEAji200LlXfQGs
	 CxsOIt98qbIlTp455Ois+1vOfji2CHtluqcE60kLlTSkGM/Z7rDiuK4jjaiRl8yYln
	 o08Wb6E0hgCyA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B25FF6096E;
	Thu, 12 Aug 2021 21:20:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: configs: Update the nhk8815_defconfig
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162880321772.12191.2062074326426023636.git-patchwork-notify@kernel.org>
Date: Thu, 12 Aug 2021 21:20:17 +0000
References: <20210807225518.3607126-1-linus.walleij@linaro.org>
In-Reply-To: <20210807225518.3607126-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (refs/heads/arm/fixes):

On Sun,  8 Aug 2021 00:55:18 +0200 you wrote:
> The platform lost the framebuffer due to a commit solving a
> circular dependency in v5.14-rc1, so add it back in by explicitly
> selecting the framebuffer.
> 
> Also fix up some Kconfig options that got dropped or moved around
> while we're at it.
> 
> [...]

Here is the summary with links:
  - ARM: configs: Update the nhk8815_defconfig
    https://git.kernel.org/soc/soc/c/813bacf41098

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


