Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9101ECCA47C
	for <soc@archiver.kernel.org>; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76509C341CE; Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 602C4C341CB;
	Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657108818;
	bh=Qiq7wgInGUNsPNAeUhPLzzd228OTrAivSWdkksqmVfc=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=nXZlxIdZMA8ECfg0Q3S+uqKiy4qlDwsncNvnwnbzkyFF9MhpTVTb52AhSMYx8BxD5
	 AQLI9KCXvq660LCs9GwGqUvjY7rMmjsAfxEmb3lF9MhSsHQDw+33Z4Ulq5+Bw6zJEt
	 cxOjNNSPxG6Zj11cxR3XoAkZYhFCr4NGXuwRw5Dp2egCGnW9IjR2WNY+LS15mMJs22
	 RmiBJaTI7y/s4JxdEPxN/KZDY4iEhgfLq7QyUxBPfOihvzMQpABMZ6jvCNJRZwXhbN
	 jJagXuw9+hi797MRKj7iihIdBrU+ikO7FYoQ85saMMEs7BnPMlcPnVoj5LZaW4uD98
	 VVR0JT1Falg+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 47A72E45BDC;
	Wed,  6 Jul 2022 12:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip soc fixes for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165710881829.23384.16425941835126355845.git-patchwork-notify@kernel.org>
Date: Wed, 06 Jul 2022 12:00:18 +0000
References: <7527945.6fTUFtlzNn@phil>
In-Reply-To: <7527945.6fTUFtlzNn@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 05 Jul 2022 13:09:30 +0200 you wrote:
> The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:
> 
>   Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.19-rockchip-socfixes1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip soc fixes for 5.19
    https://git.kernel.org/soc/soc/c/aafc013e8297

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


