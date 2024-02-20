Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B90FC54764
	for <soc@archiver.kernel.org>; Tue, 20 Feb 2024 21:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0226EC43601; Tue, 20 Feb 2024 21:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFD7AC433A6;
	Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708463561;
	bh=FHj2794pnPONSym5fB9IXuXcgI9W2viwNvCOYw2/8Gk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ebC71HWJW4Jl32wjqeRR2HgmyHQkpTtN4iyiRaCI5/4Nxrv2WScM5H9+Ph7n+4+J/
	 6Q9gAWfv2iLM4PPGgxm15rHuYB5Gc/SC9UG8VK0eFa0E97lFZ4OaX56GKrvzFwa2yy
	 uoeiBkFI58/zisRQnREtWbVEzoz4DkdxzhLoOSTo0ppmOJnwLHwolRhHUv9ASFGuwZ
	 S6SmwonTk1JCDRNqxR348/s2WrZzloCp7K6e+KhTcCkTBDsDXCwV0gfgiSC+KKWZma
	 D7GaaHp+xrUahSupLvig1bWBGfPcaLUHbFzF+6U5b9S67FA3vSI42Z6tpkzCJnvzib
	 /wrMgSHdHhU8w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CB48DD84BC4;
	Tue, 20 Feb 2024 21:12:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170846356182.4365.2761861273948383560.git-patchwork-notify@kernel.org>
Date: Tue, 20 Feb 2024 21:12:41 +0000
References: <2450634.jE0xQCEvom@phil>
In-Reply-To: <2450634.jE0xQCEvom@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 Feb 2024 21:02:46 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find a below a collection of fixes for the current release 6.8
> cycle.
> 
> Please pull
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.8
    https://git.kernel.org/soc/soc/c/0cf54e404d4f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


