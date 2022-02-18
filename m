Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F29C4167B
	for <soc@archiver.kernel.org>; Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E113C340F9; Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3652AC340F3;
	Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645216811;
	bh=3ZckXTJmQkZuU/yqEGNzhb1Imd8BDaCa5dB651+IWdY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=naqYSFs3SrSIZm9duWYJQvNAszbMuSqn5anXIax3kKWusKdKCS/3zfLFdJ0wJR982
	 zY7MznmFclXxdeeFArpppJOg0qW9ZWTbfU2ggyDyh8ur2PSc/fKfUNLJ+XdRDn6Fkj
	 hNifmO9bL7GOcp4auD8wdKkv52x/Dj8q5/ClOCgo0fXCt9vichcpEkBjeQTQ0Li3bM
	 bTD/iNXDhmZbp7JGXXu/rJkhw16BI+OP+6Z6E6Xhtw/9wBKAHMlif9h25hJdGNv664
	 vLpxBqZrKL37CMkMPLmbHdapEYeQi3w7Svj4O/09Qyqs+cHv33ibzBqvvheiqJo9WB
	 3OAPD+8t9JfsA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 17524E7BB18;
	Fri, 18 Feb 2022 20:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: fixes for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164521681109.10306.18284059161341281193.git-patchwork-notify@kernel.org>
Date: Fri, 18 Feb 2022 20:40:11 +0000
References: <20220211133515.15314-1-nicolas.ferre@microchip.com>
In-Reply-To: <20220211133515.15314-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 11 Feb 2022 14:35:15 +0100 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are 2 patches that just change the MAINTAIERS entry for at91. I think it's
> better to have it sooner than later so this is why I add it to a "fixes" RP.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: fixes for 5.17
    https://git.kernel.org/soc/soc/c/a8cd28553f0f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


