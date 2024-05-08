Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B230DC25B5F
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 20:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 842C2C32782; Wed,  8 May 2024 20:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E9D1C32781;
	Wed,  8 May 2024 20:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715200231;
	bh=gPfTVfGADX1hLLlmpC4HpSxDZ4hRpwnTYp02eNKKkfU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=iB/dv2QdwkixSibw++aTGFgqbnMlpYM+LgPKzZN5dpO24mG+ZahFR+C9m296PqyHi
	 AFombmRgg7xSTgEXoQYboU5Yd0hE+Vp6F+KYLdpciV/QXYynYhh3ln4ywqKVL7b5ZX
	 nYoBprFn70Zxn1Zzd9808WNhvrToy6srvLk5+mp4DM406aex5U0xdXQ62ZovwJlJDg
	 GZT5T/VZ6TK2qSqygWMICGavj1GWDarEtnWeG4HdMWOtfI7jx0SGIEbzVaMW89bQl0
	 48To5cxbMRAMsnFdz8behCTHc5+dGhFfQeKRXdlfqgg96WKZoAWKWelPb9tb38gSEN
	 lD3GVoA1SsEcA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 559B1C43332;
	Wed,  8 May 2024 20:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.10 Take 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171520023134.16885.18146653961128608444.git-patchwork-notify@kernel.org>
Date: Wed, 08 May 2024 20:30:31 +0000
References: <20240508-crafter-cement-4f54e4182270@spud>
In-Reply-To: <20240508-crafter-cement-4f54e4182270@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 8 May 2024 21:13:54 +0100 you wrote:
> Hey Arnd,
> 
> Here's a second attempt for ya.. The canaan stuff is dropped and I'll
> send it to you for 6.11 instead.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetrees for v6.10 Take 2
    https://git.kernel.org/soc/soc/c/01a7f9e1a97e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


