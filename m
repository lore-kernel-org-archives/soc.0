Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24271CCA480
	for <soc@archiver.kernel.org>; Fri,  1 Jul 2022 20:41:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6736C341CE; Fri,  1 Jul 2022 20:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF43EC341C8;
	Fri,  1 Jul 2022 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656708059;
	bh=zfKCKp4WIo1iHVPP/js56AelUZp8juk8uisqRMvkH/w=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gXL0oMGLzSHeMgrebJvUYBBHAriZGg5fwz81WJBfr3lzjBhD+oprO186wovt2ZmAn
	 SdcVq+QxWGl8nGT0UxBszSYLas2ZueXA1vZM3SU+SXSV6433LHr+nm2CSQ2rw5c1VA
	 OExYiww6fcKsS+nonb6pqia2+PpLTO5zOqXCy4phlii1yjGTRll4P5MHfVxEAoUCum
	 5n+yTQvls63IXMHjBkkjgxs/Ajiu2xC92PwQ9iMRAeXLgWrP/+POIV3NKSaEy5kgrh
	 Z6mjZMsLwhtq4FujfRmHzRbk1uidFtCYSjYWO1PpIiXJ4UrPiOyJTDat8yvKqVRltV
	 2CPwAnCZBvV5A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A9FD5E49FA1;
	Fri,  1 Jul 2022 20:40:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: ixp4xx/npe: Fix unused match warning
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165670805968.26141.13550758360915055499.git-patchwork-notify@kernel.org>
Date: Fri, 01 Jul 2022 20:40:59 +0000
References: <20220626074315.61209-1-linus.walleij@linaro.org>
In-Reply-To: <20220626074315.61209-1-linus.walleij@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 26 Jun 2022 09:43:15 +0200 you wrote:
> The kernel test robot found this inconsistency:
> 
>   drivers/soc/ixp4xx/ixp4xx-npe.c:737:34: warning:
>   'ixp4xx_npe_of_match' defined but not used [-Wunused-const-variable=]
>      737 | static const struct of_device_id ixp4xx_npe_of_match[] = {
> 
> This is because the match is enclosed in the of_match_ptr()
> which compiles into NULL when OF is disabled and this
> is unnecessary.
> 
> [...]

Here is the summary with links:
  - soc: ixp4xx/npe: Fix unused match warning
    https://git.kernel.org/soc/soc/c/620f83b8326c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


