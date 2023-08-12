Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FED8C04FE2
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88D23C43140; Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72D16C433BA;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691831689;
	bh=OsB4kcPEYrnPsDFIv7eaVUtuWJumav4DM2n8SagLieA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=AxzTezlVa+ez2BcIZenQMLczyEDPbJtifrUmRjEQfad3qSB/tiNCCJuW15NLQjOGc
	 tX22/VvLTIjpFTUqGvegb8YSHdtBH1Dv5cv5ZjI+8EMH2b7nAluNT/KMWbRSeRgFE0
	 53pJAGk8qcZSFfq2SzzBU5dX3hEDyufrKBJHWjHNJF5gr4+jaJu5GUDC5PQy0xBkp8
	 kCcYN4abK+CUEparWnPzgZEJL+VpxeJ9JoUBWdYfwHM3OdgRlYjS+u92bR/LDW113b
	 4OdK823KqWmq4QkyZf7gaYkupWUEcbZ1+R3XuJDw9TAyYnfAW11bpadT4RPUX56Xsq
	 A1QKDP4yCWadg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5F071E1CF31;
	Sat, 12 Aug 2023 09:14:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] soc: fsl: Explicitly include correct DT includes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169183168938.30475.6184214277029877132.git-patchwork-notify@kernel.org>
Date: Sat, 12 Aug 2023 09:14:49 +0000
References: <20230724205551.768767-1-robh@kernel.org>
In-Reply-To: <20230724205551.768767-1-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 24 Jul 2023 14:55:51 -0600 you wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Here is the summary with links:
  - [v2] soc: fsl: Explicitly include correct DT includes
    https://git.kernel.org/soc/soc/c/5df5b2e04749

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


