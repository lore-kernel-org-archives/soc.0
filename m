Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E9ACD5BC9
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 15:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C5ABAC4CEC7; Thu,  5 Sep 2024 15:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF5D4C4CEC3;
	Thu,  5 Sep 2024 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725550842;
	bh=MGPwTF0GUFW0vplW/dEtEsMMciGwr+Z0O6DvuEJ8xpI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=OACH8aw5Mn7o7kOywvI1e8Nrxnh/6t8IU7yNf57MxITvG8xibEeKBZORhQ6iIJUo5
	 YHhY1/4YCfFSAtqOD2D690RbBY28LcRmVCoaguUmKBntGzT9AXb+IYUkieaMbqBx43
	 5CN1jqI1e48RWupwtN4KOwoQpwtj4cvewz9/JF9HdePjTTmAhrNDyjphNN7Vs4Z2bd
	 ec6CKBwdqJwaA1Fpl8ibGeKABEpXCBGDyrtk63HIkAsSPZU3xoALMy8Sevnowu/Qr8
	 3RbkUFp2/ZBoGrupTTXOuffoI+B8rB7tlGdrjTRLHUU8A/I/i0858yrFibi4sUNTuz
	 +F7Y+bAjtN3bQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE6BF3806651;
	Thu,  5 Sep 2024 15:40:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 SoC updates for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172555084323.1737985.6872730568007294964.git-patchwork-notify@kernel.org>
Date: Thu, 05 Sep 2024 15:40:43 +0000
References: <20240901133110.2038675-3-claudiu.beznea@tuxon.dev>
In-Reply-To: <20240901133110.2038675-3-claudiu.beznea@tuxon.dev>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  1 Sep 2024 16:31:10 +0300 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 SoC updates for v6.12
    https://git.kernel.org/soc/soc/c/3b4253063844

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


