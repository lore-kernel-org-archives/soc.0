Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCB0C4167B
	for <soc@archiver.kernel.org>; Fri,  8 Dec 2023 09:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 27EC2C43395; Fri,  8 Dec 2023 09:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1220FC433CA;
	Fri,  8 Dec 2023 09:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702026026;
	bh=yAqfgxeZ8KU6YKWJzpTjNES33dcT5cOfDyeyzonr5uY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=h0tMuZzafey2LesldaQl/vYSZakWlaUZOvg3eoB2QgrB47NFszI3NPlAmKE8VgSub
	 16eTw4FAiQyY9kiqC7/yJZ949WCS/38tAg7gU6s4RxwUcNujJRO8saBRMCWbwU7taa
	 qxDs2RIs1M7395JvM2Zpp1n7VleoUNjHDo9efpW2GOT6EVgii8ULCLRBmeijHuGp20
	 Tc4M/0DbkPGdvusf7/mZL7h2KHkOAWRwrtMm7GL+/Ss7F07uoRInj7Orw+gIf7/nI6
	 x25o7SFts2pG19/KhAxM+ZikNF9TKMOS7EHrReGqBDOL1gdSQ0x+tXq9eS9F/4BbM3
	 Gq1YA1sUd8GYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E61F6C595CE;
	Fri,  8 Dec 2023 09:00:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170202602593.9233.11350197205461084066.git-patchwork-notify@kernel.org>
Date: Fri, 08 Dec 2023 09:00:25 +0000
References: <2709704.mvXUDI8C0e@phil>
In-Reply-To: <2709704.mvXUDI8C0e@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 07 Dec 2023 21:41:37 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find a below a collection of fixes for the current release 6.7
> cycle.
> 
> Please pull
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.7
    https://git.kernel.org/soc/soc/c/fd1e5745f87a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


