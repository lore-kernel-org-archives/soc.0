Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B20EC25B4F
	for <soc@archiver.kernel.org>; Tue, 30 Apr 2024 13:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1D3EBC4AF1D; Tue, 30 Apr 2024 13:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0623CC4AF1C;
	Tue, 30 Apr 2024 13:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714484434;
	bh=kUhizHDnpIEuKQ5d5VFjKOzyio+dIU1IDpxu8Dx5Mw8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=TkDrq64xtlXC+hLOHtsQgD7RYZ+KS2aPIO3IUJA49SjkfmdSSgEvOGFKGaJAdwPOT
	 4uuC6jSCaS9OP0AcLwQnvCjCSM9wQ1d0NrL47ghSEuLu4dt+ps8ERP0NZJXZPU4jnZ
	 V/Mb9eaQ8KAdQj2Mlyrbt/N/dHwRNICN08wfVzupGXKyRM7m9MJQ/poF1JLfyv/wM/
	 yUSv9W53MBW0hsG4vgXZ34V31KZv3G2LsQ1/NZx5R64Gn1cBQBbHnl9HxQT20C1qUU
	 TT6Nikz9fz9csMK5FbLrMOcrnYSCOsX4A6TG826VlcUiPuo0oF78NWoFBwkmIDi0+c
	 ML+JlvvVdJ8Kg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E12A7E2D487;
	Tue, 30 Apr 2024 13:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SoC driver fixes for v6.9-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171448443391.21603.6823306878868579606.git-patchwork-notify@kernel.org>
Date: Tue, 30 Apr 2024 13:40:33 +0000
References: <20240427-unflawed-humorless-690472f9c5a0@spud>
In-Reply-To: <20240427-unflawed-humorless-690472f9c5a0@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 27 Apr 2024 12:03:33 +0100 you wrote:
> Hey Arnd,
> 
> Please pull some minor fixes for some of the drivers under my remit.
> 
> Thanks,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SoC driver fixes for v6.9-rc6
    https://git.kernel.org/soc/soc/c/e845bcc8cfda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


