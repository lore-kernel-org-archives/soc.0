Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D118C54E4A
	for <soc@archiver.kernel.org>; Tue,  5 Mar 2024 17:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6BC35C433A6; Tue,  5 Mar 2024 17:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 565D1C433C7;
	Tue,  5 Mar 2024 17:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709659229;
	bh=KCidWTDsL6a1OGWajuu1jL3T9owE+EzTGh/6FfYMFUQ=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=RXkJBlRxLKsd7QiGPCtIDROAeQxdU5l/l0sJiuWNfZciBaYOYC0Z1OHxFB9f8U9UC
	 0k0Otd93hY1NjqKNHknLV3c7UkIeNSrl85WejBzzjkVe8WARqTZq3s6z3fqI6/t+rs
	 xT/O2fG7nDDKbjKnNoPkKzs1u1qT0j9L+4bxzM3HCmJwksk72hhszhZwbCmeovTrMH
	 9fJly7oZm/PjyX++LHMn7zeHUhdpG0EjjpYJ+s4RNpM2s4tBRTmsOa4aSUu2YRBp/j
	 RHrzawS4vld1sgR8j+9rq+1EAg+8a8kz/BoB92knbC2scXNs1+oS1Kt3z1TF7a9keH
	 QB0/PgC8Ps3Dg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3F9CBD88F81;
	Tue,  5 Mar 2024 17:20:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip driver changes for 6.9 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170965922925.19661.2697556831760662172.git-patchwork-notify@kernel.org>
Date: Tue, 05 Mar 2024 17:20:29 +0000
References: <5997473.alqRGMn8q6@diego>
In-Reply-To: <5997473.alqRGMn8q6@diego>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 22 Feb 2024 00:01:20 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> in expectation of more real driver-related changes I had started these
> binding additions in a driver-branch, but in hindsight they could've also
> just lived in the dt branch. So sorry about the additional pull.
> 
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip driver changes for 6.9 #1
    https://git.kernel.org/soc/soc/c/befb226b10a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


