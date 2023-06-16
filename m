Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34D8EB64D7
	for <soc@archiver.kernel.org>; Fri, 16 Jun 2023 21:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B96DFC433CA; Fri, 16 Jun 2023 21:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E08CC433C0;
	Fri, 16 Jun 2023 21:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686950505;
	bh=OOauQU7jlge6Dcgyg4fC9uKBkCPpvjPXT0adeZ8tJH8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Gfw3ngFDN3ND2HSuaQyo6nMwGGSyTvp8NpIYlsNsOCBzzszCOlmkfdHEEJx6cAwco
	 mFsmLbosnazJp56nWeLfyyL/Xhlg6MHOPv3yR24SaNLAArG5MDIO2oRWsHmDqrfSU+
	 UmTATlIsjrq4/BlF0aWuCnLWzCDqo3vgj25yVYNTDiQZ4TgANCWRbY4qou/hQD2Wko
	 hYeVlCFwkQbvGeXXLKotW+n0dYGR8XA0TgH8SOe2jraEQ6h4QOnbSXwAbUjPC4OUqa
	 TIrWWL3SRnWD3svrRGkpuIeyU6nYo9n4kjZzQ2H3aFYFkWbx0sRXZKvjCo33vgOQiQ
	 thM6rsw0AC4PQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B93FE21EE4;
	Fri, 16 Jun 2023 21:21:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts fixes for 6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168695050556.18495.2443711820305744038.git-patchwork-notify@kernel.org>
Date: Fri, 16 Jun 2023 21:21:45 +0000
References: <2885657.e9J7NaK4W3@phil>
In-Reply-To: <2885657.e9J7NaK4W3@phil>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 11 Jun 2023 23:09:34 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find a below a collection of fixes for the current release 6.4
> cycle.
> 
> Please pull
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts fixes for 6.4
    https://git.kernel.org/soc/soc/c/5b017b5ed2bc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


