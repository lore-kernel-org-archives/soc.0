Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1FCC4345F
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08119C4AF1C; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0C91C113CD;
	Mon, 29 Apr 2024 21:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424446;
	bh=HnATZyP3f+Oj2rH9Weosk2SUgsxwAn+1RlYAa3d/zII=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Cnr+4UMHH6k1SSAlF0rL+bIEM6dHWKmuU3aqHyuZuGL39W/pQQotwTrLhjWheDjmC
	 rCxl1WC+9OmrHzphimun6oHBjB4Uj4EHyH19UhAjvuky+6NfpqipC9md/ppCPtSVTQ
	 4LW2cj2xogW8f822CxWRUxgy11YsCJtmoRNNxVTtyC0at5+Oc7RZnnbRY2/qYXLEPb
	 S/uoXhlAM5Ntouhc2ho0afQ0wKKDXWjD3w+jf5N3xzyvk7GNaKojgCtOeAoGTKLGfd
	 DvoPYMYfks42ZlfTs5ztDh0K7Oc3vY5ohktoqtD3/SzJ9nUzMiyV45wXbHtiwA5v73
	 NrUuAnkyR8U1w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D0BBEE2D48A;
	Mon, 29 Apr 2024 21:00:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444685.17402.3277946967718080861.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:46 +0000
References: <cover.1712915528.git.geert+renesas@glider.be>
In-Reply-To: <cover.1712915528.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Apr 2024 12:01:36 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.10.
> 
> It consists of 4 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.10
    (no matching commit)
  - [GIT,PULL,2/4] Renesas driver updates for v6.10
    https://git.kernel.org/soc/soc/c/7ec7695d0b49
  - [GIT,PULL,3/4] Renesas DT binding updates for v6.10
    (no matching commit)
  - [GIT,PULL,4/4] Renesas DTS updates for v6.10
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


