Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDC8C43217
	for <soc@archiver.kernel.org>; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4DF73C385B2; Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3110CC385AF;
	Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649970615;
	bh=86QIll9OtINnhQ6eFyBhVzI9KsK41Osh+NCNTaxGipo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ne0sN2yehUSdxErGHoTvTrTbednuN4hjGQg8HWl9zbm+UOf/ZQ36OPqLrePYbWA5y
	 F1PYeyFfW2gzRYgaN9CYxT+h7zhFFwOOUdBg2ghzgLWkn9Vfc5YdlhfIqw3gCUr0pk
	 RCZyR7i2UikG/J3pwekquaHTZU4p3FDBJ9h0w1ozse1DMGIj5NYd7rNhlAsACnF4VV
	 L7bFXFrIAgS6wOAIetU/di7AfaLexFNp1HC/qS//7u0i1yomPJ8M55+Iyc+vPiBfq9
	 y/7k3JlYqowW08YN0sNIOdbF6fxVoK8M5S/U7lWuHkiY8sNvHNbOYBz+e0qhJwPsrT
	 uOHtqEuUtLtgw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1377FEAC09C;
	Thu, 14 Apr 2022 21:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Ux500 defconfig updates for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164997061507.10394.4833305190454252137.git-patchwork-notify@kernel.org>
Date: Thu, 14 Apr 2022 21:10:15 +0000
References: <CACRpkdY+_Go4XNzOh+Rvc24QBnUud2k-S7VQuaH5d-j71_dJog@mail.gmail.com>
In-Reply-To: <CACRpkdY+_Go4XNzOh+Rvc24QBnUud2k-S7VQuaH5d-j71_dJog@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 7 Apr 2022 23:57:34 +0200 you wrote:
> Hi SoC folks,
> 
> please pull in these Ux500/U8500 defconfig updates for v5.18.
> 
> Yours,
> Linus Walleij
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Ux500 defconfig updates for v5.18
    https://git.kernel.org/soc/soc/c/cfd08b94bed0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


