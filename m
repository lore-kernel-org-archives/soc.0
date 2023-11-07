Return-Path: <patchwork-bot+linux-riscv@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C29C4332F
	for <soc@archiver.kernel.org>; Tue,  7 Nov 2023 23:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2DC5C433C7; Tue,  7 Nov 2023 23:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE3FEC433C9;
	Tue,  7 Nov 2023 23:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699398025;
	bh=dULFohQIMtMngk6II8kbzDmD1WipBN7DPsTQrS2mvLc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ogucU28KR/GHHn0Ly1k4dMFzdxv1f8EJ3OYVjKOTGD5QkYkcp4e1AB8owzgUYT7aL
	 Ic1N6BDKGpcaHtMz1jOTUwtIiBRxEuCamqbumKl5/mV3hlrHbwR0QDiiICvCOV+arj
	 bhV6s++zmxTqhXrK2GcNs4GLMpJMt9HFTjyJqypXDKvS8CR9p4+N4cage+OkCOq687
	 XUJiy71oshqB143HIKs6n9P9CSGAbqE/bHMQgQijn7idzDE53g51syd+0pA0v7IZQ3
	 I6dA+UhIK53+Xv8pSAsSmLa309/5tGc3s1OPwzNM7GYgmyaX6u6IuecwZi+qYyc4W4
	 /vi/ujHsXa1qQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9C16CE00084;
	Tue,  7 Nov 2023 23:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: split cache ops out of dma-noncoherent.c
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <169939802563.13989.11221293353672804460.git-patchwork-notify@kernel.org>
Date: Tue, 07 Nov 2023 23:00:25 +0000
References: <20231028155101.1039049-1-hch@lst.de>
In-Reply-To: <20231028155101.1039049-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
List-Id: <soc.lore.kernel.org>
Cc: linux-riscv@lists.infradead.org, geert+renesas@glider.be,
 paul.walmsley@sifive.com, palmer@dabbelt.com, conor.dooley@microchip.com,
 soc@kernel.org, lkp@intel.com

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Sat, 28 Oct 2023 17:51:01 +0200 you wrote:
> The cache ops are also used by the pmem code which is unconditionally
> built into the kernel.  Move them into a separate file that is built
> based on the correct config option.
> 
> Fixes: fd962781270e ("riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend on RISCV_DMA_NONCOHERENT")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> [...]

Here is the summary with links:
  - riscv: split cache ops out of dma-noncoherent.c
    https://git.kernel.org/riscv/c/946bb33d3302

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


