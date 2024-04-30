Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9CCC19F53
	for <soc@archiver.kernel.org>; Tue, 30 Apr 2024 13:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A6032C4AF18; Tue, 30 Apr 2024 13:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FE5FC4AF19;
	Tue, 30 Apr 2024 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714484430;
	bh=UGNDsKLAT1lZw3gVSAykVOxJZE3WEdg00kdlvcld6/A=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=CoGa36s8YUDpHw8g5jriaoEPhDDPuUvXYCtSUttL/8XbU9u2Z5aWsYDO8eHomcRk9
	 rvYvotK/2V0JHg7t5MxRbblR+DEY7acAdNn3gg31HegVixICi3ohpBXzieRQA3CiNy
	 dt0pw2i4JdFG/gONr0EIGX0xSikNRN3hXMkhm+07mKZj7INJbT6o9TesYXJjJarvPd
	 e78JU9IOnMnvp94ZWOuFQcm3OJiMc5dhCyukIKCplXc+e+vFViaUMHO0ruKUD1bcoV
	 fva+v2VkCRE3wlPp6WE/et7+8VXo5+sNrjgWdYJeEBMVykGXPFBccovKGuYHqzHqwU
	 7+CVZ7pMeD18g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7C2F1C43616;
	Tue, 30 Apr 2024 13:40:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V SoC driver fixes for v6.9-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171448443050.21603.7558902669092114723.git-patchwork-notify@kernel.org>
Date: Tue, 30 Apr 2024 13:40:30 +0000
References: <20240427-unflawed-humorless-690472f9c5a0@spud>
In-Reply-To: <20240427-unflawed-humorless-690472f9c5a0@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 27 Apr 2024 12:03:33 +0100 you wrote:
> Hey Arnd,
> 
> Please pull some minor fixes for some of the drivers under my remit.
> 
> Thanks,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V SoC driver fixes for v6.9-rc6
    https://git.kernel.org/soc/soc/c/e845bcc8cfda

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


