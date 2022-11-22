Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99626C4332F
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 22:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C9D9C43470; Tue, 22 Nov 2022 22:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4578DC433B5;
	Tue, 22 Nov 2022 22:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669155618;
	bh=ygkhBTCApi7Qz2NSE1MyGK4v1DKYXMPC76RIOXo96kg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DzTAG+3dUsg2o9ihLAj6Kp/plACifVEZ2ZC3VPFNHnLmrPUTS8wEYhktYHtsslRnu
	 DrydAvBnpWP8lwnXF6LS2pUN3Ctqm38dygldnXgQQ18hDPXBv8VTiNLyXhA0ghTHWx
	 NgTcXpTXtAD50LSyVCQaBzQxeV4cIUF9hZblK0ta2IFi88BuFdlpd2jLUfSkHRtUZ/
	 terTWG1812HbAp6AVbD0ENlFB8g9QLJRruhet7uX/QsPCezggL3R6zPH5K+oBzK/sm
	 b/4nZLVvL/vAzovSVOn2sGx3pBeVVqohH8h12665bCxaggg1yUteXfYpXB9Yg6N5fC
	 OWsNZtTJpfhHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 23CF8E270C9;
	Tue, 22 Nov 2022 22:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: ixp4xx: Don't touch bit 7 on IXP42x
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166915561814.11152.9822438799695034297.git-patchwork-notify@kernel.org>
Date: Tue, 22 Nov 2022 22:20:18 +0000
References: <20221122134411.2030372-1-linus.walleij@linaro.org>
In-Reply-To: <20221122134411.2030372-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Nov 2022 14:44:11 +0100 you wrote:
> We face some regressions on a few IXP42x systems when
> accessing flash, the following unrelated error prints
> appear from the PCI driver:
> 
> ixp4xx-pci c0000000.pci: PCI: abort_handler addr = 0xff9ffb5f,
> 	   isr = 0x0, status = 0x22a0
> ixp4xx-pci c0000000.pci: imprecise abort
> (...)
> 
> [...]

Here is the summary with links:
  - bus: ixp4xx: Don't touch bit 7 on IXP42x
    https://git.kernel.org/soc/soc/c/ff5a19909b49

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


