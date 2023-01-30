Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0B3C64EC7
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 22:31:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F338DC433AF; Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDDD3C43323;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675117860;
	bh=hz5d832aRvbPdCr+tz5lDK/MjGeQEpET5GWfJe9nk9s=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=oVxDqSH+1zZ+Sa/QNnmGONq8cZAsG2kxlnhSCW4/3y0m2XAN4WsJL92jMw6Z98XOf
	 bCyINlvO8/M9yLhrUlbNhY43JSSbf9ucYgY3iN24njFxocSJPXsCgHjiMPEQnF6EqX
	 /v69Kyk6qP9mNOicAgxYDJG1HfLTU4UunpO+pEP71g2gCcwLzi5G8KTvdRQmoR28T+
	 WZjvn8F4fMXMf9EUECxnSMHdVDfpFGKWal/zw3f72yffW0MwJcG4d66fif3r4EPAOJ
	 2I7TKaUuHziGu16iIZpnFY1rvypSvfKdyPhfEcAgYCHbP+2foqPRIeGmRuiWZO2sF0
	 Xw6iJC5MffOvw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CB173E52559;
	Mon, 30 Jan 2023 22:31:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167511786082.29049.6113901958836795705.git-patchwork-notify@kernel.org>
Date: Mon, 30 Jan 2023 22:31:00 +0000
References: <c1641ffd-71c9-9ac9-89d9-c22da4acea10@linaro.org>
In-Reply-To: <c1641ffd-71c9-9ac9-89d9-c22da4acea10@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 30 Jan 2023 14:46:24 +0100 you wrote:
> Hi,
> 
> Here's a set of Amlogic ARM64 DT changes for v6.3.
> 
> New boards are added:
>   - Odroid-N2L using S922X (Smaller version of Odroid-N2+)
>   - BananaPi M2-Pro using S905X4 (Variant of BPI=M5 with on-board wifi)
>   - Radxa Zero2 using A311D (Faster version of Radza Zero)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v6.3
    https://git.kernel.org/soc/soc/c/d70eec528ee7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


