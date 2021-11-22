Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0F0C4321E
	for <soc@archiver.kernel.org>; Mon, 22 Nov 2021 11:08:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A558B60FE3; Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8E32760F70;
	Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637579312;
	bh=HqIQjwnEVnKo5fL192GK7C5Ko/0wwHvkEqiKCbUie2o=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=rtrWvdeJHrheBNmhPOvkNFTzkQGXuenOxSRJjFGxBINjzttzq5ites5+2/mbOf94/
	 sswo5H5UG6TmdMYvDuy3hHNp2jRaUadRRbt1CIheoTgIDFJSMWTy10LII/TcuZnbFY
	 d3wX2hdBgMp9OczHoIFtYcVUfFYIkkFAZ/Fs7aVrCrrxkXU2I+LHM2xINSuPzXAny3
	 /K+ybL05laAWIRmok4je/t5NOctM6xnWmng9N8/Nh3Rjkrsn3bULkifJ8ObyOA7frG
	 fcjvFUcm2waE6Yef/fCGsGeG/VEL8srKNwPrAOUmYbpN8Avm2KGRhUOZfMrRja6+JN
	 BU86wBRMJ0AHg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 831DF609D9;
	Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: socfpga: fix for v5.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163757931253.7615.16948904177294600590.git-patchwork-notify@kernel.org>
Date: Mon, 22 Nov 2021 11:08:32 +0000
References: <20211119153224.2761257-1-dinguyen@kernel.org>
In-Reply-To: <20211119153224.2761257-1-dinguyen@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 19 Nov 2021 09:32:24 -0600 you wrote:
> Hi Arnd/Olof,
> 
> please pull in this fix for v5.16.
> 
> Thanks,
> Dinh
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: socfpga: fix for v5.16
    https://git.kernel.org/soc/soc/c/4fd932a7250c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


