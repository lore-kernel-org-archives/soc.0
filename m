Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D21C43217
	for <soc@archiver.kernel.org>; Fri, 22 Oct 2021 20:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1C7C26112F; Fri, 22 Oct 2021 20:10:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id F2483611F2;
	Fri, 22 Oct 2021 20:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634933409;
	bh=6Oko/CFD5orTNOhcva4CFGowQ2XgUaS6z8QZi8sJsbY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=m5tNPUGs/q1Wg4qSDZgKsH8pvTa8C/2Slmxon74MRyiGp+gyTG7ZzTcK9vcFnlMsk
	 ySeONJGsNcG3FtFmcml8EJ/eYPNxIlrSJy1I052iCUTuNWbMKCFN4hKxlhQ95bJ4Hx
	 B9dfyIEpNpkVpnitpQTF+I/j2BN66Orp1IPR5JnsFPdXYK9FgV2Ol0brwetw/nirUp
	 0HK446IOSFW2dkdcLmPQs5kNZiBdtK4Gs+DzgyGyen2IIgemHVM9hBAqUYjw0H5NWD
	 A+IjU/CLWy4BHM7C9jweUPPwta7CXwtPEqTLlot0LM6x7CGkMxRudEUTMv6bLe9r1T
	 F517MC/OKrq8A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DFAA460A94;
	Fri, 22 Oct 2021 20:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] soc/fsl drivers changes for next(v5.16)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163493340891.6553.4303892986829092399.git-patchwork-notify@kernel.org>
Date: Fri, 22 Oct 2021 20:10:08 +0000
References: <20211022010027.11866-2-leoyang.li@nxp.com>
In-Reply-To: <20211022010027.11866-2-leoyang.li@nxp.com>
To: Li Yang <leoyang.li@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 Oct 2021 20:00:27 -0500 you wrote:
> Hi soc maintainers,
> 
> Please merge the following new changes for soc/fsl drivers.
> 
> Regards,
> Leo
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] soc/fsl drivers changes for next(v5.16)
    https://git.kernel.org/soc/soc/c/ac2561f921e2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


