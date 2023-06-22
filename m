Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5665CEB64D8
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 207DFC433CA; Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 062DBC433C8;
	Thu, 22 Jun 2023 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687450230;
	bh=1ZNVK9th0fxL58BezuIkgJToC50QEHcYAmhFrzETyrI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Y2Q4sFRfu9SUp3ORyrAAx/0Rdj6QviqqTKTFv1dbnhKaSFNSrdmRQg6GNMGlOVH2f
	 RLiRBmqijCCowBYNDQhS8AiglHxJKiaRo73w5vQ+bkpZ1Ajystlw/PJpCgVYSWeQGb
	 7JrdJT/t1gUFtyVIHzaiESY9g0XhH461uf+e026nyX+nmWlFvD0rI5GEhkKmgjo0tX
	 QYYvsVU3UaUlDFj7NsbQmGxRBv09rsavhrkvBe6M9Hp6UQx5bZHJIT3JIizYPuZtAb
	 wqC3J9ztZeipOV0Zup7JqjvSaEnVW8gsAWtg2xPCIqQU4tDqnRBXvAgoC1WwokRyYu
	 Taj+nxox0sBIw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D8911C691EE;
	Thu, 22 Jun 2023 16:10:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/3] clk: nuvoton: Use clk_parent_data instead and add a
 header file
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168745022987.12309.7607055430519385855.git-patchwork-notify@kernel.org>
Date: Thu, 22 Jun 2023 16:10:29 +0000
References: <20230622141343.13595-1-ychuang570808@gmail.com>
In-Reply-To: <20230622141343.13595-1-ychuang570808@gmail.com>
To: Jacky Huang <ychuang570808@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 22 Jun 2023 14:13:40 +0000 you wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> This set of patches addresses some of the issues that were identified in
> the ma35d1 clock driver.
> 
> 1. The external functions referenced between the .c files in this driver
>    should not be declared within the .c files themselves. Instead, a shared
>    .h file should be created to reference them.
> 
> [...]

Here is the summary with links:
  - [v3,1/3] clk: nuvoton: Add clk-ma35d1.h for driver extern functions
    https://git.kernel.org/soc/soc/c/a5e3f37217b7
  - [v3,2/3] clk: nuvoton: Update all constant hex values to lowercase
    https://git.kernel.org/soc/soc/c/ebd617b67543
  - [v3,3/3] clk: nuvoton: Use clk_parent_data instead of string for parent clock
    https://git.kernel.org/soc/soc/c/f50a000b4219

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


