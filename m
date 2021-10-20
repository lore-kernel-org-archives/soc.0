Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F5F5C433F5
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 16:00:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E15476138D; Wed, 20 Oct 2021 16:00:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CB33361374;
	Wed, 20 Oct 2021 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634745607;
	bh=ENROQt4lbg9QVIY+VpsY6UJpciGgTOrfMCWhmlQoxW4=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EDc0w/67uUsEImWTh0a9cAf0QfrolmSkelINvZBCSENkYf9AZ2QU13qR+PZjPRLto
	 Q/KQADt7OsQsTTr+f/j3Fi5RT2+DJmpxjPWQa/MnyDqJv7eFwuhWStEu7eX3T6foZJ
	 cFNmoeYwd9lcEwD/ot3sOjbQqr8NIMBU592Tbz8mglCc1T/tHChuJEZAUjj4rfJMBn
	 ORtJTkF74nfgD916GQw4kck8sjAVZkXnzwC6Xop+hXuFP0auLy31E0LnnIamsLFiFc
	 MXEGG0yeVWTa4ZHFOsqPeNcxuXrMccAGCYnx/H8AGzboaleW+jwXZWZb5Vcls196aA
	 sPB40bjIPgaiw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BFF4D609D7;
	Wed, 20 Oct 2021 16:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE FF-A for V5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163474560778.11707.11473751294307625020.git-patchwork-notify@kernel.org>
Date: Wed, 20 Oct 2021 16:00:07 +0000
References: <20211018121324.GA2943530@jade>
In-Reply-To: <20211018121324.GA2943530@jade>
To: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 18 Oct 2021 14:13:24 +0200 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull these patches which adds support for FF-A [1] in the OP-TEE
> driver. There's a bit of shuffling in the code where everyhting related to
> the old SMC based ABI is moved to drivers/tee/optee/smc_abi.c, but there
> should not be any changed in behavior for with the old ABI.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE FF-A for V5.16
    https://git.kernel.org/soc/soc/c/20f6d9586eee

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


