Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81141C3DA41
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 69EC1C4AF12; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53029C4AF0C;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720517438;
	bh=8loRwpnkbUPCPKc216rM/bWnT5OGVFAojI2U6WTeLsk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=o2NRv1cPuKuZXaKACLq7sfUGwhWHiZmB0pjm32zaRaxh3DiNpgghK+dEGgi/ct/Mx
	 H1SB5W2jj1TKdzF5mEl5ujq2XnfUDWzEWn9+HcQa99Q35/eY4q6Ca5hYmsZWkNQPBa
	 SGVk1dK67PpkAjgPcdbgqWH+2jGxDGq13i5jB/L0IuUUmsKv2qJYLcnchdz7I6YeJb
	 jsRekSGJAhu7W7z6lcgyAdySNMCYycbWd34ij2v7MNuiCsPyl5mfuiOUmOm3tCBFXB
	 +hrKMQu6PXo9cI3qnFHXerE9aTds0fSvfq8+FmyBoW7NwbHx5ehDo0OZg0qyIp6ve0
	 BEhpVorIAELRQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 36D95C433E9;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc: ti: Driver updates for v6.11
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172051743821.12156.10317588003042878753.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 09:30:38 +0000
References: <20240705151449.s4rngkehjn73favn@stream>
In-Reply-To: <20240705151449.s4rngkehjn73favn@stream>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 5 Jul 2024 10:14:49 -0500 you wrote:
> Hi,
> 
> Please pull:
> 
> The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:
> 
>   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc: ti: Driver updates for v6.11
    https://git.kernel.org/soc/soc/c/9c148cb47a1e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


