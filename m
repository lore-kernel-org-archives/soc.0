Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AB0C54E4C
	for <soc@archiver.kernel.org>; Fri, 23 Feb 2024 13:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D5E8CC433B2; Fri, 23 Feb 2024 13:10:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFCF2C433B1;
	Fri, 23 Feb 2024 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708693828;
	bh=jLk1yHCR8vGtu+mJgl1W6XMkoM1+6hgGA884Eliwjko=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=gxBWwsknG2bVElQ7PX1cT+uqJksaH9gZ+c77zv8XyumK1MCnHFjfAuAy3jP+zt4FW
	 SN9yJ89IC28XIORjhTrV/3Bxh7/ERM7xudJ1rRQsx0mHUoLzY0IFVmtyiWUfFPmlx6
	 /CPWvvCAyhF/vtwE0hXbWgpvXRUYvWflg2oDQbnouR2ZK4H908gnlxy1hoEp64Nr+X
	 yq9rfe3oWXEV5lwaAcYhT9DzgejCFS9xh9+Cbwrw91/kaoRFH3Z7C4nckxvS201lyG
	 nnxcZykGkPHmR49So1SuGgC1uEvP+PeGlnuUknkSzaXUriqi145+OKhYtF31RL8GoN
	 DKg/64MBTp0UQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9AA97D84BC2;
	Fri, 23 Feb 2024 13:10:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SoC driver fixes for v6.8-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170869382863.28623.794395535955737194.git-patchwork-notify@kernel.org>
Date: Fri, 23 Feb 2024 13:10:28 +0000
References: <20240221-irate-outrage-cf7f96f83074@spud>
In-Reply-To: <20240221-irate-outrage-cf7f96f83074@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Feb 2024 16:44:29 +0000 you wrote:
> Arnd,
> 
> Yet another 1 patch PR.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SoC driver fixes for v6.8-rc6
    https://git.kernel.org/soc/soc/c/fe514e177532

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


