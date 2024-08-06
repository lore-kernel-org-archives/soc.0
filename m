Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FF5C52D76
	for <soc@archiver.kernel.org>; Tue,  6 Aug 2024 20:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8E68C4AF0D; Tue,  6 Aug 2024 20:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3156C4AF0C;
	Tue,  6 Aug 2024 20:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722974897;
	bh=TOtqlA0s6mIOT2R2ZiyoHb7HIbSuSBlmElOUyBjUeho=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=coYfOvkIuyb4nDgfC4DwJJgHbgkh6o7GlT+YKp1sspekJ4kVWdbPIZqygS3mMls9M
	 YHQY7S2R76jynLlJ1IPgC90c1gkX40a9URTG/ygsTNJihX9t1VP4+dqDTSQ27zzWwo
	 e5H0Gvy/Iv3DJchPzztwjta0AcgqNpp1VOjISwofvKfMrek4GwSOQo0a+BeIorLxvD
	 8/jYNuT87+JJBI2MFB3UM1wFBBINg25MVhfFQZXimzIAV6sJBYxOn7hobO/0mgCeVi
	 d5eLjMjSMbU3iAGXNxaSttevtJMFRTieY2G7PL6X6nl0gu5L65kXkKB6a16cPL6Rbj
	 4AZ+jXaGJeNTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AF44C3824F34;
	Tue,  6 Aug 2024 20:08:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] Fixes for turris-mox-rwtm driver
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172297489624.1692635.7370786713805670353.git-patchwork-notify@kernel.org>
Date: Tue, 06 Aug 2024 20:08:16 +0000
References: <20240715115912.9507-1-kabel@kernel.org>
In-Reply-To: <20240715115912.9507-1-kabel@kernel.org>
To: =?utf-8?q?Marek_Beh=C3=BAn_=3Ckabel=40kernel=2Eorg=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 15 Jul 2024 13:59:09 +0200 you wrote:
> Hello Arnd,
> 
> as you requested I've split the 3 fix patches from the
>   Updates for turris-mox-rwtm driver
> series. I will send the rest once the merge window is closed.
> 
> Marek
> 
> [...]

Here is the summary with links:
  - [1/3] firmware: turris-mox-rwtm: Do not complete if there are no waiters
    https://git.kernel.org/soc/soc/c/0bafb172b111
  - [2/3] firmware: turris-mox-rwtm: Fix checking return value of wait_for_completion_timeout()
    https://git.kernel.org/soc/soc/c/8467cfe821ac
  - [3/3] firmware: turris-mox-rwtm: Initialize completion before mailbox
    https://git.kernel.org/soc/soc/c/49e24c80d3c8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


