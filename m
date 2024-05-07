Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5388C25B76
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8E02FC4DDE0; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78512C4AF66;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715074839;
	bh=2MslrbbtdRavVXafeeXESAntzcNGV6gzbby7QY8yaII=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Hv69ydqltZlV4qt+H0Iybg7a0+kHNOlRoxXvbOv0D0vRZ26ksumpECRjm0p3XI+7E
	 Cbgl8uub3R0fy8DND58rLx+3DimJVnXip609XE1vslEFZ0M55YgxMb4/Th4FUKd+Rn
	 FVii8Ger8cqJYc91qZ7xu817sEclukEFX+Fs2yBfJjoWPUXkkbWsKec+WJqSnUwGsk
	 mBsxryV8RTDRNcoo/ehHvsok0QE4Dh4plhrdBDUS/N/FRMiYmwaUiiLpGOE/HsGsRY
	 WLcK2B1Eeku3ANNLHgaJbYwNzFRj9P2bCe0ahZA5gHX/o7Wug2V3N2smIOOGjg+yJZ
	 0XCwcA8WIHenQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 67948C3276B;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts64 changes for 6.10 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171507483942.24942.15968715817942621775.git-patchwork-notify@kernel.org>
Date: Tue, 07 May 2024 09:40:39 +0000
References: <13810480.dW097sEU6C@diego>
In-Reply-To: <13810480.dW097sEU6C@diego>
To: =?utf-8?q?Heiko_St=C3=BCbner_=3Cheiko=40sntech=2Ede=3E?=@ci.codeaurora.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 05 May 2024 23:04:52 +0200 you wrote:
> Hi Arnd, Kevin, Olof,
> 
> please find below some more Rockchip changes for for 6.10 .
> 
> One new board and more enablement for the newly available gpu- and
> usb3-support
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts64 changes for 6.10 #2
    https://git.kernel.org/soc/soc/c/cbe240a8c544

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


