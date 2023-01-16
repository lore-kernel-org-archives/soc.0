Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96F0C678D7
	for <soc@archiver.kernel.org>; Mon, 16 Jan 2023 10:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CEEE6C433EF; Mon, 16 Jan 2023 10:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB51CC433D2;
	Mon, 16 Jan 2023 10:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673864419;
	bh=XjIMh0qf1gm+Fs3ekETKYRi0bUd22m09S+0UvRCwYdk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ws2H0+LA+ljzrSQPGniOiGAosvuKDkrBSJ8627FqdtQftMkrW/cFxaYhUcSUhuZDN
	 8ks4xRu/ux1Nf7J6C34LdrPMZP/52ScXwLBI1m80rnc8tU5+UHDjTjjYrQt/YcrBC5
	 Mftls2Lul9f1GTvH17Lr7d8DXVKcmtR4fEjD09UAst6U6akLaIlqjWgFcHnI6pjfll
	 ZBiRWMupKmRSpV1jmIYKDtia1TuHE8Av67E93R82tIzUM0clqSO7Iu5ZdZl3rpAwYw
	 T4QpVKyeHHtcAS3xrl0PclQwlpdXo8fd6ffzUE2E066YsoU7leSZ/b+D5rqFElbEdS
	 VNeAsqo9TZiaA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9801EC5C7C4;
	Mon, 16 Jan 2023 10:20:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: fixes for v6.2 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167386441961.5760.9119518592484242429.git-patchwork-notify@kernel.org>
Date: Mon, 16 Jan 2023 10:20:19 +0000
References: <87mt6mg08k.fsf@BL-laptop>
In-Reply-To: <87mt6mg08k.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Jan 2023 12:08:59 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for fixes for mvebu for v6.2.
> 
> Gregory
> 
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: fixes for v6.2 (#1)
    https://git.kernel.org/soc/soc/c/88bcc6fa5eae

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


