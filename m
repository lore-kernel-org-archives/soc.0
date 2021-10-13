Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFDC1C4167B
	for <soc@archiver.kernel.org>; Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A8B0C61165; Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8E20A611CB;
	Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634154007;
	bh=Mn50ZcC6bSWHvxpjcqzFZD+wmh92Zw+QBc4vhTo9BYs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rkRNzYgZGtnrwEWlKiMEC4Mk8HgT3To+uYYBDih8TM/H9xabJzcuAE+lKW33QRI9m
	 iqIYnw8jvkzS4PaAsCe2gYLQvu+wi+1NVOMPqnPZ6ZWLUnPihLoaLO/fuqHVPJsqOB
	 BY5P7UTn6c0Yy/gQt2x1Nz9FeJoPrvXAOdIVDm+4nnceqfJAHY/NgGw1+bxNHgtywb
	 Ag6HG+100GNxoFKloLpU/WBgBznQdlLhZPzLN9823k/15iwNJ5xb3DG6ZsnB02DPA4
	 Y9XOoIH7vfqK9N7hjFYhdmuXRABLVI2SeL9+OapCgpxbUtxG+qRbXvhclStX9OdJLQ
	 YmbYGBk6s3UzA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 76F0960173;
	Wed, 13 Oct 2021 19:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom devicetree fixes for 5.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163415400748.8098.17476611563187413650.git-patchwork-notify@kernel.org>
Date: Wed, 13 Oct 2021 19:40:07 +0000
References: <20211012213841.1872021-1-f.fainelli@gmail.com>
In-Reply-To: <20211012213841.1872021-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 12 Oct 2021 14:38:41 -0700 you wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.15/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom devicetree fixes for 5.15
    https://git.kernel.org/soc/soc/c/047051295201

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


