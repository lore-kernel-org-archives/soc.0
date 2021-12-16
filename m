Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C141BC433FE
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 17:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 89D1EC36AE7; Thu, 16 Dec 2021 17:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72E13C36AE5;
	Thu, 16 Dec 2021 17:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639674010;
	bh=4YyPZuUZvmJKv+vCZk66JsGLDR0d5xXv6/DJo1gfxVQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GK2A21dZQaLXdF8FRvgRHWwxcL19lgt3ps0jtzBxR55RPzZZzbYtB4l5/kJ6JoULD
	 FJmtJuN7ibSUrt7c8FSHb3uF+25QqBPIu9OzgJZNKEkZseSXP6OJJRhXdIYdiQW//d
	 nhXUqsqwby2KAErZa9pAYKT4RADttYpI0sTGK6gyp1WiDbddDPhbycfnG30TEFSd+a
	 5ppZSmpjuA+utudWh0QK21mZH4qy5SO8Pr1y+HHGlk/YdC6WKbu2VcurigC2hEN/Kw
	 +wvLmgMAwV/QWmrZ2Mq9c/U/fX9cbW26CUsxFYXzHJ31HOPmx0WlF1yHULupZi+Vsq
	 KTB4Wf1dJ9tzQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4ED2C60A49;
	Thu, 16 Dec 2021 17:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] Basic StarFive JH7100 RISC-V SoC support for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163967401031.7027.3129797446259137182.git-patchwork-notify@kernel.org>
Date: Thu, 16 Dec 2021 17:00:10 +0000
References: <20211216164205.286138-1-kernel@esmil.dk>
In-Reply-To: <20211216164205.286138-1-kernel@esmil.dk>
To: Emil Renner Berthing <kernel@esmil.dk>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 16 Dec 2021 17:42:05 +0100 you wrote:
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/esmil/linux.git tags/jh7100-for-5.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] Basic StarFive JH7100 RISC-V SoC support for 5.17
    https://git.kernel.org/soc/soc/c/4c0777712385

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


