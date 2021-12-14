Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1015C4332F
	for <soc@archiver.kernel.org>; Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68A9FC34606; Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 520D3C34607;
	Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639518011;
	bh=f3UpSskoR+xSKK4Ffgv3kSO+rnVRQTBEnmOMNbyQOa4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=edjph1y/9d/8yiAiRSmOtpV37ZKqR5Nl7uLJ1051fx9bRNN4Qh5wcxYjUcMGfRHtO
	 klHE6cqcgL7eIArY5n89QiRvQlW09K4NBTJ7rn9A0x8EhIQzW0536xjwjnYM8j+wXT
	 PgrQEN/WSXdk3ztIVpPoxcYbhxXNYiPL/wXOhBPEtFt0VeCJf28lDZKtAbofh1Re5b
	 m/hV2YgR5QoLnyhQgQ8t5MAF+A7BWnqRbiMn2iJC82XpUv4ObeFcZrTpY1oX8SfhO5
	 wRbxH/vZFDZ+BDicEbdOCvT8gzLGSN3tjlmg8PFGxqJMlRYtC2ijJ1CMuDTsXwV6Kj
	 sJ93m2LSkH/Sw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3093E609FE;
	Tue, 14 Dec 2021 21:40:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: configs: gemini: Activate crypto driver
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163951801119.19193.4161198775406844067.git-patchwork-notify@kernel.org>
Date: Tue, 14 Dec 2021 21:40:11 +0000
References: <20211206011158.4180141-1-linus.walleij@linaro.org>
In-Reply-To: <20211206011158.4180141-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  6 Dec 2021 02:11:58 +0100 you wrote:
> This enables the SL3516 crypto driver on the Gemini platforms
> where it is available, by default in the defconfig. Clean
> up some noise around the crypto options while we're at it.
> 
> Cc: Corentin Labbe <clabbe@baylibre.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: configs: gemini: Activate crypto driver
    https://git.kernel.org/soc/soc/c/57bcb70d7259

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


