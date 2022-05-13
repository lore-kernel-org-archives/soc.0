Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6265DC433FE
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 21:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41EC2C34119; Fri, 13 May 2022 21:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 258DAC34118;
	Fri, 13 May 2022 21:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652478019;
	bh=qrqof2pm2Fi/bflBmZBfu9iY9BFErqfzt2CUuB6KcbA=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=o8q2pwNHkwcRtduJZ/QPXE7/U75C+YGRRNBtl11QboL+iem6Ong5BEpyA+GrSYDet
	 BrbfDVMPKjiiLZQzRBvN+OEY7UNLkCs9HzSL5irlQ0ZSqr2QQ/Mubz9fVXysCZ01QB
	 lsSgJpBODoST1xD7wlUa98kSOff6pGKXtT5Z8bTtoG1TlKXH8VS+GqQgjhjaPbp6y9
	 xkkT2/5rHZRd2lTiurNHxh2qRj3Ma0x/CTBmHiJvv2uEu+Y4jVl/FWLEEeMg7FShUj
	 UQyWYJgi7/XIWh+QUZliz4+qLfFoQ1pWvRBq7xL0P82sEcRAmqkvX6Y8SD1YL6m7nJ
	 DCE+62VzaPyiQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 06163F03939;
	Fri, 13 May 2022 21:40:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v5.19 (#1)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165247801901.11200.8048784065566023472.git-patchwork-notify@kernel.org>
Date: Fri, 13 May 2022 21:40:19 +0000
References: <87r14xr2xc.fsf@BL-laptop>
In-Reply-To: <87r14xr2xc.fsf@BL-laptop>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 May 2022 15:13:19 +0200 you wrote:
> Hi,
> 
> Here is the first pull request for dt64 for mvebu for v5.19.
> 
> There is a conflict with the arm-soc tree and as pointed by Stephen
> Rothwell and confirmed by Krzysztof Kozlowski, the correct resolution is
> to take the commit 2f00bb4a69c7 ("arm64: dts: marvell: align SPI NOR
> node name with dtschema"), so the node name should be "flash", not
> "spi-flash".
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: mvebu: dt64 for v5.19 (#1)
    https://git.kernel.org/soc/soc/c/5aef4d1ecc97

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


