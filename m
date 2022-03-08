Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D60C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5AE6C340F7; Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEABCC340F4;
	Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646757014;
	bh=mYEJwUS6Jr90RvZt/4GCBKjYQboNpSYmOtnDhFtbfUI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=t8mW1Euwi1LYALie+doP1LiWBQjDhEFes54F2aZiyX7Xe3IqeBsK6ixtY4mapvPmt
	 GkcXiqM+hHAk8N727QDVO6XJuij2pb1e3CooQTMeCILnQSNckBZ/FJqHpR+hwuZaWP
	 BMryUVNwM7V2Sk2RjhO9yZbTrYb3zXsshyMQBe28BLIuw4+OAGJRZLP3akbBKNRgky
	 ui/v2TrJNWqtMQv8XwAcfuMZTrFy5lh7Kx68cKkRkMyKSysc2eXOgWPQEiyPGDGUJD
	 FkjR1coBeX6CjakcFon0HIsog2JUSqGvwe6M7KqQayCvw/ZDO5r9j/fH4wz7BMIj6j
	 yXa4gdBRnz4wA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B17DFEAC081;
	Tue,  8 Mar 2022 16:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: enable Layerscape SFP driver
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164675701472.9628.17662807755540145650.git-patchwork-notify@kernel.org>
Date: Tue, 08 Mar 2022 16:30:14 +0000
References: <20220304202124.3401165-1-michael@walle.cc>
In-Reply-To: <20220304202124.3401165-1-michael@walle.cc>
To: Michael Walle <michael@walle.cc>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  4 Mar 2022 21:21:24 +0100 you wrote:
> Enable the driver for the Layerscape SFP (Security Fuse Processor) found
> on most Layerscape SoCs. For example, a per-device unique serial number
> is stored in the fuses.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - arm64: defconfig: enable Layerscape SFP driver
    https://git.kernel.org/soc/soc/c/b3b44f502450

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


