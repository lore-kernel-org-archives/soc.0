Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABCEC433EF
	for <soc@archiver.kernel.org>; Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 81A0A60F5B; Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6B5A960FA0;
	Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637579312;
	bh=aBMEW9mb6HahvBjrRTLH0BM0OtZ/oE39b+WhOuCw8A4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FuIhmG79GdMTlFEhLs4rBg/3miQwkYo51KXFT9sxVuv/9ngPk541hEbhCl9OW7Eos
	 V8fuECC8o/P28kDjk4hNvyV4SZoVZFZrk8Ys5jpHy5yBiL9s0I8B8uG72lzVo/NuRl
	 sJHPOnLLWtAV8L59EQVIUfZs2H+ypOHxywHsF5r9x1yJdMUclH3Xqw7GkdlOaVjVgY
	 whj1CL9+DxsOpZ/QpyMgJGoqMvXrCjDIc0C3UkVOlDeJDjHKg+f/M7rvRniRGk6/oE
	 u46/Yle+2zCwTaX1fv1eoSPEtoKwYFzVN1CeZITOR16c9Z0YeqiO6zEZW0yhGcfXh2
	 wvmepdER0z8Ig==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 608D2609D9;
	Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fix for v5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163757931239.7615.1954076077704716122.git-patchwork-notify@kernel.org>
Date: Mon, 22 Nov 2021 11:08:32 +0000
References: <20211117125747.GA2896197@jade>
In-Reply-To: <20211117125747.GA2896197@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 17 Nov 2021 13:57:47 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small OP-TEE driver fix to avoid a possible NULL pointer
> dereference in the error handling path of a probe function.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fix for v5.16
    https://git.kernel.org/soc/soc/c/d063f30765fe

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


