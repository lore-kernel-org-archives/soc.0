Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9966FC3527A
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 74BBBC3410F; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F658C3410B;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809663;
	bh=Y3k3DcgMA45wPD/ePeAsERt6BprKxzHV4DaQT8eCp/E=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=WxR+4MYMgk8P70pQ2RqZ0w5gtfyGET6P37mxnGcf+SMVAk03t4HqDSUDx6emaKJHb
	 HTM8vQ2r4nwnLj3dBBxJnCM/s863itsc0838gT+1tjTb2XGlrJZVJ9N86JKMtwVoMP
	 EGYzMabAa5xGXsvCFNIZ872RA3JBo29eiY0fhIlGinpY7lcCOIl+8fzRGOrMwKvJxj
	 YhwCwCB78fS97+3OLN7xNxW6RAPp6cX6A+WoD2lM0zSetlZ9ad1LZ473M0jZ85HU6U
	 KSg2Yi2ne0dtJFOXinDFBe5P2vtOqsGY81NcUTmZ5+hhoPhLmthLXnt8zyUGzIEGuw
	 JiZcZ0sp3PkDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4A5EEEAC09C;
	Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] tee: shared memory updates for v5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966330.15608.1862859581571966604.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:03 +0000
References: <20220218184802.GA968155@jade>
In-Reply-To: <20220218184802.GA968155@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Feb 2022 19:48:02 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this TEE shared memory cleanup. Some kernel internal APIs are
> replaced with easier to use counter parts. The TEE shared memory pool is
> also simplified.
> 
> Note that this pull request includes two patches which are outside the TEE
> subsystem:
> - 231b1fc5da09 ("KEYS: trusted: tee: use tee_shm_register_kernel_buf()")
> - e7ddab084740 ("hwrng: optee-rng: use tee_shm_alloc_kernel_buf()")
> Those patches are reviewed by their maintainer. I've also asked the
> maintainers that normally sends patches upstream for these modules if it's
> OK that I take these patches via my tree. As I got no answer I assume that
> it's OK.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] tee: shared memory updates for v5.18
    https://git.kernel.org/soc/soc/c/25b67f373b49

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


