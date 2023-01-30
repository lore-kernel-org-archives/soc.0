Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35959C64ED8
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E421FC43324; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD6F1C433AA;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=2lMDgtLIuwQZs5AZcTvCBA8CgFVyPumZyt5C5U3dPNE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Rq5gzj4R3Mg9Zhem9XjQ4RD8kHkfH7ZSoyHTjCUfiRA4Cvz61C41DzRXHbjGOmVmj
	 LQCuSU96YCcSEVt8oT0VtFybs2I/3YRTRRjEHCqGqriIPboNzD1d79Ctf31UnrIDKD
	 KUguPfRsW7xn6AMeOObedJbELApyl1VPDc0368ESQra63UVksE69riz5Qm8ZuL6F9Z
	 y/MEqpknkNcsRWI2+qgLKEpwr0bFy0t8LTd1kRVrPPzvLuZ2DXQ5mG4OzEcWZo3c+S
	 CaczSY6+CRQ2hhUAtpxjZVmsYMfIW93r6oEnckqOKdEM8m2M6cP6F7A9cNspzT42E6
	 1AmybYeOYQOdg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B336EE4D014;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786073.29049.12613987127591912160.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
References: <Y9LP+Za1h0fkBa58@spud>
In-Reply-To: <Y9LP+Za1h0fkBa58@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 26 Jan 2023 19:09:45 +0000 you wrote:
> Hey Arnd,
> 
> DT stuff here for v6.3! I was kinda hoping to have a VisionFive 2 DT
> for you, but alas no.
> The changelog looks a bit odd since it's filled with un-reviewed
> commits of my own, but they went as a PR to Palmer & are in riscv's
> for-next too:
> https://lore.kernel.org/all/167225428483.14530.3368527680488639805.b4-ty@rivosinc.com/
> They might also pop up as part of the Allwinner DT PR, if the D1 stuff
> lands for v6.3, which I hope does happen!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetrees for v6.3
    https://git.kernel.org/soc/soc/c/b453988c59ab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


