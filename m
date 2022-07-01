Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC85C433EF
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D495EC341CF; Fri,  1 Jul 2022 20:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDEADC341CA;
	Fri,  1 Jul 2022 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708059;
	bh=DqrPT/ED0jKjahNHDmKlKkK0lEIXCVOLh6bCKn4kCcc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IkNT5XxBc+f+BxD/RmYXKT/xi4ih4hAWN6NwgtRjL7wKbFLkT9D/g95PL4IF+I1ib
	 XtDeJGOb7UzG/x8mq35ZgsQi590wWLpp3mhzhHMIqA5tBGJdVK1vvwdr+AviPsZQ/j
	 AjYlue7lxTo52y4W7PxEDao4C1rNkk6ZYCX2BQ+0OMqMLt9xY2JpXmOsQnBz9Xa4QR
	 64vQA19nI+Lf/WskSE1f8eSyGpUmYcBAE3kT7hmW7b+ScGymxnOQRIIpOFEMh85aQK
	 aZocPX3tMEuAnwz9QT+ItB7H34OXIyxEKQkiPA2iBT2Aea+Fof96UqGMOJariHXdaB
	 ZtEnhnIW2b9cQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9543BE49F61;
	Fri,  1 Jul 2022 20:40:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.19, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670805960.26141.2947858326726027662.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 20:40:59 +0000
References: <20220629021244.GL819983@dragon>
In-Reply-To: <20220629021244.GL819983@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 29 Jun 2022 10:12:44 +0800 you wrote:
> The following changes since commit 7c7eaeefb0ae226da9233d5db265652d900e1fcb:
> 
>   soc: imx: imx8m-blk-ctrl: fix display clock for LCDIF2 power domain (2022-06-14 11:53:42 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.19-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.19, round 2
    https://git.kernel.org/soc/soc/c/1f66f63c7312

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


