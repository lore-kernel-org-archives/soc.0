Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C26C54EED
	for <soc@archiver.kernel.org>; Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71FF2C433AF; Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A206C4339E;
	Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674580834;
	bh=KrlGOTO62/t6run3jC0zhqUuaHXjSi+1M1/uXhlYo6A=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rgoc0I+hpefigJIZmn5CAtQcz66NAKPRt4a1/gXIXEoKMwgcLuDsXJDKxtPAhkBZ6
	 CBEPrPFrrvR/bC/Pd9A608SxVR7bCkZqK8iXJxkz+Q8YeqhRiVqOLMxPyYouHjkWqc
	 /v20ASbPvwHTTvKooxpvVd6Da48wMm5vP/3yzRcNFvn2qWMFQfJEQniSg2+T5Cq6m8
	 jLMaY/KHSvVqUY0X3yyVhrv5OqOnPNh6wopOViC7rOQfi7zqgDYxRJjySk/pMM2LGY
	 3vTOY0QniR0n+ZQ/fjluyCWQ49RgwFUKmcqDb7+DKV5IFYnMYqtKe2glU6F93qQSK2
	 2R5DEiza8Dx0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2860CE5256F;
	Tue, 24 Jan 2023 17:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: multi_v7_defconfig: Enable wm896x audio CODECs
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167458083416.16533.17133501959548162788.git-patchwork-notify@kernel.org>
Date: Tue, 24 Jan 2023 17:20:34 +0000
References: <20230106-arm-wm896x-v1-1-441c564a9cd1@kernel.org>
In-Reply-To: <20230106-arm-wm896x-v1-1-441c564a9cd1@kernel.org>
To: Mark Brown <broonie@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 06 Jan 2023 23:14:12 +0000 you wrote:
> The wm896x series of audio CODECs is used on a number of Freescale
> reference designs, enable the drivers in multi_v7_defconfig to improve
> testing coverage of those systems and their derivatives.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> [...]

Here is the summary with links:
  - ARM: multi_v7_defconfig: Enable wm896x audio CODECs
    https://git.kernel.org/soc/soc/c/74ab23d5a7fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


