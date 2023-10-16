Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 622A3CDB488
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3543EC4166B; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B8DBC433AD;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491918;
	bh=We43hs6WbpwVJE5Eu7AWI/GqH9WDo+rKxMx9xZR+5UU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=jk4EwyBejvQe0WotOPDlUbkx/qkGh5pK9eqcypYMRh8BcMaqWZEGiu0LxMTywK3ts
	 zBtkVazi71lvNBurPFaDxYbyaU5K6Xj/x6BxsigcTYqPoAoSjoaqDCcb4j52bESWF8
	 VI/19B2e8kfy/J8PXRaRPGium9G8HHBOIc1hZl51/7To8UjH9m8gNqnHymR8sX30iH
	 KG17X0BTMkpbQsc3IDeipzA5b/Rw6F7ZMg27NtoAYV1HEoYpwAENYdBtDH3C9QBcZH
	 p8Ul9xHsMtfq3lFmzWikzu11WAoLLWI84+uKC+A0aZxinP/uS1s1erOq4rlR5pLZvx
	 TUAeJNHfvz3sA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id EB7E6C43170;
	Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191796.22284.10234671567461395214.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:57 +0000
References: <b3e1bf66-9182-4d48-88ef-7efc20466e7c@linaro.org>
In-Reply-To: <b3e1bf66-9182-4d48-88ef-7efc20466e7c@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Oct 2023 10:36:29 +0200 you wrote:
> Hi,
> 
> Here's a set of Amlogic ARM64 DT changeset for v6.7 with:
> - Add audio DT nodes for p200/p201/u200 to align with other boards
> - Add a bunch of peripherals for Amlogic-T7 (watchdog, power domain, pinctrl)
> - Add a bunch or peripherals for Amlogic-A1 (clk, usb, efuse, spi, uarts, emmc, ADC, rng, i2c)
> - Add NAND node on Amlogic AXG
> - Again a bunch of DT fixups for DT bindings check, we're getting close to 0 check errors, only a few remaining!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.7
    https://git.kernel.org/soc/soc/c/0a84cbfb7fed

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


