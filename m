Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E518EC6FA99
	for <soc@archiver.kernel.org>; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C0AB8C43154; Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAF8EC4314F;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664398829;
	bh=JETwvewR0mgwA9WjYXp9GNGHVyYw1mZP847EOZqAatI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RuOSK4cPRPf0at7mTAJrxlr0cmaRaDB5IWhepWtudaCNqnlkB667EuSWOn6b5qdAL
	 SrHAslKu/79U6vZcrpXNR2FkfJeCsQWzzWbrTaKPw30EIjnzsU7yWQKHL8GHutIvq3
	 LDEJEe45ZaZ+VCi9himYtTHWnJ73/DrI0G+zdIbGEcW4w0+iapIXl3P7SvCtwPvjrv
	 kDwkEs6KSyvFAv6p6Appyyo2NTYsJ1ft8SOcMf2fnWBgBRPW02/vhwc9OOhjTL4sY2
	 Li56DxrLM1yrADk3noBx8bp9iirysFKf6R5xvdUdQUmioA8L++/x/CAwaIA6G59Txy
	 oo4xYWsvDysjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 99238E4D018;
	Wed, 28 Sep 2022 21:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: aspeed: defconfig changes for 6.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166439882962.18494.2966837708887362632.git-patchwork-notify@kernel.org>
Date: Wed, 28 Sep 2022 21:00:29 +0000
References: <CACPK8XeLzL3hT8fwVw9fV7Ccduz_PNhZn_67z2yXefCEha6jJg@mail.gmail.com>
In-Reply-To: <CACPK8XeLzL3hT8fwVw9fV7Ccduz_PNhZn_67z2yXefCEha6jJg@mail.gmail.com>
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 28 Sep 2022 04:44:08 +0000 you wrote:
> Hello Soc maintainers,
> 
> After a brief hiatus that saw me absent for the past merge window, I'm
> back on deck and catching up. This branch has a long awaited sync of
> the openbmc defconfig (where most of the aspeed code is consumed) with
> the one in mainline.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: aspeed: defconfig changes for 6.1
    https://git.kernel.org/soc/soc/c/ffc79c2097fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


