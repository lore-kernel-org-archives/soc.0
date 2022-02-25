Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EFEC433FE
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3AC7FC340F3; Fri, 25 Feb 2022 20:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F2CBC340E7;
	Fri, 25 Feb 2022 20:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645821611;
	bh=HyT1V1pmLHFyEr80fTMhnTdkTnyCfannqgeeLLwhBAM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eUHBjFBxFrY7pdO/fhx+90+SBs4x+XINcbuKm4unmUItmOR29Ldk+WZDs+HloOJ20
	 NfskbDHev4wHCnLfQxMp3Q/3Sa2EyIEt0Js/mC4wPROsH755EqxfAMH12YBzcFT3Iw
	 v4y+gNmd0jjfpvCArr/2Wm2SbJhhxnlWkPhkE6m9pZ0GiyuK9kGpIDD1bqwIhea8ck
	 9+lMwZa3CBwEr6eKH7rfkJkvtKCWD5xs1JCSkpxSrIDU7wxdh8q4IGPzpQu+BngTdN
	 vLKjx5aqlYw6fdPO2vF2u07zSjGeOgnbhPbLHmFqK/NAGcTSMJ+XKLNqIIrnPnecrx
	 n1XlN4snIhXZg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 06B10E6D4BB;
	Fri, 25 Feb 2022 20:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164582161102.24382.276988265300359565.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 20:40:11 +0000
References: <cover.1644587197.git.geert+renesas@glider.be>
In-Reply-To: <cover.1644587197.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 11 Feb 2022 14:52:10 +0100 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v5.18.
> 
> It consists of 4 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Renesas ARM defconfig updates for v5.18
    https://git.kernel.org/soc/soc/c/0917b5bdbe4b
  - [GIT,PULL,2/4] Renesas ARM DT updates for v5.18
    (no matching commit)
  - [GIT,PULL,3/4] Renesas driver updates for v5.18
    (no matching commit)
  - [GIT,PULL,4/4] Renesas DT binding updates for v5.18
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


