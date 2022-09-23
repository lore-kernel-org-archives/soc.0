Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95677C6FA99
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7C9EEC43148; Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6336FC4314E;
	Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663944728;
	bh=wmaJ8x6SuByTpy6Y2XvBvzz0K72PMzK3VStfs604v9I=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EoUJ0GQwQk2qvY4r/esqU5BEzp1dpMj97eXq2aCsVytzYIJZ/Q0dht1z6yAD8G8tL
	 S6TBmkum/rEEpYeJQgiybbAcwEeBoRNTQIUwYg1zwa87aok/g2HznXDgFf2m0ku5Ej
	 sT3RH+MhYSuXGWZh3opmQnrPYIMuwvDy6jnnuDv34iW+jL/nKGkBh0N7Uxv3t4Twwe
	 AEKdQ0eFL8s3SLEoIyVouTnqjrUNHZlW0c87gRf/FUB9ZvcoLeJRXKFIuw5gVqlN36
	 hiFiV4uNRuQuCpnSX8X9Pt/AtbFDHG5quJTvxRGqP9k4+pZJwMXHlw7e6jvWsJGkR7
	 9KH0hgnoeAC2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 50179E50D6F;
	Fri, 23 Sep 2022 14:52:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394472832.12526.10683161253799913107.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 14:52:08 +0000
References: <YyePKDnOeP8Tdt5n@kista.localdomain>
In-Reply-To: <YyePKDnOeP8Tdt5n@kista.localdomain>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 18 Sep 2022 23:35:36 +0200 you wrote:
> Hi!
> 
> Please pull following device tree changes for 6.1.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.1
    https://git.kernel.org/soc/soc/c/9f1fe339ef27

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


