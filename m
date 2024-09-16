Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C0FC3ABCE
	for <soc@archiver.kernel.org>; Mon, 16 Sep 2024 12:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 839EAC4CEC7; Mon, 16 Sep 2024 12:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E279C4CEC4;
	Mon, 16 Sep 2024 12:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726491031;
	bh=7O3k5BJXzSP03glxRdfndy3nZAlKKLS0txnqq3RfT2k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LZklKZJMP0LoZhU3t3W7+eeEssDeX7kt0SzvTIW0MVfF/I7AfNDvyvqfj0zno5oDt
	 6RIoGfos0nCV/0OBOGentH3b9nEYe8Rc5BAkpowtCSL8BcMBf0cdtpMKHRnwPFW0Ye
	 zOByWjIQ9QeWL9mw9JM2vpgAsEActMSnFjqmagu4SDM2mCI4iLAl2k2v3xEtKlv56p
	 A4mIDnj1eK4rMecWsB8FeWZSbNJmi7EQMpeT1VVuNDTB6yn7O3v9kb7wgYfXbX+TkS
	 YWmyt6/gwo2I27eRM9wCTwSWZRfjv7qbVRM0DJWsm3ybOPjSmavCpmdJyYWDUnsoMV
	 +zHmdPHjiBXmA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BFE3806644;
	Mon, 16 Sep 2024 12:50:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] pinctrl: ep93xx: Fix raster pins typo
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172649103300.3685310.9126831526608464414.git-patchwork-notify@kernel.org>
Date: Mon, 16 Sep 2024 12:50:33 +0000
References: <20240913045829.11904-1-nikita.shubin@maquefel.me>
In-Reply-To: <20240913045829.11904-1-nikita.shubin@maquefel.me>
To: Nikita Shubin <nikita.shubin@maquefel.me>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Sep 2024 07:58:29 +0300 you wrote:
> Fix raster_on_sdram0_pins used in PMX_GROUP() instead of
> raster_on_sdram3_pins as it should be.
> 
> Fixes: d1661439f5a3 ("pinctrl: add a Cirrus ep93xx SoC pin controller")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409130426.1OzNAC9M-lkp@intel.com/
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> [...]

Here is the summary with links:
  - pinctrl: ep93xx: Fix raster pins typo
    https://git.kernel.org/soc/soc/c/7427c5b34fbe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


