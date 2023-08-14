Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9C9C001DB
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DFACDC433C7; Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9631C433C8;
	Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692051635;
	bh=WSCUvcd30ZLbhAz8zui6Ps7gbnRcsStDiBcXTI01afI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RCorBZSTXPTkw0mXQ34YhiPYW98LMvZk9uEYMyXHWkGeSxU/0u96n1E0vU6/GomUn
	 AIcR/SrhcrlHu9m5VLFAG5w7gqEa/L+AhLHUbgGItjYycsFLYPH4U/pSR/608hZZeM
	 C5IwZrzUlnvT7dTJxv4Y0y941Jin3hX/dBAY+XvQ+um8RiifVUZ/7xvRSECtY3L62J
	 TC4WxmntX1Wv5fhBBLzoYjo3pOhPEHokPlEXgPZ9Ok2FpVZXy5SqHlzAb7sHHmVMQI
	 DaiNrMztCFfEAPOM7tAi6EhfNmzWh6oB+UJ5bMcnoUzLRNbon6+qPZ7RiPqjbyfd7Y
	 cLu5LaitLuUBA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A7310E93B36;
	Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] soc: ti: Driver updates for v6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169205163568.23017.193700565961928792.git-patchwork-notify@kernel.org>
Date: Mon, 14 Aug 2023 22:20:35 +0000
References: <20230814160633.my3xbk5k2pxkvjyi@degrease>
In-Reply-To: <20230814160633.my3xbk5k2pxkvjyi@degrease>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 14 Aug 2023 11:06:33 -0500 you wrote:
> Hi,
> 
> Please pull:
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] soc: ti: Driver updates for v6.6
    (no matching commit)
  - [GIT,PULL,2/4] arm64: defconfig: TI K3 updates for v6.6
    (no matching commit)
  - [GIT,PULL,3/4] arm64: dts: ti: Updates for v6.6
    https://git.kernel.org/soc/soc/c/99355a235a47
  - [GIT,PULL,4/4] ARM: keystone: Updates for v6.6
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


