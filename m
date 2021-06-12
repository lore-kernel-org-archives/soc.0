Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04631C48BE5
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9054A611CD; Sat, 12 Jun 2021 16:10:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 799E361248;
	Sat, 12 Jun 2021 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514207;
	bh=2z0mk60F7UmQBhHNEIixwqLllOlbFl4VkGRwMmbKOPw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TTP3uMqCFu3va1nW2UGMXczlBcFErYjXBztN5hgO5uLZw1MCRAeGCoREc+0GW1CPR
	 yBLmvEZjPfw/0Nu1kO1yUwIfOs8dI5ln1lpFq5HSPEoxBSruHZw7xnJwYzdCtoagZC
	 nbP6a9bl1Ucu9JEGaIc2EFOQBjfaXxgqsppukMM5yjNIIwFvFUfBOZhXVOXbbeJvjD
	 1EPJl1gjzilCRgA12gl9ZXcB6BJl31QPoRHSr1bfzlxJKgkhebr9buQEgMnj31J7lG
	 sAoUMpRp9O7MWnRYvvury1kJ6pZIamivei4579r86VHF5KQ2N7HCAWSVsIGg+iSIxj
	 0/c3n3SFDvzdw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 67A8460972;
	Sat, 12 Jun 2021 16:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351420741.27448.10644576872953762249.git-patchwork-notify@kernel.org>
Date: Sat, 12 Jun 2021 16:10:07 +0000
References: <3405741.0S5aU1g85B@diego>
In-Reply-To: <3405741.0S5aU1g85B@diego>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Sat, 12 Jun 2021 00:20:40 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below a patch that unbreaks the PCIe on rk3399 that
> broke in 5.13. As the tag messages states, there are more changes
> pending that handle the backward compatiblity but will go through
> the PCI subsystem.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 5.13
    https://git.kernel.org/soc/soc/c/e60cb06cde7e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


