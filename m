Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE86C4167B
	for <soc@archiver.kernel.org>; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6ECE9C385B5; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 594D6C385BA;
	Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649970615;
	bh=M6Dgks4QW77lgmT2472YVhhu9jkzs+HGYmLSePsCBDY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oX+52XdfG9gmf8zfW/f8r7T0qO8ykBlLDAMB5/JRzo3VPLZGnYd5R7OKVTM8FtKzt
	 0qh2jX8QqTuB+PZtEXFYSxwVshk1Sp+MmYkUxASTMEuut/TTLBZmSTykbVafTWfwm/
	 BREFYnynB1BVJl3tBLdbg5p5OgsL1vNHDxrm9uXMKdv+HhLk/3Au9rN0BL5/Vw1Xiw
	 t1OKTJ9JhPv+qxE2yqIbgJVxfwgpmpuD4eBrD/o12U9TmgiMVC6AwaopAAJtnzNBmy
	 RpR/PHpHyB1OHIHpYQelUdHjA8bNBlgUaTx2fK4NVOW5GjNBtp3wYBnysmrRsXGbvq
	 JdFTGnXzRM1rA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 35FD2F03848;
	Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: fixes for 5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164997061521.10394.4792100813414024490.git-patchwork-notify@kernel.org>
Date: Thu, 14 Apr 2022 21:10:15 +0000
References: <20220414143318.26363-1-nicolas.ferre@microchip.com>
In-Reply-To: <20220414143318.26363-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 14 Apr 2022 16:33:18 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here are the fixes for 5.18 addressing DT issues. Please pull.
> 
> Thanks, best regards,
>   Nicolas
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: fixes for 5.18
    https://git.kernel.org/soc/soc/c/67e473a303e7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


