Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A40C64EC7
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 269FDC43444; Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 114DBC433B0;
	Fri,  3 Feb 2023 14:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675434645;
	bh=RC+ZSbkGNOnkbrjTNBLK6PopUKPfijd5+hsUrSMv5sg=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=o9jDDk9dZwimzdtuHAeqhbDz6gSBaERdQyt9sFD0vSfSLZ4nYF+L4edPFAiCOj8vv
	 buqU2+ZZVy+teLv0S5AO84I3b3OCxbawm1TjSJScU6hmzvUjT5ZaBT1UyGjUpkItna
	 ckarMheY8tZ071ILGL1vIBIHus0izrslF8kJp24zWrOPK8bg3eWUNPsbUwpgRPA2uK
	 lFekMlC4Z6Tjo5Of6XucUi4UxW6IsoqMyW/+UdSseZANJ9hSlCwhkx2+n9NdoWoXYh
	 88MTLTUNDnQ4ikSs/m0py9ZfdygK7WutAojtx1cp2rtFRy3YNSeKY+tTkw9N8arhH8
	 pL4o5MLpw/Aiw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E5133E21ED0;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.3 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167543464493.16250.592649368361425963.git-patchwork-notify@kernel.org>
Date: Fri, 03 Feb 2023 14:30:44 +0000
References: <6491956.DvuYhMxLoT@phil>
In-Reply-To: <6491956.DvuYhMxLoT@phil>
To: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 02 Feb 2023 00:04:05 +0100 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below and in subsequent pull-request
> Rockchip changes for for 6.3
> 
> As always the 64bit DTS part is the big one, with the most interesting
> change probably being the addition of the rk3588 soc support and some
> boards using it.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.3 #1
    https://git.kernel.org/soc/soc/c/84afaf4e378d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


