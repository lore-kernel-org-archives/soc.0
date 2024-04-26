Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B48EC25B10
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5CFB5C113CD; Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47103C4AF09;
	Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714148483;
	bh=MCuX5JXOvgGa5c7F/CL6XuwF7y3fs9i2FfeoJ6jY17s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lrBXR5SpdJv87vMSeETH91jLAeRy5mG6jOnd32iiyyAoOPwH5LeUO1r6P3doWtbP4
	 NQIYsCLw8RoGAlKxlvWGwaYqPdI91E+mVSrCYBXTK1wvvK4Vhu2prJWjTALoOvEe1o
	 Tl9k3sz5zIHxf1QtZA+vsiW56ZzML7qECE+vKWaVrhYbBtUqyP3vOY+yAwjANmnEx7
	 nHn5vjirfe5Zg/7PqiFm/IHy/JJ6Nb1AR4MrsBScuz8gMqzGU1LrUaK9Y060MSTKgN
	 K9YAiQFY0Z7vDORpsnLyDGNuZ+8Ng+Zgi3I/ni4I84MnFS6vJ357HE8J/o22Vv0Mf/
	 V9MrKnwwsHouA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2CE16DF3C9F;
	Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 6.9, round 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171414848317.5338.6921864917769294932.git-patchwork-notify@kernel.org>
Date: Fri, 26 Apr 2024 16:21:23 +0000
References: <ZioopqscxwUOwQkf@dragon>
In-Reply-To: <ZioopqscxwUOwQkf@dragon>
To: Shawn Guo <shawnguo2@yeah.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 25 Apr 2024 17:55:50 +0800 you wrote:
> The following changes since commit 00b436182138310bb8d362b912b12a9df8f72ca3:
> 
>   arm64: dts: imx8qm-ss-dma: fix can lpcg indices (2024-04-03 20:44:54 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-6.9-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 6.9, round 2
    https://git.kernel.org/soc/soc/c/7e685383468e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


