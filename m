Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8492C43219
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C336CC340F8; Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AD043C340F4;
	Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644312109;
	bh=VHbujsEru+7J6akR3RYDBaMuBPeW7r5Y4v48jqYVgXI=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=UfnZOh+UiyqCpl1tCfzhpG16MiP/cUBkhvkdZiyoKU9xVl8NWLX/bprwFJDo+ywAM
	 CUd46H+5Rw6yNQD6JGPIp8jtQ8RcCfGvl3gTC1R12541ohjdNX1p3TFvx1Kwf+Q6Al
	 /vqCG/I3GAfElOEW7Kz81WzqiomuaxJFlK21O1L2ExsYmuyClpHEGISi0bHtkttXB4
	 sVySNfc9FTgSCrIeYcvg9TMXlzyg17BI+oxVrkpwE4Q+JOV2wyEAHb1kbUkpkLpekg
	 56+yJ3i+zh5KHImiNe6E0Y6OuO1wh1HB1k4SPN8Owf9jQ9qJAaJOpauDHwFOE//OgN
	 d/QzrmXHuq/jw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9211BE6BBD2;
	Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX fixes for 5.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431210959.18327.11891478928113512766.git-patchwork-notify@kernel.org>
Date: Tue, 08 Feb 2022 09:21:49 +0000
References: <20220129073150.GZ4686@dragon>
In-Reply-To: <20220129073150.GZ4686@dragon>
To: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 29 Jan 2022 15:31:50 +0800 you wrote:
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
> 
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX fixes for 5.17
    https://git.kernel.org/soc/soc/c/f8d1fc05e288

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


