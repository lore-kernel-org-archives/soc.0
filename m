Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD0CC35274
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D1E73C433CC; Thu, 21 Dec 2023 17:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3116C433C7;
	Thu, 21 Dec 2023 17:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180434;
	bh=30g6ukJMlBjA8GNzp1RgMuPNMW82aeFLQZN+X+mlf54=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=pdv98eMhc8kwwDyWTJAwIel7ltlJPi7JcATDN2n4bZ6Qm8Wliv3vT+sr5l10//uCi
	 h9FCEFMZPQZpc5BrRDqsWUEXg5vRyJ/g15J3PfPvJ9+ciWdtt6XiKhs6js9KHjLCbq
	 HKqCG8OZpVBY9Wf+Fyg7iUAXROXa4eqnvHLaj+KT6nl8ttMU7oxNyXfCmfKidGQCcd
	 Zed1VC83iiQIEFh6S9iBy1ipM8BvmAqWCUTP1AEzwtS2UwAYnbE7aBvBTGQxoknbNo
	 PvEIDfVuu3naBZlbsrnqZWcBrf8m62IxXHZYlHw9y9pbzQsOHdQgpdjz51kZQRmpC8
	 ykzLchM24CpzA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9502FDD4EE5;
	Thu, 21 Dec 2023 17:40:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fixes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318043460.3302.4520378964629694208.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:40:34 +0000
References: <pull-1702037799-781982@atomide.com>
In-Reply-To: <pull-1702037799-781982@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  8 Dec 2023 14:17:15 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fixes for omaps
    https://git.kernel.org/soc/soc/c/2096d3ec469f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


