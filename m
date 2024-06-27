Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB90C30659
	for <soc@archiver.kernel.org>; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0B268C4AF0D; Thu, 27 Jun 2024 15:01:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E85B2C4AF09;
	Thu, 27 Jun 2024 15:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719500463;
	bh=SmJ2OLTUviQWZ51B6dkr++Nk4ieCDDREn9T2uaTJIxs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Fh0U3sy1alB4BMf4e1e0CHVnVrNriPtP0C39WOOPKDlBija1wngw8F9LE9RroUvSw
	 bGvXpT2okOljPH2ccOARkZThXUwSbmIJWdL6NV9rWoQa/cYeXzlr+u/ed/MuokY3oe
	 CyQwYJKTfTsainkgnWnEb1JlWIOD6yM27db7Jzy0d21mErA+CNDHFdB7x33XWs2MbD
	 IHwt8kx99v0M4WiCMbe/ASOn9T2NHo18UNAU/k0U9qMJkRCDqvAYOe2ggAmK27+f3u
	 eEPvNuT0yGWVfesVSA5or+NQKKE5D8n8thiGDJI2+DqR4gtdhubTzcjWQFsFnQumz2
	 bIyYDYt3vUmHQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C9E6AC43443;
	Thu, 27 Jun 2024 15:01:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171950046382.29698.5549005806089742965.git-patchwork-notify@kernel.org>
Date: Thu, 27 Jun 2024 15:01:03 +0000
References: <20240626163258.61222-1-p.zabel@pengutronix.de>
In-Reply-To: <20240626163258.61222-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 26 Jun 2024 18:32:58 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v6.11
    https://git.kernel.org/soc/soc/c/f42af02c0a9d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


