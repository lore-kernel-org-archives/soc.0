Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A6CC47DB0
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8732C4339A; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2310C433CD;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=SvSwThC75K3uehBZOA0vJSX/wFBF2Sb8LP0bqurbJ40=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Ukxrxl3djSDmxkc1S9ljxhWJtDrtCDu6EEM1WuPORc9XvbXIXWUGEET4Ndvtf1ElS
	 WdJWocljZ7RCLChHZk4p+enKrbo+dGrbACcpCvJDodV3SDJl3uqfi7gSmtvYtFALan
	 etEVDHFlVnn3rimPcTkXm6vcLJ3AN3/pKpfLtJHBT68RXcRGkgeZ9OpZ0FyZ3wqxMF
	 ABUs3cVovfjFabB3ZqzPEOfDVxOxeZvqrKN0kGit6m/s06bF8x6QOjFabfkW8wPDvj
	 ucAth7t9ThYyjxMQZ5JGtcfJWzXkAq3eMnXSqSMLOgqmA1fLcfTGYaKMJI3PJ2YFYu
	 k2Hqk/ojJjVgQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B026CDD4EEA;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] hisilicon: driver updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646771.10550.6982878878182840955.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <6572C41B.6050703@hisilicon.com>
In-Reply-To: <6572C41B.6050703@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 8 Dec 2023 15:22:03 +0800 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] hisilicon: driver updates for v6.8
    https://git.kernel.org/soc/soc/c/60cc77704eb2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


