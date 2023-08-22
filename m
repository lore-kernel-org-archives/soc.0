Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96011C3DA6F
	for <soc@archiver.kernel.org>; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 412EBC433B9; Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A823C4339A;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692671476;
	bh=URHt9n62Iq0uEnm5cHf+OD2ZmNwxAecMLZXCUXjQOzI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pY4Usx3aCSSw0mIzBlBMKBwGqk00GvpW3b9O1HYTh8E6yR3+ilHOw5XdcTWd69W+u
	 ocyg9pJp0mKrfuSI/mI2aI6d6P/UOBA8RPOHsUAW+U1fmHUwn8TRsvYUvuegy/DQZH
	 3KLw0hJrXmg+Rzz3+10cG/4/4VKgE0aef32v4jgZQ0hJmGYfaYr+dyoAc6kvW812JP
	 NDhe43O9YTfy1A9npkI48d7BANgQ8rSJT3CHjiwCW3+W3Zc5nE3ZB+cIWbgv0Nvwub
	 ssxfGqKU2NSu7EL7DfWeoNDbiCdtRKOdR82NZEKof/LVpNhuXikqn5VH4vRxVYzUxb
	 OryAIm4ECMs7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0C70CE4EAF9;
	Tue, 22 Aug 2023 02:31:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Add SCMI regulator support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169267147604.32531.13254850817493913755.git-patchwork-notify@kernel.org>
Date: Tue, 22 Aug 2023 02:31:16 +0000
References: <20230816123055.12636-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20230816123055.12636-1-alexandre.torgue@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Aug 2023 14:30:55 +0200 you wrote:
> From: Pascal Paillet <p.paillet@foss.st.com>
> 
> SCMI regulators are used in the ARMv7 STMicrolectronics stm32mp boards:
> - for STM32MP13: stm32mp135f-dk
> - for STM32MP15 boards with SCMI variant, introduced by commit 5b7e58313a77
>   ("ARM: dts: stm32: Add SCMI version of STM32 boards (DK1/DK2/ED1/EV1)")
>   * stm32mp157c-ev1-scmi
>   * stm32mp157c-ed1-scmi
>   * stm32mp157c-dk2-scmi
>   * stm32mp157a-dk1-scmi
> 
> [...]

Here is the summary with links:
  - ARM: multi_v7_defconfig: Add SCMI regulator support
    https://git.kernel.org/soc/soc/c/8d6b4927936d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


