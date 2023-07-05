Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84113EB64DA
	for <soc@archiver.kernel.org>; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D398C433CD; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 472DCC433CA;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688589724;
	bh=L3h6yuH2UN3AavhmvObU4L+LgEnzyThtr2SVwWzyAq8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=KwKd/oNd5nDziNKbSHnDDauutLxVgNaf4am/GK0gQQOk84g3pTCOrVCWWip417IdU
	 15usbn/alHMKJHO/t91ZG5zCsbO7Db2+zWvFNeVj5g8oT5dqpbIVUs0XIKO9iXW00x
	 4lqAHIXPld6DM89FSx7nIv4xwScnSPe/wHWGB0sqOgi78bUmCLLDKOHsvS17DlhKig
	 MVr7bxrlixKx+XMrx7+ebRaIvOVscDI//rWeaI61yZeeRyhzbVHaqqer2uLRGaFGY3
	 TvHNw8rr/yK536YmH6KjXtoIqhTZCux3Q2pIiBifK6hTCXHmCS3+jh09qJ2jVIgELh
	 lhpNR1ceRsbCQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 27C5CC395C5;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168858972416.10612.6675631743477307097.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jul 2023 20:42:04 +0000
References: <20230612-fasting-floss-0bc05a08bc7a@spud>
In-Reply-To: <20230612-fasting-floss-0bc05a08bc7a@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 12 Jun 2023 19:23:14 +0100 you wrote:
> Hey Arnd,
> 
> A wee bunch of changes this time around as a bunch of the jh7110 stuff
> is still blocked on clock drivers. This'll probably be my only PR for
> the window, haven't got anything SoC-driver wise & it's unlikely that
> any of the other bits will be ready in the coming week.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetrees for v6.5
    https://git.kernel.org/soc/soc/c/c9a5aa0e53d0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


