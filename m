Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C321C636F8
	for <soc@archiver.kernel.org>; Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 10CFCC4314E; Mon, 21 Nov 2022 14:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA8A3C433D7;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669042344;
	bh=m/nW5vFDA0G9/TwLUyBwM6PWjDYIIAYpY70cDZpJ+GE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Wyh84MtFEA5MLUsvk407lL0SGslPd0/YyHMG874NtFOuGz18PIyZLRnFciV/YkxL3
	 9Q7PWF0yCqGCKfoTvZwdOvgcXxk3DebGFcGENYtp4BQFzW5SOShEym7sIEqsBa5Hs8
	 rWAHcTMHIfOkYdvBEhdP4szhKClM7TksGqj1xpcTDr/+7BUzwVfKq5u3Sdjzu/sefy
	 tQjQ2DBpGcZq4E4U7m26wXynToRjDyOsVLkx2U34NLjUP4iAJnGqBOajas57oaCKu+
	 Xcqe2TjRgXvXX9M73JqF5a3VRZHOP8XGOH8EN9FU71TkrpPNs6o7FXmOqioj1NAf5Z
	 q5V9MiJn9rmrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D7AF1E4D03A;
	Mon, 21 Nov 2022 14:52:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 device tree updates for 6.2 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166904234387.4359.2074714377700286292.git-patchwork-notify@kernel.org>
Date: Mon, 21 Nov 2022 14:52:23 +0000
References: <20221118131214.301678-1-claudiu.beznea@microchip.com>
In-Reply-To: <20221118131214.301678-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 18 Nov 2022 15:12:14 +0200 you wrote:
> The following changes since commit 5258d30f33bdbb495f6de7601db5d60e13223a5b:
> 
>   ARM: dts: at91: sam9x60ek: remove status = "okay" for regulators (2022-11-01 12:28:58 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.2-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 device tree updates for 6.2 #2
    https://git.kernel.org/soc/soc/c/285fde40c112

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


