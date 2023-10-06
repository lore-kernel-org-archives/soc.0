Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2816E94125
	for <soc@archiver.kernel.org>; Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F7C6C433D9; Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39AE1C433CB;
	Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696626685;
	bh=NzvKI+ADZJ9inthm/+4exKjgwgPlfEYCHlDYBen/6w8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ca7uOVtAf4k30Tnr2dD51BabOF6XFZ9d0biMzduQleQwK5TzNVxn+ImVhI4/3X5Nc
	 Shn2nxUTxAxPJ2bzKxchz8+U1B1Qw09j5oeMO/unWTGRcjyXaM0S/iNbm7yi79Uy5L
	 5oEoyHLUDufPzjHAJ2GYp/McthA2eirpXf5hYPRGksrCj0B+eRthRI9vKPHv3iz6D3
	 BP2HzlbTx8Cf36f8fHhhJ2nh7JVq2w5ni7MSxCA/bRh94wxopcCYTiFgV2uT4XK893
	 dhEsGViKC/ydgOGbRgBN3yB/NTIJrhLSzX/D19REQeHFJbZ8nII9xvFDA1lipe62Ge
	 100uKXnEH+Ocw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 12651E11F50;
	Fri,  6 Oct 2023 21:11:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AMDTEE fix for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169662668507.6539.5233113803102683504.git-patchwork-notify@kernel.org>
Date: Fri, 06 Oct 2023 21:11:25 +0000
References: <20231003171835.GA669924@rayden>
In-Reply-To: <20231003171835.GA669924@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 3 Oct 2023 19:18:35 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small AMDTEE driver fix addressing a possible
> user-after-free vulnerability.
> 
> Note that this isn't a usual Arm driver update. This targets AMD instead,
> but is part of the TEE subsystem.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AMDTEE fix for v6.6
    https://git.kernel.org/soc/soc/c/a41e95a7c19b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


