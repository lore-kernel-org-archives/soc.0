Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682F4C54E66
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B464C4160D; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24B2BC4166A;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=UyDeoS8/RkE6KIPg1tgqM9cSfmCDZUyzuLKUzoOJfO0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Dd7SMRuLaUx2ot+A3tsTBK1XVXrtWjX8YSnC1CbvN8VZarSNYFwDQwgDLG4Scit7X
	 vTmgjteTT/VpZK8r1evz6QIMMknsDI1P5kLcVwvt9pX0xeqSghwC7tlMZUOIx7SuHI
	 00FZuPipnppC5Wq41Eq05I3mmUeuLuCyJpD0j1fSt/E9DgvEetIdBDAXB7/aXd76Ya
	 M+9LtOgisIbFS6/H8KdXYRV0pXgRtWfOeSaGHlzbuukOgM4i5C5FJJ/QglHjEHh8vH
	 DNmyjTcBejzm+kZSU08W6LcC0TLz0Spya3O5mH6wIN2REQkVNz3qxAtSlvYfiFvA/w
	 rFLk2gchFujPQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 10A08D88F88;
	Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v6.9#1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927506.27833.736609464463807988.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:15 +0000
References: <a7ae1058-e24d-4a6b-900f-401f0e3ae17c@foss.st.com>
In-Reply-To: <a7ae1058-e24d-4a6b-900f-401f0e3ae17c@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 29 Feb 2024 11:23:12 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT for v6.9 cycle.
> Sorry to be late.
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v6.9#1
    https://git.kernel.org/soc/soc/c/f01177048593

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


