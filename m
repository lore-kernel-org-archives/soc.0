Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF247C3F2D4
	for <soc@archiver.kernel.org>; Wed,  6 Jul 2022 12:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8ABA6C385A2; Wed,  6 Jul 2022 12:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 757A7C341CA;
	Wed,  6 Jul 2022 12:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657108814;
	bh=Q3D/ZgK/VesqM+PdLgL3V+CgRyJutVHfV/i+gPGviWo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RuCgxA/gTrFobJVvc6BZFQ3aviCLEtzF59F3SdEP9H/PoOJ+edQEntFh91Nk7NAu4
	 BwnlcdHiZ6lQKwBoAhZmpIP41jnK0ejLXnFZY3o7rzHjYYNwTrwyMm3UBSAbZ96Tgq
	 i0oxZ77H/Bn+0cY1Sh25LteO9UJ7+D93BR+VWI8zS1wQosz7JK5M+FCcH71Cvd5mWK
	 gAnOdRCHUpUaDqfLXNSGK9lVMU0gAFegZSyQ3QZa9k0LvQzJT4izOQZUEgF64YbnUt
	 B29tXpF+rbBjIYXW1yIwK27TcnM9XDJ0ibbBO2ktiaBwFpcs6Quk/5UBELmhZ1rpA9
	 1xOmUBvacQP7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B244E45BDC;
	Wed,  6 Jul 2022 12:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip soc fixes for 5.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165710881430.23384.5357595288903099887.git-patchwork-notify@kernel.org>
Date: Wed, 06 Jul 2022 12:00:14 +0000
References: <7527945.6fTUFtlzNn@phil>
In-Reply-To: <7527945.6fTUFtlzNn@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
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


