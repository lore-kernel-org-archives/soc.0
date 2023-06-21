Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C0CC001E0
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA208C433B9; Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA70DC433AB;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687379436;
	bh=o4gqg749nSPc6OOt7i9gq5LL9Wj3AobAll47NOBBgkU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ufWQi/6kenw75J/2+1iUZMw+8N/ejzBHc7vqtufz/O15y0j04hBowO6zypHD8qFDI
	 7r3yJfK/Snfvesl7/PCv+wxaaQIVPq42tw0lyY45z8sLZSyLcs0PRR+7DyHb/N6gDJ
	 qgx9e2BLzP7KyhGlhUV1b40GXLrQlPNNC384f2wSt07obNEaqbMdKM3DtUshfodMEK
	 X0fw6DIZKc55PomMC43o0Te/hUzSVqaMvt3xRd84K2pW52UwGrnZZfAr7mMdZWVoVx
	 A9G51H7sX5T3hfCU4MuXiCdyNPKoZ5ItdFNMnoKCYHWa7KzfA9efTZAZZ3DD7988YM
	 Me9HWypJWRBqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A8F2AE4D027;
	Wed, 21 Jun 2023 20:30:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] defconfig: mediatek: Updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168737943668.9834.13731219797425023570.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jun 2023 20:30:36 +0000
References: <92e336ca-bbbb-6d6c-297a-13deaae4138b@gmail.com>
In-Reply-To: <92e336ca-bbbb-6d6c-297a-13deaae4138b@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Jun 2023 18:25:45 +0200 you wrote:
> Hi Arnd and Olof,
> 
> Please have a look on the defconfig changes for v6.5.
> 
> Regards,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] defconfig: mediatek: Updates for v6.5
    https://git.kernel.org/soc/soc/c/94a599c8ee7b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


