Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C90D8C4167B
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B57D5C433D7; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FD3EC433B5;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042343;
	bh=A8esrYvHiSxEp/GuEFS/TTy4bKvweD+q/PZeL83PaCQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LkwNMIntdZCXVG8tjX3z5+rX8EQf4vSpsGzrrOfm3B3MVJrzqQh43moHNc0VkPX79
	 r88/COGZ/zl8Eb0+N/ebZ3OM+xMAVbz60Dor6V1Vhjf9LU5pXwXRp5SiH5D+sUoHDq
	 +PdKjKCKAEeiDpq+IZsmvxuQX++Z0wDcv0k73JMR+qFGC9RjLogFywvaBGA+s2ImPR
	 YB9VuHuHKNWPsLU1T+pnnzJZfEq+TmMjcfCx8Ztu5CrD+BbN3TPPk5hh8YOjxR4q3y
	 KysAZQetdoq2HoXnfid8mD0ac4VSTJqpNeY2pNL/uEq2P0lXAinvIO0h6jnLpfp90N
	 R9uYQs+079CxQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 89E3FE29F41;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: multi_v7_defconfig: enable Type-C UCSI and STM32G0 as
 modules
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234356.4359.1740695530530368062.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <20221117103931.26174-1-alexandre.torgue@foss.st.com>
In-Reply-To: <20221117103931.26174-1-alexandre.torgue@foss.st.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 17 Nov 2022 11:39:31 +0100 you wrote:
> From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> 
> Enable the USB Type-C UCSI, and the STM32G0 UCSI drivers as modules, since
> used on STM32MP13 board.
> 
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
> 
> [...]

Here is the summary with links:
  - ARM: multi_v7_defconfig: enable Type-C UCSI and STM32G0 as modules
    https://git.kernel.org/soc/soc/c/6bd7179385f6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


