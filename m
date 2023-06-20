Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA506C3DA41
	for <soc@archiver.kernel.org>; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C759C433B8; Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 767EEC433AD;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687296112;
	bh=V4peMp7Ugj0ju4OF9aaIhk5lKnKCxX12n3CjeQzGunc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=N59kF+X8te8pSvCOsvS+r/mve3ZHM8IlFiK+sz3ZTKIzS3v0FkQ0REPaQLqT1TXQc
	 PxL8rClZqKZjNxqUdO3A2q4prEkWRnKXNDckeO9oqV6EMfQYLBxExCaazLCFI2DnMO
	 f9lSFIJFRFZ7sQN0gCjqQs0isiQwgjVFFs7gZrE8uBKIoTkNshfxPWqltaE/vpzDGh
	 dTryAaTq4z4/H+oxZHDFjkxNPi+xUTKsWj5UA+MKVqmlTi0ETPiyyaO2vgrmVtNvH2
	 g0YtFYET/PcBq3K6FjXneAvETDbXjNWwb1nWpfgwlKWKuQWLWQnI+eXKaPsAR32O5K
	 e4/xgbMVlZKFw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 60946E301FA;
	Tue, 20 Jun 2023 21:21:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 2/2] arm: dts: Keystone2 updates for v6.5
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168729611239.12258.14308470986451695056.git-patchwork-notify@kernel.org>
Date: Tue, 20 Jun 2023 21:21:52 +0000
References: <20230615164127.qcgwrbwpmclx5wlm@landscape>
In-Reply-To: <20230615164127.qcgwrbwpmclx5wlm@landscape>
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 15 Jun 2023 11:41:27 -0500 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:
> 
>   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,2/2] arm: dts: Keystone2 updates for v6.5
    https://git.kernel.org/soc/soc/c/ce207be3e294
  - [GIT,PULL,1/2] soc: ti: Updates for v6.5
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


