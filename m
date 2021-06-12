Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CBA4C49EA7
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8185D613DF; Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 66D22613CD;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514216;
	bh=/WW3ZIKJdY6XXb+y1lOde0KKduQEKhXvJlRrdmxd+jg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lteoOfLOHtgigYfFuf/ZbK9cRDQC9oEbuQAtsuNulzLP1otp4xmjxqFDTkmgRENz4
	 AztASTk4CVs6Zx8R01vTdAHZYWkohlnl7GpuvWNXPUxEC6ndtB+00uUQ9U3D/dP+Pi
	 C7Rxpq7TjNZ6e0zocdDPymXBX2NEEOHthrYc+A4lpLXWkQBoPf8n64V0SFZnsawyjJ
	 VTHbU68zppkc4P9u1XHqv4y07toRfFCP6um8R+J+ac0Bchnf0k6XehVPrK0YtzWNpo
	 uR8zEMFPvU1Y9/2jcmyKIyrQnkGjTLeHXr9CZQegGC+xEWXAjccyXtjiI0gLN7YbQm
	 CgMdHa6oiZ0og==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5C06860D09;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421637.27448.8560813911861963810.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <20210611125659.25590-1-nicolas.ferre@microchip.com>
In-Reply-To: <20210611125659.25590-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 11 Jun 2021 14:56:59 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Only one patch for this PR: take as a patch if you prefer.
> We have other defconfig patches in preparation but not ready yet and as it's
> getting late, I send what I have now.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: defconfig for 5.14
    https://git.kernel.org/soc/soc/c/ad9f81281ebe

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


