Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809B0C25B78
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 712DAC4DDE1; Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A0EAC4AF68;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714408888;
	bh=pxiU1rk20b0fqzQdFnh7KNBfhC06BIKej0z9/CjMymQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gJOnR+NjrPBKoUHtMj2SGExtbgH2Jto5GISpOvoNsQ7ufgtQWh9ytPLorF+c/TSZQ
	 m8mY05H9BLFVvWzFzOJOSaB1ls3cPJNKqkBXRHOA2QIaqzsgVRvVTIWkUklkOhGHO7
	 S7btGZGbT4y6oQu5X/DdwH4BFEL3QSkNxs9+chp5Nk1BSKuAb7OUu2OxEm3Dc3VqrW
	 Qk7LiWTzo86BuvSJpvBmtv3zIytlG0qWRy+jdXWz/6gDtMba8djlmzdFIed6h4XfHc
	 O6arN+HTwf4pWO6gq5G7cQSXQAhbQFfrY0LZD0QNk9R90yc8zrMmaBhGQ6ovvQBHyb
	 pYkM3OQAUq0BA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4EE51C54BA4;
	Mon, 29 Apr 2024 16:41:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v6.10#1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171440888831.20509.11557712056816960095.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 16:41:28 +0000
References: <2040767c-413e-4447-b354-c44999930e4c@foss.st.com>
In-Reply-To: <2040767c-413e-4447-b354-c44999930e4c@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Apr 2024 15:22:15 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT for v6.10 cycle.
> Main changes are the introduction of the firewall bus for all platform
> and the the add of the STM32MP25 clock support.
> 
> This PR depends on "[GIT PULL] STM32 Bus firewall for v6.10" PR I just
> sent and to clk-next tree.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v6.10#1
    https://git.kernel.org/soc/soc/c/3f356691583d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


