Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBB7CC4321E
	for <soc@archiver.kernel.org>; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6C476615E3; Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 546FE615A3;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633441809;
	bh=QpcSigMIeSuCMug9k2tLmToM3nVMeDpjklGETOmqKl0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Q3mT0ijskhz68+PQ5mDt2bPY+rioQ/PiHYLEAQFjiqMiLQYr5XKBi8TWfD/JDPDoP
	 mdBPEMnHEpAA5vmsN0zWEi9iI5wR1A7e369TG63x0T51Gy1Y2MO/KqpjyoxbWB6y1N
	 8vIjLGWlXhqdEw2yuLoZuEmjFt1G3DEp/TKPJuvXA/DsXU+G7qTsQZrCW7EQw1Nstr
	 61a3xDdpuc5fexhFHfu1Dj0/uHDv/Vf17thqWs3s3DlXIKUhUuoWzbxbd8XQLGxgwl
	 DEN+stjYaMfIdKH8DoFuyabJzb5o/d5QDfVClWtqiX2aLKVm4bTG76ZaMeU/h16SWe
	 S9uJUdLWVJVVg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4D96060A53;
	Tue,  5 Oct 2021 13:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: fixes for 5.15 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163344180931.2242.2381920432806930959.git-patchwork-notify@kernel.org>
Date: Tue, 05 Oct 2021 13:50:09 +0000
References: <20211004114344.19304-1-nicolas.ferre@microchip.com>
In-Reply-To: <20211004114344.19304-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Mon, 4 Oct 2021 13:43:44 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here is the second batch of fixes for 5.15.
> It goes on top of previous PR at:
> https://lore.kernel.org/linux-arm-kernel/20210914162314.54347-1-nicolas.ferre@microchip.com/
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: fixes for 5.15 #2
    https://git.kernel.org/soc/soc/c/d0c624c03012

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


