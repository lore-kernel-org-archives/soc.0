Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B03C6379F
	for <soc@archiver.kernel.org>; Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B955FC433D2; Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3D83C433A7;
	Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675951221;
	bh=/iGOUNxQ9AFMBvNbxOmyh5ZAS/ny5vfFyNdh+plSyZ8=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=a8cznzAm2S1Ohx2PblEbgSb2dkrh0QAVtIVKQkRlG36D1r+CIUE4hEZ5brTQnBorS
	 gojyzNnroq1P6U/0x5mxy6XJdiaUSsZZwTIAn5Y4a+suRs8Fl9WembK+INfla0zUxf
	 Wcs3W/jL0OkHhOc9HmitRumCvoWVEivlm+DUIL5kOAQkfS4e46zwAQO5HaaK4NnrUV
	 6RsXbCR8/igY+biQ53PT1kQzYpK1V4xZFMADS8O7wJhWaXahZhycX0SY94auVR+ovW
	 292XFSAwIBbkTtAY0X2+GhsU666pgL1bALmcjfgO4zP5e0Md3C4jY6/wzwZNxAG7vV
	 gJQRUSB02c+wA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 84726E49FB2;
	Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] AT91 device tree updates for 6.3 #2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167595122153.31919.2910600838164569371.git-patchwork-notify@kernel.org>
Date: Thu, 09 Feb 2023 14:00:21 +0000
References: <20230209084930.289721-1-claudiu.beznea@microchip.com>
In-Reply-To: <20230209084930.289721-1-claudiu.beznea@microchip.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 9 Feb 2023 10:49:30 +0200 you wrote:
> Hi, Arnd,
> 
> Please pull in case it is not too late.
> 
> Thank you,
> Claudiu
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] AT91 device tree updates for 6.3 #2
    https://git.kernel.org/soc/soc/c/306b8201b0bb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


