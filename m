Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A09C6379F
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E73C1C433D2; Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA690C4339C;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675434644;
	bh=iorspN98m+ZPd4M93OIw5CjajYqH9NPG9sEfqD65/34=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cOzh2NIAOCKA9UQ4MyQ/NQsqvvBfOqFd0jSRoGkC5WzOdceno+RQyljrPMpf6S/cM
	 XClqWzTnh7Ao5tbFcY5plTwEXkhKYHSYgrf9VfE7uXG6KffmYdVybU1VbPqqQKBk+F
	 FkniSVytCIFhC4IoOlPsf45qLseKUeyEPAtdRKsHVkKpwTxhYBXe4Nd/CklFWWLqYl
	 yHHDlsmlQ4BK2PVIUVWrhOGh/YMc+AKUqoXwUyjTtNDK0W9ciHu1rme38eGPvNh7YX
	 /jcCec6ph0ICCBsBj6RCYwOKoOQgP/6QQwDV5qrQfJunFxGmBc+wfARyHuIEqsABob
	 fHQX0viKNKgFg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AED4AE270CA;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v6.3 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167543464471.16250.14704773383220142065.git-patchwork-notify@kernel.org>
Date: Fri, 03 Feb 2023 14:30:44 +0000
References: <87zg9w9j6l.fsf@BL-laptop>
In-Reply-To: <87zg9w9j6l.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 02 Feb 2023 16:32:50 +0100 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v6.3.
> 
> Gregory
> 
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v6.3 (#1)
    https://git.kernel.org/soc/soc/c/3e47c0dfc707

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


