Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E60C64991
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71A5EC43142; Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5C0C9C43141;
	Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661765893;
	bh=Zx/pRC2NfiUYp8miSc9xeNpWBX5XTn2CrPSqfOPhEJ0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=F5lSOj1JIV2vQe1WJxB+FT5HoRGRNOoNImek1D2vG9tnDMc7FuxzToeCvfklnJ0B6
	 SAoUjHb+lAhWvP6vVuJAuglj0ZiRqddBANb1odrECL8d1Z7CwYMYYz+sdHiVfT5X5j
	 5orGo94BMggOVAlNMW6gnaDkyfnXUZxilAFqNoo4A9woXeeCJcTwczwYj9yGnckUvo
	 6ZIelPmqhkmkMxsrtgxCRtj/5vJ11zu0JYQfgcVGrpx1yKyhP5e7XNPG9fIIttD9pl
	 9qI9U0ML42exu6qgQIDtr4RRA0mlhMiZ869bBHrWQqbRL1SbiT2OwQPltKFFKcTgR/
	 yhbRLsinev2pg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3A5F3E924D7;
	Mon, 29 Aug 2022 09:38:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: ixp4xx: fix typos in comments
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166176589323.19402.13216004205470707561.git-patchwork-notify@kernel.org>
Date: Mon, 29 Aug 2022 09:38:13 +0000
References: <20220826112153.438829-1-linus.walleij@linaro.org>
In-Reply-To: <20220826112153.438829-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 26 Aug 2022 13:21:53 +0200 you wrote:
> From: Julia Lawall <Julia.Lawall@inria.fr>
> 
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> Link: https://lore.kernel.org/r/20220318103729.157574-26-Julia.Lawall@inria.fr
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - ARM: ixp4xx: fix typos in comments
    https://git.kernel.org/soc/soc/c/251e5d715e4b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


