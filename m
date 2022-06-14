Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABACFCCA485
	for <soc@archiver.kernel.org>; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6F595C341D3; Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59E15C385A5;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655238815;
	bh=E7qDwjx/AmQZpsX0QQesR4QYujc25xu1WCPaGt1578U=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PVL9zqUpvKvSxpZ0GyzD9/UhLmDX7cTu8ltpRwaCIwHO2FzcCSuL96F1+Bg1quFc/
	 cxHPZdUlDxjELZK3PMN+a9+3aSMLN1LxYjWGWuG+6zG1K/PrnLbSseafmguxjMYm9L
	 cmk3YiTznnWMBmds6kapRmSzDbdj1qSjaEPmltVsy2HYzNrTwj5xJ+xGsqWP7jnQA5
	 6ppDkabfV4dv+jujgDV311OrIxGVDZ75vObVFjs2KsPsIIB0bW0dHbACFWoaNGgUgL
	 GKTfda4MDLzdJa+pSGGVzpGRsByan2R5BHT/Eso3pFjANc2IsFcw0N7mZ28FYWE9pR
	 X8m4ACXlUt4gA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 40E8AE73875;
	Tue, 14 Jun 2022 20:33:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] ARM: multiplatform changes, part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165523881526.29335.17939195079035706144.git-patchwork-notify@kernel.org>
Date: Tue, 14 Jun 2022 20:33:35 +0000
References: <CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com>
In-Reply-To: <CAK8P3a13uAiBJkqD9UMmnfFn3AAY2ZqQisVQdovRy5dKiyJaXQ@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Thu, 2 Jun 2022 23:34:17 +0200 you wrote:
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> tags/arm-multiplatform-5.19-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] ARM: multiplatform changes, part 2
    https://git.kernel.org/soc/soc/c/96479c09803b
  - [GIT,PULL,2/2] ARM: SoC changes, part 2
    https://git.kernel.org/soc/soc/c/09a018176ba2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


