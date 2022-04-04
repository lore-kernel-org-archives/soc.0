Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBC82C433FE
	for <soc@archiver.kernel.org>; Mon,  4 Apr 2022 13:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9FBC1C34112; Mon,  4 Apr 2022 13:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8992CC34111;
	Mon,  4 Apr 2022 13:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649077547;
	bh=IoVsS2u4d8UAs6+/dUSWi/MsgtRzDfjrc1L7fBLJHEY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=a0X1FRx2dC4F3pgkmzeMIjXzMdKwuHm12t8YIXOWeI8CuOwgzw8VmiR6sq0fD2bYk
	 8ediddoIzq77T2TEupw7FzKaRRqDcwGr176f4/eP7usQ9CtOMlxO65mqvymgg6SwaQ
	 SHXegRNc+btBYD2x16SDuTilnlV9e2wcKQH+0qdJy8msxOIIYx+7AFo53h/ETRbVNV
	 sCqfKZHh+FGLdc/6b0qkTUMms6vV0LX/9oCRC8wIfRof87aF0aKxzKORj3aWE/cL59
	 1mU+/GlXvA7AFGYQ0eE8sqUTR69L9Lg9mU4Z1HPFozJ/hE4+NtU2evQS01o2G8ilFU
	 U38Q8XeZtQMlw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 650C0E85AE7;
	Mon,  4 Apr 2022 13:05:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SoC: fixes for 5.18, part 1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164907754740.14449.13993973186117371080.git-patchwork-notify@kernel.org>
Date: Mon, 04 Apr 2022 13:05:47 +0000
References: <CAK8P3a22UV+zTMjSVdWxbVK+G1styc6KqR4o1B9FE=oByYzRwQ@mail.gmail.com>
In-Reply-To: <CAK8P3a22UV+zTMjSVdWxbVK+G1styc6KqR4o1B9FE=oByYzRwQ@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Fri, 1 Apr 2022 11:49:07 +0200 you wrote:
> The following changes since commit f443e374ae131c168a065ea1748feac6b2e76613:
> 
>   Linux 5.17 (2022-03-20 13:14:17 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> tags/soc-fixes-5.18-1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SoC: fixes for 5.18, part 1
    https://git.kernel.org/soc/soc/c/ba2d6201a9bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


