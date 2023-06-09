Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE10C7EE25
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C140DC433AE; Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9A9AC433A7;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686316227;
	bh=DfYOi2zUxqOjT522JLAispLX9Zpmt4yOMCoyH3bMCCo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IaAxhMgve8oKF0W3fwUdIJ2eD7qZ6p74LItE/w1eQQenOnOQkBMl9VYAfEYj09iKX
	 tWhzN6/pmuMcxJ4LDHdq/pspq2gNWnYVkeE6TlWOoJ71RiGdPo7EYAWhgtEra5MkXT
	 HuKMYiOU7c9zqb0yeCqKPjoGBJ8KYdgaJLd8b5TZR58WdbiG3J/2uasXuziEpTKwH6
	 3hcZZyX67Uu/CCnBaE1f5iGc+LaSVt9jdu3+amB4QFeX9VUz/cpex/afo0BJoKKft+
	 J/HLVjZeAVVfWyOsaxlQk93nO8whqBYltqMXI4YsabRRFGGLFMD/UpasUXZLZgcdM2
	 trVCFawn+3CXQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 942ACE1CF31;
	Fri,  9 Jun 2023 13:10:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Input: ads7846 - Fix usage of match data
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168631622760.816.6700631558190466064.git-patchwork-notify@kernel.org>
Date: Fri, 09 Jun 2023 13:10:27 +0000
References: <20230606191304.3804174-1-linus.walleij@linaro.org>
In-Reply-To: <20230606191304.3804174-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  6 Jun 2023 21:13:04 +0200 you wrote:
> device_get_match_data() returns the match data directly, fix
> this up and fix the probe crash.
> 
> Fixes: 767d83361aaa ("Input: ads7846 - Convert to use software nodes")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> 
> [...]

Here is the summary with links:
  - Input: ads7846 - Fix usage of match data
    https://git.kernel.org/soc/soc/c/8f7913c04f6a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


