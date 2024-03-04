Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B86C54E41
	for <soc@archiver.kernel.org>; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 155ABC43609; Mon,  4 Mar 2024 08:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2CEFC433B2;
	Mon,  4 Mar 2024 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709539275;
	bh=uRndrQwlR8udwiXgEVf8MVmZISuy95ND6d9OetNWhYs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=mxpmC2+IcIg/T0YDJVGOXZLUM15wa6fpXMDGvMF1Gh0Cbv8x157fl0piqxoURZhF4
	 eKty1BEMlclxXJPCSnRqCcCC2Toq0kd9QOhNHkeZJb0yd/AulowRaTdv5oZdBagXaf
	 rQF67lnI2X0utxyhtBrs+pOhyVBGECr0V44m6UhSyK07vek89+GNI9rCr/aCZnCsjT
	 1sKtKHdwfBLRCsn6DJSQ025mhdWTfsENB9qUW7Hpg4oNHLVU78hZvkmTw2HDYhcCRO
	 kWMU0VQTU6ZVdGJbIPIHB4n401+M0HN1D1H+47Nz5wNKxDFKTOzz9g76RCDEEpO0sF
	 si64GC90pDSfQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D036ED88F89;
	Mon,  4 Mar 2024 08:01:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] arm64: dts: ti: K3 devicetree updates for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170953927485.27833.69411987959087276.git-patchwork-notify@kernel.org>
Date: Mon, 04 Mar 2024 08:01:14 +0000
References: <e7e984db-47b9-404a-9471-5d2ed0effe1d@ti.com>
In-Reply-To: <e7e984db-47b9-404a-9471-5d2ed0effe1d@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 28 Feb 2024 09:41:54 +0530 you wrote:
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-dt-for-v6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] arm64: dts: ti: K3 devicetree updates for v6.9
    https://git.kernel.org/soc/soc/c/38efda94ed0b
  - [GIT,PULL,2/2] ARM/arm64: defconfig: Updates for v6.9 for TI K2/K3 platforms
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


