Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E03AC4332F
	for <soc@archiver.kernel.org>; Fri, 22 Oct 2021 20:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0F4C86121F; Fri, 22 Oct 2021 20:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E5BFA611BD;
	Fri, 22 Oct 2021 20:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634933408;
	bh=BRxWHFvZaLVU6zbTewpa/J8ZHv9THp7Gppk6G+ACwKM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=hkp2xSYoTfx8DsN/EsrqPic7XRJCPdD3D+xn9OJkpxLYV+1616VFJlcHUxOCOCvge
	 DhMIy6465ZGmsX8Ns3ayLZCWX3Ka78v1sQKab79KUxn6gRS+Y5PjxdOSd0y7f63lfE
	 2ecKWj7cuAkD+CtUywVzdrxm98MdIp5aEe0Fkt1Nzv2K0I0uctFSzuBfbpizIerREQ
	 pHDuY685VQCmOdEthojOxsFMZJnyzao3m3IZLxiIzmM/JKN7tPUANHnnpz5maihfwh
	 eV0tK0VYNqJ5qH+Y5Q0nO0FUP5cobKbGIbqPb6LIrJQFzxpSsviQMaQm7Auu+L4dH2
	 oddQinWUiXc1g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CC6EB60A6C;
	Fri, 22 Oct 2021 20:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: aspeed: Add UART routing support
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163493340883.6553.9940991449770058888.git-patchwork-notify@kernel.org>
Date: Fri, 22 Oct 2021 20:10:08 +0000
References: <20211022000616.481772-1-joel@jms.id.au>
In-Reply-To: <20211022000616.481772-1-joel@jms.id.au>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 22 Oct 2021 10:36:16 +1030 you wrote:
> From: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
> 
> Add driver support for the UART routing control. Users can perform
> runtime configuration of the RX muxes among the UART controllers and
> the UART IO pins.
> 
> The sysfs interface is also exported for the convenience of routing paths
> check and update.
> 
> [...]

Here is the summary with links:
  - soc: aspeed: Add UART routing support
    https://git.kernel.org/soc/soc/c/c6807970c3bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


