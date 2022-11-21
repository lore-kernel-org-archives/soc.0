Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D17C43219
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 36F8FC43149; Mon, 21 Nov 2022 14:51:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EC33C433B5;
	Mon, 21 Nov 2022 14:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042286;
	bh=uc/oHcDMt5BBru36d1T/7+3UI7PgzgClxqq1M7Rp3/4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=fsDzpMcNjO7t338Ua/x5ediM3LMavFcyzq7jnL3rLU3r29BFb8GPyPqvHM9xTBeqm
	 RMC7J64hJp2DZJzB6aF1DtX+xQ0MxQS+CfyTIqn0khBLDaAc7CIDd9EhjhVX1YMOo9
	 rpDT2276ddND44wONK4lXp04GYev4e54dd60jfg3uVx75zjL5yw69UFW+hY5Ob5ycV
	 yr8JcDERFnJ7hG3ePy4LyYxd+OBe9pZKZd8+5otMrzBfx9Bu6UAsq+T4qvgjWyHnG5
	 MJRQJRO8nw1yykNN6HStFRSPtW2igwv6xyORM4qVnoDNN8Cp3W5LEDwf6+Db7w8pXl
	 wy6SPCAVwssWA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 03CD7E270C9;
	Mon, 21 Nov 2022 14:51:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fix possible memory leak OP-TEE driver for v6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904228601.4359.11968081106982724023.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:51:26 +0000
References: <Y3d2OuJ60U30OkZe@jade>
In-Reply-To: <Y3d2OuJ60U30OkZe@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
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


