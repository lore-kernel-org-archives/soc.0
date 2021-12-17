Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76A5C433EF
	for <soc@archiver.kernel.org>; Fri, 17 Dec 2021 15:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A191CC36AEB; Fri, 17 Dec 2021 15:20:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B849C36AE1;
	Fri, 17 Dec 2021 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639754432;
	bh=FEgfYxSbJIvH69KcS5JZ11FQTU/vIRjC6v/MsHbUYx4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QUzf64bQmb2No/479IDUD+jX/tFFG/CHruOd6VpPc1HzfggJ2BF32lB8NwPR74ouh
	 dN2DW8fleqTspRa6BGfhoW25cqVaSgd7WUJe7oNrV89qSyQg5ZICrFIrGGpv6b1ub5
	 8aDS2Gim1EaOWmhtYAB69juyxgGEKLW8QSQHeRXFMGPrY08EURZG3PST4rEvChzMOr
	 +irlFz1EfTVgneDLPQYaPQ9UV6CT7GchLWEhb3IC6CMRON1VnqYStaRPXv9lCIZ1Xs
	 lSaW187fjt0zIVasAFB5F/yd3qtTRU49SiU71r0xxPB0J25E6BfzHRPMkY67J/JCjh
	 7q2GDgOJZoaVw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 739C160A39;
	Fri, 17 Dec 2021 15:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE and OP-TEE fixes for v5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163975443246.14717.9030025966655880045.git-patchwork-notify@kernel.org>
Date: Fri, 17 Dec 2021 15:20:32 +0000
References: <20211216150745.GA3347954@jade>
In-Reply-To: <20211216150745.GA3347954@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 16 Dec 2021 16:07:45 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these TEE subsystem and OP-TEE driver fixes which by coincident
> all are concerning memory shared with secure world.
> 
> There's one in particular nasty race fixed when a tee_shm is about to be
> teared down.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE and OP-TEE fixes for v5.16
    https://git.kernel.org/soc/soc/c/a6a476878ea9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


