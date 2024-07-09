Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F429C3DA4B
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8088EC4AF0D; Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69D6FC4AF11;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720517438;
	bh=UPspx1GEiDsLRUgMU3LF6J+5EhVLFS4YZsHMyzcKT/M=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UUhmhyYhP0r2XADl77QI+Xr+iLn2HmzLby+FQT3UUk3OXNqA7V8fJxTMusQbvEC8n
	 1UKftA7t+mhTfaMjGjhY5AYTaack2QrgJDpjmktsb+SifvcS0qvAdAJS0WNdamYcow
	 nv5bz3GtfbsQRRoVlQKyNxQ467+S4XLOl69osL/21yzESLeEVGe+Zw9vtzXv2eG2fk
	 kkqz2cWPR4RsC4FlZgTS3WKcivOFUyMkyHnSlaP+oY9wE7Z/V3uSBpmMxmcyZwSTP+
	 YEZZcKcnqw6AS0xFOvBiM8tMAxEZBLW3ecvWImDf4NHnrD7lEbc1bSpYZMr0U6Q7Ah
	 drl3yRA/HEqWw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 57E41C4332E;
	Tue,  9 Jul 2024 09:30:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Reset controller updates for v6.11, part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172051743835.12156.15482405194070631123.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jul 2024 09:30:38 +0000
References: <20240703100809.2773890-1-p.zabel@pengutronix.de>
In-Reply-To: <20240703100809.2773890-1-p.zabel@pengutronix.de>
To: Philipp Zabel <p.zabel@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  3 Jul 2024 12:08:09 +0200 you wrote:
> Dear arm-soc maintainers,
> 
> The following changes since commit f2661062f16b2de5d7b6a5c42a9a5c96326b8454:
> 
>   Linux 6.10-rc5 (2024-06-23 17:08:54 -0400)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Reset controller updates for v6.11, part 2
    https://git.kernel.org/soc/soc/c/2bb1acc608cb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


