Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE81C433FE
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0EFBBC340F8; Fri, 25 Feb 2022 17:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E962AC340F2;
	Fri, 25 Feb 2022 17:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645809662;
	bh=B2J/ix4jAj2DHK3fNjX+xNFGhman0Ro4/GaI03kikjo=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=e6gwcCJ/FMVmsrE0ky/QwMMnG/CPbTN9lLLTZH+kEssdmQot4mKVQv8/A4kH/4drX
	 sUav60V+M168Ii3DKj/D6PJ1HmxG87ceJxjmY77wRRtTBRLHkcrCXHq6V+KVciclM4
	 pnbM2JhQcb1Te9yVxocg/MbFsxRtYzjwZ3ltYEU3BEkxchcWvV4nQHhXfwqSnyk7Jq
	 dA4a+hhVYXkN0Umhz0sHg+qVd7EDqMXXvvMhlAGK7Ob4ulo96D9T0vu6CLMoEH0ZHa
	 2K/4Onlb/Kscxxq53bgtMipILNrLdUFcZ/sUw8YiMNPO6xFfZLH6EVxgk0vtDOUhC4
	 4lAdSZI9sffIQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C618EEAC09C;
	Fri, 25 Feb 2022 17:21:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/6] i.MX drivers update for 5.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164580966280.15608.13157230230344557636.git-patchwork-notify@kernel.org>
Date: Fri, 25 Feb 2022 17:21:02 +0000
References: <20220222075226.160187-1-shawnguo@kernel.org>
In-Reply-To: <20220222075226.160187-1-shawnguo@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Feb 2022 15:52:21 +0800 you wrote:
> Hi,
> 
> Commit 7a7b1414ea9a ("dt-bindings: power: imx8mq: add defines for VPU
> blk-ctrl domains") on imx/bindings branch is merged here to resolve
> a dependency on VPU blk-ctrl domain defines.
> 
> Please consider to pull, thanks!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/6] i.MX drivers update for 5.18
    https://git.kernel.org/soc/soc/c/c8812c2a0815
  - [GIT,PULL,2/6] i.MX SoC update for 5.18
    https://git.kernel.org/soc/soc/c/183fc8344df9
  - [GIT,PULL,3/6] i.MX dt-bindings change for 5.18
    https://git.kernel.org/soc/soc/c/fd9eff2ebc6a
  - [GIT,PULL,4/6] i.MX arm device tree change for 5.18
    https://git.kernel.org/soc/soc/c/9d71d4a9eb27
  - [GIT,PULL,5/6] i.MX arm64 device tree change for 5.18
    https://git.kernel.org/soc/soc/c/52e71a47e82b
  - [GIT,PULL,6/6] i.MX defconfig change for 5.18
    https://git.kernel.org/soc/soc/c/32d748a03e49

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


