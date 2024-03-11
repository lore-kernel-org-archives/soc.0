Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A9BC5475B
	for <soc@archiver.kernel.org>; Mon, 11 Mar 2024 19:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6589AC433A6; Mon, 11 Mar 2024 19:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F2D5C43390;
	Mon, 11 Mar 2024 19:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710186632;
	bh=GXHPfgdQFa1wBPnsnU2kmXiJDOFnxqTXB4uRGxL8aGY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EJBn5WzE1nqMDKYm22uRT0WIY5vnzeRL0lKD/fCmq3SmLTonDC1bfuA3ZMAoAH85e
	 d8qr8uCgLaumKIO2oyTY96tEoYrYVAF65jzVcWpxtu0/R0rodYGCYkYLd+KK3ntp/Y
	 fCdyRX3mln7vL+1uZ1l7Q8ue17hHgPlZ8G5HFBoKnza45pUy9X53I8uF3iPZyHVUiH
	 pJRE3gy4BcKY8vNgiarKzq6eXJQ33oQSVaoaxsEdszlfwZ3P+OafiuM/qjXrKIjFOZ
	 x9DXAAX0GKROUrYYtRAiiwPwv9Bo7VSXYyGlCQrr0bOKY25HYX9C434q/SL5MC1dlr
	 A9bgwZdtK5M6A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 32352C395F1;
	Mon, 11 Mar 2024 19:50:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetree fixes for v6.8-final
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171018663220.32255.6696687548456554191.git-patchwork-notify@kernel.org>
Date: Mon, 11 Mar 2024 19:50:32 +0000
References: <20240306-waltz-facial-9e4e1b792053@spud>
In-Reply-To: <20240306-waltz-facial-9e4e1b792053@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 Mar 2024 18:08:11 +0000 you wrote:
> Hey Arnd,
> 
> I know it is pretty late in the day here for fixes, and I would've kept
> the builtin dtb fix as v6.9 material, but Geert reported yesterday that
> boot was broken on the jh7100 platforms due to a fix that I sent in my
> last PR.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetree fixes for v6.8-final
    https://git.kernel.org/soc/soc/c/59f33701fd1c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


