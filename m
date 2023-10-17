Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EBECDB486
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1598DC433B9; Tue, 17 Oct 2023 22:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC340C4339A;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697580028;
	bh=8l4Qk/65LezKrnVsQ53ye2wOJ+NBwEug6RQ/2rJSHGU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=G/n9PpqFO5dfzavNhSKe8FYMmoN4T2ARhyz/wAI8THafAHWyn5pwbUZeavgeoCCWT
	 2fg/9CbCtEcmB6ZMuSfIn/5rvw5pFSjgj82q0S8LiCt7KZcSPNxyQy0hOQBg304O/t
	 6ngM6vhXO8nf7YYVNey780yqch9B4hFi+pPNErVGuTgMjEKdcFdsaEzyQh9AerarfF
	 kpN8EyTw1pGdeLG7nHKpdCmm3JUBToan2frKi3sBEVZDqAFP5DwusG+Pcr7ug+NwDB
	 lutIIOn5sTZDzzlsgIJInCO61ahRC6lfiTr30U0W524r3Ykz7Gi2j/BP0QQxLsjvlg
	 eBuhMz77xfssQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CB9DFC73FE9;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/5] Renesas SoC updates for v6.7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169758002783.24805.15604037693099269000.git-patchwork-notify@kernel.org>
Date: Tue, 17 Oct 2023 22:00:27 +0000
References: <cover.1695985418.git.geert+renesas@glider.be>
In-Reply-To: <cover.1695985418.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 29 Sep 2023 13:10:10 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.7.
> 
> It consists of 5 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] Renesas ARM defconfig updates for v6.7
    https://git.kernel.org/soc/soc/c/22bf97fc236b
  - [GIT,PULL,2/5] Renesas ARM SoC updates for v6.7
    (no matching commit)
  - [GIT,PULL,3/5] Renesas driver updates for v6.7
    (no matching commit)
  - [GIT,PULL,4/5] Renesas DT binding updates for v6.7
    (no matching commit)
  - [GIT,PULL,5/5] Renesas DTS updates for v6.7
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


