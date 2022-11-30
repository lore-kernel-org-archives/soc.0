Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88345C636F8
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 72A28C4315A; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56298C43158;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828262;
	bh=okJL9a+hLs2x7JHjXWlYAySJeNC8O25rweXt/gdKYlE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hkwVEtVHQ7KMOIVGolNlvX4qlEf4qcMDN8Lubekt0ufRnB2V5fS2WbajuyY+sY+bR
	 47MLNehmw8bFkoHZ7XxJAheR2YCrH8i4EY2UjWxG15Y+yS1KJWyCzx4M0tI3KGm2bR
	 JoqwWQtLH6k2y6zurzaYJUwb623EQgyeaGWUVY2+dc6Bd9EGTWnoH1Foj4PrXPTSFV
	 M/tLaiv60uKWjT3b2SzPFy0Le+fhH5HAHkSmeaoxOEY2lySHDjbG7TQEvkKB+pDy02
	 +7mSSRRgo7qYCcGcEtPrEu+Mq/HM//rEQWgc0TbKol4p28E8zd1Cd8hFydx8oSAtyJ
	 kIoo8wTw06F7Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 42828E52548;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Revert "ARM: dts: stm32: add fake interrupt propoerty for
 ASync notif - TEMP/TO REMOVE"
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826226.9936.14723554727437854397.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 17:11:02 +0000
References: <20221128133339.25055-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20221128133339.25055-1-alexandre.torgue@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 28 Nov 2022 14:33:39 +0100 you wrote:
> This reverts commit fb4ce97d9c5daafe100a83670c697b92c9d1bb45.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> ---
> 
> Hi,
> 
> [...]

Here is the summary with links:
  - Revert "ARM: dts: stm32: add fake interrupt propoerty for ASync notif - TEMP/TO REMOVE"
    https://git.kernel.org/soc/soc/c/7b16ab92bbf8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


