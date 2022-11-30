Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7180EC636F9
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62919C4315C; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C379C43154;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828262;
	bh=48CGUgCmxhFhBUwM/OW4p1J1+cEQkagTDsApEGD2ZvU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=EK21Axm6NJ9GqhEO+vMybwdieX34sKnSRrbPXE8xuVCiQM9fZaTnHC+aDA2FJl7X3
	 jDIbNA2akxg6wa6cxbApwjmZOeI3xMOkWiKyz/JyUcmyhZRuJYo8pcrxfFvmUFi9GM
	 +8iuKqea698mYHCyTd26C9ri14aTWsEmYEZEPw8z0qP936q0hZuQDUvP4kx/BxhDU1
	 XJeZwIsYESua/G93OuM6P/ZURdBivIr46ikgzfRqmT0kcd8kAdWrips/apYJDbzw6Z
	 QDZhLFrDSGDVBMiM4V12YZaO4ttnDUOBN7TGGk9YXNualKVoNPtvTHZTLEnb9W/Tdw
	 wIBHVBDDt1JKA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2C680E21EF2;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 device tree updates for 6.2 #3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826217.9936.1944700373798845395.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 17:11:02 +0000
References: <20221125140525.384928-1-claudiu.beznea@microchip.com>
In-Reply-To: <20221125140525.384928-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Nov 2022 16:05:25 +0200 you wrote:
> The following changes since commit 7a3c62678699d7e56736c2d0579d077a7773e77c:
> 
>   ARM: dts: at91: sama7g5: fix signal name of pin PD8 (2022-11-17 15:32:33 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.2-3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 device tree updates for 6.2 #3
    https://git.kernel.org/soc/soc/c/ca1a1892f8eb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


