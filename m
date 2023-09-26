Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35428E7F12B
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 14300C433BA; Tue, 26 Sep 2023 21:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0F0CC433B7;
	Tue, 26 Sep 2023 21:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695762233;
	bh=AqlCk9t26RggMLjP8EezUchRisv1cUfj5tHMRjJqsoI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=u6PtcXX2JGPJdO6iQe7q2FSuJ/zLcKvHsYto49byevYzTQUwsSFN59ZNFlZ+xKCcc
	 anmXcyP5aMexkXYI37I5THd+32E6pGy7qfNyOsYhn0kOLzBa/6z/g/OFv0DhBQGlB+
	 e3hBohmFy+gdu1bTCjGBTOTtYj9iOe1vWNlWUFii3oy8Y5I64FJsAU0wDhh2kIvMS1
	 bgDmzUz9pjO3QkLO2iiEP3qx9yx2S5fe287HOud445G+wKOhGanDWGEbUFIK9va0P5
	 rLeb75SFQNElRNytEBE07W2t5lEfs9GaPel8bT2fLyYSlNwmVF8YqLymm3Fnn4XyF3
	 6U+EfTDO7+obA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BFD29E29AFF;
	Tue, 26 Sep 2023 21:03:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE fix for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576223278.24546.18377829900348104819.git-patchwork-notify@kernel.org>
Date: Tue, 26 Sep 2023 21:03:52 +0000
References: <20230913083909.GA473533@rayden>
In-Reply-To: <20230913083909.GA473533@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 13 Sep 2023 10:39:09 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small fix that removes a few unused function declarations
> in the TEE subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE fix for v6.6
    https://git.kernel.org/soc/soc/c/b8c94cc66642

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


