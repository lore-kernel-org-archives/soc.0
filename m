Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25E5C7EE22
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E317BC43446; Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDBC0C43322;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681489263;
	bh=XvUjV5whOFOXXYWNPCrcVyWy8+iVba02snbQ/b7Zc1Q=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=GJds/tca25cMj08kBrN36fR7hvgemIK/mCYIqZcE98WKJnroru65ar+P/Ssh3Wdsa
	 JMRxXIduVRk61ybmuU+H0uump8fmxFb8a9/Nwh8ecPzqNinaXOq2ZM31aQQyHTuYBt
	 b79OjiILMTS6AMkVbor2nLf4ejfFoIq878NZdDUZ86EOKEJytUy0BwZedr2sT9OBud
	 TPwRId0svqsh8mccv74GxImgMjcxmx5W9GMEtiFNW9UXrTEoIogZ5VaruvavpdG1oA
	 4ltbuQ71DtNe2sx68wGIo0B6TRXdHfuIzt/iCcdcALtrVqpqeIseNQ5e460Asf1/DP
	 UJ4tAYDroLXtQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B54B5E4F0B3;
	Fri, 14 Apr 2023 16:21:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Devicetrees for v6.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168148926373.30442.16464445257695927280.git-patchwork-notify@kernel.org>
Date: Fri, 14 Apr 2023 16:21:03 +0000
References: <20230406-shank-impromptu-3d483bbc249f@spud>
In-Reply-To: <20230406-shank-impromptu-3d483bbc249f@spud>
To: Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 6 Apr 2023 21:24:40 +0100 you wrote:
> Hey Arnd,
> 
> Please pull some Devicetree updates for v6.4, mainly adding the base
> level of support for the StarFive VisionFive v2.
> I wanted to get an initial PR out before -rc6, but I may have another
> PR adding some of the peripherals (pmu, mmc) for the StarFive stuff
> that are already reviewed etc, but need a rebase on top of what
> actually got applied. Is that okay, or will the end of next week be
> too late for you?
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Devicetrees for v6.4
    https://git.kernel.org/soc/soc/c/d40a2f5062ee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


