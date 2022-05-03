Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CE7C43217
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27F7CC385A4; Tue,  3 May 2022 14:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11348C385AF;
	Tue,  3 May 2022 14:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651589422;
	bh=0jXdW3CmDSxQLmQa0Z9veUr+1GnUwjovETkQ/wVA4qY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Awsfkl2ezLr+oK7llt5t/D4d4Y8jQnJ75vVUgIjUDl37LxF9WaG5Wyf7aRT5o51sH
	 7WOnC3DWrpUYHF05S6379iJU5J6WRaCCYs6j1cd9qDjstcr9vHgIWmAMmBOguclbT9
	 qFKPaaBDgovDUtOjN1P0oX3aW/nhWy0HkoUNBQcHUDcSUbNSD9jx3YDDSQv/K7A4OJ
	 GinYUJEdrBQE/LDK5B4uQsKMW+nJ5ewucymAm8SGszC51jTyMloD7ho3+ZD+LryBgU
	 G0O7xz8QVzA0mSjh3G8ZrVNN+FBe11pOO+1wy+0V+miehxLryd1qvPz3WRSqtmKMak
	 qciPrpK2UJ6Jw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DBD72F03848;
	Tue,  3 May 2022 14:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] DTS updates for the v5.19 kernel
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165158942189.22061.9496234297797710716.git-patchwork-notify@kernel.org>
Date: Tue, 03 May 2022 14:50:21 +0000
References: <CACRpkdYngWscqak5phKm58O2GF0RmVETgwW4NCKTBiASdaEcyg@mail.gmail.com>
In-Reply-To: <CACRpkdYngWscqak5phKm58O2GF0RmVETgwW4NCKTBiASdaEcyg@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 1 May 2022 00:52:43 +0200 you wrote:
> Hi SoC folks,
> 
> please pull in these Arm Ux500 DTS changes for the v5.19 kernel.
> 
> The details are in the signed tag!
> 
> Yours,
> Linus Walleij
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] DTS updates for the v5.19 kernel
    https://git.kernel.org/soc/soc/c/97736c2ef670

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


