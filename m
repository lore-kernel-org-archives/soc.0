Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518E2C43217
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 14:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F3C8C341C0; Fri, 27 May 2022 14:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 095F1C3411D;
	Fri, 27 May 2022 14:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653661215;
	bh=kVNnzX6bj4yPnPcvJZYrrme2o57Rgvc7gZf9LOzk6WQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=kPbPFOISwpYHeuDnW4P6tETGmPL/hBSs0Bs/YtPlWcwnmJ5DNZKwz9nT5nAQ8KrC/
	 adrO3METjYage5SoPoAa+vV3aia3Gj33v5IuKjPKNgcuOWn+Ehu8qTRLxSL4mCkDLw
	 w0RgpWULlrkjTIeLDiJBMgJZKhuCx+pHMVFuU9XuZVehMjeShfGg7gv7OBrhWHvvA1
	 j33bqbjLu7PwYnd/rs94Ry4C+l+R7WfJ+P03tTcn37uTV6TyGFYqvYGbit4hD6VKyj
	 Gi0Jf8OByRZHe2ThdXVQ+NEbyqbix2KrsP6MszO83zQq8Qc/WTuouzdeG7QXg6HxsJ
	 3T7+pdHuYxljg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DE93AF0394F;
	Fri, 27 May 2022 14:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: at91: dt for 5.19 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165366121490.3919.8148866005584555845.git-patchwork-notify@kernel.org>
Date: Fri, 27 May 2022 14:20:14 +0000
References: <20220517153252.92393-1-nicolas.ferre@microchip.com>
In-Reply-To: <20220517153252.92393-1-nicolas.ferre@microchip.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 17 May 2022 17:32:52 +0200 you wrote:
> From: Nicolas Ferre <nicolas.ferre@microchip.com>
> 
> Arnd, Olof,
> 
> Here is the (late) second batch of dt changes for 5.19. It's not crucial code,
> so you can just postopone its inclusion without any problem.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: at91: dt for 5.19 #2
    https://git.kernel.org/soc/soc/c/2ef306e16e7b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


