Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C7EEE4981
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 09:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB406C4CED3; Wed, 11 Sep 2024 09:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43A4C4CEC5;
	Wed, 11 Sep 2024 09:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726046445;
	bh=1AFEtp1qj4HJ1iQjKidMG7v2hAo0u2BwwL57iKJBhms=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=V1823vdS7dyz3PpbGBidETgdmUTjTZZW5G9s/qLjrvmWNADyKAOVOEsBIlHhBV+9/
	 esnxxGiM1jmCNgp5f32/+oTiGTe/ZLQP0jcaJV1zhrAQ2Rw1EbcuNt2revfkkUZyU/
	 aQBJj8+WQ8toNbUeDX5dsVueAiwP6zBT2PMad2mAkSv3dEvzbjOjhtvlIL+qd8bMuZ
	 8UVHurB9ARXZqC0nxRawJWy00wmnUzWJmX7Ymefqt7Dbg9qQRj74jCcjjCeJqDcjgl
	 DcFlByCoqEYe4YB9otDZfDUx5rkkRkY6U4vmfMK/13EUbmREL/S01MrGTiKFRHggzk
	 EmqWeHxt0dEVw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1903822FA4;
	Wed, 11 Sep 2024 09:20:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] Broadcom devicetree changes for 6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172604644677.555636.578481179914309065.git-patchwork-notify@kernel.org>
Date: Wed, 11 Sep 2024 09:20:46 +0000
References: <20240906180643.2275460-1-florian.fainelli@broadcom.com>
In-Reply-To: <20240906180643.2275460-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  6 Sep 2024 11:06:40 -0700 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.12/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Broadcom devicetree changes for 6.12
    (no matching commit)
  - [GIT,PULL,2/4] Broadcom devicetree-arm64 changes for 6.12
    https://git.kernel.org/soc/soc/c/ceb7d8adf640
  - [GIT,PULL,3/4] Broadcom drivers changes for 6.12
    https://git.kernel.org/soc/soc/c/13e87440bf0f
  - [GIT,PULL,4/4] Broadcom soc changes for 6.12
    https://git.kernel.org/soc/soc/c/46d2efc4efc0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


