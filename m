Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F012C47070
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3958CC433AD; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 214B8C43397;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=MTL4ruWyIAzc5sNa6lYuKPRH8R7xIZ6Fpr0KctlJYyc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=J1fPgiiitTzmx5trdoddajFgQybUj0l9E3eYFOoYCHyswAFDg3Ro6bh5RBbDsXpRT
	 NHBEMMLm5HfWD6b7WD+w1MzZGyPr24f5BwBp3jarMT82fxbo0lp3Mic6KDLRmVqVIB
	 5YJUvvNm6VHcyc2ijq9jT446U3gYqxv3ovH6LPQXGIkaIliX7waAfldqEEhy/iNWE4
	 1M0tFn4ajQOKoJruKjkhGg0hvgDEHexsFd8MDypyM1UATN78BLzeEsOrFLHN37kg6O
	 CcLtR7FX8lXhHVp3dALLfvIby4oA8uEWuZLF1civ4NbamBaxdYsf0tgcobvz7wKiMa
	 mvHv2E0z1ta/Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 08B0DDD4EFA;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] i.MX drivers change for 6.8
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046603.3302.12426367923469525407.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <20231216064605.876196-1-shawnguo@kernel.org>
In-Reply-To: <20231216064605.876196-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 16 Dec 2023 14:46:01 +0800 you wrote:
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-6.8
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] i.MX drivers change for 6.8
    (no matching commit)
  - [GIT,PULL,2/5] i.MX SoC change for 6.8
    (no matching commit)
  - [GIT,PULL,3/5] i.MX DT bindings for 6.8
    https://git.kernel.org/soc/soc/c/e802ed9e9bdc
  - [GIT,PULL,4/5] i.MX ARM device tree for 6.8
    https://git.kernel.org/soc/soc/c/8c5ce9094b0e
  - [GIT,PULL,5/5] i.MX arm64 device tree for 6.8
    https://git.kernel.org/soc/soc/c/5d9331b48d17

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


