Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B4BCC43219
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 14:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0CD01C3411E; Fri, 27 May 2022 14:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E953CC34118;
	Fri, 27 May 2022 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653661215;
	bh=N+FXvuktxKrnQST7DiRO9JanIsAGTn0B+mO5unq6D2M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=FfAluSpo/0RLTt0834P0xzwbzjCBtoLeR77OE51Y8V231dhbi0SODIxXGWE1AHEEO
	 PsRBpVhS7G+6LjTlN8+AqnOhZanEif7xLi1Ze0RL64mIkf1580el3hFYHavyIN+B7y
	 lnA6/wXde72TGCEqzrYXyAwFSLXTASLgSgVybMcESfN/GaoBRgYMxLDeEAzqC0/PNQ
	 Zfkxt5eywQwdhdN7sD09v9nU3owjR0bp0W0/nmzPJFFWFXxe9AvMO/UTKGv3z+9CjY
	 5I6OsPiKxlwZtuh2nrnqGZFcZPa8S4IlzrEprpCVDgPqxiwQyIwlxaGcyw87MPk/xM
	 NQGBFwqq1UUCA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CC081F0394D;
	Fri, 27 May 2022 14:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: soc for 5.19 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165366121483.3919.16019496199817685857.git-patchwork-notify@kernel.org>
Date: Fri, 27 May 2022 14:20:14 +0000
References: <20220517150832.89451-1-nicolas.ferre@microchip.com>
In-Reply-To: <20220517150832.89451-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 17 May 2022 17:08:32 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here is one more soc patch for 5.19. It goes on top of previous PR from last
> week and fixes one patch queued in this presious series.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: soc for 5.19 #2
    https://git.kernel.org/soc/soc/c/fd82d925f206

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


