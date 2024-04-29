Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C3F7C25B74
	for <soc@archiver.kernel.org>; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 51ABDC4AF65; Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3AF3BC4AF54;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714424447;
	bh=FeyY9Oo+7nnLe6+2r0C/SwldCKWE/xncxeJyC4tKArs=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=PNO2Bp5FGfyK0IfokXtgICAHpG0eD+Cfc8q//YSLYxVyK7axuzQYY/N8JXdFmvRtT
	 ZOsmFXupcDguWs2z6gVE4k/SvFXscuh63G7amPC59jc9MhMWYjrh1Xt6JrbzsJS/C/
	 EniPH9etfmGoEDXl9CzDaC8BpHrPrHzrfFpZSsIA3PHMNrb/a5iTsTsLgQH/V7DfZ4
	 E2A9qpbFx1gh4hnRvj6MO8OWmDVqoUR4Ky5z+DFwKN4VZ40Ngb9wd2IswCoEUCzKiW
	 pHgmsH07ApeKMxFfjPwwjdN1RnYYCgkaeU+aYycnEMSN+Fl7kWZAyeLV2qbSq341GV
	 hDR3m/YBRZTbQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 30733C54BAA;
	Mon, 29 Apr 2024 21:00:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner config changes for 6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171442444719.17402.4851063764380447967.git-patchwork-notify@kernel.org>
Date: Mon, 29 Apr 2024 21:00:47 +0000
References: <20240426164354.GA101098@jernej-laptop>
In-Reply-To: <20240426164354.GA101098@jernej-laptop>
To: Jernej Skrabec <jernej@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 26 Apr 2024 18:43:54 +0200 you wrote:
> Hi!
> 
> Please pull following config changes for 6.10.
> 
> Best regards,
> Jernej
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner config changes for 6.10
    https://git.kernel.org/soc/soc/c/b8980117038a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


