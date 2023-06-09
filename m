Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7619CC7EE29
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 13:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3DE15C433A1; Fri,  9 Jun 2023 13:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 278CEC433D2;
	Fri,  9 Jun 2023 13:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686316223;
	bh=2bTC0dqPzHKLUvaspNhW8bMNCmhxtXWBelpPj73aK84=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=QNxTdLK7uBhM+JvArc7s5efQyUyZojWjYOf78HrHqrWy2iUXf1dcNHHT7qvD1bqEv
	 7miRrUNlMbbyn1RDYOBKyM9OjdEDFxbYijbvtYhBAuyoZKLBUM8a+PavDf7eBx9uN0
	 j40AMj8XmDTrEaDGDRed9PFXtQKctmgYXAiHyNfzBg+DMMkzvykHz5RYUnXq214JCW
	 8DAkPAGfmSExgKcv+f427ZQ7jydLHl4gAviwXPSCUa32Ekl2VN0XrKwG9jaagLQS1K
	 nZIfVR6+B6+SBVhZJ2xwFRZUGTbNCVO27bAi9OdNePgfB3fgyNj19hkF+baZz0vl0S
	 cuSOUK7U+TTRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id F2B10E1CF31;
	Fri,  9 Jun 2023 13:10:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.4, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168631622298.816.16788144763302717919.git-patchwork-notify@kernel.org>
Date: Fri, 09 Jun 2023 13:10:22 +0000
References: <20230607141312.GU4199@dragon>
In-Reply-To: <20230607141312.GU4199@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 7 Jun 2023 22:13:12 +0800 you wrote:
> The following changes since commit 0f554e37dad416f445cd3ec5935f5aec1b0e7ba5:
> 
>   arm64: dts: imx8: fix USB 3.0 Gadget Failure in QM & QXPB0 at super speed (2023-05-16 20:43:48 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.4-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.4, round 2
    https://git.kernel.org/soc/soc/c/5cdd5ec17654

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


