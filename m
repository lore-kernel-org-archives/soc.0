Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1B5C43217
	for <soc@archiver.kernel.org>; Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 81C42C43146; Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69E8BC433B5;
	Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668430816;
	bh=wb9Cm7BfRX1LdQ0LRq0mIBJH8u74iE2RleWjZa1fMk0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Un1MkOV8zVh1+7iQv7EkmF2VrMQ0ERVmDzpY565zyxmB68gS+lCrU0/1Kxzn3aqEJ
	 RPSXYpX1jOPupGyFmsV/2LMSkqS3mUtDNhSsCpzU8VndwLJCx4JcSedycufjQC+GpU
	 h9R2QvFYgy7UYO3MmOLuHEfKXZ33WgkEO+EpjAvdXWhMIEuA0m3MXFH9U1ZDPsnuft
	 2TWbcG7pu0HptOQu8+2K6KjkCJIrq2Hc89snkX/qlYMXLN+AMGIfVg9YJJf7Fqg4bs
	 tLEgEEstLQxEmDTpaBh6Oaf3z7w4FIWkbMvphGrZurz/4a5yQkHQK6sLgFN0uJqtV3
	 cXsM6WUEwqDdw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 56615E270EF;
	Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 0/4] Route RISC-V SoC drivers/firmware/DT via the soc tree
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166843081635.22003.16583813044179917807.git-patchwork-notify@kernel.org>
Date: Mon, 14 Nov 2022 13:00:16 +0000
References: <20221109212219.1598355-1-conor@kernel.org>
In-Reply-To: <20221109212219.1598355-1-conor@kernel.org>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  9 Nov 2022 21:22:16 +0000 you wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Spoke to Palmer today at the linux-riscv pw sync-up (see [0] for anyone
> that may see this and is interested), and he said go for it w/
> MAINTAINERS changes. Routing patches this way was proposed by Palmer @
> [1] where Arnd & I had a wee bit of back and forth about the maintainers
> entries required.
> 
> [...]

Here is the summary with links:
  - [v1,1/4] MAINTAINERS: add entries for misc. RISC-V SoC drivers and devicetrees
    (no matching commit)
  - [v1,2/4] MAINTAINERS: generify the Microchip RISC-V entry name
    https://git.kernel.org/soc/soc/c/d10728ff93b5
  - [v1,3/4] MAINTAINERS: add an entry for StarFive devicetrees
    https://git.kernel.org/soc/soc/c/94803f9e1623
  - [v1,4/4] MAINTAINERS: repair Microchip corei2c driver entry
    https://git.kernel.org/soc/soc/c/d7f6fc14e513

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


