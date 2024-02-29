Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05DAC54E49
	for <soc@archiver.kernel.org>; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A005CC433C7; Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86083C433F1;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709226129;
	bh=IkLpiN9/rgXJ1/8k35As2qrz8fFOnLHqwCxOPPQUZzs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GpQlUrevuDxIWEBBVn2k7BYmCbVF0/IthGp4M0o9TT2OJEBaK7Wzvnkpc/4CyU9LZ
	 lGCvoUSyqvTxIJLT2nyiboT61cyf2y7V/8fbe1NhnLSaVEKh22rBK7NCwYr/joWVVX
	 pCV6ojj7CBEv56Tpgv2Nk2n30JH05JnrPmWWC9jZ3JdcLgDDEeDgx9TTXEYzcdV4G9
	 OE026jxE63pCqBJO4tPyqYwGc+5ddBIeiu17orCHhzC+17pzjTvo1F7wWQfSTYs7Tg
	 9ZLC2V5h3+3eRaCNnOIItONSUefrpce/dVJJIn7MwHEj7vMWtxO5r86cSTsE/UdGgJ
	 5E3+wYvBGUAMg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6542DD84BBA;
	Thu, 29 Feb 2024 17:02:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Gemini DTS updates for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170922612940.13542.5519840555333285040.git-patchwork-notify@kernel.org>
Date: Thu, 29 Feb 2024 17:02:09 +0000
References: <CACRpkdYQv9cyCZyjgQB4FTrxek9Hfu4EZ3syfHqHF7P6gzddvA@mail.gmail.com>
In-Reply-To: <CACRpkdYQv9cyCZyjgQB4FTrxek9Hfu4EZ3syfHqHF7P6gzddvA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Feb 2024 14:29:37 +0100 you wrote:
> Hi SoC folks,
> 
> these are some Gemini DTS updates for the v6.9 kernel.
> Details in the signed tag!
> 
> Please pull it in.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Gemini DTS updates for v6.9
    https://git.kernel.org/soc/soc/c/ca369f962875

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


