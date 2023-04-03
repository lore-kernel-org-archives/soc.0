Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53E3C76196
	for <soc@archiver.kernel.org>; Mon,  3 Apr 2023 16:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D32CC4339E; Mon,  3 Apr 2023 16:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 868BAC433EF;
	Mon,  3 Apr 2023 16:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680537684;
	bh=iRB9C8bsK1YSnnMHMUijiO3OxeE1UKnjiv5ps2pFTJE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Xra8P5Bb9Ax0CU6yhag0Bw6JrUJGlh8yKgIxJ1K444pML/4yQ2nBfWHyd+IMBG0AP
	 96LHjBPQiwlSOWPzlaOS6PARebNZ4THdHaxCDzKP4zp0rABSSd4IXA7KsBDHPggzrX
	 E6zTm4jowJBUd2CKn1iK0CEIykEvV65vQ3ZzJF2ydcmMJ7tDLPpFmmQHDn0IH9qPqI
	 e5Zu4Dy0yi7EhXwkqHcn9j9BAUNiUPRJMeHF+MWFwpwIJowvvbRWVpaTxOQfJzkTxn
	 1ZV5BQRonwfL9DKycVcnBjmWlttU82l1RHHB3b/WMtm2IAxU6dGQ4IszM7nojyMgpU
	 IryThmaZCQ5pQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 65001E5EA88;
	Mon,  3 Apr 2023 16:01:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fix spell error in OP-TEE driver for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168053768439.32283.15118391848827777529.git-patchwork-notify@kernel.org>
Date: Mon, 03 Apr 2023 16:01:24 +0000
References: <20230314184441.GA2936721@rayden>
In-Reply-To: <20230314184441.GA2936721@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 14 Mar 2023 19:44:41 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch fixing a spell error in an error message in
> the OP-TEE driver.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fix spell error in OP-TEE driver for v6.3
    https://git.kernel.org/soc/soc/c/167fba62c377

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


