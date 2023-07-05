Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2FCC001E0
	for <soc@archiver.kernel.org>; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D3D4C433B6; Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62B8EC433C7;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688589724;
	bh=yGcFyOYfRbQGgpD7TYYX7rdr+0VuwAgnVhkOvr7Me6w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=VTTaiW3GCoOfqat6HhlByuLEvfdLGCcEtIeijidEBZw47XmvlhBMbKSy3oKMci05l
	 sJmJtFiblof7g62hQ2V9G4oefhAgJRyUKCyQsUZDFnBC4I57+AHlmmcaMPDcQ8A8A8
	 iPTPsELk/l3pJ8AU00/smdDkShZXKjx4kSO8HRCrMk0o10wmtq8xZVBeQysJpi/MMr
	 HG5cm8OYNhBqG/Byu0SdQyvQSyegapkChtHTrXBAbJ6aq8QIElwYhtgfLE6lZrazlQ
	 05Wr5yHAKlEL4p1X8NF5zg3mImLa+L/tC1eCgqIuM8GwKMBqnCAFcQEZCV0hcLMtul
	 ZAl/zrchv8PTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3EBC1C691F0;
	Wed,  5 Jul 2023 20:42:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: ixp4xx: fix IXP4XX_EXP_T1_MASK
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168858972425.10612.9766659262240373045.git-patchwork-notify@kernel.org>
Date: Wed, 05 Jul 2023 20:42:04 +0000
References: <20230624122139.3229642-1-linus.walleij@linaro.org>
In-Reply-To: <20230624122139.3229642-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 24 Jun 2023 14:21:39 +0200 you wrote:
> From: Jonas Gorski <jonas.gorski@gmail.com>
> 
> The IXP4XX_EXP_T1_MASK was shifted one bit to the right, overlapping
> IXP4XX_EXP_T2_MASK and leaving bit 29 unused. The offset being wrong is
> also confirmed at least by the datasheet of IXP45X/46X [1].
> 
> Fix this by aligning it to IXP4XX_EXP_T1_SHIFT.
> 
> [...]

Here is the summary with links:
  - bus: ixp4xx: fix IXP4XX_EXP_T1_MASK
    https://git.kernel.org/soc/soc/c/6722e46513e0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


