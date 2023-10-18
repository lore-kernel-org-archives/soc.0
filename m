Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38723CDB484
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 15:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 298F7C433B7; Wed, 18 Oct 2023 15:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D95DC43397;
	Wed, 18 Oct 2023 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697643634;
	bh=1T+ZBMDCwwHkkj8FP6fTZ5zabhIjG+N5frzB67a71Mg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ervO0AcbiTHmidg+Lpz+5LR9T63nCt6/eSHmxvoYNjqiuzzyOwg4mUFTacoP2QONR
	 Z8Y2jlid+QWgTL0n2IfiQiCvyX6HzJtpEGWvDPspbr8UyPlYAufM9n9W4B9KES3KwB
	 W6XhLGfHNfYhAz+Jwu/WMPh0Hscx+Nnm1IEQW0/6USGMZVrck+4wFTHqiIvryu+Gv7
	 hAloyc3nQ8ORerWI+3/YRDEPnJH5+/qUp4VriTEtCk+vi2is9fWcSWyk3BRh0WzLaY
	 nBozwmE9PNHX6SoCMmUIlD/Qwk6oBeABpIVcxk1y+HKljjcyoCoXqNb5QQWHiPcGat
	 KJFdyAG3Zi1jQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E70F9E00084;
	Wed, 18 Oct 2023 15:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fixes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169764363394.8197.5201841114937781556.git-patchwork-notify@kernel.org>
Date: Wed, 18 Oct 2023 15:40:33 +0000
References: <pull-1697606314-911862@atomide.com>
In-Reply-To: <pull-1697606314-911862@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 18 Oct 2023 08:19:34 +0300 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit 06f114cf7cbe96a07c51c47114d79e9654275919:
> 
>   Merge branches 'fixes-mapphone' and 'fixes-ti-sysc' into fixes (2023-09-13 11:11:11 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fixes for omaps
    https://git.kernel.org/soc/soc/c/eaf16b92b18c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


