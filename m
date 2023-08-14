Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F94FC001B0
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 22:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2604C43397; Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8A8FC433C9;
	Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692051635;
	bh=Gkc1tfOnW0xvuqhqPuLJpcYx1mo9E4DNy8lMDX40cuQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OqfBg48DFPLo7Y/IAOJPJ17mD1AvJIichsPGMAvy8vQRYSMkQhYnjr8Gu7a99r9UB
	 AoluRQ8ObBJ1J0RZTZTNY/cy3GvtLjxnalgN6PXTLI3iFxvJteGKTzRxMj7ojeBXI6
	 rK3PTxtZtuc6BTgBjNFJuMv67/xNjHx+EtyQ1A4Bekm539NQ1oe41/5Rc2Qc0qehfX
	 RcpweLu2XpCyaCm2TzznHMOdMlXiDqJgP/WnhpmKOO9ciQYYtd0G/st2w81c0GYMXt
	 IsmlLvOm41HQnFAaGckvN8cgqChrxbe6l5tdmk4mdNMmi6C0msgggdHscQ97Likxfu
	 g81uOVk1x0uDQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B84A5E93B33;
	Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169205163575.23017.14896738190774232648.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 22:20:35 +0000
References: <20230813-naturist-fragment-ac7d10c453ba@spud>
In-Reply-To: <20230813-naturist-fragment-ac7d10c453ba@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 13 Aug 2023 11:25:59 +0100 you wrote:
> Hey Arnd,
> 
> Please pull what is entirely StarFive related changes for v6.6.
> I noticed this morning that I had an s/0xf/15/ change sitting unstaged
> on my system, hence the recency of the top-most commit in the branch.
> 
> The rest of this has been in linux-next and all that jazz.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetrees for v6.6
    https://git.kernel.org/soc/soc/c/ba817911855c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


