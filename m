Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B3EC6FD20
	for <soc@archiver.kernel.org>; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5627FC433D2; Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 35444C433EF;
	Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679680822;
	bh=fQKAasX7NS6QzxfYvkJd6+mFWMtD4zG6bILkIOrQV5A=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=HQwfXrBUdHscS2Xdwbpbt9spUeH5+JFTVG74d2Q/4k+jjzpB2RRq+pu00CInpZ5/a
	 ijX77ndIRN8eCpz4oktKIseeZZzBKAb0NdCVU+E8TkTO5GySbPxewvVFw7OPnmrgTh
	 Uq3VHKxDazrcGfjN1LSvABa8mH3aub5x2fAQ8w2zV8CVFJpMbYXyNP2uv3VMuo2mmt
	 ab/P9teeyR9iphcvK2drasVHKUTBHgY5daD7BVz+UsWy95PD33hogTT7V+r4jpmqj3
	 gcIMr3pUaOl8i2MAMnocbJSp+kNiWT702rO6HUYl4HaB2NHcb454EUXmFmuYscIwn0
	 JHUAgAX8KaeqQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0BCECE4D021;
	Fri, 24 Mar 2023 18:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: spear: remove obsolete config MACH_SPEAR600
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167968082204.24696.196649536999754648.git-patchwork-notify@kernel.org>
Date: Fri, 24 Mar 2023 18:00:22 +0000
References: <20230320130159.32316-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20230320130159.32316-1-lukas.bulwahn@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 20 Mar 2023 14:01:59 +0100 you wrote:
> ARM: spear: remove obsolete config MACH_SPEAR600
> 
> Since commit ddb902cc3459 ("ARM: centralize common multi-platform kconfig
> options"), the config MACH_SPEAR600 has no effect. Remove this config.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> [...]

Here is the summary with links:
  - ARM: spear: remove obsolete config MACH_SPEAR600
    https://git.kernel.org/soc/soc/c/2e6115c175c7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


