Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C46C41513
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3FCC5C433B8; Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2634DC43395;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697230838;
	bh=k0P66ugNyGr6egzGAJPlM2Bmu3JQg7fF5C54yD+tmlE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=APiBfmFojmdWArsiFzIBNYGqrgd28BD0zYZxM+vIS0FJ3kXCYPhigq9ZHbVgyOff9
	 ZWjqVk4G+a/cAboZG+V5563C/HdQPcoubl7/A6zn49QNpeSWKix++msO6GKJsJsnsq
	 U5wDNaoTUUCH37bk4iTdDOhtFMgvU2oGlNIN83cY1G747kKDNiVJkpJEbJc8f4tqlR
	 i1iSBcJo3cR6/lVrewyfl/um2yccNjioljCS2D750t/sO8fNA+Ju06wcBGYrWDT37R
	 UEpecb1wdlEuzcWuQ2Q0v8sUEfR+dr1xxpIsTDDma2UHXp2+5IyUm7PUaBdKItnmG3
	 NOON3P26pEw4Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0F96AE1F66F;
	Fri, 13 Oct 2023 21:00:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/3] Renesas SoC updates for v6.7 (take two)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169723083805.14185.17503114465260813238.git-patchwork-notify@kernel.org>
Date: Fri, 13 Oct 2023 21:00:38 +0000
References: <cover.1697200117.git.geert+renesas@glider.be>
In-Reply-To: <cover.1697200117.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 13 Oct 2023 14:39:12 +0200 you wrote:
> Hi SoC folks,
> 
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.7.
> 
> It consists of 3 parts:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.7 (take two)
    (no matching commit)
  - [GIT,PULL,2/3] Renesas DT binding updates for v6.7 (take two)
    https://git.kernel.org/soc/soc/c/469a58f1728b
  - [GIT,PULL,3/3] Renesas DTS updates for v6.7 (take two)
    https://git.kernel.org/soc/soc/c/64b5812550b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


