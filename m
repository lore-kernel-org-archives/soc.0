Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42A49C77B72
	for <soc@archiver.kernel.org>; Tue,  4 Apr 2023 14:41:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EFC75C433A4; Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D971BC4339B;
	Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680619283;
	bh=JMBDK+RKzU6roQz7K1542hV1BPbOHqULToFNIDNZ0x8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UJ+vdtDPmpLhIu2K5vmOgJP/iX0cpvWLPNqLRAp0W9sILYBEFzR5CxxbEu0oDrRpC
	 TlbJhi0uclD5rzvgByE5x9uOBjC9s79cLkagMvDWJIDNzbcABVjWbFcoxE8xbejYRN
	 L+HJ3bmkAyrmMOIKW6uGhEIDYeIQFL8Oiphlg8Y442WA95SV+Wj24KmkcneqladFCs
	 71XwVIGSEmAgrEHTt+oXjIaZhl4IYNglj7gibVHcejsxYxXwyoM9le5qdVg/R0mRSI
	 tfygk+gkf/pnZPDVszLNNhNl95oFcZBuEyQOylOsJEyLD7cTICSijQ87lfCMXQtBLi
	 BQzCH34GmQ6/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B23F1E5EA85;
	Tue,  4 Apr 2023 14:41:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: dt for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168061928372.17322.5401131999722781322.git-patchwork-notify@kernel.org>
Date: Tue, 04 Apr 2023 14:41:23 +0000
References: <20230331142751.41522-1-nicolas.ferre@microchip.com>
In-Reply-To: <20230331142751.41522-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 31 Mar 2023 16:27:51 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are the dt changes for 6.4. Just a few patches this cycle, please pull.
> 
> Thanks, best regards,
>   Nicolas
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: dt for 6.4
    https://git.kernel.org/soc/soc/c/63d2b92754aa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


