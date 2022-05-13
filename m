Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BE7C433EF
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 10:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 813F4C36AE5; Fri, 13 May 2022 10:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 671B3C34113;
	Fri, 13 May 2022 10:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652436018;
	bh=uua7Gj5IPSM4e5wt1sUnYZe7W3mPQDlRPyJcxJ+f9EU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Es1FLZSun6VyU2dK8PNgEuuunXRwKa+X9yrNiV1GwKYkDZhUCXWqxcttllJrxJ8Gu
	 yRU8Cr8jlki5+xZhALGiHcXf4P8U8HMr69vvudoLnVlUk/hOidBB1n5/TjzvId/WpA
	 UGmoNrgeHLAcwiPP/JgWdDPq+++0biEMj9L9m7Sybm7LNgURuMBzxZxNSnhuOza9oV
	 V5cAMt+l5nP7jKv3TYFIMb231+gV2q3oXEpXZ2M9R5lWKYdjgHieSrDA2DSDnAUEmc
	 zgYFaSEmZD4YbeQOivNS8Cf+FqaoA1SzZpvdSEYXb2vIz8NNCztAD1syqmw9/JxgyI
	 9yxyK5Hravohg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4D69DF03935;
	Fri, 13 May 2022 10:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: clock: stm32mp1: adapt example for
 "st,stm32mp1-rcc-secure"
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165243601831.30999.161396984094001630.git-patchwork-notify@kernel.org>
Date: Fri, 13 May 2022 10:00:18 +0000
References: <20220511092559.4952-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20220511092559.4952-1-alexandre.torgue@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 11 May 2022 11:25:59 +0200 you wrote:
> For "st,stm32mp1-rcc-secure" schema, clocks and clock-names entries are now
> required properties.
> 
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Acked-by: Rob Herring <robh@kernel.org>
> 
> 
> [...]

Here is the summary with links:
  - dt-bindings: clock: stm32mp1: adapt example for "st,stm32mp1-rcc-secure"
    https://git.kernel.org/soc/soc/c/045d0c3db911

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


