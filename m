Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0702C46CA3
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF229C43397; Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A499BC433CC;
	Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701883050;
	bh=CQ7JIHeAIVHBtQhrjDnsLnd3BuHJEDDnb5KMoOGbBkI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ATAu0zZNfJAACl/TgVhjqPRS7/Ajz7YX2wc4YvIxMvhRXSWSDCTUFVna2sXCrezP+
	 NIv8m6AdNBRAxS3z63LfL1g3SokJ6xPAXWyWGsmapFLcCsUIXhDaNA2uquKnM4+Hk1
	 ++FIVb6hP1ihTWCtjFZmy88mGJ9uZECqtVENTF4Wm9wNCLZgropvWS6Fgqu+EtAQih
	 beHxlKAgUSJuy+c5W2K+XjbnaTuCGt4RiSIIEWwwPi6PuE257RqnIjq+SVHxl10ndE
	 rRtaaUflxx4qEOFtHeS2i/cwSOCD5g7Wjsb0IO4WmdodM6F5cPNVlhEJMpn8h3WemM
	 HmofExQ1TknDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C8E9C04D3F;
	Wed,  6 Dec 2023 17:17:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Add SCMI reset support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170188305057.32642.17028354492956509235.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 17:17:30 +0000
References: <20231103085400.2924282-1-etienne.carriere@foss.st.com>
In-Reply-To: <20231103085400.2924282-1-etienne.carriere@foss.st.com>
To: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 3 Nov 2023 09:54:00 +0100 you wrote:
> SCMI reset controllers are used in the ARMv7 STMicroelectronics stm32mp
> boards:
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
  - ARM: multi_v7_defconfig: Add SCMI reset support
    https://git.kernel.org/soc/soc/c/e88b859cab4b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


