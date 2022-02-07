Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD4BEC433FE
	for <soc@archiver.kernel.org>; Mon,  7 Feb 2022 14:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BFC1C004E1; Mon,  7 Feb 2022 14:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86546C340EF;
	Mon,  7 Feb 2022 14:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644244357;
	bh=LrksDh0AT80GgqhINN9yWmIdYKAtWbmaIIWITiI133c=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=eRGNY8UVY5oRfoepDDYgnJiHF9KrTzekSU/zH6Y5XEJedSnInuuYZlFSA7VZ6h26l
	 cfAs27CMCqVUSLmy9N1FnnonvBd1B4TYBBA3dO80IP0INfXzxqw6BSZgvDig2sLHXc
	 Ym2roy7P2Y1TRvjXMuSEWtkIwUX0l1OSa/ph0d9SafrGWFKMvm9JV1EwAHNOToCgFM
	 5rJlxoXfV88lSc+nTNjRSyTop9tXALhp/VXFz8GXGA3iB2OQv0gzUWdmjZ9AXh3bnn
	 8S/VTOOg+nHs8cE6zCzcqa8bLf79fnMPrmwBFHw4NIFCLYoihN5hDQ5nXAFGPNFirK
	 Gyp4iAocY6/SA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6F3FFE5CF96;
	Mon,  7 Feb 2022 14:32:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 0/5] SoC changes for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164424435745.21264.12595414115478316345.git-patchwork-notify@kernel.org>
Date: Mon, 07 Feb 2022 14:32:37 +0000
References: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0RDZpLtWjMEU1QVWSjOoqRAH6QxQ+ZQnJc8LwaV7m+JQ@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (arm/fixes)
by Linus Torvalds <torvalds@linux-foundation.org>:

On Thu, 23 Dec 2021 22:31:40 +0100 you wrote:
> I'm sending out the pull requests for 5.17 early, as I won't have access to
> my workstation for the next two weeks. With only 760 non-merge commits,
> this again feels quieter than the massive previous merge window, but the
> number of changed lines was actually slightly higher.
> 
> There are very few changes aside from devicetree patches, most of
> which are for the i.MX, Tegra, Qualcomm, Apple, K3 and Aspeed
> platforms.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] ARM: SoC updates for v5.17
    (no matching commit)
  - [GIT,PULL,2/5] ARM: defconfig updates for 5.17
    https://git.kernel.org/soc/soc/c/0dca3c5e017a
  - [GIT,PULL,3/5] ARM: SoC driver updates for v5.17
    https://git.kernel.org/soc/soc/c/e85195d5bf89
  - [GIT,PULL,4/5] ARM: SoC devicetree changes for v5.17
    https://git.kernel.org/soc/soc/c/aca48b2dd1e7
  - [GIT,PULL,5/5] SoC: Add support for StarFive JH7100 RISC-V SoC
    https://git.kernel.org/soc/soc/c/bb4ed26e7e83

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


