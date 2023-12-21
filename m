Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A08C4706F
	for <soc@archiver.kernel.org>; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5A309C43140; Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 42EA5C43397;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703180466;
	bh=OG9u18RgRn/d+Hf/5s64e3a0pJrbXhf5os2zhYI/aGY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UL7q6TRbvYSBCArcGcxedLhsNN8m/iSy9aTG7wbZr83V/OAhbiQWn9iRdvJpEXaGg
	 WcLNoJbErcCawCNa2rFV0Gam36w+GjilHpfprFVzZhIeTS9VtXRBBEdFZT0uqsraJ0
	 8B0l4LkhaRyMclWKq6Iv7Q9RoLeONR88HexALNV5esp8OrpuLefkmCmZf6f1pls/lb
	 wMHZUWsuQaT1AGwAsHSgbn4OwjA85Z2iACuvb77NxacKVs0gVgP5d2URd066POuz2M
	 10mymcR7HpN0ElyHAt7LgFtFp71e/gUAGyrLajLToJOFSoZfN8+X83O/2KEqp3nYdw
	 4/nByS+Y0M23Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2959BDD4F17;
	Thu, 21 Dec 2023 17:41:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Fixes for omaps
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170318046616.3302.2372101822692185187.git-patchwork-notify@kernel.org>
Date: Thu, 21 Dec 2023 17:41:06 +0000
References: <pull-1702037799-781982@atomide.com>
In-Reply-To: <pull-1702037799-781982@atomide.com>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  8 Dec 2023 14:17:15 +0200 you wrote:
> From: "Tony Lindgren" <tony@atomide.com>
> 
> The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:
> 
>   Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Fixes for omaps
    https://git.kernel.org/soc/soc/c/2096d3ec469f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


