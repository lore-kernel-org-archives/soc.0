Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7EBC4321E
	for <soc@archiver.kernel.org>; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54BD5C385B6; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E3ABC385A9;
	Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649970615;
	bh=akQE/fY9pS+TTjLao0N2c5JPbFuMsMFfcjdvrWwlOho=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PFSgI80ECmEZVk3IDKEXQdXphwlq7LhQhfAyDnTr5r4WmRHpcZEt5/mEjPLtGP90F
	 YoZj3GJJddCUBa1KIQArtHCF2VVhFzy54FNxBqr7A075qhnn83lEnRBL1b/8tvD5va
	 I7RpdcZHLAQv/dXKU27WDonqRf8Lhr0TdHd8Q32autWF90XTPQX1HJ5bk0hXLcbTdq
	 w8JuWylpNegiJTzKv9HozwHaKEJlpr5wG/UU13ptJ2nRbT5ui2GFBRvF9JBbVwbUEd
	 2XeDBtCIKiGuna19dMOxr8m1/BBZ0eKZLsPctJHt+qt7rryZzG09FKVK6BUZcZK0lK
	 8NWVnz9Y4yZqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 24CFEF0383D;
	Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: config: Update Gemini defconfig
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164997061514.10394.17692295125877387982.git-patchwork-notify@kernel.org>
Date: Thu, 14 Apr 2022 21:10:15 +0000
References: <20220410202837.2667333-1-linus.walleij@linaro.org>
In-Reply-To: <20220410202837.2667333-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 10 Apr 2022 22:28:37 +0200 you wrote:
> The Gemini defconfig needs to be updated due to DSA driver
> Kconfig changes in the v5.18 merge window:
> CONFIG_NET_DSA_REALTEK_SMI is now behind
> CONFIG_NET_DSA_REALTEK and the desired DSA switch need
> to be selected explicitly with
> CONFIG_NET_DSA_REALTEK_RTL8366RB.
> 
> [...]

Here is the summary with links:
  - ARM: config: Update Gemini defconfig
    https://git.kernel.org/soc/soc/c/24a4351e1c04

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


