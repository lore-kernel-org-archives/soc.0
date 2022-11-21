Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35E6C4708A
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DC766C43154; Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6ED8C43149;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042343;
	bh=/D2ff4LK6jQ57IOUUF44HPkeiUILTOgE/siEHVg/mUo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kZ1shdyH+GdkgOiQpX8L4BccBYr1qnt819ukZ9GwmHp0/RScn/NMOmuaZlO664PVM
	 8cWaGrDH05fjGE73ZBsDw4mjVNhZwKQV18kFLJlk/gNZB/p/qyqopRxncvpzT4SPt4
	 1Zfq37zXiuIR3vLbbSXRRpFTGeMB2w/QB0N3yrGehislP67JxdV2ZMCqfWSpKNd9x3
	 rCePclR+BxOd815nmc6AP1pDEFbC5IbQKa0J0wuBxEsS+6vjuv08Th6STnONMlox/s
	 9mJ3du7oyvXfVSDCPs9SoDJCRklM+XwNbI4zFHUlg/hT4BBYbeNDCvWKmEptzenh9m
	 UZRoICNNgZVkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B41C9E270C7;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fix possible memory leak OP-TEE driver for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234373.4359.12369457953618021364.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <Y3d2OuJ60U30OkZe@jade>
In-Reply-To: <Y3d2OuJ60U30OkZe@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Nov 2022 13:10:34 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch in the OP-TEE driver which fixes a possible
> memory leak in the error path of optee_register_device().
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fix possible memory leak OP-TEE driver for v6.1
    https://git.kernel.org/soc/soc/c/dc0e2470f4b9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


