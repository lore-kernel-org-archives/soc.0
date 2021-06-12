Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF4B1C49ECA
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1377461410; Sat, 12 Jun 2021 16:10:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EDED361414;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514217;
	bh=odR/I2HCc8VGcpoS3PLt4xbM1dB19YlqTSRxCnyMt1I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IFsHBsMiEflTZSr0OLNo/k1s8rAysOBFD6L4A6kqWqU3+LyAMckOJVxXKoJ5ZFD+1
	 ZpsmbHUM1QnFZTVuyHA+xja5fF278pqlQGiQd/do9IpnDj5E53W0M4ZFYqzoj7S+3j
	 jo2mVoOIPUV7tcHJeKDpFa3TXhPwwd3DUO9GZ2Ay7uXvzTCCE5bTXkWF/j/GIkkq9r
	 e4qC/w0PPvAkfs/RuZPqFsMxQjB3RBTvKfJNlh6sRJYhGyYZF/+zX669cvwR80eIVC
	 Kgh3XW5kKbvqgayQGb8Oo2cAqvgVLx+rjRENf960hHDUCpo7x5TI/620mTxa0i7aYG
	 2xmXOQyraIdWA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E6A3F60972;
	Sat, 12 Jun 2021 16:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Gemini DTS updates for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351421694.27448.7726536325960003501.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:16 +0000
References: <CACRpkdZWpLAcAStq8dEyGL_d9Bvp-WNPu-2EuJw1eTL4kyvgig@mail.gmail.com>
In-Reply-To: <CACRpkdZWpLAcAStq8dEyGL_d9Bvp-WNPu-2EuJw1eTL4kyvgig@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Tue, 1 Jun 2021 11:44:56 +0200 you wrote:
> Hi SoC maintainers,
> 
> here are some collected DTS-patches for Gemini destined
> for the v5.14 kernel.
> 
> Corentin is working on some more really interesting stuff:
> crypto acceleration and two new boards. If this gets finished
> in time for v5.14 I will simply send another pull request on
> top of this one.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Gemini DTS updates for v5.14
    https://git.kernel.org/soc/soc/c/b7c8bde730a8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


