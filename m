Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1960C46CA3
	for <soc@archiver.kernel.org>; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB9D9C43391; Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 933AFC433C9;
	Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701879541;
	bh=tYabG4DVUSk3clC4MYlcyNNdKLMCV54vqgLeCAnKa00=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Oy7W7Iwtcl9gd2W0xUxRzRJsawNxrURAgo7qzZnVG5vy5MMdscpw39joVwJBtE+8/
	 YwqldMGF8SIiaqwnVHVQ6TFieIfhu1E+D68UJkLLs9pWfrgTmfIpAiqHO3ORNdxNu+
	 K4BIZ1Fa+MyUF206hGnirUm58jy+mJOFy1amTqCCl9iXO8yv5ILC6+McUmD4FtW4iy
	 tWLTIB13D7w57gvSx/Bf4HUE6Bga1CV84EyI8ycw96LTlnrnVOhXHEn5G+QVM7mR7W
	 Dez+G3H4e9240Of8wkhVbfaZkEm22vg1egJEHmvOJxCdvvOllAotVgKhEr9W1utWKg
	 Sgf3EYoAgkryw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6F8CFC04E27;
	Wed,  6 Dec 2023 16:19:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] riscv: split cache ops out of dma-noncoherent.c
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170187954145.26038.3996545646354758791.git-patchwork-notify@kernel.org>
Date: Wed, 06 Dec 2023 16:19:01 +0000
References: <20231028155101.1039049-1-hch@lst.de>
In-Reply-To: <20231028155101.1039049-1-hch@lst.de>
To: Christoph Hellwig <hch@lst.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
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
    https://git.kernel.org/soc/soc/c/946bb33d3302

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


