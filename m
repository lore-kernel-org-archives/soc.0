Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B5ACE7B0A
	for <soc@archiver.kernel.org>; Thu, 28 Sep 2023 08:00:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8EA2C433CB; Thu, 28 Sep 2023 08:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C31F3C433C9;
	Thu, 28 Sep 2023 08:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695888044;
	bh=gvBxnxjhbcDgXNa2vOFKxEXDj/LFwxz/42ttr1ixajE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=XRpcU2sc6oXClV1gn19mIRr7Mevm+TNzaMA7QFDCyk1mBSNKXW0BAp2AaiBerQWq9
	 PYnvKD5ojRtUhU1jFmcwq1sWizPUOmzNB5YEQvbSdvHk0LiVsmdjlXi8BBADdlcLV8
	 ND9PISEcjqj/wWoeWN4WsNDaoGxUEN1ALHfylkILGhZnahe1bpTncylxuIewCVG9v9
	 x3iDS1KMaQmqFJt48D/RUj7Bfh6pKAUNkGW9yPOTqH94HB7xiu3ujBUL5D0kZnJu47
	 PdDj/wWWkXi4Og28iM7DbP+HFK8ON+va6aIWbyuFC8mA+zyS4jJg3irzDUoojxON6g
	 sSj5R0/dORtDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A68E9E29B00;
	Thu, 28 Sep 2023 08:00:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: locomo: fix locomolcd_power declaration
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169588804467.3136.5353217530807896037.git-patchwork-notify@kernel.org>
Date: Thu, 28 Sep 2023 08:00:44 +0000
References: <20230927194844.680771-1-arnd@kernel.org>
In-Reply-To: <20230927194844.680771-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 27 Sep 2023 21:38:10 +0200 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The locomolcd driver has one remaining missing-prototype warning:
> 
> drivers/video/backlight/locomolcd.c:83:6: error: no previous prototype for 'locomolcd_power' [-Werror=missing-prototypes]
> 
> There is in fact an unused prototype with a similar name in a global
> header, so move the actual one there and remove the old one.
> 
> [...]

Here is the summary with links:
  - ARM: locomo: fix locomolcd_power declaration
    https://git.kernel.org/soc/soc/c/5e8a380b2dd3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


