Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFFCC6FA92
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82264C43144; Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C608C43142;
	Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663273220;
	bh=9Jso3HBXAQqc1qXZ+4Ah1Wp7oUGky5v1UUjPrHl6jdc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JIdJxF16m2tSsTH9b7fQQA3sAbWj8D4Wyc1ipnE/I1RfF6P6SJjC5VcI2+LsDpBTm
	 YPb7I9fVlKNT2y5Gq6aSn+YfnHRpkmHDjV2DjOdv7zYqrXP05sntKvdsWInMQ2h9DP
	 1dIjk3qsO8U4wBv5lg61Q3FSOWHtNWW0um5LU83+/uK8zQw3wBZgCV9iExzxJppnIR
	 5wp/5eIUejLRdsAdYNjwnTDBR7niGV7gHi9nT46U7F1M84YltI8BQErsFIv5Dn0vd8
	 ZCPJ3jOWQhFZ5GKGUKIAzBAxxfr6EidJPi5vn4Iu/xht4r4GV6BhsVlj3okxBxkLad
	 qm29+vpiOd8bQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 54579C73FEB;
	Thu, 15 Sep 2022 20:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] Broadcom defconfig-arm64 changes for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166327322034.27590.12458078683077181899.git-patchwork-notify@kernel.org>
Date: Thu, 15 Sep 2022 20:20:20 +0000
References: <20220915023044.2350782-1-f.fainelli@gmail.com>
In-Reply-To: <20220915023044.2350782-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 14 Sep 2022 19:30:40 -0700 you wrote:
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:
> 
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.1/defconfig-arm64
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] Broadcom defconfig-arm64 changes for 6.1
    https://git.kernel.org/soc/soc/c/79774742bde7
  - [GIT,PULL,2/5] Broadcom devicetree changes for 6.1
    (no matching commit)
  - [GIT,PULL,3/5] Broadcom devicetree-arm64 changes for 6.1
    https://git.kernel.org/soc/soc/c/e33060879cd3
  - [GIT,PULL,4/5] Broadcom drivers changes for 6.1
    https://git.kernel.org/soc/soc/c/34fdb46f0fe2
  - [GIT,PULL,5/5] Broadcom maintainers changes for 6.1
    https://git.kernel.org/soc/soc/c/8a6660465a96

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


