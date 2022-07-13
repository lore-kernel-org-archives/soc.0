Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4C4CCA47C
	for <soc@archiver.kernel.org>; Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9169FC36AE3; Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74BB6C341C0;
	Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657746023;
	bh=QpMnvp4p9CxVj279chy0M3GhroTydHsWdozHocufAgU=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ZCG9KSVX/sYoV5E+9VYSRJNz3Qt1VDRA8oosHXQbYX4yLBhukIHEOwKDDtAzkp92L
	 MjdXKQhOQIU6yxyxlBsg8fbf5qq9w9BfLldGjiWPgPQity4XG/pbHz72YaU4F8UoqY
	 8IhqF356ZJxw8d36N9EL7vSSa4S97ytMtWnrF+xq/c8qJqKnNlIR7aARYxFqsakW9R
	 6eTEy4Ex486uvqVcgXJ2GCxX2bA4XyT4JYI1xUny6H70n4c6IVdtwgdKTCSCq+KdgK
	 t7Y2ZRnzsGnz+ZskjSObJy+XDF95/UDXZh4lbBzI5tYuJBDoB5vRif47YLqclXccLX
	 Q120dHsMPcxPQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5858FE4522F;
	Wed, 13 Jul 2022 21:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/7] Broadcom SoC updates for 5.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165774602335.1051.15193748318789432037.git-patchwork-notify@kernel.org>
Date: Wed, 13 Jul 2022 21:00:23 +0000
References: <20220711164451.3542127-1-f.fainelli@gmail.com>
In-Reply-To: <20220711164451.3542127-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 11 Jul 2022 09:44:44 -0700 you wrote:
> Hi Arnd, Olof,
> 
> The highlights of the pull requests are:
> 
> - William and Anand add support for a large number of Broadband Carrier
>   Access (BCA) DSL/PON/Wi-Fi router chips under the ARCH_BCMBCA umbrella
>   and we expect to see more activity in the future on these chips.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/7] Broadcom defconfig changes for 5.20
    (no matching commit)
  - [GIT,PULL,2/7] Broadcom defconfig-arm64 changes for 5.20
    (no matching commit)
  - [GIT,PULL,3/7] Broadcom devicetree changes for 5.20
    (no matching commit)
  - [GIT,PULL,4/7] Broadcom devicetree-arm64 changes for 5.20
    (no matching commit)
  - [GIT,PULL,5/7] Broadcom drivers changes for 5.20
    (no matching commit)
  - [GIT,PULL,6/7] Broadcom maintainers changes for 5.20
    https://git.kernel.org/soc/soc/c/c67af87178f2
  - [GIT,PULL,7/7] Broadcom soc changes for 5.20
    https://git.kernel.org/soc/soc/c/aa68ce3bcb0a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


