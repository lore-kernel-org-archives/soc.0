Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C479C41513
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 12:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4E35C2BD10; Mon,  1 Jul 2024 12:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF052C32786;
	Mon,  1 Jul 2024 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719838229;
	bh=jFjh2zpvX8gvNtcUah+WMEt5DFPKBbj1UyxV5FzX7h4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IY1f5d39swTWYMcImnq+WtylefwjOTyfg4B8KwhBIu6OtzTrV3CDIu/aAY/i+BAcb
	 lIpbfXzU29q1fdrROQjHv7dFgnoYsCQYS50HJMPmspzcSeWWujssijWWQNQCbnfhLu
	 Dv28wyRxOsh7lT4YqekpsgH1BxlYQnsi2ydZqn73rhd6fY+oWTX98cuVqq+R3r3Giu
	 k9M8UkARlUHh345/0JcQbmKUYniUikGKqI2uKmuY5MEAOqGCKwNFV52sIXKZoaAag4
	 x9tW2Qk61LYw1++Lo73EXL0q5YIneFb1QTwDAV6gyb1nhQwlnAkhG4cqIAwM5rxmG4
	 mv1vZGB9hY7sQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C3C53C43339;
	Mon,  1 Jul 2024 12:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171983822979.2563.11068094135309941989.git-patchwork-notify@kernel.org>
Date: Mon, 01 Jul 2024 12:50:29 +0000
References: <10237789.nnTZe4vzsl@diego>
In-Reply-To: <10237789.nnTZe4vzsl@diego>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 27 Jun 2024 23:36:02 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find a below a collection of fixes for the current release 6.10
> cycle.
> 
> Please pull
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.10
    https://git.kernel.org/soc/soc/c/07917ee08723

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


