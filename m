Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F5CC433EF
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 16:30:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DB73F61090; Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BF83461078;
	Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635265810;
	bh=y/2beNsfHqyueN8L49/ucl33X/gpJ/KKAulQ09w2L+8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nWa9DZazcMMmJiKfQm7LeeBU1MBSqzPDYelHPW57A8vKKS80nFa2uUDQvh3gENKsJ
	 bQJ0s4Cki0FkpQX3kKYa3cX/pUYtrHRiFS7DGVB4HHi4hpIwairxa+3eS/l5BweAju
	 cfZa5/2UdnuPyzQ3lRN29yJ0m3qEoEK7GLdIYpLIubk+Tc60+tb6DQBhZif6iJr1/M
	 LR8Sw47Yx5TtC9tBd3lT08EDBTwmFJRYJR5OtNYxgl2XqVRGbd7rhg3kko1siMG+3s
	 uMaFtsLxP0ydl9+Fywn8R7GaoiEMnG7VgCOcuvjMuXQjjHVFJfOnjk8fWEqyHntkoF
	 KJu8eTT4Sv7Sw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B27A7608FE;
	Tue, 26 Oct 2021 16:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: arm: Update register-bit-led nodes 'reg' and node
 names
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163526581072.16112.4276755940285481694.git-patchwork-notify@kernel.org>
Date: Tue, 26 Oct 2021 16:30:10 +0000
References: <20211024232003.211484-1-linus.walleij@linaro.org>
In-Reply-To: <20211024232003.211484-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 25 Oct 2021 01:20:03 +0200 you wrote:
> From: Rob Herring <robh@kernel.org>
> 
> Add a 'reg' entry for register-bit-led nodes on the Arm Ltd platforms.
> The 'reg' entry is the LED control register address. With this, the node
> name can be updated to use a generic node name, 'led', and a
> unit-address.
> 
> [...]

Here is the summary with links:
  - ARM: dts: arm: Update register-bit-led nodes 'reg' and node names
    https://git.kernel.org/soc/soc/c/25b892b583cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


