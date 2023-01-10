Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C09C67871
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1A37C433F2; Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 846F4C433EF;
	Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673390529;
	bh=f/uY9z5Io5fujkIxRiUyvVIgo46MKm8B/EnzxVbVpLI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=dlCyE2i1KQbiqjfSw/yjl2Vy70JoC96aNBJvrwGSC930Jx6kQ1Azoe9DFA02xhIzB
	 Z5qVVkNK10R93Ymsy5lbe1D1p6dS+b9ZPNgflu+YJNowN8+zZGUzbe1Abjj0JDVkwk
	 LhV4c0Vz8O8U/B6prDolgSjLT5mVkGuouHjzntUeRm1of95MBctVtNujojSh4u8nGs
	 //f4xXkchCbvAdDEHFPq2UsZtbdaGSgoWjQu3ZbPh0qyPDb1wCLsu8BMJNtK/UKObM
	 XYNpBuvNXE8UsGqpTx9TzuwjAl5BSZF4wYH0Cb1pM7H3mzdbRpVG2U0Ba3aXvhpv8O
	 ycZTCL67SpI2g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 64F91E524EE;
	Tue, 10 Jan 2023 22:42:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom drivers fixes for 6.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167339052940.5083.10864296353724523666.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jan 2023 22:42:09 +0000
References: <20230110215025.1008437-1-f.fainelli@gmail.com>
In-Reply-To: <20230110215025.1008437-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 10 Jan 2023 13:50:25 -0800 you wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.2/drivers-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom drivers fixes for 6.2
    https://git.kernel.org/soc/soc/c/45c734817847

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


