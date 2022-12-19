Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A868C10F1B
	for <soc@archiver.kernel.org>; Mon, 19 Dec 2022 16:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2480C43392; Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB412C4339E;
	Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671465633;
	bh=fPgv//6dxE0zUnHz8zyENVA6XbABc/hDmJDRQ/TT+Hg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=F4FH5pmnDm4EWw0ez0kPYvsTiAWtNsaJiwn4IuztaIsF58vAkD3hvasvvbQOGYb2/
	 6DhIr+k4tfcjF2e1tPVFcEFbBi4KrZcvj/MQHlB2sg6Q7sBX7B17Ij1H1gMxqE15SE
	 Zr+rAW98b/T7XhgU/bbYqkdiVzGycIwKN/Sx6r/GERbiKEyBzbizWHe81QOSJjP5vV
	 glY+0wDa5MHhMTEvGYJRlDf4Cx7UKQ8Y0Fm3W22wB+zX01ZATpeq0J9Sypmy5xQb1u
	 7PP8R+cYGv9BVq1s2ACV8zedYys7hKfHGSGUWrA0lBWEXWZKCwdoU4OwO30M0wSF1T
	 c0c3lDd9Kyo1Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A354CE4D009;
	Mon, 19 Dec 2022 16:00:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: disallow pre-ARMv5 builds with ld.lld
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167146563366.24111.18317592468369321766.git-patchwork-notify@kernel.org>
Date: Mon, 19 Dec 2022 16:00:33 +0000
References: <20221215162635.3750763-1-arnd@kernel.org>
In-Reply-To: <20221215162635.3750763-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Dec 2022 17:26:20 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> lld cannot build for ARMv4/v4T targets because it inserts 'blx' instructions
> that are unsupported there:
> 
>   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
> 
> [...]

Here is the summary with links:
  - ARM: disallow pre-ARMv5 builds with ld.lld
    https://git.kernel.org/soc/soc/c/6a7ee50f8f56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


