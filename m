Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB87DC54E5A
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E52AC433A6; Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88AAEC43394;
	Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709568697;
	bh=2PgLmnbrBKrg6vnEn/bGrnELRM8AyOLYyard6IE+yxY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ooy+2/XAKrH4jdnaP2Qg5lFdWI9FS1p1CEnIO3/4U0I94s4NZfqji2AMoz7k+HXNe
	 A3XaRiQxOFvnw+hmfJ4UUHLJ8eK/s4OoUCyoBbQHpniDQzNaxKxBvb11WbSuawvbXr
	 f/XXso945gjSX3nEh3ssPUkFuIaEcUmuCCV72TNyYqvU9PURsJq9QdHdwNVvIZfdIP
	 fak93Muq1HKsUK/V6wJw+K+2vCiX4MdGRWAOvRQV4LdnovWUqK+KBmNRwRtz9/l9Bz
	 El71Tv2uVN6nfYKYWbiSABEG4NfzEfqoiH5DbgQ4Xho7lY/6oYHdG5WMr8PjlZndZZ
	 38BbfgNcW4H6A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 64C7DD88F8B;
	Mon,  4 Mar 2024 16:11:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fix for 6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170956869740.25915.3872655174866175213.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 16:11:37 +0000
References: <20240304132727.GA3501807@rayden>
In-Reply-To: <20240304132727.GA3501807@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 4 Mar 2024 14:27:27 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small fix for a panic in the OP-TEE driver that can occur
> in the error path when registering devices on the TEE bus.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fix for 6.8
    https://git.kernel.org/soc/soc/c/64b9175055a6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


