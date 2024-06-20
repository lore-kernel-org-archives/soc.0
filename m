Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F041FC2BBCA
	for <soc@archiver.kernel.org>; Thu, 20 Jun 2024 21:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E0906C4AF0A; Thu, 20 Jun 2024 21:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB505C2BD10;
	Thu, 20 Jun 2024 21:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718920283;
	bh=/W625ekIWDlUam2Pmv+MqsdH/9cJiHsFdC9z32xBMAY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fGolvCtPm2GNuNhFS2sClFqLAsVBFZuvXvZXfz2qVaN8We2PJKNb+NZkaY4kwj5ji
	 FVt/xhBF1YVuRqnSYncBuGaV+/EG5DUGeb0lvwNZ80m2P0sxvRpIwUlkuIRyr3gIws
	 eJN05ttjWnDn4/HgJnDMLYDmtXbFnuCOtPq9awnFVFG9tVPGA1I0iahx5FgiFMZsZ+
	 97Uw4Ea/icEPA4aWJVDtMgddfvmdM6ztNnefXZ5DDxA+d9q6xnBMYEvYTfcFiVVqB2
	 AYd+8Yv0poDwtXl3pQWjYq3V2/a5xeZ7xLsodJPZlvPwStbgOcNL3zglXVgpskOgua
	 zBdoqikJO8S8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AC030CF3B97;
	Thu, 20 Jun 2024 21:51:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171892028370.21354.12301212878009525749.git-patchwork-notify@kernel.org>
Date: Thu, 20 Jun 2024 21:51:23 +0000
References: <Zm+xVUmFtaOnYBb4@dragon>
In-Reply-To: <Zm+xVUmFtaOnYBb4@dragon>
To: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Jun 2024 11:45:25 +0800 you wrote:
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.10
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.10
    https://git.kernel.org/soc/soc/c/238f636ddc93

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


