Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69779C4708E
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B5DFC43159; Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44264C4314C;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669828262;
	bh=Ev0BhvMcZzd+f7gBRJMDV+gEBgWKYfY70SYc7QI/KH0=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=abID8Ee79utCZe/pNPee+VbNGotFYD+bUytM6ILJ4O24lOCpY8fxPBfUyiZo6iDnz
	 Jo6gVvE2mJFhLDgS05+shgUvb2tF2x1HbL/gddN+F+z4oujmw+l3878I3foq5kFzIV
	 oMIw/raxQbMDLz2s5dzc3f7Q1qoWZFAqVfxIaedbydySeCA4u/vciJsg7kXTdjbXAQ
	 LxYpQZDOw2I3igEW64y4pbkDCqyd1yYHTekYhz4UVJ2oSJSq+aFfcEfzTYvgdpFSlK
	 hlr/53NadO8BtJuABJToRi1NBJlkuxbCsFkKKvlpLXMJLZVLw5AyJ1RSjCMsdaIr73
	 faGcUzofQj4Mw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1DD4AE5254B;
	Wed, 30 Nov 2022 17:11:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 fixes for 6.1 #3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166982826211.9936.12386200757412442140.git-patchwork-notify@kernel.org>
Date: Wed, 30 Nov 2022 17:11:02 +0000
References: <20221125093521.382105-1-claudiu.beznea@microchip.com>
In-Reply-To: <20221125093521.382105-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Nov 2022 11:35:21 +0200 you wrote:
> The following changes since commit 40a2226e8bfacb79dd154dea68febeead9d847e9:
> 
>   ARM: dts: at91: sam9g20ek: enable udc vbus gpio pinctrl (2022-11-17 15:23:50 +0200)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-fixes-6.1-3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 fixes for 6.1 #3
    https://git.kernel.org/soc/soc/c/da0cbf9307a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


