Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7ADC43460
	for <soc@archiver.kernel.org>; Mon, 17 May 2021 20:20:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CCDDC610CB; Mon, 17 May 2021 20:20:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B4DBA610CC;
	Mon, 17 May 2021 20:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1621282809;
	bh=0maelkMyoy5oxaO8gfwRjnMlSX8dckw9PBaCLORE+tE=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=coxaV79Ibc27LygtJP3cNCDF/o8BlqBKmlybV4wA6onXA/BrQrT7D+raJERIRNYtc
	 TGTvapeHobtXfmtSwBXhulT3CIs3rdUxXYbBDYcS7mKdjRZOY1EHiTsWChoiVxpmAQ
	 WSTpbIL6bwm3AYl35ZqlS54xSyXlXCc/EmigvBDO7Rg8dZA4lSZBDntv8bnUHZYXAf
	 hn8kmTzy0J35H1NOzdqYEmTTU7egYjyIGqtWS83TwsvtfJUUKShH0tQtCGOIs4yJH3
	 9239HzTq0A6aatYLulsMa+8V1yCvyZ+FDRZIIxiY6cScKrdVRtWmLRUenKq+z3A7at
	 YpP2jmftcUoow==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A7A7560A47;
	Mon, 17 May 2021 20:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v5.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162128280968.19328.7707278071184840534.git-patchwork-notify@kernel.org>
Date: Mon, 17 May 2021 20:20:09 +0000
References: <20210428093148.flrcowzr2dsj7byz@bogus>
In-Reply-To: <20210428093148.flrcowzr2dsj7byz@bogus>
To: Sudeep Holla <Sudeep.Holla@arm.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (refs/heads/arm/fixes):

On Wed, 28 Apr 2021 10:31:48 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v5.13
    https://git.kernel.org/soc/soc/c/e393cc4e9ce0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


