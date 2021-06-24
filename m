Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C633C49EA5
	for <soc@archiver.kernel.org>; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 02732613C9; Thu, 24 Jun 2021 02:40:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E0026613C3;
	Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624502410;
	bh=BT88uTro7crBEcce2aTZNJ67Rkwqk00SHSyy7vtGi0E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HlGoqZzHxqGbFJOfi34JGVLO9oRSwT+f6xElQCaLs9b6Dk6J3rFHr0/uUlJfYLy0w
	 wxPUoMmqYF62T8ciIfR0w+rltq17uQaDNbUs3sBfO8hWAbvWPBZOD/SSArOIwIjF7F
	 /WHeMw9QIe3GswV3CIXsrbjha0SIXcsAE0hFmL+CNQx4P+5JKd46+aqDRxGPZs8C6b
	 JDHzEINt5jdRyIyTquJMP61xaaMpTW+AKwN8wzaJOYP9IrqkGAreJb8U3FUEsc2V5/
	 dcef58IabYMwXejKBIDRjUAVtAsswSpzIPMD3wUW+cwUfD7OGYGv0BPISQsAJ062r3
	 l8DA5nagLKshg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DB16D60A47;
	Thu, 24 Jun 2021 02:40:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Non-urgent fixes for omaps for v5.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162450241089.24025.14272616302971630312.git-patchwork-notify@kernel.org>
Date: Thu, 24 Jun 2021 02:40:10 +0000
References: <pull-1624002812-396117@atomide.com>
In-Reply-To: <pull-1624002812-396117@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/for-next):

On Fri, 18 Jun 2021 10:54:45 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 78b4b165280d3d70e7a217599f0c06a4c0bb11f9:
> 
>   ARM: dts: dra7: Fix duplicate USB4 target module node (2021-06-11 08:30:42 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Non-urgent fixes for omaps for v5.14
    https://git.kernel.org/soc/soc/c/6b4670af9f49
  - [GIT,PULL,2/2] Devicetree binding clean-up for omaps for v5.14
    https://git.kernel.org/soc/soc/c/e356dc4c088d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


