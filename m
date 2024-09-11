Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ECB8EE4981
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 09:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F30B3C4CECC; Wed, 11 Sep 2024 09:20:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD518C4CEC5;
	Wed, 11 Sep 2024 09:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726046452;
	bh=ZDaS2CRhe4fwk4CpcMWFUCe0Aw8wI/6iL8X/pgDInFY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dtIwbE7iwJS0ZByZdKt/remJ5z+kJiFAbHwslde85Uiplev+UdGrQrpfrnTY1u5ge
	 BbxTSU4E7wxnio07Y/fYDH2gejCFutJ35SLgcBNhWnbZ5vygVmTScnYWuodq0KUXAq
	 BwvJiWv0SBQ+p0IubHmtkVTPVTDOv9B1d8BEnID0d+BP7kVsqTyuXBjCX4Bo3o3Is7
	 0o7i2qEZMAPgUVXmmPEGluxkwJN+sriAK1lx2j9GUx1dmB2HdOfdCh/jMy1LLYwKHO
	 HB43E1BDJgVa/AzreIuqfngQpdJXrmb0PEQxlT5NY+PAvGwk41GeHxOqYK3YbxevA9
	 QudrlWxJzbUsg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 346FD3822FA4;
	Wed, 11 Sep 2024 09:20:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V config for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172604645374.555636.8973601715170100840.git-patchwork-notify@kernel.org>
Date: Wed, 11 Sep 2024 09:20:53 +0000
References: <20240910-annex-ravage-07d63041a7c5@spud>
In-Reply-To: <20240910-annex-ravage-07d63041a7c5@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 10 Sep 2024 23:02:17 +0100 you wrote:
> Hey Arnd,
> 
> Practically nothing for you this cycle, so this will be my only PR.
> There's both Microchip and Spacemit stuff on the lists, but none of it
> ready for this cycle.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V config for v6.12
    https://git.kernel.org/soc/soc/c/3c557d0062bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


