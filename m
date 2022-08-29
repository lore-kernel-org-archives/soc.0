Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED93ECAAD5
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 86372C433C1; Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66070C433D7;
	Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661766603;
	bh=zLdhTKJgKZkaUUuU9VfJrcaoMy3MzY26ILRSavZqQXQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=cREIBlxKmC3lpm8JNUa0dzYMyB0Wc/zCcGc9CE9sTt7jPHJ2Jpg8HfBuOGpe8kuie
	 vsqs/M2VK3bPKk8YoS3XTq0X8hRMRmO3kgvdkvDBbQF/QBynHIWtezdawdS1GbwojW
	 /u23Huo69LFhu+h1h9JhIp9KseUF5O3aBeHjf1f5NsrTtYbQOPhnWZtCr3xzj8UdrP
	 0ejLLH2KhUH4OgQEQVJ0XSq0Aw43Uk4rf0MJ1cBjmt6oOAxNHzp5A8V6jpc18PGtwP
	 5LPjrykl36x176jx1LqqhydDH7CprkKHgm+9cRbeAGa6QgIWmOgrQ2gSXMBqpNz2UA
	 uzl7p8qZpqvVw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 474B5E924D6;
	Mon, 29 Aug 2022 09:50:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] DTS fixes for the Versatile family
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166176660328.19402.8127438902893673887.git-patchwork-notify@kernel.org>
Date: Mon, 29 Aug 2022 09:50:03 +0000
References: <CACRpkdZfTe8NSGR2ZCkn-1JcNobjfWeXqajSqcJMp8+WtY+2Xw@mail.gmail.com>
In-Reply-To: <CACRpkdZfTe8NSGR2ZCkn-1JcNobjfWeXqajSqcJMp8+WtY+2Xw@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Aug 2022 00:22:44 +0200 you wrote:
> Hi SoC folks,
> 
> these DTS fixes for the Versatile family missed the last merge
> window because I forgot to send them.
> 
> Mea culpa.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] DTS fixes for the Versatile family
    https://git.kernel.org/soc/soc/c/43e403a286c5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


