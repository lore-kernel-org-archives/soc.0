Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C45C3527A
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3DB4FC385C1; Thu,  5 May 2022 19:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 256F7C385BC;
	Thu,  5 May 2022 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651779108;
	bh=3gcM7eUKDCr1M7a696e7KqPKtNKWAMdeBVgMy2Pqj3g=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=glAk8FEXyWgO0epc+7R4uhX4v3fR1kwj6/AmrSH+JJEpbzxRqo23V7RdcK9MUPsAy
	 S/jwhtibNJboifYDruNLZ8TinOtERb5f6cGc21Ut0dldDRRBHyvJko1aw/Dl3EHYdB
	 2ZgmlUzwoGjr0CLAlyhm+b0f+eHv6sW861zrw52Xtl1CQ7FKOw5ZVnmLzEG5gjZxMD
	 ydpbH2zqUlmdCMCvfEWVd7aUHpRaSjca3OwESw39cBoa26Amrpbjx1hOZA9gXd50cg
	 pDzCcXtvq7U3VBbpEGKrJ8Adq96j1OO2cnIyP4+sp47neA3dcvEwLiVIHlVdy4yjvM
	 j6HL3wWzA24eA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0EE8DF0389D;
	Thu,  5 May 2022 19:31:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE menu for v5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165177910805.9627.11857555309210983555.git-patchwork-notify@kernel.org>
Date: Thu, 05 May 2022 19:31:48 +0000
References: <20220503191626.GA3278203@jade>
In-Reply-To: <20220503191626.GA3278203@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 3 May 2022 21:16:26 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch which combines the config and menu for TEE's
> menuconfig into one line.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE menu for v5.19
    https://git.kernel.org/soc/soc/c/a964ecd8a70a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


