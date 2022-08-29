Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FA2ECAAD5
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B034C433D6; Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5509EC433B5;
	Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661765893;
	bh=A7avFGS7tBF1iltmItqxLz3e9UViKKg8st/+B1axdJM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=qa3/5FYr56X/WNhfNtzbAMtTF3f1ZnX9NC4YuPlmo8Ldb4AyJz32RpywE1XxGscse
	 njCo9iIumcFHV39LHw3z87VqKZlRa152H0Y+5wH0pWsWvDt2Aq720kyNAq57o7f6k5
	 EuF/LbXdFGpRGHwIwnR+PVn6+JWvWQSdTYZn9Rlnz923xW+jVquR/aIMuZJCE/9sf7
	 wD7kfZGrVo7bTdbDtbcXtudDtZJL5upOJgllLtFBIZf/m5oRXq4vY0yvMxToemfILW
	 PcguOIPYiafz1+nApjXalqNIIvaDjqztP5tMx99oQvIM5f+gIwWFnqf5tojXs/PUWE
	 4QieFd7QyefJQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2FB46E924DA;
	Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] DTS fixes for the Versatile family
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166176589319.19402.9283241619282986345.git-patchwork-notify@kernel.org>
Date: Mon, 29 Aug 2022 09:38:13 +0000
References: <CACRpkdZfTe8NSGR2ZCkn-1JcNobjfWeXqajSqcJMp8+WtY+2Xw@mail.gmail.com>
In-Reply-To: <CACRpkdZfTe8NSGR2ZCkn-1JcNobjfWeXqajSqcJMp8+WtY+2Xw@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Aug 2022 00:22:44 +0200 you wrote:
> Hi SoC folks,
> 
> these DTS fixes for the Versatile family missed the last merge
> window because I forgot to send them.
> 
> Mea culpa.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] DTS fixes for the Versatile family
    https://git.kernel.org/soc/soc/c/43e403a286c5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


