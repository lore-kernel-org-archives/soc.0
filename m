Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60835C433F5
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 21:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 371BAC3411A; Fri, 13 May 2022 21:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 216C7C34100;
	Fri, 13 May 2022 21:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652478019;
	bh=wOD0TLVe6BDYs0vtTqgteVHJtl0trFQZ1LQv4EJM1wE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=c9uj0Oz5Tij5FU3wy8KnmBTbgieUd2zbPHLUHnMkfIXneg9vLaGIJDznGW+//MULC
	 Rsem+KmD7epb78StanVP0bewpszfI6Zco6lhFAEcJqRL78RYWcE5IBe25YGoF52ewG
	 T0Qm7CR+cS49rX/F/KtAEAjziszGsbqrcItd6tibDMAYk3f2zOjOKqm3LtTrLbV76Y
	 SbgwQslOm2ynBeQbusvk5oRpV+wnCszbm+O4v68QhpDf6lHqRiXl1K9KOz+HkAgVuw
	 LCKOnJD8dcW8KaQiiyEzRdmbXXLGjg6RnCiSoSTratcNle41CysHLlZcXh5FxVMtDp
	 ymjE8JnIlbaww==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ED059F0389D;
	Fri, 13 May 2022 21:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: dt for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165247801896.11200.17948813091828167061.git-patchwork-notify@kernel.org>
Date: Fri, 13 May 2022 21:40:18 +0000
References: <20220513162338.87717-1-nicolas.ferre@microchip.com>
In-Reply-To: <20220513162338.87717-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 May 2022 18:23:38 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here is the first batch of dt changes for 5.19.
> Thanks to Claudiu for having collected this series of patches.
> It's a bit late in the process but we might have another batch to prepare for
> 5.19: not a big deal if it's delayed, so tell me if it's closed for this cycle.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: dt for 5.19
    https://git.kernel.org/soc/soc/c/8f311c09df4e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


