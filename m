Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6A0C63798
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 21:20:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 32D15221F9; Thu, 26 Nov 2020 21:20:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606425639;
	bh=JaXD0/T/Eijc99enrGgFIhSxxk+81snpTtVAAkyC0TI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eP9oFdNRIWU56xjqoPJKQ2GNmACdlT7scqzcpGuKU6LXdDDg37ZxiYJyXTxLIK7eF
	 kwyL2iBqwoVi+0qO7d1DPVQT2ZlQehnHyvrmX8wV9aDWAAeDxjFq/7Y78svAB2uWhv
	 m5m3tBAbNSe03hjxmVEaTYth37X8bDPdPSeMS2Y4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: soc: zynqmp: Xilinx SoC fixes for v5.10-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160642563902.13931.14924902594772050786.git-patchwork-notify@kernel.org>
Date: Thu, 26 Nov 2020 21:20:39 +0000
References: <fd5ab967-f3cf-95fb-7947-5477ff85f97e@monstr.eu>
In-Reply-To: <fd5ab967-f3cf-95fb-7947-5477ff85f97e@monstr.eu>
To: Michal Simek <monstr@monstr.eu>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Tue, 24 Nov 2020 15:22:37 +0100 you wrote:
> Hi guys,
> 
> please pull these two fixes to the soc fixes branch. It would be great
> if we can get it to v5.10.
> The branch is based on v5.10-rc4 because Arnd's first patch was applied
> to rc4 by Greg which is causing panic on Xilinx Versal SoC.
> The second patch is fixing issue with SD reset by using proper ID.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: soc: zynqmp: Xilinx SoC fixes for v5.10-rc6
    https://git.kernel.org/soc/soc/c/dbae2736fd9f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


