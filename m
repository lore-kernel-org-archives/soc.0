Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9854C47422
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B01E0C43397; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9373AC433CC;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=CQE/+8tezPkhqXNyGDcGoSkHuiA/3kdwpqbLT6In3DU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ShZleaIEDz50MJ/6/8Kat1cWd87pTFiq7aMppxeoE3mezo2lb8kp8hgad2VO22ntC
	 L5/TXR/XWC1KR93MaohJQ3/GlMax0Jp7Kdj/oqRzcYgRPpRZ1TM2ipanwlr1yQTmQ5
	 RWG0yQdZRxmIb6spjPGgaNvC5mG5n5jPuMApJwqwAxNUdVFFuChlZb4vuwkzOziP2R
	 pNsyamH+RwixySuYLJEOe02vfSiaO7c+tdzFMQpf9/wbYVFQYrVIOgqxTdvayeEgrt
	 oRH8+lGY55fLV5cDMq/SuHvSsH1PvsoZALR11+YlYM6nOaK4rfCv6tAg88n4LkPlEl
	 I6/KrTscPBqRw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7A3B9DD4EEA;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic drivers updates for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646749.10550.14396846640730693216.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <a987f881-1c23-4528-9cb1-e5a875b7e7a8@linaro.org>
In-Reply-To: <a987f881-1c23-4528-9cb1-e5a875b7e7a8@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 Dec 2023 11:11:07 +0100 you wrote:
> Hi,
> 
> Here's a couple of non urgent fixes for the meson-sm drivers.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic drivers updates for v6.8
    https://git.kernel.org/soc/soc/c/418188d878d5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


