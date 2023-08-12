Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC43FC07E8B
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D829C433BC; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57FAEC433AB;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=oeUPeCBz031K/6JwoXSbuc9/vWf1616+OOaLEvc6s6k=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IlwPwEDaLZkXViZjVdG3YJL1wiNQ9bXrA1D+R+gEJW9MbgwvvzFcGVG/EOzWNNdSW
	 22I671fOYtDVuGVnvvBqNEqU4EUqjwE3evM6mmex4jDXerE97eHKbgx6Or1zoXvSus
	 Je8acvL4k3tljrZDUeGsBjJZb48GudKOgaPgqA0G5b5iyBXxgoYFW6EbX5UXc7gJLL
	 F0iaEXBwFB1PvMsnh/ED4azcSwz3MGScTl/il0qOt5MVY6qwLrw5tLD5S0To0bcnuR
	 HeSGnCv9zyJ1+4z2578Y5SYuHWwEzrbo89TDxW5BBOsucOA7VVXb/a3thIp9150T0U
	 9/JfRczTpIzwA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 429B0C595D0;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip ARM64 DT updates for 6.6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168926.30475.12149539122639470904.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <20230804044132.231508-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20230804044132.231508-1-claudiu.beznea@tuxon.dev>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  4 Aug 2023 07:41:32 +0300 you wrote:
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/microchip-dt64-6.6
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip ARM64 DT updates for 6.6
    https://git.kernel.org/soc/soc/c/a6fb5573a3b7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


