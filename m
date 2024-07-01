Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA9E0C3065C
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D901C4AF12; Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86269C116B1;
	Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719867637;
	bh=paE1aYRkrdbVqAkdau6B5yFAbCvr+3U6c0QH5kjK1uM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=czBWy/LBIa1+tTtNbB5fmRZePDiZi9v0v6pQuoXIZ4rAg/lFfTX9rb8sEkaGEwu7+
	 krAIeE0A3mM/JKth1zeRHYZiYZrTnkFXgQ039rER6IOMnwWL+/ki2W+bM5sipbgQ6a
	 Ucj5xqPNU1ddobwdDv976snWh9l5kdf/CFtjEcoGg74EvcOCns1ZNYmZrI6yXI5jkM
	 Esv7YwIXdWZCP7/lzgh3n0ukZyvNgcHeFr9ZIetL+E8R/r8VJS9TBwBvo6isHQy1FA
	 h/sOa+4p6XEwQbWd7kfyEt0f8F5A3A95EYYjcFL2BKkWFMJEckH+BL53a5eqx6auY0
	 +9Nr72Jhlfmmg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 71DA1C43446;
	Mon,  1 Jul 2024 21:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171986763746.7657.15059465933415146361.git-patchwork-notify@kernel.org>
Date: Mon, 01 Jul 2024 21:00:37 +0000
References: <7f71e76c-c793-429a-b0ed-7296553a3eff@linaro.org>
In-Reply-To: <7f71e76c-c793-429a-b0ed-7296553a3eff@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 1 Jul 2024 10:36:36 +0200 you wrote:
> Hi,
> 
> Here's a set of Amlogic ARM64 DT changes for v6.11, with:
> - A bunch of DT fixes to allmost solve all remaining check errors
> - Some SM1/G12 SPDIF & HDMI updates an fixes
> - Amlogic S4 PWM
> - Amlogic A4 Power Domain
> - New boards: OSMC Vero 4K, Dreambox One & Two, GXLX/S905L p271 Reference Boards
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.11
    https://git.kernel.org/soc/soc/c/35b94a99fc67

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


