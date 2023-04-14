Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1D0C77B71
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82B90C4339C; Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6358FC433D2;
	Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681505423;
	bh=dkRHUSK9d/2egyLRc5nsJrv0nBXStZp2bi5qHJd41zA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=f94yAr4UNdxVluNBPINvIfdHrUg79su2Es5mFMqef2t2lb+IYs8AbP1zarr1I6bBN
	 M5yY/8ztGqkodongf60SGWp8Xp8I8JMvBJ9Q7/ZD1YMQ36aKnO2I1oX7c7GJ3ocj0l
	 n0tGF1pn/KeWwCqaIidsNReVHnOWkq8ThYJ5JNMJmjmcAZ5tn+5nrDrfqMn5KiraV1
	 cCOMvO0UWkUcU3gi2Att6OoTOs2TRa1Ul8LcHxPKXcEjcDeQGhOf0hJ0+04AYqvOoq
	 BdmvLs5eQrGY39kPQSzuFhc6vC5+LqmWaLEP9nRz6whYlJrtbhMkiawYkajWusalNs
	 0DYLWoF5xOoOw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 46A9FE52446;
	Fri, 14 Apr 2023 20:50:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] MediaTek SoC driver updates for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168150542328.1155.14931486605299010719.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 20:50:23 +0000
References: <bc9f7a74-ce12-b323-021c-ff2c0473e979@gmail.com>
In-Reply-To: <bc9f7a74-ce12-b323-021c-ff2c0473e979@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 14 Apr 2023 18:59:32 +0200 you wrote:
> Hi Arnd and Olof,
> 
> Please take into account the SoC driver patches for v6.4
> In the last round Arnd had some comments, unfortunately not all of the are
> addressed, but I track them and hopefully all of them will be done in the next
> merge window.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] MediaTek SoC driver updates for 6.4
    https://git.kernel.org/soc/soc/c/4f2f29913684

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


