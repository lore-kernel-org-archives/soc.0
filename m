Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3521AC4332F
	for <soc@archiver.kernel.org>; Thu, 24 Feb 2022 22:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF8FEC340F4; Thu, 24 Feb 2022 22:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7600C340EF;
	Thu, 24 Feb 2022 22:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645740024;
	bh=rnpQup9DnxTSvxwnYDK7DazJaXhk6bNuW/NRkn30Gzc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QFBcGkhIoIvAn+qijy3CJVaFhACD+aFRO7WrzjQtAYJwayF1T5vAPLcSvbVUAmzvn
	 JqTDXFfs4xAJ6JltDcZJfDov422HP1Xq07+QIRQ22YlZyKTimUq7F6EKC27wZb+wBL
	 bg2te0/zZI/+EIjWl4w/i0XAg6n05w7MpmdUkOYeYwEIaai13mLQQUI/1D8+HTC5mO
	 5M2U50En515ZOsn9gCrTP5NMY65p/gpfcxRrO1Vat1HKno7NEYx0lt44Q2fB5Eh5+g
	 IqSTBHmyj3iXN7i78xNH1O1tL2qim2vifiT58BRfC4ktpkktGl79OVf36bfZx+4kf5
	 rQotJAxXzAamA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AF979E6D3DE;
	Thu, 24 Feb 2022 22:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164574002471.25177.7544980037815427353.git-patchwork-notify@kernel.org>
Date: Thu, 24 Feb 2022 22:00:24 +0000
References: <1973741.CViHJPHrxy@phil>
In-Reply-To: <1973741.CViHJPHrxy@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Feb 2022 12:46:06 +0100 you wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.17-rockchip-dtsfixes1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 5.17
    https://git.kernel.org/soc/soc/c/795a2ab1da7b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


