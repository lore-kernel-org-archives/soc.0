Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB9AC3065A
	for <soc@archiver.kernel.org>; Fri, 28 Jun 2024 21:20:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EAA13C4AF0C; Fri, 28 Jun 2024 21:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0513C116B1;
	Fri, 28 Jun 2024 21:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719609649;
	bh=h5pgWkv89YHnGlQlhQTpjSYmhIRqzyJDfOoJ54F+Iu0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Hf3650TT0wCmKVUxSjnI2xhEb6hElu/zhi3pfTrzyecFKI/4M61vChjQRVuqH3/1l
	 9LXmPFHLluZFoG4Lb5hOUkzU/8sHWAYKTyVLTPnOdMKQJpNGG50ytiMBngWDauv5k6
	 aLxqy4XSc05BJPCW7OsR5Fhy5RAoGgQwuJ3xttiU/4BwTbupsjOrKQFk8V+maIzioS
	 MMfw3PFGnOxB29GesNM360RNeJ4KK6IjzuwPnMPsKrawhbnJuPo5No6uOsFjwB07CN
	 d+x7PGy/iXa66nluKCUQ+AV+Os5pBGSjr56nEYhh7Uq647LdQrrRdxMr8YL4GbdsnA
	 BJlUu/MgMcLEg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C2A2AC43443;
	Fri, 28 Jun 2024 21:20:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL,1/3] MediaTek ARM64 DTS updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171960964979.14447.13826784840273137235.git-patchwork-notify@kernel.org>
Date: Fri, 28 Jun 2024 21:20:49 +0000
References: <20240628093801.126013-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240628093801.126013-1-angelogioacchino.delregno@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 28 Jun 2024 11:37:57 +0200 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.11
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] MediaTek ARM64 DTS updates for v6.11
    https://git.kernel.org/soc/soc/c/c4043e7655ff
  - [GIT,PULL,2/3] MediaTek ARM32 DTS updates for v6.11
    https://git.kernel.org/soc/soc/c/c48081f41efa
  - [GIT,PULL,3/3] MediaTek driver updates for v6.11
    https://git.kernel.org/soc/soc/c/1392cb2649e5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


