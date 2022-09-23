Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60ECC6FA92
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92F20C433B5; Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7688AC43470;
	Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663944667;
	bh=vghKfA8hQU9z6El2n2TApkdSqt1LtS9FbRv4XqeEza8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=uNq3AZUTJlU+rhqg+akZ1qCihuBdytM1Nr7ERATbzMbJhvM2tR/6D1Sw75u2SmnQh
	 u30KG+QKYR/Ga7NKDGXXpTJM1uZuhQWuJTEYsJXxag2jl03QeE4dELgTsnyaMkNOMr
	 aBt+2on+HrvJtPtTemnesqRU4J2isT66AKga+7s6xEU5ilKYSmUsHHPy4T7kFCNNKr
	 MmdrAqeN65K1TUwTcaCV+iJJKfzv4S2d6dKRMIqvdRKjyimljPR3U7bA10Mh/owb+h
	 zPvJmIg7M0M2stXTnFJtlK/2HPiHw2UuNASAtfwq60aTDFH2SBMthX5OkYhaNBfjg+
	 QP/s8yu1XLS/g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 60EC5E4D03A;
	Fri, 23 Sep 2022 14:51:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom drivers fixes for 6.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394466739.12526.17924763121502550567.git-patchwork-notify@kernel.org>
Date: Fri, 23 Sep 2022 14:51:07 +0000
References: <20220918205038.3017866-1-f.fainelli@gmail.com>
In-Reply-To: <20220918205038.3017866-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 18 Sep 2022 13:50:38 -0700 you wrote:
> The following changes since commit 1085f5080647f0c9f357c270a537869191f7f2a1:
> 
>   soc: brcmstb: pm-arm: Fix refcount leak and __iomem leak bugs (2022-08-29 10:30:22 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.0/drivers-fixes-v2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom drivers fixes for 6.0
    https://git.kernel.org/soc/soc/c/b58e731783a0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


