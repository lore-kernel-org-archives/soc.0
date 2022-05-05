Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBFFC4332F
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16352C385B9; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1D61C385AA;
	Thu,  5 May 2022 19:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651779108;
	bh=kVNVQqlcVJ3ZYOdrvX1MQfVaOAhSFoq+lgpguvLLJO8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gt4DVz8yH3qLkqvTogaTt0eO/VIMMdiKhFy2I+6WGlGyoPyAZv0TDD24d36IlgXV/
	 gbaWDSynSzGMAtwj8QmvIn/JudwxEtujoQ1Io3Nj6GCmcQULY43sIgyH2eitYoDIxl
	 oZY0/oFU+EJyq6s/yic28weWxHkAQDa9iXqfyutPRUrSoC0Ss4MflE7Vi+Vu/psDip
	 wfgfqBJx8CSqLiDKMuFdiUeSd8Cq2iSncu+uwB9v6g8R8tct70j/EXskXslkVLZ5Mq
	 XIlWQ7ljRaxJ8qfCR4DOFsZBOog91L55ylWhw3bHJMwGiWTJyn88krziAgIpmIWVaD
	 v8zaeTl1euAIQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D2B88F03874;
	Thu,  5 May 2022 19:31:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE SHM vmalloc for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165177910786.9627.7622564549073486438.git-patchwork-notify@kernel.org>
Date: Thu, 05 May 2022 19:31:47 +0000
References: <20220503192916.GA3288817@jade>
In-Reply-To: <20220503192916.GA3288817@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 3 May 2022 21:29:16 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this patch which enables tee_shm_register_kernel_buf() to
> accept vmalloc()ed buffers.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE SHM vmalloc for v5.19
    https://git.kernel.org/soc/soc/c/a37de2ad8e2d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


