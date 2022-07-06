Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE24BC3F2D4
	for <soc@archiver.kernel.org>; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9AE27C341D5; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 856FAC341D1;
	Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657108818;
	bh=zXGJZ6rMwh1xOJajnNRaBnt27lthH0bLGq7+zWNWuWg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=tQxEItUgwgYVw9cqmcVpZOt1DlSqbKcUP3ZrtmZoAwiB4FGrg5x4OxCH43uUyUnVN
	 U/bZFvWTz2QzPkKOfu9JpBMyJMSTNJkPj75f4i8aXSEAtJJLmtPXjL1pKTcBFOWXRl
	 g8MsI4kcdj6HxZ1gRiT+/SZpfKaXSiuK1Ocx7CdCkgYfFeAILfefA8OGFkSLNhNAMl
	 /UNpT+PWqMnLTseAwMcZXpkGIc/GXhtVK3JU1AWvzUloQPat1BDFbxHFINmjPVx1ps
	 otggUyn6wWgVoKwFwMEDc1qBsg49VfCLO62tzphUyeCStMgZk2/5Xk33Vh78mV7oVA
	 2I6mDLxpNb3xA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 66B50E45BE2;
	Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ARM: dts: lan966x: Cleanup flexcom3 usart pinctrl
 settings.
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165710881841.23384.1632474007849606356.git-patchwork-notify@kernel.org>
Date: Wed, 06 Jul 2022 12:00:18 +0000
References: <20220704135809.6952-1-kavyasree.kotagiri@microchip.com>
In-Reply-To: <20220704135809.6952-1-kavyasree.kotagiri@microchip.com>
To: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Claudiu Beznea <claudiu.beznea@microchip.com>:

On Mon, 4 Jul 2022 11:58:09 -0200 you wrote:
> On pcb8291, Flexcom3 usart has only tx and rx pins.
> Cleaningup usart3 pinctrl settings.
> 
> Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
> ---
> v1 -> v2:
> - Keep both tx and rx pins into one node.
> 
> [...]

Here is the summary with links:
  - [v2] ARM: dts: lan966x: Cleanup flexcom3 usart pinctrl settings.
    https://git.kernel.org/soc/soc/c/43a4ab4cf568

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


