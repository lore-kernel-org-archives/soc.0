Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5506C41513
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 11:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A129AC4AF0F; Mon, 15 Jul 2024 11:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A24AC32782;
	Mon, 15 Jul 2024 11:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721044230;
	bh=ydWquWDUrXhmTyL7jrBVh63WTNUCIerdT4B6NTDim9I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RedtX9GcBssY6gp+qKQpLlqHjORLiIk0F3PpwBczr6Bu8Z2ic/Muy3vbjUcA1d6vO
	 Tod+1r5BfUqtw2SO7A264f8cUz9wGniw51l0ZlXJIbo7evM9/IUVrIzHdPZ5TsNke9
	 aHyZPj0+OMDj7tkln1eJv/22+TXrIkhNIG99CuA/rCLSHCsk6Al06PRY7RlUve0+DG
	 4TRGULg85TYl262kgOXvJSMira7LUFNuhiRYp+kWJD3hT5NUAGSm+ILm+BXcXPg0ns
	 NIrOuNVFSOVEbJW3/9gZxusVOyy6XqX1wMWp4CkRimWuFP4PqaZStDxH9BKR/LFdG1
	 KkqAfpp+y17PQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7DD1AC43332;
	Mon, 15 Jul 2024 11:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: drop riscv list from cache controllers
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172104423051.10224.9891156262958586945.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jul 2024 11:50:30 +0000
References: <20240715-pesticide-strike-6217a07b72ef@wendy>
In-Reply-To: <20240715-pesticide-strike-6217a07b72ef@wendy>
To: Conor Dooley <conor.dooley@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 15 Jul 2024 12:21:48 +0100 you wrote:
> When adding the bindings for cache controllers to the MAINTAINERS entry,
> I forgot to drop the riscv mailing list - and so completely unrelated to
> riscv stuff is now being sent there. Drop it.
> 
> Fixes: 4ca47d8bcca0 ("MAINTAINERS: add cache binding directory to cache driver entry")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: drop riscv list from cache controllers
    https://git.kernel.org/soc/soc/c/6bad1bef26ca

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


