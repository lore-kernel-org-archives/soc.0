Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA084C433FE
	for <soc@archiver.kernel.org>; Mon, 22 Nov 2021 13:00:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7CAE760F9F; Mon, 22 Nov 2021 13:00:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 673D060F9D;
	Mon, 22 Nov 2021 13:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637586010;
	bh=snwmsEKe191wzW06DTgZEYFksLz9g+mCOKfaRzPTfw8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IOZ7jnpS6+wDIkJgCdpFbRX/qWaRDSatl+AyMU8fN2NFVURv9POjpitcvOBKC29dD
	 wugg++f7+p8EDNzaJnGnesT5TWZc9P7J2nQeoQH3OFJAt9fM4qUDmFDpPhj4qRHtoe
	 2UCJw6fCb2KSWVXQDmL2McBhylPXfFl//SWSQuC2878h5oHHuT0KPxdteUTX2PpSjT
	 ewh6SQpENIiTpIxjKVfd+Si8HnDE0iGp5KBvUYPY/Qj9xqmINxxSHn6i1YbaQqsP9K
	 Ck7UGCkjYaI42Y+zyPuzlNN30HSq9o6RjmD6599fS9bBt/+64YZBO5cw09owWmf3Pa
	 0/TirIlf0AECA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5E916609B9;
	Mon, 22 Nov 2021 13:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] Add clock node and phandles for M10V platform
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163758601038.20556.3719567461155544324.git-patchwork-notify@kernel.org>
Date: Mon, 22 Nov 2021 13:00:10 +0000
References: <1636968656-14033-1-git-send-email-sugaya.taichi@socionext.com>
In-Reply-To: <1636968656-14033-1-git-send-email-sugaya.taichi@socionext.com>
To: Sugaya Taichi <sugaya.taichi@socionext.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 15 Nov 2021 18:30:52 +0900 you wrote:
> This series add a clock node of Milbeaut driver and clock phandles
> to clock consumer nodes.
> 
> Changes:
> from v1
>  -fix wrong property name "clock" to "clocks"
>  -add milbeaut MAINTAINERS
> 
> [...]

Here is the summary with links:
  - [v2,1/4] ARM: dts: milbeaut: add a clock node for M10V
    https://git.kernel.org/soc/soc/c/8e0150fe5cf5
  - [v2,2/4] ARM: dts: milbeaut: set clock phandle to timer node
    https://git.kernel.org/soc/soc/c/2fc4dfc294ee
  - [v2,3/4] ARM: dts: milbeaut: set clock phandle to uart node
    https://git.kernel.org/soc/soc/c/69a25d34f377
  - [v2,4/4] MAINTAINERS: Add entry to MAINTAINERS for Milbeaut
    https://git.kernel.org/soc/soc/c/18fe42bdd635

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


