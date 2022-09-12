Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B86C6FA82
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2629BC43146; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 109A6C43141;
	Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662996625;
	bh=rIiMeyZdgxJFzB8X59DZr7p5CsBEqAJFe8GtwP9nRJM=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ovOXonGZhfZrUcF09/3OCvHN23qE2oOGR7MmfAxVcxz5TDi9VMT3c4St1TGwZPhLn
	 XQFJBka4fRKQEOJHy8YJwk+PXCEC5mWk1KTL/zy+8dWJ6R4lZ44nLTQtlDB7Se25U1
	 94trkOyqNdtvG+8Ep4bSNTmFXm89y4vqPKWEUEuNXOPm+iJf3cxdr5jlDHGV/IG7gA
	 idIwsSAgguvpY2u/+ymncUnkDxhPzufteJq2dJOYaGZQry+RN3Zyy5V7EPI5vDte30
	 6Mw5S7vsOvYqgtuTi+NLuN70Zvc2sKYNJCtmQckF/kML2trMraLZyJqM61pKnHlnZN
	 EyjaOyi2e9cqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DFF3DC73FF2;
	Mon, 12 Sep 2022 15:30:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: config: ixp4xx: Disable legacy EEPROM driver
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166299662491.5098.3294964806543684205.git-patchwork-notify@kernel.org>
Date: Mon, 12 Sep 2022 15:30:24 +0000
References: <20220911214042.1857352-1-linus.walleij@linaro.org>
In-Reply-To: <20220911214042.1857352-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 11 Sep 2022 23:40:42 +0200 you wrote:
> This disables the legacy EEPROM driver, we only need
> the new AT24 driver.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> SoC folks: please apply this directly for 6.1.
> 
> [...]

Here is the summary with links:
  - ARM: config: ixp4xx: Disable legacy EEPROM driver
    https://git.kernel.org/soc/soc/c/5a4ca019f627

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


