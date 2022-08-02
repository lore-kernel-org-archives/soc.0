Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131E3C3F6B0
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 14:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DCBB5C433B5; Tue,  2 Aug 2022 14:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2A9AC433C1;
	Tue,  2 Aug 2022 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659448829;
	bh=s6uZCvbge3l05Y3XI8JpyHRXjXtug9Wy64NyTfao7tY=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=JNokWAPnV9VYIytm2tCpby/jh3xpH45denPL+MjNzldLa48BXHFKF5RV95whpbLUl
	 2zyCz9puk4rmL93Jh38KKHl6ff1XTOLkdRTCqCEgsN6HC10gLyDrEtWMMUZMCGCWU7
	 qxt0AWpIOGBxFTpl5Xn0cG/juRyK6SY7eSTdKZUFzqqCwVKroDW7ffJ7do40vTGKwX
	 tiKl4fGl27hJwv0Gh0DPdJmEozM5zKIHFapTFKn3Uh0b4Zd9de/z1zDxTIf+XIItKm
	 X6o+Xt9+GS4aMXEtWMz4Z2DbvmrnpHzGbrJFOhEP1c91EONqpcSH7r3V1FSd9InnBT
	 3sifE18ySIRxg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A04D4C43142;
	Tue,  2 Aug 2022 14:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC MAINTAINERS updates for 5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165944882964.23404.12148855611121878836.git-patchwork-notify@kernel.org>
Date: Tue, 02 Aug 2022 14:00:29 +0000
References: <308defdf-8873-63ed-dc9c-a88cd7a3cc2f@marcan.st>
In-Reply-To: <308defdf-8873-63ed-dc9c-a88cd7a3cc2f@marcan.st>
To: Hector Martin <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 31 Jul 2022 15:59:45 +0900 you wrote:
> Hi SoC folks,
> 
> Please merge these MAINTAINERS changes for 5.20.
> 
> This one is trivial, so hopefully being this late won't cause you too
> much trouble... My apologies.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC MAINTAINERS updates for 5.20
    https://git.kernel.org/soc/soc/c/879bcfc4e536

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


