Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CECC04FE0
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 22:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1BBEC43391; Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC13EC433CA;
	Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692051635;
	bh=0LfW5+AmuFdCo3d5g+hoIy7hab2yKFG73004vIqkPOA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=C6GJLRswbAXedKeICIG96uyy2OhL6HZAkBRF8EVdAkuisK9uoEnxxw/f7saNvPlJb
	 QTm0OuhDmLwes4qNMl3aMwzsIDOwu/jS0Y/D8u57Pk019hfEkFU9yx4vvsHfUwn1Vk
	 fdj24dmvIwVLHiOCObadeYhApdqb6kblsRDLw7njwgoqvJl2ycW+nUKHGrJvztCXAh
	 f9/70kJQT0Cy3sNHAb2jOkBb0RMmkIGViN9nfeQV6DS1F3CkBzg+9O/9HfSYEn4t6/
	 jbiTYodn+0r9E+2X1xpIP7i/Zp08crBUW1IGJPHKH2/TE5X3R6fWrS7Vaj1KvVSNu9
	 L5k4YlbrhXKrw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AFAA1C395C5;
	Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: dts: various cleanup for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169205163571.23017.11245345080244624617.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 22:20:35 +0000
References: <20230814114154.26017-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230814114154.26017-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 14 Aug 2023 13:41:54 +0200 you wrote:
> Hi,
> 
> Not much this time - I just two patches.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: various cleanup for v6.6
    https://git.kernel.org/soc/soc/c/1298d0dd31b2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


