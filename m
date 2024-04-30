Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A539C10F16
	for <soc@archiver.kernel.org>; Tue, 30 Apr 2024 13:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C5F9C4AF1A; Tue, 30 Apr 2024 13:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E95DFC2BBFC;
	Tue, 30 Apr 2024 13:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714484434;
	bh=4bomxlSbVYYmbFUNEv3tCJshGEtVGdhKO4Z99xdB7Gk=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=BDMbI7K3wII2891MQ67PUOxsEyK95lex6uhr77E+WuKWp5SwEYDitxZ8O2nwpfufT
	 cZeYLV98oCJz1sUQy31H8bGBxNMSq9sk1Yyj/KHT9XZo8l7R9f4bF6XSjtSGVSbwxd
	 avoyX1cIgyGDbAxSBeTkGz5oaqZeKxIW9waVLCtsQisfYP7UKtyY91ogVlRL2XBwcG
	 XbCp4epGoJ4DQ/9aBG3wPsXBBGVPdlWOQsK3GArEPizfD2IdMavmmFSbO9dDht7CLK
	 ts7nC3UrKx7KjfQ4YckrmMGHvSoFMPLgrpsSt+Jx5sjQFPdJZmOWny62dCXTK/QiR5
	 l/ewYBHGwaxdw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D8238C43616;
	Tue, 30 Apr 2024 13:40:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/4] Renesas SoC updates for v6.10
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171448443387.21603.677782244690146663.git-patchwork-notify@kernel.org>
Date: Tue, 30 Apr 2024 13:40:33 +0000
References: <cover.1712915528.git.geert+renesas@glider.be>
In-Reply-To: <cover.1712915528.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Apr 2024 12:01:36 +0200 you wrote:
> Hi SoC folks,
> 
> This is my first pull request for the inclusion of Renesas SoC updates
> for v6.10.
> 
> It consists of 4 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] Renesas ARM defconfig updates for v6.10
    https://git.kernel.org/soc/soc/c/c6175cf275cc
  - [GIT,PULL,2/4] Renesas driver updates for v6.10
    (no matching commit)
  - [GIT,PULL,3/4] Renesas DT binding updates for v6.10
    (no matching commit)
  - [GIT,PULL,4/4] Renesas DTS updates for v6.10
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


