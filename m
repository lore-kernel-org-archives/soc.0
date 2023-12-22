Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEEEC47DBA
	for <soc@archiver.kernel.org>; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E232BC433BD; Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C989FC116CB;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246467;
	bh=vyZeOJo2t2n5MvlnGq3YugW+FH7UztrP4RVVaG/10pA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Qhs0si/kgTbkbp8M4vL1GWd4XYLosSYWgoCwQAOFHK7Q5pL128hvKBMmkVfzwak4I
	 OEomFvOv9lknnc8BuXaKW+nwDtkSd7ZzeF++0oaG4xHwCb5vuVexOQxmkG9dxs+zUO
	 poZZR74HTgAl299uLlTxfTjuzRCvgVG+RTpbDftVaDYy2k6DkGKIwKvxR4PDPRQyWo
	 LIayFMHB4szh9xwrIJxZdEgbKa/DcItf8/OLidVEfjBoktBpJRJskcDj6PMnjyE0ij
	 CjeKe8oGuN+0uJJJ1CBG7GrubRY1FtxrYq9th6fvTVTaU2bHYx+mvczdx4hMaAZtW/
	 fMugltkTTIhCw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B63B9C41620;
	Fri, 22 Dec 2023 12:01:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SoC drivers for v6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170324646774.10550.16056685660098410197.git-patchwork-notify@kernel.org>
Date: Fri, 22 Dec 2023 12:01:07 +0000
References: <20231221-droop-unblock-81e4fe14acee@spud>
In-Reply-To: <20231221-droop-unblock-81e4fe14acee@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 Dec 2023 12:38:15 +0000 you wrote:
> Hey Arnd,
> 
> The FPGA preprogramming driver that we discussed a while back (was it
> at LPC?) is in this PR. It's in the soc-drivers branch because there's
> a bunch of pre-req patches to the existing soc driver that it relies on.
> I'll put stuff for drivers/firmware into a separate branch in the future.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SoC drivers for v6.8
    https://git.kernel.org/soc/soc/c/cd845dfd46b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


