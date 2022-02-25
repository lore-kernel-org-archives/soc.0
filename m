Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD30BC4707E
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85F13C36AE3; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DD55C3410E;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=MhE4IP9t3UOJ3jn6CBqhDxHZjNBY8EJvN8IvNBNuN8o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kUwaB+meX/3Oi1UJ2OcQTCvplU3KQAkCxeTe2Kh3EIgaTQqotCG36mYiwAqVr1X2G
	 XyDlZCDK4I+EbrGoO7u9aesMektm2UISyuXWHjuK3aI7N33kFTg9e/Wy4rm9D1/6Jd
	 eTGklX/SFce/PJG/7zBFVcvWpB9Z5n2meLOk3PYpK3KbQkrUmoC++qWW072txGSrOS
	 jdGR5uL2m2YIgaWrHnulVjOrNSNfuh2hK8BwD7mWC/NxG40W3W048TMATB+qQohvBE
	 v5wC0J9blxeHuJgQ55XHdKdVIAIe6dKIYHUKma/8MAxTbn6svPG5HqSAcUYaDSuXwI
	 2XfoKnjVigo5g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5BE55EAC081;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] IXP4xx spring cleaning patches
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966337.15608.7141491597281975405.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:03 +0000
References: <CACRpkdahK-jaHFqLCpSqiXwAtkSKbhWQZ9jaSo6rRzHfSiECkA@mail.gmail.com>
In-Reply-To: <CACRpkdahK-jaHFqLCpSqiXwAtkSKbhWQZ9jaSo6rRzHfSiECkA@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 12 Feb 2022 18:27:14 +0100 you wrote:
> Hi SoC folks,
> 
> here is the spring cleaning of IXP4xx, after this we only do
> device tree boots and we dropped a ton of legacy code in
> favor of proper drivers, most notable the PCI driver.
> 
> The two network subsystem-touching patches have been
> ACKed by Jakub.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] IXP4xx spring cleaning patches
    https://git.kernel.org/soc/soc/c/543f7961c204

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


