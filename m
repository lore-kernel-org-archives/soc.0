Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BC6C636D6
	for <soc@archiver.kernel.org>; Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B25A3C433A8; Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9A180C4339E;
	Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675951221;
	bh=hnhAiHdGLa7+fgf/myAOuo81/5HURSKTxRtUSQ1UflU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=Aj18xvYee+j3SywLD9ey1iAIegTd6MIfPRTUv0hg31OhVrRNjpOhffhwlIG2FzZt4
	 dnYBWocecXChiBsxnKnqBbhLWs3guum1nZNdJ116on/YqcqvFJ7NozhndziR0VTGiz
	 K2SzcKpGHfAYFYx7Zh7sMstP6MzHVWmFZuvjkcqVHMgEuxjTiP38Ch/7+THtci+Vtc
	 t314i3bfCyQjH3OR4fITJvC318/jcA7S7Bzfpig+FVeSe2njpl13qHBw37H4cBa/WI
	 myTKEEbhI120/CHOGlvf77shfV4HcINvBcveBmSTPZfSGDTXq9FtXE4KCoziEwafpN
	 T4GpdI//7cnAA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 77E3FE21EC9;
	Thu,  9 Feb 2023 14:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/8] Update UniPhier devicetree for 6.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167595122148.31919.3039469046863801957.git-patchwork-notify@kernel.org>
Date: Thu, 09 Feb 2023 14:00:21 +0000
References: <20230207023514.29783-1-hayashi.kunihiko@socionext.com>
In-Reply-To: <20230207023514.29783-1-hayashi.kunihiko@socionext.com>
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  7 Feb 2023 11:35:06 +0900 you wrote:
> Update devicetree sources for UniPhier SoCs to align node names
> to generic, add missing properties and compatible strings,
> and add SD UHS property.
> 
> The SD UHS mode patches are related to the series:
> https://lore.kernel.org/lkml/20230125010201.28246-4-hayashi.kunihiko@socionext.com/
> 
> [...]

Here is the summary with links:
  - [1/8] ARM: dts: uniphier: Align node names for SoC-dependent controller and PHYs with bindings
    https://git.kernel.org/soc/soc/c/2a03c600fe7e
  - [2/8] ARM: dts: uniphier: Add missing reg properties for glue layer
    https://git.kernel.org/soc/soc/c/2d1bf1fc778b
  - [3/8] ARM: dts: uniphier: Add syscon compatible string to soc-glue-debug
    https://git.kernel.org/soc/soc/c/76b2cb8a7023
  - [4/8] ARM: dts: uniphier: Add syscon-uhs-mode to SD node
    https://git.kernel.org/soc/soc/c/1ae6e6bc7227
  - [5/8] arm64: dts: uniphier: Align node names for SoC-dependent controller and PHYs with bindings
    https://git.kernel.org/soc/soc/c/5ebfa90bdd3d
  - [6/8] arm64: dts: uniphier: Add missing reg properties for glue layer nodes
    https://git.kernel.org/soc/soc/c/f45d62071595
  - [7/8] arm64: dts: uniphier: Add syscon compatible string to soc-glue-debug
    https://git.kernel.org/soc/soc/c/f4d624a17488
  - [8/8] arm64: dts: uniphier: Add syscon-uhs-mode to SD node
    https://git.kernel.org/soc/soc/c/a8d3f2d9d2cc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


