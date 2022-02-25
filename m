Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F09C41535
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3EAC7C34102; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 295C3C340FE;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=Fl8bqYL+k7W23yThJzpVaw/Jwi2Nw+gdVHNrIL1M0VI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=umrxeYGttazcD+whyC6Ly6dBeHpvdGZCKAn8KtZzTLNZRt0NclSvcPF42Ax6mBdCT
	 YcSp7Iunm6xyPwa3uxjmYwcuXFsx1RS93IYWiaaBT/MKKeC8IEd5qSefY61NCT7G1m
	 tZotckS3Tf/cQnThBA96oAaE7wKwlufMNmpyVy+HajGC7D6IFEkQpPhNPWpJreQpv3
	 U0LhsuybwLfQoH6vSmyBNYkTwI/sKEwS5PEZQXmoW/29/NEqBhS9bmrgTIidIj4Fn3
	 aaw4P8fPYtLKqwdrntCacr1fOFJL1IagL81BpJfeEAOEBHg37+rGjxWm3SL5yw5vBj
	 EELdn0xcFoIQQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 127C4E6D4BB;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AMDTEE simplification for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966307.15608.8907163745199495930.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:03 +0000
References: <20220218175632.GA926082@jade>
In-Reply-To: <20220218175632.GA926082@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Feb 2022 18:56:32 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small AMDTEE driver simplification to use the LIST_HEAD()
> macro instead for a global variable.
> 
> Note that this isn't a usual Arm driver update. This targets AMD instead,
> but is part of the TEE subsystem.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AMDTEE simplification for v5.18
    https://git.kernel.org/soc/soc/c/bc5ede20b8ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


