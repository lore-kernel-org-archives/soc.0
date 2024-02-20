Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E40C54764
	for <soc@archiver.kernel.org>; Tue, 20 Feb 2024 21:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29B65C43399; Tue, 20 Feb 2024 21:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14018C433B1;
	Tue, 20 Feb 2024 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708463502;
	bh=e2ngQiclIxwBdiG0wawks10EFoEkr4bxWO3MwFQDBgw=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=MuDCrUbmU7Nr/l8GWRlaQk/9SfUSXefICgC2IjMK9yUcpDGPxjaVdUyUadKmz4hPE
	 fsnrpvcR8qk1Guxjavp5jzF2AtiG51pxO75rEEvwFV7+8dn3yqgr6tvGgNwUcneOy3
	 zkZ4FIGpfxhc1NzyEDqekcwDUz/FCw/Azd5K6In7Z81wZkh4wSEYeoCIlmOnbtBBEt
	 uzMSLDRWtu6y6qeJ1dAC4jIKfI995Yx2x3qRywfU30kbxvhRYabeEACKNXXw7O3/8k
	 JQXvBBtyhslzPTOtxTRSrucHj2qYTl+bTMFH5twIcLEG/kOlgoNNra3ZXmMiGvY6vP
	 gtUKcJAF1evTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F0B73D84BC4;
	Tue, 20 Feb 2024 21:11:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170846350198.4365.10293073673459865260.git-patchwork-notify@kernel.org>
Date: Tue, 20 Feb 2024 21:11:41 +0000
References: <20240206151744.2459-1-shawnguo2@yeah.net>
In-Reply-To: <20240206151744.2459-1-shawnguo2@yeah.net>
To: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  6 Feb 2024 23:17:44 +0800 you wrote:
> From: Shawn Guo <shawnguo@kernel.org>
> 
> The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:
> 
>   Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.8
    https://git.kernel.org/soc/soc/c/d0a59944e34f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


