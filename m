Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50FABCDB486
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 20C64C433B9; Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 095AFC433AB;
	Mon, 16 Oct 2023 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491918;
	bh=5cZ5MF5KsAwXIWEKATL5DDQxgAuA6eLtwOKF4I7fwSs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=DJMmRRdR9ETTqeFLe2451vtL8+nwYtJ2tynM1ba0jL0xVczFT/RozDJZcfx345CSJ
	 yhI5rUCfvuQhisX1iRkvCzWbzqoI01M8ob38crjt3dgt1irqiTw2ZybwE7wWTL/xpN
	 3H0o19nkX0s+4LVeKv3oUNc+kt3GqFDlu9dM8qDN16Xsue6/0Yume6VCYsQve9AIzn
	 vSOs2GKF/nubASrk5OhauI9Wp2bRp9+lxkj9bsTQ8AgDtaERXBoQ4Gz2zYzJ/DtdVO
	 nQQnZwcT9Y1zXZOoxKpluH4Ik1efE3n13mESbmQsvsWG6NWtGsEVHyuisUUJu3owFg
	 43dlmuca5TmPQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E333FC595D7;
	Mon, 16 Oct 2023 21:31:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SoC drivers for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749191792.22284.12067850510874838511.git-patchwork-notify@kernel.org>
Date: Mon, 16 Oct 2023 21:31:57 +0000
References: <20231016-predator-affiliate-e8affd3a7be9@spud>
In-Reply-To: <20231016-predator-affiliate-e8affd3a7be9@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Oct 2023 16:15:53 +0100 you wrote:
> Hey Arnd,
> 
> Please pull a small number of soc driver changes for 6.7
> 
> Thanks,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SoC drivers for v6.7
    https://git.kernel.org/soc/soc/c/09427e1975bf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


