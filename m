Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA93CCD129E
	for <soc@archiver.kernel.org>; Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC2E3C433A6; Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5046C43330;
	Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712678195;
	bh=8uvdgcDEkL/fQRV5W2HdWNXIf5dfzqntmjLf1QpgTuY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LnPvjgm0+6zO3yLnAsby5eZSfsUgvEdfWn49eSJzc7U9dsKRb3Btvs1fGz34nhuoT
	 214FFsX/sTau0SObj8/Uxdhahl4L6SzdD5ek9IaPTsgYQCvgiUt0HlbUnRNPNrM4xk
	 F4zoJzn6HWIQYYFKa0spRiEqo6FeUigI/fdDCTOitL2FIFiwlDv7ZoPDRvuyb/0aLJ
	 o4kVr2epab8HHePSEB2LItsxFoSlafmvXy9u/z+1ynmkk6v+sfQRDARmvDijGtBgDs
	 ujeKAaflwDdUo23bHZy/tdofA5GmIwZP5ZhcXT0Wfh2ys7Ofo8iLdekKhZvUVP41r+
	 EJ13VWX72hhxw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 862D2D6030D;
	Tue,  9 Apr 2024 15:56:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171267819554.12038.5296904270714527853.git-patchwork-notify@kernel.org>
Date: Tue, 09 Apr 2024 15:56:35 +0000
References: <Zg5rfaVVvD9egoBK@dragon>
In-Reply-To: <Zg5rfaVVvD9egoBK@dragon>
To: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 4 Apr 2024 16:57:33 +0800 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.9
    https://git.kernel.org/soc/soc/c/7d177ae11468

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


