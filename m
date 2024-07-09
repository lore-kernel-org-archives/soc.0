Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E590C3DA41
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 10:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2C9EC4AF0B; Tue,  9 Jul 2024 10:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC4AAC4AF0A;
	Tue,  9 Jul 2024 10:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720522230;
	bh=77MqNO/yWZLIVawJi5DjlWZCa7ypZZJ//KEMIgzOvPs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CfMZHkbjrJxMeGy/W+2bAz6utBR+6y6WwQfeEAyyihUMhHrm/gNMmK2J3PXcG/qEx
	 4ahZRKfEmDLoDRGZXs4dqB0jTzLUzPvUs8+z3odxEXG2nW0x8lO62Y7bA50FTBGPMy
	 nAkVM6Shi3BCWUmsEuZC5sB389uBzSoqXiHaepcOP5P4AKKyxtmuxLccoWj7YHWNxy
	 FobrfuBxsuGiJE1jo1e6gh4yTOEbqShQm47MDXT89ZMTsBaYxzFs5Yor5wbHcH/J9l
	 S+dW1qr2AmGTZnOURPlS9FYB9fSYOM9tTB4tVuUwyVyUy0CDI4CNCMqzZLV3+6raLn
	 s97vfDgQLz4QA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C6B5EC4332E;
	Tue,  9 Jul 2024 10:50:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172052223081.24318.9643714926168360631.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 10:50:30 +0000
References: <PN1P287MB281861EA2B1706B430D2FA3EFEDB2@PN1P287MB2818.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <PN1P287MB281861EA2B1706B430D2FA3EFEDB2@PN1P287MB2818.INDP287.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 9 Jul 2024 08:39:29 +0800 you wrote:
> Hey Arnd,
> 
> Please pull dt changes for RISC-V/Sophgo.
> 
> I hope this PR is not too late, because I just got the message today
> from Stephen that this clock driver part has been merged into clk-next.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v6.11
    https://git.kernel.org/soc/soc/c/95ab7b209bd9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


