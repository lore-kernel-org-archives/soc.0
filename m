Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53A4FC49EAB
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F12FC613C8; Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DA52F613C2;
	Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502410;
	bh=tWwlG6pt+925xbaA5LR6gW/hFye9CKzNQReWTAZ40W8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LrU+T+zNwYKg0WmEK5W7OTeoQaNuEiBF8PKfcQWnOh9qmenDZoKRTGsvyhTqU8KRI
	 EJ7ms5Z26LZg3O2N2AWYjdcoZ5uMUnZB+uaxLJECPmsojt/V6goYoUehHbHo+wdKQO
	 qLNKZVqIJ3GlkSdEHpP7B7GF5JXTofLKUOTwB0xvHkatKfJslRNNyelJJVM8hl9Ro+
	 N80U6bKawns8R/rXzZhJROC3yw2JZcxo/iZKQ96SsTk8RyUvHOM8nyBeYnDbL4Xt/X
	 yHc8xlJqK7CgEEhYD6h5Qyw2LPXJdNe6Mdz8fT5xaZF/eRwRojgY56q6Hvx/u6CheV
	 MhzatG/60xw6w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D1781609B1;
	Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.14 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241085.24025.8939780874490493120.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:10 +0000
References: <878s3429zi.fsf@BL-laptop>
In-Reply-To: <878s3429zi.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Sun, 20 Jun 2021 10:53:05 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v5.14.
> 
> Gregory
> 
> The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v5.14 (#1)
    https://git.kernel.org/soc/soc/c/43b3219861c7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


