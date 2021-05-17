Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A72EC43462
	for <soc@archiver.kernel.org>; Mon, 17 May 2021 20:20:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E686A6135B; Mon, 17 May 2021 20:20:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CF61661352;
	Mon, 17 May 2021 20:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621282809;
	bh=X15NXBZS3JGbFVrPOKXKihBuXAGfg1xzMw9EbfYgwks=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=LWfnDf467qZGOtMTcfrooB9YSNzNxR9SGSFhpV/gJbXQ8q1W7EdCAf4L2su35FpFE
	 OX6rmt8j6TSoeJM/Ccr0UuzivZzcLEpqabWtH/QQYQV75ZI5m8BKeBp0VssgPM26KE
	 ELTq0m/UmAljQt9EuUGOGQxuwXSz/ZRSm3cbBst8z1oph2CSHK0rfSboXQ5+QNar6f
	 SGQ5WDpqmoCtRATJeZLEwrliDkWY7NMEkwe86aCYYXvVVPwVdaZk0HIqgdmKeadCJ8
	 4Vzw8Jc3X3X9ON8rHPl/C5jPwpFM7OysMelwVoRfBT2gxvLqXZFQ5TZAn3mY1yZUac
	 cY0qS6jbHm6sA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C3C3060BFB;
	Mon, 17 May 2021 20:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AMD-TEE fix for v5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162128280979.19328.13271242836160511417.git-patchwork-notify@kernel.org>
Date: Mon, 17 May 2021 20:20:09 +0000
References: <20210505110850.GA3434209@jade>
In-Reply-To: <20210505110850.GA3434209@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 5 May 2021 13:08:50 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this AMDTEE driver fix which adds reference counting to
> loaded TAs which is needed for proper life cycle management of TAs.
> 
> Note that this isn't a usual Arm driver update. This targets AMD instead,
> but is part of the TEE subsystem.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AMD-TEE fix for v5.13
    https://git.kernel.org/soc/soc/c/8ec51f894bf5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


