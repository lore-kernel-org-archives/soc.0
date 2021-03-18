Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E03B9C433E6
	for <soc@archiver.kernel.org>; Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7BE9C64F57; Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6254D64EF6;
	Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616109012;
	bh=lY96gVjeBOxuhZcomyUp9EM3hyaVyZEjR3Rya46SNWE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=ImaYzY32anSPwC8d8pH6cA8qofftyJMShClBaSQNhCUUAik3c3CAesPmjRIRG/EFK
	 meOJqjc48SVt0w1acFuUzKH3NbxHqmTMLdBAPYqydIDjevwR+78ShZYYDG2vbgBodo
	 0/eTAOLH6dg9Fw9wJ7GqALrY7s6naluPKSuQhKJ+1YSiEP51NMsgu3L3HkOfq/Kl+2
	 IBLp+dexcbMmnUnMgRraYTz+ODVU9vblN7R+tFWCQFDvlmtAb/mZmc84lCafyzeUXy
	 lpmJElPdAKzwWJOq7e3Kt0oTYmd8i/W9BiPJObs3EOZtfL+CLg0qp31+I50FXIld2J
	 0CueQ2fJszD9g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5619460191;
	Thu, 18 Mar 2021 23:10:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161610901234.20140.10748557687792537800.git-patchwork-notify@kernel.org>
Date: Thu, 18 Mar 2021 23:10:12 +0000
References: <20210318090145.GA22955@dragon>
In-Reply-To: <20210318090145.GA22955@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Thu, 18 Mar 2021 17:01:46 +0800 you wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.12
    https://git.kernel.org/soc/soc/c/67335b8d28cd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


