Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55761C433FE
	for <soc@archiver.kernel.org>; Thu, 10 Mar 2022 13:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2F756C340E8; Thu, 10 Mar 2022 13:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A696C340F4;
	Thu, 10 Mar 2022 13:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646919011;
	bh=sYW7Id0KYsRRG6fW09pkhOsQNr21PJlVVY9rdzI/6Xs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=teL/NAwsv5MfFZ99u3DHWydo4pwQxC/sWGfnbfroAhdGA/fQkDtd/WfPRF3x6IQjm
	 SvRWukw3O16W1xl2EUY9325rHTt6Y7HQMqhbFf5DdPhy1QRAQf72kEDVSzNSnPvXky
	 MvYk+y+R+TdXi+WjSc+mhEUxpUv0BeMonrcyrOEjn33ogKqCa3ELGlyFay5i/0eR1I
	 Or4ELuQZLi9vzg6XDvwWahu3xaMi4wMdvEKk0Inuy8RRDAp+VOC1RphkHVusduMXPj
	 ngbtT0UgnH2Ae1P1TVwjLkzssVXNZXUmR4ghhl3QkbTLH+r2PqnvhHDxkgeCTTqPHT
	 lfBe7Uk/BGQUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E9CC2E8DD5B;
	Thu, 10 Mar 2022 13:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 5.18 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164691901095.15792.16396326936706890463.git-patchwork-notify@kernel.org>
Date: Thu, 10 Mar 2022 13:30:10 +0000
References: <13959624.7hp8jFWaoN@phil>
In-Reply-To: <13959624.7hp8jFWaoN@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Mar 2022 02:37:57 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below some somewhat tiny additional Rockchip changes
> ideally still for 5.18.
> 
> I can also move them to 5.19 if needed though.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 5.18 #2
    https://git.kernel.org/soc/soc/c/fc30ed4edd4d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


